unit uFilterForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  uAdditionalFormMethods,
  ExtCtrls,
  uConstantsDM,
  DateUtils,
  uCurrentTaskForm,
  uDefinitionsDM,
  uClientStateDM,
  uStationStateDM,
  uReportForm,
  uTaskControllerDM;

type
  TFilterForm = class(TForm)
    lblHours: TLabel;
    lblMinutes: TLabel;
    Label3: TLabel;
    lblSeconds: TLabel;
    Label5: TLabel;
    lblwavePRD_A: TLabel;
    Label6: TLabel;
    lblwavePRM_A: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    lblwavePRD_B: TLabel;
    Label4: TLabel;
    lblwavePRM_B: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    tmrTimeUpdate: TTimer;
    btnCompleteExercise: TButton;
    btnHelp: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCompleteExerciseClick(Sender: TObject);
    procedure ClickBtnCompleteHandler(var Msg : TMessage); message MM_CLICK_BUTTON;
    procedure tmrTimeUpdateTimer(Sender: TObject);
    procedure btnCompleteClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    StationTime:TDateTime;
    Wave_PRM_A : Integer;
    Wave_PRM_B : Integer;
    Wave_PRD_A : Integer;
    Wave_PRD_B : Integer;
    CountHint : Integer;
    procedure IncTimer;
    procedure UpdateTime;
    procedure Update;      reintroduce;
    procedure UpdateWave;
  public
    procedure StartTimer;
    procedure StopTimer;
    procedure SetStationWave(WavePRDA, WavePRDB, WavePRMA,WavePRMB : Integer);
    function GetCountHint :Integer;
    procedure SetCountHint (count : Integer);
    constructor Create(Sender1: TComponent; TaskController1: TTaskController; ClientState1: TClientState); reintroduce;
  end;



implementation

uses
  uStationR414Form,
  uPreparationToWorkForm;


{$R *.dfm}
 var
  ClientState: TClientState;
  TaskController: TTaskController;
  //Station: TStation;

constructor TFilterForm.Create(Sender1: TComponent; TaskController1: TTaskController; ClientState1: TClientState);
begin
  inherited Create(Sender1);
  ClientState:= ClientState1;
  TaskController:=TaskController1;
  SetStationWave(CLientState.TransmitterWaveA, CLientState.TransmitterWaveB, CLientState.ReceiverWaveA, CLientState.ReceiverWaveB);
  SetCountHint(99);
  StartTimer;
  //Station:=Station0;
end;
/// <summary>
/// ������������� ���������� ������������ ���������.
/// </summary>
/// <param name="count">���������� ���������.</param>
procedure TFilterForm.SetCountHint(count: Integer);
begin
  CountHint := count;
  btnHelp.Caption := '���������:' + IntToStr(CountHint);
end;

/// <summary>
/// ���������� ���������� ���������.
/// </summary>
function TFilterForm.GetCountHint : Integer;
begin
  Exit(CountHint);
end;

/// <summary>
/// ���������� ������� �� ������ "Help".
/// </summary>
procedure TFilterForm.btnHelpClick(Sender: TObject);
begin
  //if Station.WorkType = wtTrening then
  //begin
    //HideHint;
  //  DisplayHint;
  //end
  //else if Station.WorkType = wtLearn then
  //begin
  //   ShowVideoHelpInLearningMode(GetNumberHelp(CurBlockSelected), False);
  //end
  TaskController.ShowHelp;
end;

/// <summary>
/// ��������� �������� ���� � ��������� �����.
/// </summary>
procedure TFilterForm.UpdateWave;
begin
  lblwavePRD_A.Caption := IntToStr(Wave_PRD_A);
  lblwavePRD_B.Caption := IntToStr(Wave_PRD_B);
  lblwavePRM_A.Caption := IntToStr(Wave_PRM_A);
  lblwavePRM_B.Caption := IntToStr(Wave_PRM_B);
end;

/// <summary>
/// ������������� �������� ���� ������ � �������� ��� ������� ���������.
/// </summary>
/// <param name="WavePRDA">����� �������� ��������� �.</param>
/// <param name="WavePRDB">����� �������� ��������� �.</param>
/// <param name="WavePRMA">����� ������ ��������� �.</param>
/// <param name="WavePRMB">����� ������ ��������� �.</param>
procedure TFilterForm.SetStationWave(WavePRDA, WavePRDB, WavePRMA,WavePRMB : Integer);
begin
     Wave_PRM_A := WavePRMA;
     Wave_PRM_B := WavePRMB;
     Wave_PRD_B := WavePRDB;
     Wave_PRD_A := WavePRDA;
