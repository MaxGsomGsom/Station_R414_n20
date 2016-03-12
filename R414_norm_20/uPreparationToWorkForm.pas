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
    lblCross: TLabel;
    lblCrossName: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure lstTaskChoiceClick(Sender: TObject);
    procedure cbbWorkModeChange(Sender: TObject);
    procedure ShowPriorityAndLinkedName(Sender: string);
    procedure StartNetTask(Sender: TObject);
    procedure Disconnect(Sender: string);
    procedure FormShow(Sender: TObject);
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
  ShowPriorityAndLinkedName(CLIENT_STATION_R414);


   NetWorker.ClientState.OnStartNetTask:=StartNetTask;

           //��������
     edtTransmitterWaveA.Text:= IntToStr(Random(5)+5);
     edtTransmitterWaveB.Text :=IntToStr(Random(5)+10);
     edtReceiverWaveA.Text :=IntToStr(Random(5)+15);
     edtReceiverWaveB.Text :=IntToStr(Random(5)+20);
  //Self.Station := TStation.Create;
  //Self.TaskController := TTaskController.Create(Station);

  lstTaskChoice.Items.Delete(0);            // ������� ������ �������
//  for i := 1 to TaskController.CountTasks do// ��������� ������ �������
//  begin
//    strTaskTitle := TaskController.GetTaskTitle(i);
//    if strTaskTitle = '' then continue;
//    strTaskTitle := IntToStr(i) + '. ' + strTaskTitle; // ����������� ����� �������
//    lstTaskChoice.Items.Add(strTaskTitle);
//  end;
//  lstTaskChoice.ItemIndex := 0;                        // �������� ������ �������

  cbbWorkMode.Items.Delete(0);                         // ������� ������ ������
  for i := 0 to COUNT_WORK_MODES - 1 do
    cbbWorkMode.Items.Add(GetWorkModeTitle(TWorkMode(i)));
  cbbWorkMode.ItemIndex := 0;                          // �������� ������ �������
end;

destructor TPreparationToWorkForm.Destroy;
begin
  NetworkSender.Free;
  if (NetWorker <> nil) then
    NetWorker.Disconnect;
  NetWorker.Free;
  Station.Free;                                     // ������� ���� ������� ���
                                                    // �������� �����
  TaskController.Free;                              // ��� ������ ��� ��������
                                                    // �����
  inherited;
end;

procedure TPreparationToWorkForm.btnCancelClick(Sender: TObject);
begin

  NetWorker.Disconnect;
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
      strError := '����������, �������� �������.';
      ShowMessage(strError);
      Exit;
    end;
    try
      iTransmitterWaveA := StrToInt(edtTransmitterWaveA.Text);
      iTransmitterWaveB := StrToInt(edtTransmitterWaveB.Text);
      iReceiverWaveA := StrToInt(edtReceiverWaveA.Text);
      iReceiverWaveB := StrToInt(edtReceiverWaveB.Text);
    except
      on E: Exception do            // ������������� ����������, ������� ���
      begin                         // ������ ����������� �����������

        strError := '����������, ������� ���������� �������� ����!';
        ShowMessage(strError);
        Exit;
      end;
    end;

    strError := TrySetWaves(iTransmitterWaveA, iTransmitterWaveB,
      iReceiverWaveA, iReceiverWaveB);
    if strError <> '' then             // �������� ���� ��������� �������������
    begin
      ShowMessage(strError);
      Exit;
    end;


    ////////////////////////////////////
    NetWorker.ClientState.NetStatus:='open';

    if (NetWorker.ClientState.TaskID=ttTransferToTerminalMode) then begin

     if not (NetWorker.ClientState.LinkedR414Connected) then
     begin
         ShowMessage('��� ������ ����� ������� ��������� ����������� ��������� �������');
         Exit;
     end;

     NetworkSender.SendInitialStationParams(iTransmitterWaveA, iTransmitterWaveB,
      iReceiverWaveA, iReceiverWaveB, TaskID, WorkMode);

     NetWorker.SendParams(KEY_STARTNETTASK, 'call');

     Exit;

    end
    else if True then
    begin
        NetWorker.ClientState.NetStatus:='doneLocal';
    end;
    /////////////////////////////////////////

    Station := TStation.Create;                   // �������
    StationInitializer := TStationInitializer.Create(Station, NetWorker);
    StationInitializer.InitStationByTask(NetWorker.ClientState.TaskID);              // �������������� �������

                                                  // � ������������ � ��������
    StationInitializer.Free;


    Station.WaveTransmitA := iTransmitterWaveA;      //�������!!!!!!!
    Station.WaveReceiveA := iReceiverWaveA;        //�������
    Station.WaveTransmitB := iTransmitterWaveB;    //�������
    Station.WaveReceiveB := iReceiverWaveB;  //�������

    TaskController := TTaskController.Create(Station, NetWorker); // �� ��������� ������� �� ������������ �������
    TaskController.SetCurrentTask();
    //�������������� � ����������� �� �� ��� ���� �������

    R414 := TStationR414Form.Create(Self, Station, TaskController, NetWorker);
    R414.Show;
    Hide;
  end;
end;

