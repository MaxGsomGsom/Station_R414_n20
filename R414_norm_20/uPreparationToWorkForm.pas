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
    lblPriorityText: TLabel;
    lblStationPriority: TLabel;
    lbl1: TLabel;
    lblLinkedR414: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure lstTaskChoiceClick(Sender: TObject);
    procedure cbbWorkModeChange(Sender: TObject);
    procedure ShowPriority(Sender: TObject);
    procedure StartNetTask(Sender: TObject);
    //procedure FormHide(Sender: TObject);

  private
    NetWorker: TClientNetWorker;
    NetworkSender: TNetworkSender;
    TaskController: TTaskController;
    Station: TStation;
    R414: TStationR414Form;


  public
    constructor CreateForm(AOwner: TComponent; NetWorker: TClientNetWorker);
    destructor Destroy; override;

  end;

var
  PreparationToWorkForm: TPreparationToWorkForm;


implementation

uses
  uConstantsDM,
  uStationInitializer,
  uRequestDM;

{$R *.dfm}

constructor TPreparationToWorkForm.CreateForm(AOwner: TComponent;
    NetWorker: TClientNetWorker);
  var
    i: Integer;
    strTaskTitle: string;
begin

  Inherited Create(AOwner);
  Self.NetWorker := NetWorker;
  Self.edtUserName.Text := NetWorker.ClientState.UserName;
  Self.NetworkSender := TNetworkSender.Create(NetWorker);
  ShowPriority(Self);
  NetWorker.ClientState.OnConnectedEvent:=ShowPriority;

   NetWorker.ClientState.OnStartNetTask:=StartNetTask;
           //временно
     edtTransmitterWaveA.Text:='11';
      edtTransmitterWaveB.Text :='10' ;
      edtReceiverWaveA.Text :='22' ;
      edtReceiverWaveB.Text :='20' ;
  //Self.Station := TStation.Create;
  //Self.TaskController := TTaskController.Create(Station);

  lstTaskChoice.Items.Delete(0);            // Удаляем пустую строчку
//  for i := 1 to TaskController.CountTasks do// Заполняем список заданий
//  begin
//    strTaskTitle := TaskController.GetTaskTitle(i);
//    if strTaskTitle = '' then continue;
//    strTaskTitle := IntToStr(i) + '. ' + strTaskTitle; // Приписываем номер задания
//    lstTaskChoice.Items.Add(strTaskTitle);
//  end;
//  lstTaskChoice.ItemIndex := 0;                        // Выбираем первое задание

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
  try
    NetWorker.Disconnect;

  finally

  end;
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
      iReceiverWaveA, iReceiverWaveB, TaskID, WorkMode);

    ////////////////////////////////////
    if (NetWorker.ClientState.TaskID=ttTransferToTerminalMode) then begin

     if not (NetWorker.ClientState.LinkedR414Connected) then
     begin
         ShowMessage('Для начала этого задания дождитесь подключения связанной станции');
         Exit;
     end;

     NetWorker.SendParams(KEY_STARTNETTASK, 'call');
     Exit;

    end;
    /////////////////////////////////////////

    Station := TStation.Create;                   // Станция
    StationInitializer := TStationInitializer.Create(Station, NetWorker);
    StationInitializer.InitStationByTask(NetWorker.ClientState.TaskID);              // Инициализируем станцию

                                                  // в соответствии с заданием
    StationInitializer.Free;


    Station.WaveTransmitA := iTransmitterWaveA;      //костыль!!!!!!!
    Station.WaveReceiveA := iReceiverWaveA;        //костыль
    Station.WaveTransmitB := iTransmitterWaveB;    //костыль
    Station.WaveReceiveB := iReceiverWaveB;  //костыль

    TaskController := TTaskController.Create(Station, NetWorker); // Он проверяет станцию на соответствие заданию
    TaskController.SetCurrentTask();
    //Соответственно в деструкторе мы всё это дело убиваем

    R414 := TStationR414Form.Create(Self, Station, TaskController, NetWorker);
    R414.Show;
    Hide;
  end;
