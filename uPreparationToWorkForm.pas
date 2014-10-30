unit uPreparationToWorkForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uNetWorkerDM,
  uNetworkSenderDM,
  uTaskControllerDM,
  uStationR414Form,
  uStationStateDM;

type
  TPreparationToWorkForm = class(TForm)
    grpWaveTuning: TGroupBox;
    grpHalfSetA: TGroupBox;
    grpHalfSetB: TGroupBox;
    lblReceiverWaveA: TLabel;
    lblReceiverWaveB: TLabel;
    lblTransmitterWaveA: TLabel;
    lblTransmitterWaveB: TLabel;
    edtReceiverWaveA: TEdit;
    edtTransmitterWaveA: TEdit;
    edtReceiverWaveB: TEdit;
    edtTransmitterWaveB: TEdit;
    btnStart: TButton;
    btnCancel: TButton;
    cbbWorkMode: TComboBox;
    lblWorkMode: TLabel;
    grpTaskChoice: TGroupBox;
    lstTaskChoice: TListBox;
    lblUsername: TLabel;
    edtUserName: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure lstTaskChoiceClick(Sender: TObject);
    procedure cbbWorkModeChange(Sender: TObject);
    //procedure FormHide(Sender: TObject);

  private
    NetWorker: IClientNetWorker;
    NetworkSender: TNetworkSender;
    TaskController: TTaskController;
    Station: TStation;
    R414: TStationR414Form;

  public
    constructor CreateForm(AOwner: TComponent; NetWorker: IClientNetWorker);
    destructor Destroy; override;
  end;

var
  PreparationToWorkForm: TPreparationToWorkForm;


implementation

uses
  uConstantsDM,
  uStationInitializer;

{$R *.dfm}

constructor TPreparationToWorkForm.CreateForm(AOwner: TComponent;
    NetWorker: IClientNetWorker);
  var
    i: Integer;
    strTaskTitle: string;
begin

  Inherited Create(AOwner);
  Self.NetWorker := NetWorker;
  Self.edtUserName.Text := NetWorker.ClientState.UserName;
  Self.NetworkSender := TNetworkSender.Create(NetWorker);

  Self.Station := TStation.Create;
  Self.TaskController := TTaskController.Create(Station);

  lstTaskChoice.Items.Delete(0);            // Удаляем пустую строчку
  for i := 1 to TaskController.CountTasks do// Заполняем список заданий
  begin
    strTaskTitle := TaskController.GetTaskTitle(i);
    if strTaskTitle = '' then continue;
    strTaskTitle := IntToStr(i) + '. ' + strTaskTitle; // Приписываем номер задания
    lstTaskChoice.Items.Add(strTaskTitle);
  end;
  lstTaskChoice.ItemIndex := 0;                        // Выбираем первое задание

  cbbWorkMode.Items.Delete(0);                         // Удаляем пустую строку
  for i := 0 to COUNT_WORK_MODES - 1 do
    cbbWorkMode.Items.Add(GetWorkModeTitle(TWorkMode(i)));
  cbbWorkMode.ItemIndex := 0;                          // Выбираем первый элемент
end;

destructor TPreparationToWorkForm.Destroy;
begin
  NetworkSender.Free;
  if (NetWorker <> nil) then
    NetWorker.Disconnect;
  NetWorker.Free;
  Station.Free;                                     // Станция была создана при
                                                    // создании формы
  TaskController.Free;                              // Был создан при создании
                                                    // формы
  inherited;
end;

procedure TPreparationToWorkForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TPreparationToWorkForm.btnStartClick(Sender: TObject);
var
  strError: string;
  iTransmitterWaveA: Integer;
  iTransmitterWaveB: Integer;
  iReceiverWaveA: Integer;
  iReceiverWaveB: Integer;
  StationInitializer: TStationInitializer;
begin
  with NetWorker.ClientState do
  begin



           //временно
     edtTransmitterWaveA.Text:='11' ;
      edtTransmitterWaveB.Text :='11' ;
      edtReceiverWaveA.Text :='22' ;
      edtReceiverWaveB.Text :='22' ;




    if not IsTaskSelected then
    begin
      strError := 'Пожалуйста, выберите задание.';
      ShowMessage(strError);
      Exit;
    end;
    try
      iTransmitterWaveA := StrToInt(edtTransmitterWaveA.Text);
      iTransmitterWaveB := StrToInt(edtTransmitterWaveB.Text);
      iReceiverWaveA := StrToInt(edtReceiverWaveA.Text);
      iReceiverWaveB := StrToInt(edtReceiverWaveB.Text);
    except
      on E: Exception do            // Перехватываем исключение, которое при
      begin                         // ошибке конвертации выскакивает

        strError := 'Пожалуйста, введите корректное значение волн!';
        ShowMessage(strError);
        Exit;
      end;
    end;

    strError := TrySetWaves(iTransmitterWaveA, iTransmitterWaveB,
      iReceiverWaveA, iReceiverWaveB);
    if strError <> '' then             // Значения волн оказались некорректными
    begin
      ShowMessage(strError);
      Exit;
    end;

    NetworkSender.SendInitialStationParams(iTransmitterWaveA, iTransmitterWaveB,
      iReceiverWaveA, iReceiverWaveB, TaskID);

    Station := TStation.Create;                   // Станция
    StationInitializer := TStationInitializer.Create(Station);
    StationInitializer.InitStationByTaskID(
      NetWorker.ClientState.TaskID);              // Инициализируем станцию

    StationInitializer.InitForStartParametersSetupTask; //временно


                                                  // в соответствии с заданием
    StationInitializer.Free;


    TaskController := TTaskController.Create(Station); // Он проверяет станцию на соответствие заданию
    TaskController.SetCurrentTask(WorkMode, TaskID);
    //Соответственно в деструкторе мы всё это дело убиваем

    R414 := TStationR414Form.Create(Self, Station, TaskController, NetWorker.ClientState);
    R414.Show;
    Hide;
  end;
end;

/// <summary>
///   Сохраняет изменённый режим работы в состоянии клиента
/// </summary>
procedure TPreparationToWorkForm.cbbWorkModeChange(Sender: TObject);
begin
  if TWorkMode(cbbWorkMode.ItemIndex)    // Получаем тип задания по индексу
    <> NetWorker.ClientState.WorkMode then
  begin
    NetWorker.ClientState.WorkMode := TWorkMode(cbbWorkMode.ItemIndex);
  end;
end;

procedure TPreparationToWorkForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin                                         // Закрываем форму только при
  Action := caFree;                           // выходе в главное меню
  try
    if Owner <> nil then (Owner as TForm).Show;     // Открываем главное меню
  finally
  end;
end;



/// <summary>
///   Изменяет номер выбранного задания в состоянии клиента
/// </summary>
procedure TPreparationToWorkForm.lstTaskChoiceClick(Sender: TObject);
begin
  if (lstTaskChoice.ItemIndex + 1) <> Ord(NetWorker.ClientState.TaskID) then
    NetWorker.ClientState.TaskID := TTaskType(lstTaskChoice.ItemIndex + 1);
end;

end.