/// <summary>
///   ��������� ��������� ����� ������ � ��������� �������
/// </summary>
procedure TPreparationToWorkForm.cbbWorkModeChange(Sender: TObject);
var
strTaskTitle:string;
i:integer;
begin
  NetWorker.ClientState.TaskID:= TTaskType.ttNone;
  if TWorkMode(cbbWorkMode.ItemIndex)    // �������� ��� ������� �� �������
    <> NetWorker.ClientState.WorkMode then
  begin
    NetWorker.ClientState.WorkMode := TWorkMode(cbbWorkMode.ItemIndex);
  end;

  lstTaskChoice.Items.Clear;
  if (TWorkMode(cbbWorkMode.ItemIndex) = TWorkMode.wmLearning) or (TWorkMode(cbbWorkMode.ItemIndex) = TWorkMode.wmTraining) then
  begin
       for i := 1 to TaskController.CountTasks do// ��������� ������ �������
  begin
    strTaskTitle := TaskController.GetTaskTitle(i);
    if strTaskTitle = '' then continue;
    strTaskTitle := IntToStr(i) + '. ' + strTaskTitle; // ����������� ����� �������
    lstTaskChoice.Items.Add(strTaskTitle);
  end;
  lstTaskChoice.ItemIndex := 0;
  NetWorker.ClientState.TaskID := TTaskType(lstTaskChoice.ItemIndex + 1);
  end
  else if (TWorkMode(cbbWorkMode.ItemIndex) = TWorkMode.wmExam) then
       
  
end;

procedure TPreparationToWorkForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;

    (Owner as TForm).Show;     // ��������� ������� ����
    NetWorker.Disconnect;

end;



procedure TPreparationToWorkForm.FormShow(Sender: TObject);
begin
  ShowPriorityAndLinkedName(CLIENT_STATION_R414);
  ShowPriorityAndLinkedName(CLIENT_CROSS);
  Disconnect(CLIENT_STATION_R414);
  Disconnect(CLIENT_CROSS);
  NetWorker.ClientState.OnConnectedEvent:= ShowPriorityAndLinkedName;
  NetWorker.ClientState.OnDisconnect:=Disconnect;
end;

/// <summary>
///   �������� ����� ���������� ������� � ��������� �������
/// </summary>
procedure TPreparationToWorkForm.lstTaskChoiceClick(Sender: TObject);
begin
  if (lstTaskChoice.ItemIndex + 1) <> Ord(NetWorker.ClientState.TaskID) then
    NetWorker.ClientState.TaskID := TTaskType(lstTaskChoice.ItemIndex + 1);
end;

procedure TPreparationToWorkForm.ShowPriorityAndLinkedName(Sender: string);
begin
if (Sender = CLIENT_STATION_R414) then
 begin
    if (NetWorker.ClientState.LinkedR414Connected) then begin
      if (NetWorker.ClientState.IsMainStation) then
      begin
        lblStationPriority.Caption:= '������� �������';
      end
      else
      begin
         lblStationPriority.Caption:= '����������� �������';
      end;

      lblLinkedR414.Caption:=NetWorker.ClientState.LinkedR414UserName;
    end;
 end
 else if (Sender = CLIENT_CROSS) then
 begin
    if (NetWorker.ClientState.LinkedCrossConnected) then begin
      lblCrossName.Caption:=NetWorker.ClientState.LinkedCrossUserName;
    end;
 end;
end;


procedure TPreparationToWorkForm.Disconnect(Sender: string);
begin
if (Sender = CLIENT_STATION_R414) and (not NetWorker.ClientState.LinkedR414Connected) then
   begin
     //NetWorker.ClientState.LinkedR414Connected := False;
     lblLinkedR414.Caption:='-';
     lblStationPriority.Caption:='-';
   end
else if (Sender = CLIENT_CROSS) and (not NetWorker.ClientState.LinkedCrossConnected) then
begin
  //NetWorker.ClientState.LinkedCrossConnected := false;
  lblCrossName.Caption:='-';
end;

end;





procedure TPreparationToWorkForm.StartNetTask(Sender: TObject);  //������ �� ����� �������
var
StationInitializer: TStationInitializer;
     begin
       if (NetWorker.ClientState.LastNetCommand='doneLocal') or (NetWorker.ClientState.LastNetCommand='done') then
       begin
           ShowMessage('�� ����������� ������� ��� ����������� �������');
         Exit;
       end
       else if (NetWorker.ClientState.LastNetCommand='call') and (NetWorker.ClientState.NetStatus='doneLocal') then
       begin
           NetWorker.SendParams(KEY_STARTNETTASK, 'doneLocal');
       end
       else if (NetWorker.ClientState.LastNetCommand='call') and (NetWorker.ClientState.NetStatus='done') then
       begin
           NetWorker.SendParams(KEY_STARTNETTASK, 'done');
       end
       else if (NetWorker.ClientState.LastNetCommand='call') or (NetWorker.ClientState.LastNetCommand='return') then
       begin

          Station := TStation.Create;                   // �������
          StationInitializer := TStationInitializer.Create(Station, NetWorker);
          StationInitializer.InitStationByTask(NetWorker.ClientState.TaskID);              // �������������� �������

                                                        // � ������������ � ��������
          StationInitializer.Free;


          Station.WaveTransmitA := NetWorker.ClientState.TransmitterWaveA;   //�������!!!!!!!!!!
          Station.WaveReceiveA := NetWorker.ClientState.ReceiverWaveA;      //�������
          Station.WaveTransmitB := NetWorker.ClientState.TransmitterWaveB;  //�������
          Station.WaveReceiveB := NetWorker.ClientState.ReceiverWaveB;  //�������

          TaskController := TTaskController.Create(Station, NetWorker); // �� ��������� ������� �� ������������ �������
          TaskController.SetCurrentTask();

          R414 := TStationR414Form.Create(Self, Station, TaskController, NetWorker);
          R414.Show;
          Hide;

          if (NetWorker.ClientState.LastNetCommand='call') then
          begin
             NetWorker.SendParams(KEY_STARTNETTASK, 'return');
             NetWorker.ClientState.NetStatus:='done';
          end
          else if (NetWorker.ClientState.LastNetCommand='return') then
          begin
              NetWorker.ClientState.NetStatus:='done';
          end;
       end;



     end;



end.