end;

/// <summary>
/// �������� ������� ���������� ������� � ����.
/// </summary>
procedure TFilterForm.Update;
begin
  UpdateTime;
  UpdateWave;
  IncTimer;
end;

 /// <summary>
 /// ��������� ����� � ��������� �����.
 /// </summary>
procedure TFilterForm.UpdateTime;
begin
  if HourOf(StationTime) < 10 then
    lblHours.Caption := '0' + IntToStr(HourOf(StationTime))
  else
    lblHours.Caption := IntToStr(HourOf(StationTime));

  if MinuteOf(StationTime) < 10 then
    lblMinutes.Caption := '0' + IntToStr(MinuteOf(StationTime))
  else
    lblMinutes.Caption := IntToStr(MinuteOf(StationTime));

  if SecondOf(StationTime) < 10 then
    lblSeconds.Caption := '0' + IntToStr(SecondOf(StationTime))
  else
    lblSeconds.Caption := IntToStr(SecondOf(StationTime));

  case MinuteOf(StationTime) of
    0..5:
      begin
        lblMinutes.Font.Color := clBlue;
      end;
    6..9:
      begin
        lblMinutes.Font.Color := clMaroon;
      end;
  else
    begin
      lblMinutes.Font.Color := clRed;
    end;
  end;
end;

/// <summary>
/// ����������� ����� ������� �� 1 �������.
/// </summary>
procedure TFilterForm.IncTimer;
begin
  StationTime := IncSecond(StationTime, 1);
end;

/// <summary>
/// ������������� ������.
/// </summary>
procedure TFilterForm.StopTimer;
begin
  tmrTimeUpdate.Enabled := False;
end;

/// <summary>
/// �������� �����, ��������� ������ � ���������� �����, ���� ��� ������.
/// </summary>
procedure TFilterForm.StartTimer;
begin
  StationTime:= RecodeTime(StationTime,0,0,0,0);
  Update;
  tmrTimeUpdate.Enabled := True;
  if TaskController.NetWorker.ClientState.WorkMode = wmExam then
    btnHelp.Enabled := False
  else
    btnHelp.Enabled := True;
  if not Visible then Show;
end;

/// <summary>
/// ������� �� ������ ���������� �������� �������
/// </summary>
/// <param name="Sender"></param>
procedure TFilterForm.btnCompleteExerciseClick(Sender: TObject);
begin
  (Owner as TStationR414Form).Close;
end;

procedure TFilterForm.btnCompleteClick(Sender: TObject);
var
Report: TReportForm;
lastSubtaskNum: Integer;
begin
//  //if (TaskController.CurrentTask.IsComplete) then
//  if (TaskController.CurrentTask.FullCheck = False) then begin
//  //(Owner.Owner as TForm).Show;
//  (Owner as TStationR414Form).Close;
//  ClientState.NetStatus:='open';
//  //Close;
//  end
//  else
//  begin
lastSubtaskNum:= Length(TaskController.CurrentTask.SubTasks)-1;

if (TaskController.CurrentTask.SubTasks[lastSubtaskNum].IsComplete = true) then
  begin
    TaskController.CurrentTask.LastCheck;
    if (TaskController.CurrentTask.IsTaskComplete=True) then
      begin
        Report:=TReportForm.Create(Owner.Owner, TaskController);
        (Owner as TStationR414Form).Close;
        Report.Show;
        Report.BringToFront();
        ClientState.NetStatus:='open';
      end;
  end
  else
  begin
    (Owner as TStationR414Form).Close;
    ClientState.NetStatus:='open';
  end;


end;

/// <summary>
/// ���������� ������������� ��������� "������ �� ������ ���������� ����������"
/// </summary>
/// <param name='Msg'></param>
procedure TFilterForm.ClickBtnCompleteHandler(var Msg : TMessage);
begin
  (Owner as TStationR414Form).Close;
end;

procedure TFilterForm.FormCreate(Sender: TObject);
begin
  Self.Left := R414miniFormWidth;
  Self.Top  := Screen.Height - GetTaskBarHeight() - R414miniFormHeight;
  Self.Height :=  R414miniFormHeight;
  Self.Width  :=  frequencyTCurrentTaskFormWidth;
end;

/// <summary>
///   ���������� �������. ��������� ���������� ���������.
/// <param name = 'Sender'> </param>
/// </summary>
procedure TFilterForm.tmrTimeUpdateTimer(Sender: TObject);
begin
   Update;
end;

end.