end;

/// <summary>
///   Сохраняет изменённый режим работы в состоянии клиента
/// </summary>
procedure TPreparationToWorkForm.cbbWorkModeChange(Sender: TObject);
var
strTaskTitle:string;
i:integer;
begin
  NetWorker.ClientState.TaskID:= TTaskType.ttNone;
  if TWorkMode(cbbWorkMode.ItemIndex)    // Получаем тип задания по индексу
    <> NetWorker.ClientState.WorkMode then
  begin
    NetWorker.ClientState.WorkMode := TWorkMode(cbbWorkMode.ItemIndex);
  end;

  lstTaskChoice.Items.Clear;
  if (TWorkMode(cbbWorkMode.ItemIndex) = TWorkMode.wmLearning) or (TWorkMode(cbbWorkMode.ItemIndex) = TWorkMode.wmTraining) then
  begin
       for i := 1 to TaskController.CountTasks do// Заполняем список заданий
  begin
    strTaskTitle := TaskController.GetTaskTitle(i);
    if strTaskTitle = '' then continue;
    strTaskTitle := IntToStr(i) + '. ' + strTaskTitle; // Приписываем номер задания
    lstTaskChoice.Items.Add(strTaskTitle);
  end;
  lstTaskChoice.ItemIndex := 0;
  NetWorker.ClientState.TaskID := TTaskType(lstTaskChoice.ItemIndex + 1);
  end
  else if (TWorkMode(cbbWorkMode.ItemIndex) = TWorkMode.wmExam) then
       
  
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

procedure TPreparationToWorkForm.ShowPriority;
begin
if (NetWorker.ClientState.LinkedR414Connected) then begin
  if (NetWorker.ClientState.IsMainStation) then
  begin
    lblStationPriority.Caption:= 'Главная станция';
  end
  else
  begin
     lblStationPriority.Caption:= 'Подчиненная станция';
  end;

  lblLinkedR414.Caption:=NetWorker.ClientState.LinkedR414UserName;
end;
end;



procedure TPreparationToWorkForm.StartNetTask(Sender: TObject);  //запрос на старт задания
var
StationInitializer: TStationInitializer;
     begin
       if (NetWorker.ClientState.StartNetTaskStatus='done') then
       begin
           ShowMessage('На сопряженной станции уже выполняется задание');
         Exit;
       end;


    Station := TStation.Create;                   // Станция
    StationInitializer := TStationInitializer.Create(Station, NetWorker);
    StationInitializer.InitStationByTask(NetWorker.ClientState.TaskID);              // Инициализируем станцию

                                                  // в соответствии с заданием
    StationInitializer.Free;


    Station.WaveTransmitA := NetWorker.ClientState.TransmitterWaveA;   //костыль!!!!!!!!!!
    Station.WaveReceiveA := NetWorker.ClientState.ReceiverWaveA;      //костыль
    Station.WaveTransmitB := NetWorker.ClientState.TransmitterWaveB;  //костыль
    Station.WaveReceiveB := NetWorker.ClientState.ReceiverWaveB;  //костыль

    TaskController := TTaskController.Create(Station, NetWorker); // Он проверяет станцию на соответствие заданию
    TaskController.SetCurrentTask();

    R414 := TStationR414Form.Create(Self, Station, TaskController, NetWorker);
    R414.Show;
    Hide;

      if (NetWorker.ClientState.StartNetTaskStatus='call') then
      begin
         NetWorker.SendParams(KEY_STARTNETTASK, 'return');
         NetWorker.ClientState.StartNetTaskStatus:='done';
      end
      else if (NetWorker.ClientState.StartNetTaskStatus='return') then
      begin
          NetWorker.ClientState.StartNetTaskStatus:='done';
      end;
     end;



end.
