unit uTaskControllerDM;

interface


uses
  uConstantsDM,
  uStationStateDM,
  uDefinitionsDM,
  forms,
  Controls,
  Classes,
  uClientStateDM,
  StdCtrls,
  ExtCtrls;



/// <summary>
///   ��������� �������� �������, �������� ������ � ������,
///   ��������� � ��������� (���� �� ����������)
/// </summary>
///
///


 type TSubTask = class
   public
   function CheckSubTask: Boolean; virtual; abstract;
   constructor Create; virtual;
   var
   EventType: TComponentName;
   Text: String;
   Name: String;
   Time: String;
   IsComplete: Boolean;
   //const

 end;



type TTask = class
      private
           FSubTaskComplete: TNotifyEvent;
      FTaskComplete: TNotifyEvent;

       TimeStart: TDateTime;
       
      public
       Name: String;
       
       property OnSubTaskComplete: TNotifyEvent read FSubTaskComplete write FSubTaskComplete;
       property OnTaskComplete: TNotifyEvent read FTaskComplete write FTaskComplete;
      //const

  procedure CheckTask(Sender0: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  constructor Create; virtual;
  var
    SubTasks: array of TSubTask;
    CurrentSubTask: Integer;
    
end;



  type TTaskNone = class (TTask)
    public
   constructor Create;  override;
   //const

  end;


  type TTaskNoneSubTask1 = class (TSubTask)
  public
   function CheckSubTask: Boolean; override;
   constructor Create;  override;
  end;




type TTaskController = class
  private
    //FTasks: TList<TTask>;     // TTask - ����� ������ ��� �������, ����������
                                // ������ �������, �������� ������� � ����
                                // ������� Task ������������� ��������� ��
                                // ������������ TaskType
    FStation: TStation;

    
    const                       // ��������, ���� ��� ����� �������,
                                // ���������� ���������
      count_tasks = 6;
      task_title_1 = '��������� �������';
      task_title_2 =
        '�������� ����������������� ������� � ������ "���������� ��������"';
      task_title_3 = '��������� ��������� ����� � �������' ;
      task_title_4 = '������� ������� � ��������� ����� ������' ;
      task_title_5 =
        '��������� ������ ��� ������ �� ������ ��������� ����� ��������������';
      task_title_6 =
        '����������� ����������� ��������� ���� ������� ��  � ������ 4��.��.';

      procedure TaskComplete(Sender: TObject);
      

      function GetCountTasks: Integer;


      property Station: TStation read FStation
                                 write FStation;
  public
    procedure SetCurrentTask(WorkMode:TWorkMode; TaskID:TTaskType);
    procedure Subscribe (CurForm0: TForm);

    constructor Create(Station: TStation);
    //destructor Destroy; override; // �����������-� ����������� �����,
                                    // ������ Tasks.Free
    function GetTaskTitle(TaskID: Integer): string;

    
    //class function GetTaskType(TaskID: Integer): TTaskType; static;

    property CountTasks: Integer read GetCountTasks;
    var
    CurrentTask : TTask;
    CurrentForm: TForm;
    //Tasks: array of TTask;
end;




{$REGION '������ ������'}

  function AnalyseStation(CurBlockId: Byte = NotSelected;
                          WorkMode: Byte = NotSelected): string;
  function ChangeEvent: Byte;

  function GetNumberOfCallPassedThrough2ChannelMode: Byte;
  function GetNumberOfCallPassedThrough4ChannelMode: Byte;
  function GetNumberOfTunedChannelBlocksA: Byte;
  function GetNumberOfTunedChannelBlocksB: Byte;
  function GetNumberOfTunedChannelBlocks: Byte;
  function GetNextTaskString: string;
  function GetNumberOfCallPassedThrough: Byte;
  function GetNotPassedTaskId: Byte;
  function GetNextBlockId: LongInt;
  function GetRackCodeByTaskId(TaskId: Integer): Integer;
  function GetNumberOfPassedExamTasks: Byte;
  function GetNumberHelp (FormId : Integer) : Integer;

  function IsZaniatiePassed: boolean;

  procedure AddError(ErrorInRackCode: Byte = NotSelected;
    ErrorDescription: string = '');
  procedure CheckFormBeforeClosing(var CanClose: Boolean);
  procedure CheckFormBeforeClosingInExamMode(var CanClose: Boolean);
  procedure MadeMistake(MistakeId: Integer);
  procedure LoadSubject;
{$ENDREGION}  

implementation


uses
  ComCtrls,
  SysUtils,
  Windows,
  uTasksDM,
  uStationR414Form;

constructor TTaskController.Create(Station: TStation);
begin
  Inherited Create;
  Self.Station := Station;

  //self.ClientState = ClientState;
  //������� ������� Task � Tasks      SetLength(Tasks, 1);
      //Tasks[0] = TTaskNone.Create
      
end;

/// <summary>
///   ���������� ��� ������� �� ��� ID (���������� � 1)
/// <param name='TaskID'>ID �������<param>
/// </summary>
//class function TTaskController.GetTaskType(TaskID: Integer): TTaskType;
//begin
//                                                     // Low = ttNone
//  if (TaskID > Ord(Low(TTaskType)))                  // ���� ����� ID
//    and (TaskID <= Ord(High(TTaskType))) then        // ���� � ������������
//  begin
//    Exit(TTaskType(TaskID));
//  end;
//  Exit(ttNone);
//end;

/// <summary>
///   ���������� ��������� ������� �� ��� ID (���������� � 1)
/// <param name='TaskID'>ID �������<param>
/// </summary>
function TTaskController.GetTaskTitle(TaskID: Integer): string;
  begin           {TODO: ����������� �����, ����� �������� ���� ������� Task }
    Result := '';
    case TaskID of
      1: Result := task_title_1;
      2: Result := task_title_2;
      3: Result := task_title_3;
      4: Result := task_title_4;
      5: Result := task_title_5;
      6: Result := task_title_6;
    end;
  end;

  function TTaskController.GetCountTasks: Integer;
  begin
    //Result := Tasks.Count;
    Result := count_tasks;
  end;

  {$REGION '����� ������ ����������� � �������'}
  
    procedure TTaskController.SetCurrentTask(WorkMode:TWorkMode; TaskID:TTaskType);
    begin

    if WorkMode=TWorkMode.wmFree then
    begin
          CurrentTask := TTaskNone.Create;    
    end
    else if WorkMode=TWorkMode.wmLearning then
    begin
        case TaskID of
          ttNone:  CurrentTask := TTaskNone.Create;
        end;      
    end;

    CurrentTask.OnTaskComplete:=self.TaskComplete;
    end;






     procedure TTaskController.Subscribe(CurForm0: TForm);
     var
     img: TComponent;
     begin
          //��� �������� �� ��� ������� click ���� ��������� �����
          for img in CurForm0 do
          begin
          if (img is TImage) then
            (img as TImage).OnMouseDown:= CurrentTask.CheckTask;
          end;
            
            
     end;



      procedure TTaskController.TaskComplete(Sender: TObject);
      begin
            // ��� ���������� ���������� �������
      end;





  //�������� �������
  constructor TTask.Create;
  begin
       CurrentSubTask:= 0;
        TimeStart:= Time;
  end;

    constructor TSubTask.Create;
  begin

  end;


  //����� ������������ �� ������ ���� ������� ��� �������� �������� �������
  procedure TTask.CheckTask(Sender0: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
  SubResult: Boolean;
  Sender: TControl;
  begin
        Sender:=Sender0 as TControl;
        SubResult:= false;

         if (Sender.Name=SubTasks[CurrentSubTask].EventType) then
         begin
             SubResult:=SubTasks[CurrentSubTask].CheckSubTask;
         end;

         if SubResult then begin
          SubTasks[CurrentSubTask].IsComplete:= true;
          SubTasks[CurrentSubTask].Time:= TimeToStr(Time-TimeStart);
          
          self.FSubTaskComplete(nil);
          if CurrentSubTask=Length(SubTasks)-1 then
          begin
            self.FTaskComplete(nil);
          end
          else
          begin
            CurrentSubTask:=CurrentSubTask+1;
          end;
          end;
  end;

  {$ENDREGION}  


{$REGION '������ �������'}
  // �������� ������� �������
  constructor TTaskNone.Create;
  begin
  inherited Create;

  Name:='��������� ������ �������';
     
  SetLength(SubTasks, 1);

  SubTasks[0]:= TTaskNoneSubTask1.Create;

  end;

    //�������� ���������� ������� ���������� ������� �������
   function TTaskNoneSubTask1.CheckSubTask: Boolean;
   begin
        result:=true;
   end;

   constructor TTaskNoneSubTask1.Create;
   begin
   inherited Create;

        Name:='��������� ������ �������';
        Text:='';
        EventType:='nil';
        Time:= '';
   end;
{$ENDREGION}






{$REGION '������ ������'}

{*************************************************************************}
{ ����� ������� ������ �������, ������� ������ ���� ����������� � ������� }
{*************************************************************************}

function GetNumberOfCallPassedThrough2ChannelMode: Byte;
var
  PassedCallCount, btA: Byte;
begin
  PassedCallCount := 0;
  for btA := 1 to 21 do
  begin
    if (stCallPassed.TwoChannelMode.ChannelA[btA].State = stPassed) and (stCallPassed.TwoChannelMode.ChannelB[btA].State = stPassed) then
      Inc(PassedCallCount, 1);
  end;
  Result := PassedCallCount;
end;

function GetNumberOfCallPassedThrough4ChannelMode;
var
  PassedCallCount, btA: Byte;
begin
  PassedCallCount := 0;
  for btA := 1 to 21 do
  begin
    if (stCallPassed.FourChannelMode.ChannelA[btA].State = stPassed)
      and (stCallPassed.FourChannelMode.ChannelB[btA].State = stPassed) then
      Inc(PassedCallCount);
  end;
  Result := PassedCallCount;
end;

function GetNumberOfTunedChannelBlocks: Byte;
const
  OffsetTuneValue = 6;
var
  btResult: Byte;
begin
  btResult := 0;
  if  (Station.HalfSetA.Rack1200Left.sw1240VTunedValue =
          Station.HalfSetA.Rack1200Left.sw1240VTune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240VTunedValue =
          Station.HalfSetB.Rack1200Left.sw1240VTune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240V2TunedValue =
          Station.HalfSetA.Rack1200Left.sw1240V2Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240V2TunedValue =
          Station.HalfSetB.Rack1200Left.sw1240V2Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240V1TunedValue =
          Station.HalfSetA.Rack1200Right.sw1240V1Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240V1TunedValue =
          Station.HalfSetB.Rack1200Right.sw1240V1Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240V2TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240V2Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240V2TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240V2Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240V3TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240V3Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240V3TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240V3Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240GTunedValue =
        Station.HalfSetA.Rack1200Right.sw1240GTune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240GTunedValue =
        Station.HalfSetB.Rack1200Right.sw1240GTune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240G1TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G1Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G1TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G1Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240G2TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G2Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G2TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G2Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240G3TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G3Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G3TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G3Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240G4TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G4Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G4TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G4Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240G1TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240G5Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240G1TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240G5Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240G2TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240G6Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240G2TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240G6Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240G3TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240G7Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240G3TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240G7Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);
  if  (Station.HalfSetA.Rack1200Right.sw1240G4TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240G8Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240G4TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240G8Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);
  if  (Station.HalfSetA.Rack1200Left.sw1240G5TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G5Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G5TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G5Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240G6TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G6Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G6TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G6Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240G7TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G7Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G7TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G7Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Left.sw1240G8TunedValue =
        Station.HalfSetA.Rack1200Left.sw1240G8Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Left.sw1240G8TunedValue =
        Station.HalfSetB.Rack1200Left.sw1240G8Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240G5TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240G5Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240G5TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240G5Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240G6TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240G6Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240G6TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240G6Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  if  (Station.HalfSetA.Rack1200Right.sw1240G7TunedValue =
        Station.HalfSetA.Rack1200Right.sw1240G7Tune - OffsetTuneValue) and
      (Station.HalfSetB.Rack1200Right.sw1240G7TunedValue =
        Station.HalfSetB.Rack1200Right.sw1240G7Tune - OffsetTuneValue)
  then
    Inc(btResult, 1);

  Result := btResult;
end;

function GetNumberOfTunedChannelBlocksA: Byte;
const
  OffsetTuneValue = 6;
var
  btResult: Byte;
begin
  btResult := 0;
  if Station.HalfSetA.Rack1200Left.sw1240VTunedValue = Station.HalfSetA.Rack1200Left.sw1240VTune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240V2TunedValue = Station.HalfSetA.Rack1200Left.sw1240V2Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240V1TunedValue = Station.HalfSetA.Rack1200Right.sw1240V1Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240V2TunedValue = Station.HalfSetA.Rack1200Right.sw1240V2Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240V3TunedValue = Station.HalfSetA.Rack1200Right.sw1240V3Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240GTunedValue = Station.HalfSetA.Rack1200Right.sw1240GTune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G1TunedValue = Station.HalfSetA.Rack1200Left.sw1240G1Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G2TunedValue = Station.HalfSetA.Rack1200Left.sw1240G2Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G3TunedValue = Station.HalfSetA.Rack1200Left.sw1240G3Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G4TunedValue = Station.HalfSetA.Rack1200Left.sw1240G4Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240G1TunedValue = Station.HalfSetA.Rack1200Right.sw1240G5Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240G2TunedValue = Station.HalfSetA.Rack1200Right.sw1240G6Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240G3TunedValue = Station.HalfSetA.Rack1200Right.sw1240G7Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240G4TunedValue = Station.HalfSetA.Rack1200Right.sw1240G8Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G5TunedValue = Station.HalfSetA.Rack1200Left.sw1240G5Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G6TunedValue = Station.HalfSetA.Rack1200Left.sw1240G6Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G7TunedValue = Station.HalfSetA.Rack1200Left.sw1240G7Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Left.sw1240G8TunedValue = Station.HalfSetA.Rack1200Left.sw1240G8Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240G5TunedValue = Station.HalfSetA.Rack1200Right.sw1240G5Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240G6TunedValue = Station.HalfSetA.Rack1200Right.sw1240G6Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetA.Rack1200Right.sw1240G7TunedValue = Station.HalfSetA.Rack1200Right.sw1240G7Tune - OffsetTuneValue then
    Inc(btResult, 1);
  Result := btResult;
end;

function GetNumberOfTunedChannelBlocksB: Byte;
const
  OffsetTuneValue = 6;
var
  btResult: Byte;
begin
  btResult := 0;
  if Station.HalfSetB.Rack1200Left.sw1240VTunedValue = Station.HalfSetB.Rack1200Left.sw1240VTune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240V2TunedValue = Station.HalfSetB.Rack1200Left.sw1240V2Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240V1TunedValue = Station.HalfSetB.Rack1200Right.sw1240V1Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240V2TunedValue = Station.HalfSetB.Rack1200Right.sw1240V2Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240V3TunedValue = Station.HalfSetB.Rack1200Right.sw1240V3Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240GTunedValue = Station.HalfSetB.Rack1200Right.sw1240GTune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G1TunedValue = Station.HalfSetB.Rack1200Left.sw1240G1Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G2TunedValue = Station.HalfSetB.Rack1200Left.sw1240G2Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G3TunedValue = Station.HalfSetB.Rack1200Left.sw1240G3Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G4TunedValue = Station.HalfSetB.Rack1200Left.sw1240G4Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240G1TunedValue = Station.HalfSetB.Rack1200Right.sw1240G5Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240G2TunedValue = Station.HalfSetB.Rack1200Right.sw1240G6Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240G3TunedValue = Station.HalfSetB.Rack1200Right.sw1240G7Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240G4TunedValue = Station.HalfSetB.Rack1200Right.sw1240G8Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G5TunedValue = Station.HalfSetB.Rack1200Left.sw1240G5Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G6TunedValue = Station.HalfSetB.Rack1200Left.sw1240G6Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G7TunedValue = Station.HalfSetB.Rack1200Left.sw1240G7Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Left.sw1240G8TunedValue = Station.HalfSetB.Rack1200Left.sw1240G8Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240G5TunedValue = Station.HalfSetB.Rack1200Right.sw1240G5Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240G6TunedValue = Station.HalfSetB.Rack1200Right.sw1240G6Tune - OffsetTuneValue then
    Inc(btResult, 1);
  if Station.HalfSetB.Rack1200Right.sw1240G7TunedValue = Station.HalfSetB.Rack1200Right.sw1240G7Tune - OffsetTuneValue then
    Inc(btResult, 1);
  Result := btResult;
end;

function GetNextTaskString: string;
var
  btA: Byte;
begin
  case Station.WorkMode of
    mdExternalView:
      begin
        for btA := 0 to Length(Task1Passed) - 1 do
        begin
          if Task1Passed[btA] = stNotPassed then
          begin
            Result := '���������� ������� ������: ' + UnitsNames[btA];
            Break;
          end;
        end;
      end;
    mdStartParametersSetup:
      begin
        for btA := 1 to Length(Task2Passed) do
        begin
          if Task2Passed[btA] = stNotPassed then
          begin
            Result := Task2Arr[btA];
            Break;
          end;
        end;
      end;
    mdPowerOn:
      begin
        for btA := 1 to Length(Task3Passed) do
        begin
          if Task3Passed[btA] = stNotPassed then
          begin
            Result := Task3Arr[btA];
            Break;
          end;
        end;
      end;
    mdReceiveAndTransmitTracksSetup:
      begin
        for btA := 1 to Length(Task4Passed) do
        begin
          if Task4Passed[btA] = stNotPassed then
          begin
            Result := Task4Arr[btA];
            Break;
          end;
        end;
      end;
    mdWorkWithLowFrequency:
      begin
        for btA := 1 to Length(Task5Passed) do
        begin
          if Task5Passed[btA] = stNotPassed then
          begin
            Result := Task5Arr[btA];
            Break;
          end;
        end;
      end;
  end;
end;

function IsZaniatiePassed: Boolean;
var
  btA: Byte;
begin
  Result := True;
  case Station.WorkMode of
    mdExternalView:
      begin
        for btA := 0 to Length(Task1Passed) - 1 do
          if Task1Passed[btA] = stNotPassed  then
          begin
            Result := False;
            Break;
          end;
      end;
    mdStartParametersSetup:
      begin
        for btA := 1 to Length(Task2Passed) do
          if Task2Passed[btA] = stNotPassed  then
          begin
            Result := False;
            Break;
          end;
      end;
    mdPowerOn:
      begin
        for btA := 1 to Length(Task3Passed) do
          if Task3Passed[btA] = stNotPassed  then
          begin
            Result := False;
            Break;
          end;
      end;
    mdReceiveAndTransmitTracksSetup:
      begin
        for btA := 1 to Length(Task4Passed) do
          if Task4Passed[btA] = stNotPassed  then
          begin
            Result := False;
            Break;
          end;
      end;
    mdWorkWithLowFrequency:
      begin
        for btA := 1 to Length(Task5Passed) do
          if Task5Passed[btA] = stNotPassed  then
          begin
            Result := False;
            Break;
          end;
      end;
  end;
end;

/// <summary>
///   ���������� ���������� ����������� ������� ������� (��� �����������)
///    ��� ������ (2� � 4� ���������)
/// </summary>
function GetNumberOfCallPassedThrough: Byte;
var
  PassedCallCount, btA: Byte;
begin
  PassedCallCount := 0;
  for btA := 1 to 21 do
  begin
    if (stCallPassed.TwoChannelMode.ChannelA[btA].State = stPassed) and (stCallPassed.TwoChannelMode.ChannelB[btA].State = stPassed) then
      Inc(PassedCallCount, 1)
    else
      if (stCallPassed.FourChannelMode.ChannelA[btA].State = stPassed) and (stCallPassed.FourChannelMode.ChannelB[btA].State = stPassed) then
        Inc(PassedCallCount, 1);
  end;
  Result := PassedCallCount;
end;

/// <summary>
///   ���������� Id ������� �������������� ������� � ������� ����������
/// </summary>
function GetNotPassedTaskId: Byte;
var
  btAA: Byte;
begin
  Result := NotSelected;
  case Station.WorkMode of
    mdExternalView:
      begin
        for btAA := 0 to 27 do
        begin
          if Task1Passed[btAA] = stNotPassed then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdStartParametersSetup:
      begin
        for btAA := 1 to Length(Task2Passed) do
        begin
          if Task2Passed[btAA] = stNotPassed then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdPowerOn:
      begin
        for btAA := 1 to Length(Task3Passed) do
        begin
          if Task3Passed[btAA] = stNotPassed then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdReceiveAndTransmitTracksSetup:
      begin
        for btAA := 1 to Length(Task4Passed) do
        begin
          if Task4Passed[btAA] = stNotPassed then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdWorkWithLowFrequency:
      begin
        for btAA := 1 to Length(Task5Passed) do
        begin
          if Task5Passed[btAA] = stNotPassed then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
  end;
end;

/// <summary>
///   ���������, � ���������� �� ������� ���������� ������� �� ������
///   (������� ������, ����� ������ � �.�.)
/// </summary>
function ChangeEvent: Byte;
var
  PowerArr: array [1..7] of Byte;
  stPowered: Boolean;
  btA: Byte;

const
  ErrMessageText = '�������� ������� ������ ��� ��������� �������';

  function IsErrorExists: Boolean;
  var
    intA: LongInt;
  begin
    Result := False;
//    for intA := 0 to Length(Errors) - 1 do
//      if (Errors[intA].ErrInRack = CurFormId) and
//      (Errors[intA].ErrDescription  = ErrMessageText) then
//      begin
//        Result := True;
//        Break;
//      end;
  end;

begin
  Result := 0;
//  case Station.WorkMode  of
//    mdPowerOn:
//      begin
//        for btA := 1 to 5 do
//          PowerArr[btA] := 0;
//        if (Station.PowerPanel.swNet = 1)
//          and (Station.PowerPanel.sw1700Power = 1)
//          and (Station.PowerPanel.sw1900Power = 1)
//          and (Station.PowerPanel.sw1900Power_2 = 1)
//          and (Station.PowerPanel.sw1200Power = 1)
//          and (Station.PowerPanel.sw1200Power_2 = 1)
//          and (Station.PowerPanel.sw1400 = 1) then
//        begin
//          PowerArr[1] := 1;
//        end;
//        if (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionUp) and (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp) then
//        begin
//          PowerArr[2] := 1;
//        end;
//        if (Station.HalfSetA.Rack1920.but1910A = butPositionUp)
//          and (Station.HalfSetA.Rack1920.but1910 = butPositionUp)
//          and (Station.HalfSetA.Rack1920.but1930 = butPositionUp)
//          and (Station.HalfSetA.Rack1920.but1960_1 = butPositionUp)
//          and (Station.HalfSetA.Rack1920.butPower = butPositionUp)
//          and (Station.HalfSetA.Rack1920.butPower2 = butPositionUp) then
//        begin
//          PowerArr[3] := 1;
//        end;
//        if (Station.Rack1710.butPower = butPositionRight) then
//        begin
//          PowerArr[4] := 1;
//        end;
//        if (Station.Rack1400.butPower = butPositionRight) then
//        begin
//          PowerArr[5] := 1;
//        end;
//        if (Station.HalfSetB.Rack1920.but1910A = butPositionUp)
//          and (Station.HalfSetB.Rack1920.but1910 = butPositionUp)
//          and (Station.HalfSetB.Rack1920.but1930 = butPositionUp)
//          and (Station.HalfSetB.Rack1920.but1960_1 = butPositionUp)
//          and (Station.HalfSetB.Rack1920.butPower = butPositionUp)
//          and (Station.HalfSetB.Rack1920.butPower2 = butPositionUp) then
//        begin
//          PowerArr[6] := 1;
//        end;
//        if (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionUp) and (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp) then
//        begin
//          PowerArr[7] := 1;
//        end;
//
//        stPowered := False;
//        for btA := 5 downto 1 do
//        begin
//          if stPowered and (PowerArr[btA] = 0) then
//          begin
//            AddError(CurFormId, ErrMessageText);
//            if Station.WorkType = wtExam then
//            begin
//              if ErrorForLevelGiven[mdPowerOn] = 0 then
//                AddExamError(CurFormId, ErrMessageText);
//            end;
//          end;
//          if PowerArr[btA] = 1 then
//            stPowered := True;
//        end;
//      end;
//  end;
end;

procedure AddError(ErrorInRackCode: Byte = NotSelected; ErrorDescription: string = '');
begin
//  if ErrorInRackCode = NotSelected then
//    ErrorInRackCode := CurFormId;
  if ErrorDescription = '' then
  begin
    ErrorDescription := AnalyseStation(ErrorInRackCode);
  end;
  if ErrorDescription <> '' then
  begin
    SetLength(Errors, Length(Errors) + 1);
    Errors[Length(Errors) - 1].ErrInRack := ErrorInRackCode;
    Errors[Length(Errors) - 1].ErrDescription := ErrorDescription;
  end;
  if Length(Errors) > MaxErrorsAllowedWhileTesting then
  begin
    Application.MessageBox('�������� ������� ����� ������, ���������� ������� ����������� ������!',
      PChar(PName), MB_OK + MB_ICONINFORMATION);
    CurBlockSelected := 255;
    //StationR414Form.lvTask.Clear;
    Initialise;
    //StationR414Form.Show;
    Exit;
  end;
end;

/// <summary>
///   ���������� ID ���������� ����� ��� ��������� (�� ������ �������)
/// </summary>
function GetNextBlockId: LongInt;
var
  btBlockId: Byte;
begin
  Result := NotSelected;
  btBlockId := GetNotPassedTaskId;
  if btBlockId <> NotSelected then
  begin
    case Station.WorkMode of
      mdExternalView:
        begin
          btBlockId := GetRackCodeByTaskId(btBlockId);
          if btBlockId <> NotSelected then
          begin
            Result := btBlockId;
          end;
        end;
      mdStartParametersSetup:
        begin
          btBlockId := GetRackCodeByTaskId(btBlockId);
           if btBlockId <> NotSelected then
          begin
            Result := btBlockId;
          end;
        end;
      mdPowerOn:
        begin
          btBlockId := GetRackCodeByTaskId(btBlockId);
          if btBlockId <> NotSelected then
          begin
            Result := btBlockId;
          end;
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          btBlockId := GetRackCodeByTaskId(btBlockId);
          if btBlockId <> NotSelected then
          begin
            Result := btBlockId;
          end;
        end;
      mdWorkWithLowFrequency:
        begin
          btBlockId := GetRackCodeByTaskId(btBlockId);
          if btBlockId <> NotSelected then
          begin
            Result := btBlockId;
          end;
        end;
    end;
  end;
end;

/// <summary>
///   ���������� id ������ �� ������ �������
/// </summary>
/// <param name="TaskId">����� �������</param>
function GetRackCodeByTaskId(TaskId: Integer): Integer;
var
  btAA: Byte;
begin
  Result := NotSelected;
  case Station.WorkMode of
    mdExternalView:
      begin
        for btAA := 0 to Length(Task1RackCodeArr) - 1 do
        begin
          if Task1RackCodeArr[btAA] = TaskId then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdStartParametersSetup:
      begin
        for btAA := 0 to Length(Task2RackCodeArr) - 1 do
        begin
          if Task2RackCodeArr[btAA] = TaskId then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdPowerOn:
      begin
        for btAA := 0 to Length(Task3RackCodeArr) - 1 do
        begin
          if Task3RackCodeArr[btAA] = TaskId then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdReceiveAndTransmitTracksSetup:
      begin
        for btAA := 0 to Length(Task4RackCodeArr) - 1 do
        begin
          if Task4RackCodeArr[btAA] = TaskId then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
    mdWorkWithLowFrequency:
      begin
        for btAA := 0 to Length(Task5RackCodeArr) - 1 do
        begin
          if Task5RackCodeArr[btAA] = TaskId then
          begin
            Result := btAA;
            Break;
          end;
        end;
      end;
  end;
end;

procedure MadeMistake(MistakeId: Integer);
begin
  AddError(MistakeId, '������ ��� ���������� ������ ');
end;

/// <summary>
///   ��������� ������ �������, �������������� �� ����� ���� �414
/// </summary>
procedure LoadSubject;

  procedure addTaskInTaskList(var arrTaskTexts: array of String;
    iCountTaskTexts: Integer);
  var
    i: Integer;
    LI: TListItem;
  begin
//    for i := 0 to iCountTaskTexts - 1 do
//    begin
//      LI := StationR414Form.lvTask.Items.Add;
//      LI.Caption := IntToStr(i + 1);
//      //�������� �����������               //��� �� �������� ���������� ���??
//      LI.SubItems.Add(arrTaskTexts[i]);
//      LI.SubItems.Add(stTaskOpened);
//      LI.SubItems.Add(InitialTimeString);
//    end;
  end;

var
  intA: LongInt;
  LI: TListItem;
begin
  case Station.WorkMode of
    mdExternalView:
      addTaskInTaskList(UnitsNames, 28);
    mdStartParametersSetup:
      addTaskInTaskList(Task2Arr, Length(Task2Arr));
    mdPowerOn:
      addTaskInTaskList(Task3Arr, Length(Task3Arr));
    mdReceiveAndTransmitTracksSetup:
      addTaskInTaskList(Task4Arr, Length(Task4Arr));
    mdWorkWithLowFrequency:
      addTaskInTaskList(Task5Arr, Length(Task5Arr));
  end;
end;

function GetNumberOfPassedExamTasks: Byte;
var
  btA: Byte;
  intCount: Byte;
begin
  intCount := 0;
  for btA := 0 to Length(Task1Passed) - 1 do
  begin
    //���� ��� ����� ����� � �� ���� �� ��������� ������
    if Task1Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task2Passed) do
  begin
    //���� ��� ����� ����� � �� ���� �� ��������� ������
    if Task2Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task3Passed) do
  begin
    //���� ��� ����� ����� � �� ���� �� ��������� ������
    if Task3Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task4Passed) do
  begin
    //���� ��� ����� ����� � �� ���� �� ��������� ������
    if Task4Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task5Passed) do
  begin
    //���� ��� ����� ����� � �� ���� �� ��������� ������
    if Task5Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  Result := intCount;
end;


/// <summary>
/// ���������� ����� �������, ���������� � ������, id ������� ���������
/// � ����������.
/// </summary>
/// <param name="FormId">id ������, ��� ������� ���������� ��������
/// ����� �������.</param>
function GetNumberHelp (FormId : Integer) : Integer;
begin
  if (FormId <> NotSelected) then
    case Station.WorkMode of
      mdStartParametersSetup:
      begin
        Exit(Task2RackCodeArr[FormId]);
      end;
      mdPowerOn:
      begin
        Exit(Task3RackCodeArr[FormId]);
      end;
      mdReceiveAndTransmitTracksSetup:
      begin
        Exit(Task4RackCodeArr[FormId]);
      end;
      mdWorkWithLowFrequency:
      begin
        Exit(Task5RackCodeArr[FormId]);
      end;
    else
      Exit(254);
    end;
  Exit(NotSelected);
end;

/// <summary>
///   ���������, ��������� �� ����������� ����� � ������������
///   � ������� ��������
/// <param name = 'CanClose'> ���������� ��������, ������������,
///   ����� �� ��������� ����� </param>
/// </summary>
procedure CheckFormBeforeClosing(var CanClose: Boolean);
var
  PassTaskNumber, ClosingFormId: Byte;
  ConditionsAreMet : Boolean;

  procedure PassTask;
  begin
    case Station.WorkMode of
      mdStartParametersSetup:
        begin
          Task2Passed[PassTaskNumber] := stPassed;
          Task2PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
      mdPowerOn:
        begin
          Task3Passed[PassTaskNumber] := stPassed;
          Task3PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          Task4Passed[PassTaskNumber] := stPassed;
          Task4PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
      mdWorkWithLowFrequency:
        begin
          Task5Passed[PassTaskNumber] := stPassed;
          Task5PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
    end;
  end;

  procedure ReactToClosingOfForm(ConditionsAreMet : Boolean);
  begin
    if ConditionsAreMet then
    begin
      CanClose := True;
      PassTask;
    end
    else
    begin
      AddError;
      if (Station.WorkType = wtLearn) then
      begin
        CanClose := ShowVideoHelpInLearningMode(PassTaskNumber, True);
      end;
    end;
  end;

begin
  //if frmCloseLabel.Visible then
  //  frmCloseLabel.Close;
  Application.ProcessMessages;

  CanClose := True;
  ClosingFormId := CurBlockSelected;

  if Station.WorkType = wtExam then
  begin
    CheckFormBeforeClosingInExamMode(CanClose);
    Exit;
  end;

  if CurBlockSelected <> NotSelected then
  begin
    case Station.WorkMode of
      mdStartParametersSetup:
        {$REGION '��������� ��������� ������� ����������'}
        begin
          PassTaskNumber := Task2RackCodeArr[ClosingFormId];
          case ClosingFormId of
            idDuplexerB:
              begin
                ConditionsAreMet :=
                  ((Station.HalfSetB.Duplexer.waveTransmit = Station.WaveTransmitB)
                  and (Station.HalfSetB.Duplexer.waveReceive = Station.WaveReceiveB)
                  and (Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeLeft)
                  and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
                  or ((Station.HalfSetB.Duplexer.waveTransmit = Station.WaveTransmitB)
                  and (Station.HalfSetB.Duplexer.waveReceive = Station.WaveReceiveB)
                  and (Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeRight)
                  and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeLeft));
              end;
            idRack1920B:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.Rack1920.butPower = butPositionDown)
                  and (Station.HalfSetB.Rack1920.butPower2 = butPositionDown)
                  and (Station.HalfSetB.Rack1920.but1910 = butPositionDown)
                  and (Station.HalfSetB.Rack1920.but1910A = butPositionDown)
                  and (Station.HalfSetB.Rack1920.but1930 = butPositionDown)
                  and (Station.HalfSetB.Rack1920.but1960_1 = butPositionDown);
              end;
            idRack1200B2:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.Rack1200Right.But1270Main = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1220AMMain = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1230AMain = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1210AMain = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1270Reserve = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1220AMReserve = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240V = butPositionLeft)
                  and (Station.HalfSetB.Rack1200Right.But1240V2 = butPositionLeft)
                  and (Station.HalfSetB.Rack1200Right.But1240V3 = butPositionLeft)
                  and (Station.HalfSetB.Rack1200Right.Sw1240V = 1)
                  and (Station.HalfSetB.Rack1200Right.Sw1240V2 = 1)
                  and (Station.HalfSetB.Rack1200Right.Sw1240V3 = 1)
                  and (Station.HalfSetB.Rack1200Right.But1240G = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G1 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G2 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G3 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G4 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G5 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G6 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G7 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.But1240G8 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Right.But1290Power = butPositionDown);
              end;
            idShield:
              begin
                ConditionsAreMet :=
                  ((Station.PowerPanel.swNet = 0)
                    or (Station.PowerPanel.swNet = 2))
                  and ((Station.PowerPanel.swPhase = 0)
                    or (Station.PowerPanel.swPhase = 2))
                  and (Station.PowerPanel.butRetranslator = butPositionDown)
                  and ((Station.PowerPanel.sw1700Power = 0)
                    or (Station.PowerPanel.sw1700Power = 2))
                  and (Station.PowerPanel.butRetranslator2 = butPositionDown)
                  and ((Station.PowerPanel.sw1900Power = 0)
                    or (Station.PowerPanel.sw1900Power = 2))
                  and ((Station.PowerPanel.sw1900Power_2 = 0)
                    or (Station.PowerPanel.sw1900Power_2 = 2))
                  and ((Station.PowerPanel.swHeat5A = 0)
                    or (Station.PowerPanel.swHeat5A = 2))
                  and ((Station.PowerPanel.sw1200Power = 0)
                    or (Station.PowerPanel.sw1200Power = 2))
                  and ((Station.PowerPanel.sw1400 = 0)
                    or (Station.PowerPanel.sw1400 = 2))
                  and ((Station.PowerPanel.sw1200Power_2 = 0)
                    or (Station.PowerPanel.sw1200Power_2 = 2))
                  and (Station.PowerPanel.butVent1 = butPositionDown)
                  and (Station.PowerPanel.butUnitBK = butPositionDown)
                  and (Station.PowerPanel.butVipriamit4V = butPositionDown)
                  and (Station.PowerPanel.butVent1_2 = butPositionDown)
                  and (Station.PowerPanel.butVent3 = butPositionDown);
              end;
            idRack1200A2:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.Rack1200Right.But1270Main = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1220AMMain = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1230AMain = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1210AMain = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1270Reserve = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1220AMReserve = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240V = butPositionLeft)
                  and (Station.HalfSetA.Rack1200Right.But1240V2 = butPositionLeft)
                  and (Station.HalfSetA.Rack1200Right.But1240V3 = butPositionLeft)
                  and (Station.HalfSetA.Rack1200Right.Sw1240V = 1)
                  and (Station.HalfSetA.Rack1200Right.Sw1240V2 = 1)
                  and (Station.HalfSetA.Rack1200Right.Sw1240V3 = 1)
                  and (Station.HalfSetA.Rack1200Right.But1240G = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G1 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G2 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G3 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G4 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G5 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G6 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G7 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.But1240G8 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Right.But1290Power = butPositionDown);
              end;
            idRack1600B, idRack1600Bback:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.Rack1600.butAutomatic = butPositionRight)
                  and (Station.HalfSetB.Rack1600.wave1610_0 = Station.WaveReceiveB)
                  and (Station.HalfSetB.Rack1600.swChannelControl = 9)
                  and (Station.HalfSetB.Rack1600.wave1610_R = Station.WaveReceiveB)
                  and (Station.HalfSetB.Rack1600.wave1600 = Station.WaveReceiveB)
                  and (Station.HalfSetB.Rack1600B.swKukushka = 1)
                  and (Station.HalfSetB.Rack1600B.but1621Main = butPositionUp)
                  and (Station.HalfSetB.Rack1600B.but1621Reserve = butPositionUp)
                  and (Station.HalfSetB.Rack1600B.butUPT = butPositionRight)
                  and (Station.HalfSetB.Rack1600B.butUPT2 = butPositionRight)
                  and (Station.HalfSetB.Rack1600B.swUGS = 5)
                  and (Station.HalfSetB.Rack1600B.swUGS2 = 5)
                  and (Station.HalfSetB.Rack1600B.but1622Main = butPositionUp)
                  and (Station.HalfSetB.Rack1600B.but1622Reserve = butPositionUp);
              end;
            idRack1710A:
              begin
                ConditionsAreMet :=
                  (Station.Rack1710.swWorkMode = 1)
                  and (Station.Rack1710.butAutomat = butPositionUp)
                  and (Station.Rack1710.butEmergencyLine1 = butPositionUp)
                  and (Station.Rack1710.butEmergencyLine2 = butPositionUp)
                  and (Station.Rack1710.but1220AD = butPositionLeft)
                  and (Station.Rack1710.but1230AD = butPositionLeft)
                  and (Station.Rack1710.but1290 = butPositionLeft)
                  and (Station.Rack1710.but1220AM = butPositionLeft)
                  and (Station.Rack1710.but1230AM = butPositionLeft)
                  and (Station.Rack1710.but1210A = butPositionLeft)
                  and (Station.Rack1710.but1270 = butPositionLeft)
                  and (Station.Rack1710.but1220AD_2 = butPositionLeft)
                  and (Station.Rack1710.but1230AD_2 = butPositionLeft)
                  and (Station.Rack1710.but1290_2 = butPositionLeft)
                  and (Station.Rack1710.but1220AM_2 = butPositionLeft)
                  and (Station.Rack1710.but1230AM_2 = butPositionLeft)
                  and (Station.Rack1710.but1210A_2 = butPositionLeft)
                  and (Station.Rack1710.but1270_2 = butPositionLeft)
                  and (Station.Rack1710.swReductorCurrent = 1)
                  and (Station.Rack1710.butExternalUplotnenieA = butPositionLeft)
                  and (Station.Rack1710.butExternalUplotnenieB = butPositionLeft)
                  and (Station.Rack1710.butPower = butPositionLeft)
                  and (Station.Rack1710.butSpeaker = butPositionLeft)
                  and (Station.Rack1710.swKukushka = 1);
              end;
            idRack1200B1:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.Rack1200Left.butChannelControl = butPositionDown)
                  and (Station.HalfSetB.Rack1200Left.but1220ADMain = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1230AMain = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1220ADReserve = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1230AReserve = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.But1240GMain = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.But1240GMain2 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240GPrmPrd = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240GOneTwo = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.st1240G_ports = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Left.but1240V = butPositionLeft)
                  and (Station.HalfSetB.Rack1200Left.but1240V2 = butPositionLeft)
                  and (Station.HalfSetB.Rack1200Left.Sw1240V = 1)
                  and (Station.HalfSetB.Rack1200Left.Sw1240V2 = 1)
                  and (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedIn)
                  and (Station.HalfSetB.Rack1200Left.but1240G1 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G2 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G3 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G4 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G5 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G6 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G7 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1240G8 = butPositionUp)
                  and (Station.HalfSetB.Rack1200Left.but1290Power = butPositionDown);
              end;
            idRack1200A1:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.Rack1200Left.butChannelControl = butPositionDown)
                  and (Station.HalfSetA.Rack1200Left.but1220ADMain = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1230AMain = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1220ADReserve = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1230AReserve = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.But1240GMain = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.But1240GMain2 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240GPrmPrd = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240GOneTwo = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.st1240G_ports = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Left.but1240V = butPositionLeft)
                  and (Station.HalfSetA.Rack1200Left.but1240V2 = butPositionLeft)
                  and (Station.HalfSetA.Rack1200Left.Sw1240V = 1)
                  and (Station.HalfSetA.Rack1200Left.Sw1240V2 = 1)
                  and (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedIn)
                  and (Station.HalfSetA.Rack1200Left.but1240G1 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G2 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G3 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G4 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G5 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G6 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G7 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1240G8 = butPositionUp)
                  and (Station.HalfSetA.Rack1200Left.but1290Power = butPositionDown);
              end;
            idRack1600A, idRack1600Aback:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.Rack1600.butAutomatic = butPositionRight)
                  and (Station.HalfSetA.Rack1600.wave1610_0 = Station.WaveReceiveA)
                  and (Station.HalfSetA.Rack1600.swChannelControl = 9)
                  and (Station.HalfSetA.Rack1600.wave1610_R = Station.WaveReceiveA)
                  and (Station.HalfSetA.Rack1600.wave1600 = Station.WaveReceiveA)
                  and (Station.HalfSetA.Rack1600B.swKukushka = 1)
                  and (Station.HalfSetA.Rack1600B.but1621Main = butPositionUp)
                  and (Station.HalfSetA.Rack1600B.but1621Reserve = butPositionUp)
                  and (Station.HalfSetA.Rack1600B.butUPT = butPositionRight)
                  and (Station.HalfSetA.Rack1600B.butUPT2 = butPositionRight)
                  and (Station.HalfSetA.Rack1600B.swUGS = 5)
                  and (Station.HalfSetA.Rack1600B.swUGS2 = 5)
                  and (Station.HalfSetA.Rack1600B.but1622Main = butPositionUp)
                  and (Station.HalfSetA.Rack1600B.but1622Reserve = butPositionUp);
              end;
            idRack1920A:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.Rack1920.but1930 = butPositionDown)
                  and (Station.HalfSetA.Rack1920.but1910 = butPositionDown)
                  and (Station.HalfSetA.Rack1920.but1910A = butPositionDown)
                  and (Station.HalfSetA.Rack1920.butPower2 = butPositionDown)
                  and (Station.HalfSetA.Rack1920.butPower = butPositionDown)
                  and (Station.HalfSetA.Rack1920.but1960_1 = butPositionDown);
              end;
            idDuplexerA:
              begin
                ConditionsAreMet :=
                  ((Station.HalfSetA.Duplexer.waveTransmit = Station.WaveTransmitA)
                  and (Station.HalfSetA.Duplexer.waveReceive = Station.WaveReceiveA)
                  and (Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft)
                  and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
                  or ((Station.HalfSetA.Duplexer.waveTransmit = Station.WaveTransmitA)
                  and (Station.HalfSetA.Duplexer.waveReceive = Station.WaveReceiveA)
                  and (Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight)
                  and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft));
              end;
            idMshuA:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.LittleNoisyAmplifier.swWave = Station.WaveReceiveA)
                  and (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionDown)
                  and (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionDown)
                  and (Station.HalfSetA.LittleNoisyAmplifier.butMshu = butPositionLeft);
              end;
            idMshuB:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.LittleNoisyAmplifier.swWave = Station.WaveReceiveB)
                  and (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionDown)
                  and (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionDown)
                  and (Station.HalfSetB.LittleNoisyAmplifier.butMshu = butPositionLeft);
              end;
            idP321A:
              begin
                ConditionsAreMet := (Station.HalfSetA.P321.butPower = butPositionDown);
              end;
            idP321B:
              begin
                ConditionsAreMet := (Station.HalfSetB.P321.butPower = butPositionDown);
              end;
            idP321C:
              begin
                ConditionsAreMet := (Station.P321C.butPower = butPositionDown);
              end;
            idRack1500B:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft)
                  and (Station.HalfSetB.Rack1500.swModeControl = 6)
                  and (Station.HalfSetB.Rack1500.butMode_R = butPositionLeft)
                  and (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1610_0)
                  and (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1500)
                  and (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave161_R)
                  and (Station.HalfSetB.Rack1500.stCableNoName = csConnectedAtRack1500Sh1)
                  and (Station.HalfSetB.Rack1500.stCableSh1 = csConnectedAtRack1500NoName)
                  and (Station.HalfSetB.Rack1500B.butMdOsn_1 = butPositionLeft)
                  and (Station.HalfSetB.Rack1500B.butMdOsn_2 = butPositionLeft)
                  and (Station.HalfSetB.Rack1500B.butMdOsn_3 = butPositionLeft)
                  and (Station.HalfSetB.Rack1500B.but1622_1 = butPositionUp)
                  and (Station.HalfSetB.Rack1500B.but1622_2 = butPositionUp);
              end;
            idRack1500A:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft)
                  and (Station.HalfSetA.Rack1500.swModeControl = 6)
                  and (Station.HalfSetA.Rack1500.butMode_R = butPositionLeft)
                  and (Station.WaveTransmitA = Station.HalfSetA.Rack1500.swWave1610_0)
                  and (Station.WaveTransmitA = Station.HalfSetA.Rack1500.swWave1500)
                  and (Station.WaveTransmitA = Station.HalfSetA.Rack1500.swWave161_R)
                  and (Station.HalfSetA.Rack1500.stCableNoName = csConnectedAtRack1500Sh1)
                  and (Station.HalfSetA.Rack1500.stCableSh1 = csConnectedAtRack1500NoName)
                  and (Station.HalfSetA.Rack1500B.butMdOsn_1 = butPositionLeft)
                  and (Station.HalfSetA.Rack1500B.butMdOsn_2 = butPositionLeft)
                  and (Station.HalfSetA.Rack1500B.butMdOsn_3 = butPositionLeft)
                  and (Station.HalfSetA.Rack1500B.but1622_1 = butPositionUp)
                  and (Station.HalfSetA.Rack1500B.but1622_2= butPositionUp);
              end;
            idRack1400B:
              begin
                ConditionsAreMet :=
                  (Station.Rack1400.butPower = butPositionLeft)
                  and (Station.Rack1400.swKukushka = 1);
              end;
          end;
          ReactToClosingOfForm(ConditionsAreMet);
        end;
        {$ENDREGION}
      mdPowerOn:
        {$REGION '��������� �������'}
        begin
          PassTaskNumber := Task3RackCodeArr[ClosingFormId];
          case ClosingFormId of
            idRack1920B:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.Rack1920.butPower = butPositionUp)
                  and (Station.HalfSetB.Rack1920.butPower2 = butPositionUp)
                  and (Station.HalfSetB.Rack1920.but1910 = butPositionUp)
                  and (Station.HalfSetB.Rack1920.but1910A = butPositionUp)
                  and (Station.HalfSetB.Rack1920.but1930 = butPositionUp)
                  and (Station.HalfSetB.Rack1920.but1960_1 = butPositionUp);
              end;
            idRack1710A:
              begin
                ConditionsAreMet :=
                  (Station.Rack1710.butPower = butPositionRight)
                  and (Station.Rack1710.swKukushka = 1);
              end;
            idRack1920A:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.Rack1920.butPower = butPositionUp)
                  and (Station.HalfSetA.Rack1920.butPower2 = butPositionUp)
                  and (Station.HalfSetA.Rack1920.but1910 = butPositionUp)
                  and (Station.HalfSetA.Rack1920.but1910A = butPositionUp)
                  and (Station.HalfSetA.Rack1920.but1930 = butPositionUp)
                  and (Station.HalfSetA.Rack1920.but1960_1 = butPositionUp);
              end;
            idMshuA:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetA.LittleNoisyAmplifier.swWave = Station.WaveReceiveA)
                  and (Station.HalfSetA.LittleNoisyAmplifier.butMshu = butMain)
                  and (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionUp)
                  and (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp);
              end;
            idMshuB:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.LittleNoisyAmplifier.swWave = Station.WaveReceiveB)
                  and (Station.HalfSetB.LittleNoisyAmplifier.butMshu = butMain)
                  and (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionUp)
                  and (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp);
              end;
            idRack1500B:
              begin
                ConditionsAreMet :=
                  (Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft)
                  and (Station.HalfSetB.Rack1500.swModeControl = 6)
                  and (Station.HalfSetB.Rack1500.butMode_R = butPositionLeft)
                  and (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1610_0)
                  and (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1500)
                  and (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave161_R)
                  and (Station.HalfSetB.Rack1500B.butMdOsn_1 = 1)
                  and (Station.HalfSetB.Rack1500B.butMdOsn_2 = 1)
                  and (Station.HalfSetB.Rack1500B.butMdOsn_3 = 1)
                  and (Station.HalfSetB.Rack1500B.but1622_1 = 0)
                  and (Station.HalfSetB.Rack1500B.but1622_2 = 0);
              end;
            idShield:
              begin
                ConditionsAreMet :=
                (Station.PowerPanel.swNet = 1)
                and (Station.PowerPanel.sw1700Power = 1)
                and (Station.PowerPanel.sw1900Power = 1)
                and (Station.PowerPanel.sw1900Power_2 = 1)
                and (Station.PowerPanel.sw1200Power = 1)
                and (Station.PowerPanel.sw1200Power_2 = 1)
                and (Station.PowerPanel.sw1400 = 1);
              end;
            idRack1400B:
              begin
                ConditionsAreMet :=
                  Station.Rack1400.butPower = butPositionRight;
              end;
          end;
          ReactToClosingOfForm(ConditionsAreMet);
        end;
        {$ENDREGION}
      mdReceiveAndTransmitTracksSetup:
        {$REGION '��������� �����-����������� ������'}
        begin
          case ClosingFormId of
            idRack1500A:
              begin
                if Station.HalfSetA.Rack1500.GeterodinTunedMain
                  and (Station.HalfSetA.Rack1500.GeterodinTunedReserve)
                  and ((Station.HalfSetA.Rack1500.SelectedMd = smdMain)
                  and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain))
                  and (Station.HalfSetA.Rack1500.DropError)
                  and (Station.HalfSetA.Rack1500.btnAutomatic = butPositionRight)
                  and (Station.HalfSetA.Rack1500.swPhaseMover = 10) then
                begin
                  Task4Passed[1] := stPassed;
                  Task4PassTime[1] := TimeToStr(Time);
                end
                else
                begin
                  if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn
                    or Station.HalfSetA.Rack1920.stLBV2_TurnedOn
                    or Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1
                    or Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2) then
                  begin
                    Task4Passed[1] := stNotPassed;
                    Task4PassTime[1] := InitialTimeString;
                    AddError;
                    if (Station.WorkType = wtLearn) then
                    begin
                      CanClose := ShowVideoHelpInLearningMode(PassTaskNumber, True);
                    end;
                  end;
                end;
              end;
            idRack1920A:
              begin
                Task4Passed[2] := BoolToByteInv(Station.HalfSetA.Rack1920.stLBV1_TurnedOn
                  and Station.HalfSetA.Rack1920.stLBV2_TurnedOn
                  and Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1
                  and Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2);
                if Task4Passed[2] = stPassed then
                  Task4PassTime[2] := TimeToStr(Time)
                else
                  Task4PassTime[2] := InitialTimeString;
              end;
            idRack1600A:
              begin
                Task4Passed[3] :=
                  BoolToByteInv((Station.HalfSetA.Rack1600.GeterodinTunedMain)
                  and (Station.HalfSetA.Rack1600.GeterodinTunedReserve)
                  and ((Station.HalfSetA.Rack1600.SelectedMd = smdMain)
                  and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain)
                  and (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain))
                  and (Station.HalfSetA.Rack1600.DropError)
                  and (Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft));
                if Task4Passed[3] = stPassed then
                  Task4PassTime[3] := TimeToStr(Time)
                else
                  Task4PassTime[3] := InitialTimeString;
              end;
            idRack1600B:
              begin
                Task4Passed[4] :=
                  BoolToByteInv((Station.HalfSetB.Rack1600.GeterodinTunedMain)
                  and (Station.HalfSetB.Rack1600.GeterodinTunedReserve)
                  and ((Station.HalfSetB.Rack1600.SelectedMd = smdMain)
                  and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain)
                  and (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain))
                  and (Station.HalfSetB.Rack1600.DropError)
                  and (Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft));
                if Task4Passed[4] = stPassed then
                  Task4PassTime[4] := TimeToStr(Time)
                else
                  Task4PassTime[4] := InitialTimeString;
              end;
            idRack1500B:
              begin
                if Station.HalfSetB.Rack1500.GeterodinTunedMain
                  and (Station.HalfSetB.Rack1500.GeterodinTunedReserve)
                  and ((Station.HalfSetB.Rack1500.SelectedMd = smdMain)
                  and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain))
                  and (Station.HalfSetB.Rack1500.DropError)
                  and (Station.HalfSetB.Rack1500.btnAutomatic = butPositionRight)
                  and (Station.HalfSetB.Rack1500.swPhaseMover = 10) then
                begin
                  Task4Passed[5] := stPassed;
                  Task4PassTime[5] := TimeToStr(Time);
                end
                else
                begin
                  if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
                    or Station.HalfSetB.Rack1920.stLBV2_TurnedOn
                    or Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1
                    or Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) then
                  begin
                    Task4Passed[5] := stNotPassed;
                    Task4PassTime[5] := InitialTimeString;
                    AddError;
                    if (Station.WorkType = wtLearn) then
                    begin
                      CanClose := ShowVideoHelpInLearningMode(PassTaskNumber, True);
                    end;
                  end;
                end;
              end;
            idRack1920B:
              begin
                Task4Passed[6] := BoolToByteInv(Station.HalfSetB.Rack1920.stLBV1_TurnedOn
                  and Station.HalfSetB.Rack1920.stLBV2_TurnedOn
                  and Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1
                  and Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2);
                if Task4Passed[6] = stPassed then
                  Task4PassTime[6] := TimeToStr(Time)
                else
                  Task4PassTime[6] := InitialTimeString;
              end;
          end;
        end;
        {$ENDREGION}
    end;

    if CanClose then
    begin
      CurBlockSelected := NotSelected;
      //StationR414Form.Show;
    end;
  end;
end;

/// <summary>
///   ���������, ��������� �� ����������� ����� � ������������
///   � ������� �������� � ������ ��������
/// <param name = 'CanClose'> ���������� ��������, ������������,
///   ����� �� ��������� ����� </param>
/// </summary>
procedure CheckFormBeforeClosingInExamMode(var CanClose: Boolean);
var
  PassTaskNumber, ClosingFormId: Byte;

  procedure PassedTask(PassTaskType: Byte);
  begin
    case PassTaskType of
      mdStartParametersSetup:
        begin
          Task2Passed[PassTaskNumber] := stPassed;
          Task2PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
      mdPowerOn:
        begin
          Task3Passed[PassTaskNumber] := stPassed;
          Task3PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          Task4Passed[PassTaskNumber] := stPassed;
          Task4PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
      mdWorkWithLowFrequency:
        begin
          Task5Passed[PassTaskNumber] := stPassed;
          Task5PassTime[PassTaskNumber] := TimeToStr(Time);
        end;
    end;
  end;

begin
  Application.ProcessMessages;

  CanClose := True;
  ClosingFormId := CurBlockSelected;

    //====================== mdStartParametersSetup ==============================
    {$REGION '��������� ���������'}
    PassTaskNumber := Task2RackCodeArr[ClosingFormId];
    case ClosingFormId of
      idDuplexerB:
        begin
          if ((Station.HalfSetB.Duplexer.waveTransmit = Station.WaveTransmitB) and
          (Station.HalfSetB.Duplexer.waveReceive = Station.WaveReceiveB) and
          (Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and
          (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeRight)) or
          ((Station.HalfSetB.Duplexer.waveTransmit = Station.WaveTransmitB) and
          (Station.HalfSetB.Duplexer.waveReceive = Station.WaveReceiveB) and
          (Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and
          (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)) then
          begin
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          END;
        end;
      idRack1920B:
        begin
          if (Station.HalfSetB.Rack1920.butPower = butPositionDown) and
          (Station.HalfSetB.Rack1920.butPower2 = butPositionDown) and
          (Station.HalfSetB.Rack1920.but1910 = butPositionDown) and (Station.HalfSetB.Rack1920.but1910A = butPositionDown) and
          (Station.HalfSetB.Rack1920.but1930 = butPositionDown) and (Station.HalfSetB.Rack1920.but1960_1 = butPositionDown) then
          begin
            CanClose := True;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1200B2:
        begin
          if (Station.HalfSetB.Rack1200Right.But1270Main = butPositionUp) and (Station.HalfSetB.Rack1200Right.But1220AMMain = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.But1230AMain = butPositionUp) and (Station.HalfSetB.Rack1200Right.But1210AMain = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.But1270Reserve = butPositionUp) and (Station.HalfSetB.Rack1200Right.But1220AMReserve = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.But1240V = butPositionLeft) and (Station.HalfSetB.Rack1200Right.But1240V2 = butPositionLeft) and
          (Station.HalfSetB.Rack1200Right.But1240V3 = butPositionLeft) and (Station.HalfSetB.Rack1200Right.Sw1240V = 4) and
          (Station.HalfSetB.Rack1200Right.Sw1240V2 = 4) and (Station.HalfSetB.Rack1200Right.Sw1240V3 = 4) and (Station.HalfSetB.Rack1200Right.But1240G = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.But1240G1 = butPositionUp) and (Station.HalfSetB.Rack1200Right.But1240G2 = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.But1240G3 = butPositionUp) and (Station.HalfSetB.Rack1200Right.But1240G4 = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.But1240G5 = butPositionUp) and (Station.HalfSetB.Rack1200Right.But1240G6 = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.But1240G7 = butPositionUp) and (Station.HalfSetB.Rack1200Right.But1240G8 = butPositionUp) and
          (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedInCross) and (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedInCross) and
          (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedInCross) and (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedInCross) and
          (Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedInCross) and (Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedInCross) and
          (Station.HalfSetB.Rack1200Right.But1290Power = butPositionDown) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idShield:
        begin
          if ((Station.PowerPanel.swNet = 0) or (Station.PowerPanel.swNet = 2)) and
          //((Station.PowerPanel.swPhase = 0) or (Station.PowerPanel.swPhase = 2)) and
          (Station.PowerPanel.butRetranslator = butPositionDown) and
          ((Station.PowerPanel.sw1700Power = 0) or (Station.PowerPanel.sw1700Power = 2)) and
          (Station.PowerPanel.butRetranslator2 = butPositionDown) and
          ((Station.PowerPanel.sw1900Power = 0) or (Station.PowerPanel.sw1900Power = 2)) and
          ((Station.PowerPanel.sw1900Power_2 = 0) or (Station.PowerPanel.sw1900Power_2 = 2)) and
          ((Station.PowerPanel.swHeat5A = 0) or (Station.PowerPanel.swHeat5A = 2)) and
          ((Station.PowerPanel.sw1200Power = 0) or (Station.PowerPanel.sw1200Power = 2)) and
          ((Station.PowerPanel.sw1400 = 0) or  (Station.PowerPanel.sw1400 = 2)) and
          ((Station.PowerPanel.sw1200Power_2 = 0) or (Station.PowerPanel.sw1200Power_2 = 2)) and
          (Station.PowerPanel.butVent1 = butPositionDown) and
          (Station.PowerPanel.butUnitBK = butPositionDown) and
          (Station.PowerPanel.butVipriamit4V = butPositionDown) and
          (Station.PowerPanel.butVent1_2 = butPositionDown) and
          (Station.PowerPanel.butVent3 = butPositionDown) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1200A2:
        begin
          if (Station.HalfSetA.Rack1200Right.But1270Main = butPositionUp) and (Station.HalfSetA.Rack1200Right.But1220AMMain = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.But1230AMain = butPositionUp) and (Station.HalfSetA.Rack1200Right.But1210AMain = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.But1270Reserve = butPositionUp) and (Station.HalfSetA.Rack1200Right.But1220AMReserve = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.But1240V = butPositionLeft) and (Station.HalfSetA.Rack1200Right.But1240V2 = butPositionLeft) and
          (Station.HalfSetA.Rack1200Right.But1240V3 = butPositionLeft) and (Station.HalfSetA.Rack1200Right.Sw1240V = 4) and
          (Station.HalfSetA.Rack1200Right.Sw1240V2 = 4) and (Station.HalfSetA.Rack1200Right.Sw1240V3 = 4) and (Station.HalfSetA.Rack1200Right.But1240G = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.But1240G1 = butPositionUp) and (Station.HalfSetA.Rack1200Right.But1240G2 = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.But1240G3 = butPositionUp) and (Station.HalfSetA.Rack1200Right.But1240G4 = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.But1240G5 = butPositionUp) and (Station.HalfSetA.Rack1200Right.But1240G6 = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.But1240G7 = butPositionUp) and (Station.HalfSetA.Rack1200Right.But1240G8 = butPositionUp) and
          (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedInCross) and (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedInCross) and
          (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedInCross) and (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedInCross) and
          (Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedInCross) and (Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedInCross) and
          (Station.HalfSetA.Rack1200Right.But1290Power = butPositionDown) then
          begin
            CanClose := true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1600B, idRack1600Bback:
        begin
          if (Station.HalfSetB.Rack1600.butAutomatic = butPositionRight) and
          //(Station.HalfSetB.Rack1600.butDmch = butPositionUp) and
          //(Station.HalfSetB.Rack1600.butChannelControl = butPositionUp) and
          (Station.HalfSetB.Rack1600.wave1610_0 = Station.WaveReceiveB) and
          (Station.HalfSetB.Rack1600.swChannelControl = 9) and (Station.HalfSetB.Rack1600.wave1610_R = Station.WaveReceiveB) and
          (Station.HalfSetB.Rack1600.wave1600 = Station.WaveReceiveB) and (Station.HalfSetB.Rack1600B.swKukushka = 1) and
          (Station.HalfSetB.Rack1600B.but1621Main = butPositionUp) and (Station.HalfSetB.Rack1600B.but1621Reserve = butPositionUp) and
          (Station.HalfSetB.Rack1600B.butUPT = butPositionRight) and (Station.HalfSetB.Rack1600B.butUPT2 = butPositionRight) and
          (Station.HalfSetB.Rack1600B.swUGS = 5) and (Station.HalfSetB.Rack1600B.swUGS2 = 5) and (Station.HalfSetB.Rack1600B.but1622Main = butPositionUp) and
          (Station.HalfSetB.Rack1600B.but1622Reserve = butPositionUp) then
          begin
            PassedTask(mdStartParametersSetup);
            CanClose := True;
          end
          else
          begin

          end;
        end;
      idRack1710A:
        begin
          if (Station.Rack1710.swWorkMode = 1) and
          (Station.Rack1710.butAutomat = butPositionUp) and
          (Station.Rack1710.butEmergencyLine1 = butPositionUp) and
          (Station.Rack1710.butEmergencyLine2 = butPositionUp) and
          (Station.Rack1710.but1220AD = butPositionLeft) and
          (Station.Rack1710.but1230AD = butPositionLeft) and
          (Station.Rack1710.but1290 = butPositionLeft) and
          (Station.Rack1710.but1220AM = butPositionLeft) and
          (Station.Rack1710.but1230AM = butPositionLeft) and
          (Station.Rack1710.but1210A = butPositionLeft) and
          (Station.Rack1710.but1270 = butPositionLeft) and
          (Station.Rack1710.but1220AD_2 = butPositionLeft) and
          (Station.Rack1710.but1230AD_2 = butPositionLeft) and
          (Station.Rack1710.but1290_2 = butPositionLeft) and
          (Station.Rack1710.but1220AM_2 = butPositionLeft) and
          (Station.Rack1710.but1230AM_2 = butPositionLeft) and
          (Station.Rack1710.but1210A_2 = butPositionLeft) and
          (Station.Rack1710.but1270_2 = butPositionLeft) and
          (Station.Rack1710.swReductorCurrent = 1) and
          (Station.Rack1710.butExternalUplotnenieA = butPositionLeft) and
          (Station.Rack1710.butExternalUplotnenieB = butPositionLeft) and
          (Station.Rack1710.butPower = butPositionLeft) and
          (Station.Rack1710.butSpeaker = butPositionLeft) and
          (Station.Rack1710.swKukushka = 1)
          then
          begin
            PassedTask(mdStartParametersSetup);
            CanClose:=true;
          end
          else
          begin

          end;
        end;
      idRack1200B1:
        begin
          if (Station.HalfSetB.Rack1200Left.butChannelControl = butPositionDown) and (Station.HalfSetB.Rack1200Left.but1220ADMain = butPositionUp) and
          (Station.HalfSetB.Rack1200Left.but1230AMain = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1220ADReserve = butPositionUp) and
          (Station.HalfSetB.Rack1200Left.but1230AReserve = butPositionUp) and (Station.HalfSetB.Rack1200Left.But1240GMain = butPositionUp) and
          (Station.HalfSetB.Rack1200Left.But1240GMain2 = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1240GPrmPrd = butPositionUp) and
          (Station.HalfSetB.Rack1200Left.but1240GOneTwo = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1240G = butPositionUp) and
          (Station.HalfSetB.Rack1200Left.st1240G_ports = stPluggedInCross) and (Station.HalfSetB.Rack1200Left.but1240V = butPositionLeft) and
          (Station.HalfSetB.Rack1200Left.but1240V2 = butPositionLeft) and (Station.HalfSetB.Rack1200Left.Sw1240V = 4) and (Station.HalfSetB.Rack1200Left.Sw1240V2 = 4) and
          (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedInCross) and (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedInCross) and
          (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedInCross) and (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedInCross) and
          (Station.HalfSetB.Rack1200Left.but1240G1 = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1240G2 = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1240G3 = butPositionUp) and
          (Station.HalfSetB.Rack1200Left.but1240G4 = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1240G5 = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1240G6 = butPositionUp) and
          (Station.HalfSetB.Rack1200Left.but1240G7 = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1240G8 = butPositionUp) and (Station.HalfSetB.Rack1200Left.but1290Power = butPositionDown) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1200A1:
        begin
          if (Station.HalfSetA.Rack1200Left.butChannelControl = butPositionDown) and (Station.HalfSetA.Rack1200Left.but1220ADMain = butPositionUp) and
          (Station.HalfSetA.Rack1200Left.but1230AMain = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1220ADReserve = butPositionUp) and
          (Station.HalfSetA.Rack1200Left.but1230AReserve = butPositionUp) and (Station.HalfSetA.Rack1200Left.But1240GMain = butPositionUp) and
          (Station.HalfSetA.Rack1200Left.But1240GMain2 = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1240GPrmPrd = butPositionUp) and
          (Station.HalfSetA.Rack1200Left.but1240GOneTwo = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1240G = butPositionUp) and
          (Station.HalfSetA.Rack1200Left.st1240G_ports = stPluggedInCross) and (Station.HalfSetA.Rack1200Left.but1240V = butPositionLeft) and
          (Station.HalfSetA.Rack1200Left.but1240V2 = butPositionLeft) and (Station.HalfSetA.Rack1200Left.Sw1240V = 4) and (Station.HalfSetA.Rack1200Left.Sw1240V2 = 4) and
          (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedInCross) and (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedInCross) and
          (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedInCross) and (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedInCross) and
          (Station.HalfSetA.Rack1200Left.but1240G1 = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1240G2 = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1240G3 = butPositionUp) and
          (Station.HalfSetA.Rack1200Left.but1240G4 = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1240G5 = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1240G6 = butPositionUp) and
          (Station.HalfSetA.Rack1200Left.but1240G7 = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1240G8 = butPositionUp) and (Station.HalfSetA.Rack1200Left.but1290Power = butPositionDown) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1600A, idRack1600Aback:
        begin
          if (Station.HalfSetA.Rack1600.butAutomatic = butPositionRight) and
          //(Station.HalfSetA.Rack1600.butDmch = butPositionUp) and
          //(Station.HalfSetA.Rack1600.butChannelControl = butPositionUp) and
          (Station.HalfSetA.Rack1600.wave1610_0 = Station.WaveReceiveA) and
          (Station.HalfSetA.Rack1600.swChannelControl = 9) and (Station.HalfSetA.Rack1600.wave1610_R = Station.WaveReceiveA) and
          (Station.HalfSetA.Rack1600.wave1600 = Station.WaveReceiveA) and (Station.HalfSetA.Rack1600B.swKukushka = 1) and
          (Station.HalfSetA.Rack1600B.but1621Main = butPositionUp) and (Station.HalfSetA.Rack1600B.but1621Reserve = butPositionUp) and
          (Station.HalfSetA.Rack1600B.butUPT = butPositionRight) and (Station.HalfSetA.Rack1600B.butUPT2 = butPositionRight) and
          (Station.HalfSetA.Rack1600B.swUGS = 5) and (Station.HalfSetA.Rack1600B.swUGS2 = 5) and (Station.HalfSetA.Rack1600B.but1622Main = butPositionUp) and
          (Station.HalfSetA.Rack1600B.but1622Reserve = butPositionUp) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1920A:
        begin
          if (Station.HalfSetA.Rack1920.but1930 = butPositionDown) and
          (Station.HalfSetA.Rack1920.but1910 = butPositionDown) and
          (Station.HalfSetA.Rack1920.but1910A = butPositionDown) and
          (Station.HalfSetA.Rack1920.butPower2 = butPositionDown) and
          (Station.HalfSetA.Rack1920.butPower = butPositionDown) and
          (Station.HalfSetA.Rack1920.but1960_1 = butPositionDown) then
          begin
            PassedTask(mdStartParametersSetup);
            CanClose:=true;
          end
          else
          begin

          end;
        end;
      idDuplexerA:
        begin
          //-----------------����� ���������-------------------------------------------
          if ((Station.HalfSetA.Duplexer.waveTransmit = Station.WaveTransmitA)and
          (Station.HalfSetA.Duplexer.waveReceive = Station.WaveReceiveA) and
          (Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and
          (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight)) or
          ((Station.HalfSetA.Duplexer.waveTransmit = Station.WaveTransmitA)and
          (Station.HalfSetA.Duplexer.waveReceive = Station.WaveReceiveA) and
          (Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and
          (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)) then
          begin
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idMshuA:
        begin
          if (Station.HalfSetA.LittleNoisyAmplifier.swWave = Station.WaveReceiveA) and
          (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionDown) and
          (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionDown) and
          (Station.HalfSetA.LittleNoisyAmplifier.butMshu = butPositionLeft) then
          begin
            CanClose := True;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idMshuB:
        begin
          if (Station.HalfSetB.LittleNoisyAmplifier.swWave = Station.WaveReceiveB) and
          (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionDown) and
          (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionDown) and
          (Station.HalfSetB.LittleNoisyAmplifier.butMshu = butPositionLeft) then
          begin
            CanClose := true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idP321A:
        begin
          if (Station.HalfSetA.P321.butPower = butPositionDown) then
          //(Station.HalfSetA.P321.butMeasure = butPositionUp) and
          //(Station.HalfSetA.P321.but600Ohm = butPositionUp) and
          //(Station.HalfSetA.P321.swNepGen = 8) and
          //(Station.HalfSetA.P321.swFrequency = 4) and
          //(Station.HalfSetA.P321.swNepGenYY = 7) and
          //(Station.HalfSetA.P321.cblVhYY = csDisconected) and
          //(Station.HalfSetA.P321.cblVihGen = csDisconected) then
          begin
            CanClose := True;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idP321B:
        begin
          if (Station.HalfSetB.P321.butPower = butPositionDown) then
          //(Station.HalfSetB.P321.butMeasure = butPositionUp) and
          //(Station.HalfSetB.P321.but600Ohm = butPositionUp) and
          //(Station.HalfSetB.P321.swNepGen = 8) and
          //(Station.HalfSetB.P321.swFrequency = 4) and
          //(Station.HalfSetB.P321.swNepGenYY = 7) and
          //(Station.HalfSetB.P321.cblVhYY = csDisconected) and
          //(Station.HalfSetB.P321.cblVihGen = csDisconected) then
          begin
            CanClose := True;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idP321C:
        begin
          if (Station.P321C.butPower = butPositionDown) then
          //(Station.P321C.butMeasure = butPositionUp) and
          //(Station.P321C.but600Ohm = butPositionUp) and
          //(Station.P321C.swNepGen = 8) and
          //(Station.P321C.swFrequency = 4) and
          //(Station.P321C.swNepGenYY = 7) and
          //(Station.P321C.cblVhYY = csDisconected) and
          //(Station.P321C.cblVihGen = csDisconected) then
          begin
            CanClose := True;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1500B:
        begin
          if (Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft) and
          (Station.HalfSetB.Rack1500.swModeControl = 6) and
          (Station.HalfSetB.Rack1500.butMode_R = butPositionLeft) and
          (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1610_0) and
          (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1500) and
          (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave161_R) and
          (Station.HalfSetB.Rack1500.stCableNoName = csConnectedAtRack1500Sh1) and
          (Station.HalfSetB.Rack1500.stCableSh1 = csConnectedAtRack1500NoName) and
          (Station.HalfSetB.Rack1500B.butMdOsn_1 = butPositionLeft) and
          (Station.HalfSetB.Rack1500B.butMdOsn_2 = butPositionLeft) and
          (Station.HalfSetB.Rack1500B.butMdOsn_3 = butPositionLeft) and
          (Station.HalfSetB.Rack1500B.but1622_1 = butPositionUp) and
          (Station.HalfSetB.Rack1500B.but1622_2 = butPositionUp) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1500A:
        begin
          if (Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft) and
          (Station.HalfSetA.Rack1500.swModeControl = 6) and
          (Station.HalfSetA.Rack1500.butMode_R = butPositionLeft) and
          (Station.WaveTransmitA = Station.HalfSetA.Rack1500.swWave1610_0) and
          (Station.WaveTransmitA = Station.HalfSetA.Rack1500.swWave1500) and
          (Station.WaveTransmitA = Station.HalfSetA.Rack1500.swWave161_R) and
          (Station.HalfSetA.Rack1500.stCableNoName = csConnectedAtRack1500Sh1) and
          (Station.HalfSetA.Rack1500.stCableSh1 = csConnectedAtRack1500NoName) and
          (Station.HalfSetA.Rack1500B.butMdOsn_1 = butPositionLeft) and
          (Station.HalfSetA.Rack1500B.butMdOsn_2 = butPositionLeft) and
          (Station.HalfSetA.Rack1500B.butMdOsn_3 = butPositionLeft) and
          (Station.HalfSetA.Rack1500B.but1622_1 = butPositionUp) and
          (Station.HalfSetA.Rack1500B.but1622_2= butPositionUp) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
      idRack1400B:
        begin
          if (Station.Rack1400.butPower = butPositionLeft) and
          (Station.Rack1400.swKukushka = 1) then
          begin
            CanClose:=true;
            PassedTask(mdStartParametersSetup);
          end
          else
          begin

          end;
        end;
    end;
    {$ENDREGION}

    //==========================mdPowerOn=======================================
    {$REGION '��������� �������'}
    PassTaskNumber := Task3RackCodeArr[ClosingFormId];
    case ClosingFormId of
      idRack1920B:
        begin
          if (Station.HalfSetB.Rack1920.butPower = butPositionUp) and
          (Station.HalfSetB.Rack1920.butPower2 = butPositionUp) and
          (Station.HalfSetB.Rack1920.but1910 = butPositionUp) and
          (Station.HalfSetB.Rack1920.but1910A = butPositionUp) and
          (Station.HalfSetB.Rack1920.but1930 = butPositionUp) and
          (Station.HalfSetB.Rack1920.but1960_1 = butPositionUp)
          then
          begin
            CanClose := True;
            PassedTask(mdPowerOn);
          end
          else
          begin

          end;
        end;
      idRack1710A:
        begin
          if (Station.Rack1710.butPower = butPositionRight) and
          (Station.Rack1710.swKukushka = 1) and (Station.PowerPanel.swNet = 1) then
          begin
            PassedTask(mdPowerOn);
            CanClose:=true;
          end
          else
          begin

          end;
        end;
      idRack1920A:
        begin
          if (Station.HalfSetA.Rack1920.butPower = butPositionUp) and
          (Station.HalfSetA.Rack1920.butPower2 = butPositionUp) and
          (Station.HalfSetA.Rack1920.but1910 = butPositionUp) and
          (Station.HalfSetA.Rack1920.but1910A = butPositionUp) and
          (Station.HalfSetA.Rack1920.but1930 = butPositionUp) and
          (Station.HalfSetA.Rack1920.but1960_1 = butPositionUp)
          then
          begin
            CanClose:=true;
            PassedTask(mdPowerOn);
          end
          else
          begin

          end;
        end;
      idMshuA:
        begin
          if (Station.HalfSetA.LittleNoisyAmplifier.swWave = Station.WaveReceiveA) and
          (Station.HalfSetA.LittleNoisyAmplifier.butMshu = butMain) and
          (Station.HalfSetA.LittleNoisyAmplifier.butNet = butPositionUp) and
          (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp) and
          (Station.PowerPanel.swNet = 1) then
          begin
            CanClose:=true;
            PassedTask(mdPowerOn);
          end
          else
          begin

          end;
        end;
      idMshuB:
        begin
          if (Station.HalfSetB.LittleNoisyAmplifier.swWave = Station.WaveReceiveB) and
          (Station.HalfSetB.LittleNoisyAmplifier.butMshu = butMain) and
          (Station.HalfSetB.LittleNoisyAmplifier.butNet = butPositionUp) and
          (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp) and
          (Station.PowerPanel.swNet = 1) then
          begin
            CanClose := true;
            PassedTask(mdPowerOn);
          end
          else
          begin

          end;
        end;
      idRack1500B:
        begin
          if (Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft) and
          (Station.HalfSetB.Rack1500.swModeControl = 6) and
          (Station.HalfSetB.Rack1500.butMode_R = butPositionLeft) and
          (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1610_0) and
          (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave1500) and
          (Station.WaveTransmitB = Station.HalfSetB.Rack1500.swWave161_R) and
          (Station.HalfSetB.Rack1500B.butMdOsn_1 = 1) and
          (Station.HalfSetB.Rack1500B.butMdOsn_2 = 1) and
          (Station.HalfSetB.Rack1500B.butMdOsn_3 = 1) and
          (Station.HalfSetB.Rack1500B.but1622_1 = 0) and
          (Station.HalfSetB.Rack1500B.but1622_2=0) then
          begin
            CanClose := True;
            PassedTask(mdPowerOn);
          end
          else
          begin

          end;
        end;
      idShield:
        begin
          if (Station.PowerPanel.swNet = 1) and
          (Station.PowerPanel.sw1700Power = 1) and
          (Station.PowerPanel.sw1900Power = 1) and
          (Station.PowerPanel.sw1900Power_2 = 1) and
          (Station.PowerPanel.sw1200Power = 1) and
          (Station.PowerPanel.sw1200Power_2 = 1) and
          (Station.PowerPanel.sw1400 = 1) then
          begin
            CanClose := true;
            PassedTask(mdPowerOn);
          end
          else
          begin

          end;
        end;
      idRack1400B:
        begin
          if (Station.Rack1400.butPower = butPositionRight) and
          (Station.Rack1400.swKukushka = 1) and (Station.PowerPanel.swNet = 1) then
          begin
            PassedTask(mdPowerOn);
            CanClose:=true;
          end
          else
          begin

          end;
        end;
    end;
    {$ENDREGION}

    //====================mdReceiveAndTransmitTracksSetup=======================
    {$REGION '��������� �����-����������� ������'}
    case ClosingFormId of
      idRack1500A:
        begin
          if (Station.HalfSetA.Rack1500.GeterodinTunedMain and
          (Station.HalfSetA.Rack1500.GeterodinTunedReserve) and
          ((Station.HalfSetA.Rack1500.SelectedMd = smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain)) and
          (Station.HalfSetA.Rack1500.DropError) and
          (Station.HalfSetA.Rack1500.btnAutomatic = butPositionRight) and
          (Station.HalfSetA.Rack1500.swPhaseMover = 10) = True) then
          begin
            Task4Passed[1] := stPassed;
            Task4PassTime[1] := TimeToStr(Time);
          end
          else
          begin

          end;
        end;
      idRack1920A:
        begin
          Task4Passed[2] := BoolToByteInv(Station.HalfSetA.Rack1920.stLBV1_TurnedOn and Station.HalfSetA.Rack1920.stLBV2_TurnedOn and
          Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 and Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2);
          if Task4Passed[2] = stPassed then
            Task4PassTime[2] := TimeToStr(Time)
          else
            Task4PassTime[2] := InitialTimeString;
        end;
      idRack1600A:
        begin
          Task4Passed[3] := BoolToByteInv((Station.HalfSetA.Rack1600.GeterodinTunedMain) and
          (Station.HalfSetA.Rack1600.GeterodinTunedReserve) and
          ((Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and
          (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)) and
          (Station.HalfSetA.Rack1600.DropError) and
          (Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft));
          if Task4Passed[3] = stPassed then
            Task4PassTime[3] := TimeToStr(Time)
          else
            Task4PassTime[3] := InitialTimeString;
        end;
      idRack1600B:
        begin
          Task4Passed[4] := BoolToByteInv((Station.HalfSetB.Rack1600.GeterodinTunedMain) and
          (Station.HalfSetB.Rack1600.GeterodinTunedReserve) and
          ((Station.HalfSetB.Rack1600.SelectedMd = smdMain) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and
          (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain)) and
          (Station.HalfSetB.Rack1600.DropError) and
          (Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft));
          if Task4Passed[4] = stPassed then
            Task4PassTime[4] := TimeToStr(Time)
          else
            Task4PassTime[4] := InitialTimeString;
        end;
      idRack1500B:
        begin
          if (Station.HalfSetB.Rack1500.GeterodinTunedMain and
          (Station.HalfSetB.Rack1500.GeterodinTunedReserve) and
          ((Station.HalfSetB.Rack1500.SelectedMd = smdMain) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain)) and
          (Station.HalfSetB.Rack1500.DropError) and
          (Station.HalfSetB.Rack1500.btnAutomatic = butPositionRight) and
          (Station.HalfSetB.Rack1500.swPhaseMover = 10) = True) then
          begin
            Task4Passed[5] := stPassed;
            Task4PassTime[5] := TimeToStr(Time);
          end
          else
          begin
            if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn or Station.HalfSetB.Rack1920.stLBV2_TurnedOn or
            Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 or Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2) then
            begin
              Task4Passed[5] := stNotPassed;
              Task4PassTime[5] := InitialTimeString;
              AddError;
              if (Station.WorkType = wtLearn) then
              begin
                CanClose := ShowVideoHelpInLearningMode(PassTaskNumber, True);
              end;
            end;
          end;
        end;
      idRack1920B:
        begin
          Task4Passed[6] := BoolToByteInv(Station.HalfSetB.Rack1920.stLBV1_TurnedOn and Station.HalfSetB.Rack1920.stLBV2_TurnedOn and
          Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 and Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2);
          if Task4Passed[6] = stPassed then
            Task4PassTime[6] := TimeToStr(Time)
          else
            Task4PassTime[6] := InitialTimeString;
        end;
    end;
    {$ENDREGION}

    //=====================================5 �������===========================================
    {$REGION '������ � �������������� �������������'}
    if ((stDeviation.Rack1200A_PRD = stPassed)
        and (stDeviation.Rack1200A_PRM = stPassed)
        and (stDeviation.Rack1200B_PRD = stPassed)
        and (stDeviation.Rack1200B_PRM = stPassed))
        and (Task5Passed[1] = stNotPassed)
    then begin
      Task5Passed[1] := stPassed;
      Task5PassTime[1] := TimeToStr(Time);
    end
    else begin
      Task5Passed[1] := stNotPassed;
      Task5PassTime[1] := InitialTimeString;
    end;

    if (((GetNumberOfTunedChannelBlocks) > 4) and
    (GetNumberOfCallPassedThrough > 4))  and (Task5Passed[2] = stNotPassed) then
    begin
      Task5Passed[2] := stPassed;
      Task5PassTime[2] := TimeToStr(Time);
    end
    else
    begin
      Task5Passed[2] := stNotPassed;
      Task5PassTime[2] := InitialTimeString;
    end;
    {$ENDREGION}
end;


/// <summary>
/// ����������� ������� �� ������� ������ � ��������� � ����������
/// ������ ����������� ������
/// </summary>
/// <param name="CurBlockId"></param>
/// <param name="WorkMode"></param>
/// <returns></returns>
function AnalyseStation(CurBlockId: Byte = NotSelected;
                        WorkMode: Byte = NotSelected): string;
var
  strMessage: string;

  procedure AddMessage(strToAdd: string);
  begin
    if strMessage <> '' then
      strMessage := strMessage + '. ' + strToAdd
    else
      strMessage := strMessage + strToAdd;
  end;

begin
  Result := '';
  strMessage := '';
//  if CurBlockId = NotSelected then
//    CurBlockId := CurFormId;
  if WorkMode = NotSelected then
    WorkMode := Station.WorkMode;
  case WorkMode of
    mdStartParametersSetup:
      {$REGION '�������� ������������ ��������� ������'}
      begin
        case CurBlockId of
          idDuplexerB:
          begin
            if (Station.HalfSetB.Duplexer.waveTransmit <> Station.WaveTransmitB) then
            begin
              AddMessage('�������� ����� ��������. ����: ' + IntToStr(Station.HalfSetB.Duplexer.waveTransmit) + ' ����: ' +
              IntToStr(Station.WaveTransmitB));
            end;
            if (Station.HalfSetB.Duplexer.waveTransmit <> Station.WaveTransmitB) then
            begin
              AddMessage('�������� ����� ������. ����: ' + IntToStr(Station.HalfSetB.Duplexer.waveReceive) + ' ����: ' +
              IntToStr(Station.WaveReceiveB));
            end;
            if ((Station.HalfSetB.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and
            (Station.HalfSetB.Duplexer.cbSh2 <> csConnectedAtDuplexeRight)) or
            ((Station.HalfSetB.Duplexer.waveTransmit <> Station.WaveTransmitB) and
            (Station.HalfSetB.Duplexer.waveReceive <> Station.WaveReceiveB) and
            (Station.HalfSetB.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) and
            (Station.HalfSetB.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft)) then
            begin
              AddMessage('������� ���������� ������ � ����������');
            end;
          end;
          idRack1920B:
            begin
              if (Station.HalfSetB.Rack1920.butPower <> butPositionDown) then
              begin
                AddMessage('������������� ''����'' �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1920.butPower2 <> butPositionDown) then
              begin
                AddMessage('������������� ''����'' 2 �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1920.but1910 <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1910'' �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1920.but1930 <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1930'' �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1920.but1910A <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1910A'' �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1920.but1960_1 <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1360-1'' �� ���������� ���������');
              end;
            end;
          idRack1200B2:
            begin
              if (Station.HalfSetB.Rack1200Right.But1270Main <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1270'' � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1220AMMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1220AM'' � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1230AMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1230A'' � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1210AMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1210A'' � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1270Reserve <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1270'' � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1220AMReserve <> butPositionUp) then
              begin
                AddMessage('������������� ���������� ����� ''1220AM'' � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240V <> butPositionLeft) then
              begin
                AddMessage('������������� ����� ''1240�'' � ��������� ''����''');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240V2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� ''1240�-2'' � ��������� ''����''');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240V3 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� ''1240�-3'' � ������ ��������� ''����''');
              end;
              if (Station.HalfSetB.Rack1200Right.Sw1240V <> butPositionUp) then
              begin
                AddMessage('������� ����� ''1240�'' �� � ������ �������');
              end;
              if (Station.HalfSetB.Rack1200Right.Sw1240V2 <> butPositionUp) then
              begin
                AddMessage('������� ����� ''1240�-2'' �� � ������ �������');
              end;
              if (Station.HalfSetB.Rack1200Right.Sw1240V3 <> butPositionUp) then
              begin
                AddMessage('������� ����� ''1240�-3'' �� � ������ �������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G1 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-1'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G2 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-2'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G3 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-3'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G4 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-4'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G5 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-5'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G6 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-6'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G7 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-7'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G8 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-8'' �� � ������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�'' � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�'' � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-2'' � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-2'' � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-3'' � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-3'' � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Right.But1290Power <> butPositionDown) then
              begin
                AddMessage('�������� ����� ''1290'' � ��������� ��������');
              end;
            end;
          idShield:
            begin
              if (Station.PowerPanel.swNet <> 0) or (Station.PowerPanel.swNet <> 2) then
              begin
                AddMessage('������������� ��������� ������� �������');
              end;
              if (Station.PowerPanel.butRetranslator <> butPositionDown) then
              begin
                AddMessage('������������� ������� ������������� �������');
              end;
              if (Station.PowerPanel.sw1700Power <> 0) or (Station.PowerPanel.sw1700Power <> 2) then
              begin
                AddMessage('������� �� ������ 1700 ������');
              end;
              if (Station.PowerPanel.butRetranslator2 <> butPositionDown) then
              begin
                AddMessage('������������� ������� ������� ������������� �������');
              end;
              if (Station.PowerPanel.sw1900Power <> 0) or (Station.PowerPanel.sw1900Power <> 2) then
              begin
                AddMessage('������������� ������� ������ 1920 � �������');
              end;
              if (Station.PowerPanel.sw1900Power <> 0) or (Station.PowerPanel.sw1900Power <> 2) then
              begin
                AddMessage('������������� ������� ������ 1920 � �������');
              end;
              if (Station.PowerPanel.swHeat5A <> 0) or (Station.PowerPanel.swHeat5A <> 2) then
              begin
                AddMessage('������������� ������� ������������ �������');
              end;
              if (Station.PowerPanel.sw1200Power <> 0) or (Station.PowerPanel.sw1200Power <> 2) then
              begin
                AddMessage('������������� ������� ������ 1200 � �������');
              end;
              if (Station.PowerPanel.sw1200Power_2 <> 0) or (Station.PowerPanel.sw1200Power_2 <> 2) then
              begin
                AddMessage('������������� ������� ������ 1200 � �������');
              end;
              if (Station.PowerPanel.sw1400 <> 0) or (Station.PowerPanel.sw1400 <> 2) then
              begin
                AddMessage('������������� ������� ������ 1400 �������');
              end;
              if (Station.PowerPanel.butVent1 <> butPositionDown) then
              begin
                AddMessage('������������� ������� ����������� �������');
              end;
              if (Station.PowerPanel.butUnitBK <> butPositionDown) then
              begin
                AddMessage('������������� ������� ����� �� �������');
              end;
              if (Station.PowerPanel.butVent1_2 <> butPositionDown) then
              begin
                AddMessage('������������� ������� ����������� �������');
              end;
              if (Station.PowerPanel.butVipriamit4V <> butPositionDown) then
              begin
                AddMessage('������������� ������� ����������� 4� �������');
              end;
              if (Station.PowerPanel.butVent3 <> butPositionDown) then
              begin
                AddMessage('������������� ������� ����������� 3 �������');
              end;
            end;
          idRack1200A2:
            begin
              if (Station.HalfSetA.Rack1200Right.But1270Main <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1270'' � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1220AMMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1220AM'' � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1230AMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1230A'' � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1210AMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1210A'' � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1270Reserve <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1270'' � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1220AMReserve <> butPositionUp) then
              begin
                AddMessage('������������� ���������� ����� ''1220AM'' � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240V <> butPositionLeft) then
              begin
                AddMessage('������������� ����� ''1240�'' � ��������� ''����''');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240V2 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-2'' � ��������� ''����''');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240V3 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-3'' � ��������� ''����''');
              end;
              if (Station.HalfSetA.Rack1200Right.Sw1240V <> butPositionUp) then
              begin
                AddMessage('������� ����� ''1240�'' �� � ������ �������');
              end;
              if (Station.HalfSetA.Rack1200Right.Sw1240V2 <> butPositionUp) then
              begin
                AddMessage('������� ����� ''1240�-2'' �� � ������ �������');
              end;
              if (Station.HalfSetA.Rack1200Right.Sw1240V3 <> butPositionUp) then
              begin
                AddMessage('������� ����� ''1240�-3'' �� � ������ �������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G1 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-1'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G2 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-2'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G3 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-3'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G4 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-4'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G5 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-5'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G6 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-6'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G7 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-7'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G8 <> butPositionUp) then
              begin
                AddMessage('������������� ����� ''1240�-8'' �� � ������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�'' � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�'' � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-2'' � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-2'' � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-3'' � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('�������� ����� ''1240�-3'' � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Right.But1290Power <> butPositionDown) then
              begin
                AddMessage('�������� ����� ''1290'' � ��������� ��������');
              end;
            end;
          idRack1600B, idRack1600Bback:
            begin
              if (Station.HalfSetB.Rack1600.butAutomatic <> butPositionRight) then
              begin
                AddMessage('������������� ���������� �������');
              end;
              if (Station.HalfSetB.Rack1600.butDmch <> butPositionUp) then
              begin
                AddMessage('������������� ��� �� �������');
              end;
              if (Station.HalfSetB.Rack1600.butDmch <> butPositionUp) then
              begin
                AddMessage('������������� ��� �� �������');
              end;
              if (Station.HalfSetB.Rack1600.butChannelControl <> butPositionUp) then
              begin
                AddMessage('������������� �������� ������� �� �������');
              end;
              if (Station.HalfSetB.Rack1600.wave1610_0 <> Station.WaveReceiveB) then
              begin
                AddMessage('����������� ���������� ����� 1610-0. ���� ' + inttostr(Station.HalfSetB.Rack1600.wave1610_0) + ' ����:' +
                IntToStr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.Rack1600.swChannelControl <> 9) then
              begin
                AddMessage('������� �������� ������� �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1600.wave1610_R <> Station.WaveReceiveB) then
              begin
                AddMessage('����������� ���������� ����� 1610-�. ���� ' + inttostr(Station.HalfSetB.Rack1600.wave1610_R) + ' ����:' +
                IntToStr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.Rack1600.wave1610_R <> Station.WaveReceiveB) then
              begin
                AddMessage('����������� ���������� ����� 1600. ���� ' + inttostr(Station.HalfSetB.Rack1600.wave1600) + ' ����:' +
                IntToStr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.Rack1600B.swKukushka <> 1) then
              begin
                AddMessage('������� �� � ��������� ''���''');
              end;
              if (Station.HalfSetB.Rack1600B.but1621Main <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1621-0 �� �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1600B.but1621Reserve <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1621-� �� �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1600B.butUPT <> butPositionRight) then
              begin
                AddMessage('������������� ����� ��� �� � ��������� ''���''');
              end;
              if (Station.HalfSetB.Rack1600B.butUPT2 <> butPositionRight) then
              begin
                AddMessage('������������� ����� ���-2 �� � ��������� ''���''');
              end;
              if (Station.HalfSetB.Rack1600B.swUGS2 <> 5) then
              begin
                AddMessage('������������� ����� ���-2 �� �� ������� ''5''');
              end;
              if (Station.HalfSetB.Rack1600B.swUGS <> 5) then
              begin
                AddMessage('������������� ����� ��� �� �� ������� ''5''');
              end;
              if (Station.HalfSetB.Rack1600B.but1622Main <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-0 �� �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1600B.but1622Reserve <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-0 �� �� ���������� ���������');
              end;
            end;
          idRack1710A:
            begin
              if (Station.Rack1710.swWorkMode <> 1) then
              begin
                AddMessage('������������� ������ ������ �� � ��� ���������');
              end;
              if (Station.Rack1710.butEmergencyLine1 <> butPositionUp) then
              begin
                AddMessage('������������� ��������� ����� �� �� ���������� ���������');
              end;
              if (Station.Rack1710.butEmergencyLine2 <> butPositionUp) then
              begin
                AddMessage('������������� ��������� ����� 2 �� �� ���������� ���������');
              end;
              if (Station.Rack1710.but1220AD <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1220�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1220AD <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1230�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1290 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1290 (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1220AM <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1220�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1230AM <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1230�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1210A <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1210� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1270 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1270 (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1220AD_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1220�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1230AD_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1230�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1290_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1290 (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1220AM_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1220�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1230AM_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1230�� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1210A_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1210� (�) �� ��������� �����');
              end;
              if (Station.Rack1710.but1270_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1270 (�) �� ��������� �����');
              end;
              if (Station.Rack1710.swReductorCurrent <> 1) then
              begin
                AddMessage('������������� ����� 310 �� � ��� ���������');
              end;
              if (Station.Rack1710.butExternalUplotnenieA <> butPositionLeft) then
              begin
                AddMessage('������������� �������� ���������� � � ��������� ''�������''');
              end;
              if (Station.Rack1710.butExternalUplotnenieB <> butPositionLeft) then
              begin
                AddMessage('������������� �������� ���������� � � ��������� ''�������''');
              end;
              if (Station.Rack1710.butPower <> butPositionLeft) then
              begin
                AddMessage('������������� ������� ����� 470 �� ���������� ���������''');
              end;
              if (Station.Rack1710.butSpeaker <> butPositionLeft) then
              begin
                AddMessage('���������������� �������''');
              end;
              if (Station.Rack1710.swKukushka <> 1) then
              begin
                AddMessage('������� ������������ ������� ����� 470 ��������''');
              end;
            end;
          idRack1200B1:
            begin
              if (Station.HalfSetB.Rack1200Left.butChannelControl <> butPositionDown) then
              begin
                AddMessage('������������� �������� ������� �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1220ADMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1220�� � ��������� ''��������''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1230AMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1230 � ��������� ''��������''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1220ADReserve <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1220�� (��������) �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1230AReserve <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1230 (��������) �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.But1240GMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-0 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.But1240GMain2 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-0 (���������) �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240GPrmPrd <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240� � ��������� ''��''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240GOneTwo <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240� � ��������� ''2''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240� �� � ��������� ''���.''');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240G_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240� � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240V <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1240�  � ��������� ''����''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240V2 <> butPositionLeft) then
              begin
                AddMessage('�������� ����� 1240�2 � ��������� ''����''');
              end;
              if (Station.HalfSetB.Rack1200Left.Sw1240V <> 1) then
              begin
                AddMessage('������� ����� 1240� �� � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.Sw1240V2 <> 1) then
              begin
                AddMessage('������� ����� 1240�2 �� � ������ ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240� � ��������� �����');
              end;
               if (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240� � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240�-2 � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240�-2 � ��������� �����');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G1 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-1 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G2 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-2 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G3 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-3 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G4 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-4 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G5 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-5 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G6 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-6 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G7 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-7 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G8 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-8 �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1200Left.but1290Power <> butPositionDown) then
              begin
                AddMessage('������� ����� 1290 ��������');
              end;
            end;
          idRack1200A1:
            begin
              if (Station.HalfSetA.Rack1200Left.butChannelControl <> butPositionDown) then
              begin
                AddMessage('������������� �������� ������� �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1220ADMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1220�� � ��������� ''��������''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1230AMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1230 � ��������� ''��������''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1220ADReserve <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1220�� (��������) �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1230AReserve <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1230 (��������) �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.But1240GMain <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-0 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.But1240GMain2 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-0 (���������) �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240GPrmPrd <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240� � ��������� ''��''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240GOneTwo <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240� � ��������� ''2''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240� �� � ��������� ''���.''');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240G_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240� � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240V <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1240� � ��������� ''����''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240V2 <> butPositionLeft) then
              begin
                AddMessage('�������� ����� 1240�2 � ��������� ''����''');
              end;
              if (Station.HalfSetA.Rack1200Left.Sw1240V <> 1) then
              begin
                AddMessage('������� ����� 1240� �� � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.Sw1240V2 <> 1) then
              begin
                AddMessage('������� ����� 1240�2 �� � ������ ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240� � ��������� �����');
              end;
               if (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240� � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240�-2 � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('�������� ����� 1240�-2 � ��������� �����');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G1 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-1 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G2 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-2 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G3 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-3 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G4 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-4 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G5 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-5 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G6 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-6 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G7 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-7 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G8 <> butPositionUp) then
              begin
                AddMessage('������������� ����� 1240�-8 �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1200Left.but1290Power <> butPositionDown) then
              begin
                AddMessage('������� ����� 1290 ��������');
              end;
            end;
          idRack1600A, idRack1600Aback:
            begin
              if (Station.HalfSetA.Rack1600.butAutomatic <> butPositionRight) then
              begin
                AddMessage('������������� ���������� �������');
              end;
              if (Station.HalfSetA.Rack1600.butDmch <> butPositionUp) then
              begin
                AddMessage('������������� ��� �� �������');
              end;
              if (Station.HalfSetA.Rack1600.butChannelControl <> butPositionUp) then
              begin
                AddMessage('������������� �������� ������� �� �������');
              end;
              if (Station.HalfSetA.Rack1600.wave1610_0 <> Station.WaveReceiveA) then
              begin
                AddMessage('����������� ���������� ����� 1610-0. ���� ' + inttostr(Station.HalfSetA.Rack1600.wave1610_0) + ' ����:' +
                IntToStr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.Rack1600.swChannelControl <> 9) then
              begin
                AddMessage('������� �������� ������� �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1600.wave1610_R <> Station.WaveReceiveA) then
              begin
                AddMessage('����������� ���������� ����� 1610-�. ���� ' + inttostr(Station.HalfSetA.Rack1600.wave1610_R) + ' ����:' +
                IntToStr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.Rack1600.wave1610_R <> Station.WaveReceiveA) then
              begin
                AddMessage('����������� ���������� ����� 1600. ���� ' + inttostr(Station.HalfSetA.Rack1600.wave1600) + ' ����:' +
                IntToStr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.Rack1600B.swKukushka <> 1) then
              begin
                AddMessage('������� �� � ��������� ''���''');
              end;
              if (Station.HalfSetA.Rack1600B.but1621Main <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1621-0 �� �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1600B.but1621Reserve <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1621-� �� �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1600B.butUPT <> butPositionRight) then
              begin
                AddMessage('������������� ����� ��� �� � ��������� ''���''');
              end;
              if (Station.HalfSetA.Rack1600B.butUPT2 <> butPositionRight) then
              begin
                AddMessage('������������� ����� ���-2 �� � ��������� ''���''');
              end;
              if (Station.HalfSetA.Rack1600B.swUGS2 <> 5) then
              begin
                AddMessage('������������� ����� ���-2 �� �� ������� ''5''');
              end;
              if (Station.HalfSetA.Rack1600B.swUGS <> 5) then
              begin
                AddMessage('������������� ����� ��� �� �� ������� ''5''');
              end;
              if (Station.HalfSetA.Rack1600B.but1622Main <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-0 �� �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1600B.but1622Reserve <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-0 �� �� ���������� ���������');
              end;
            end;
          idRack1920A:
            begin
              if (Station.HalfSetA.Rack1920.butPower <> butPositionDown) then
              begin
                AddMessage('������������� ''����'' �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1920.butPower2 <> butPositionDown) then
              begin
                AddMessage('������������� ''����'' 2 �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1920.but1910 <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1910'' �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1920.but1930 <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1930'' �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1920.but1910A <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1910A'' �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1920.but1960_1 <> butPositionDown) then
              begin
                AddMessage('������������� ����� ''1360-1'' �� ���������� ���������');
              end;
            end;
          idDuplexerA:
            begin
              //-----------------����� ���������-------------------------------------------
              if (Station.HalfSetA.Duplexer.waveTransmit <> Station.WaveTransmitA) then
              begin
                AddMessage('�������� ����� ��������. ����: ' + IntToStr(Station.HalfSetA.Duplexer.waveTransmit) + ' ����: ' +
                IntToStr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Duplexer.waveReceive <> Station.WaveReceiveA) then
              begin
                AddMessage('�������� ����� ������. ����: ' + IntToStr(Station.HalfSetA.Duplexer.waveReceive) + ' ����: ' +
                IntToStr(Station.WaveReceiveA));
              end;
              if ((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and
              (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeRight)) or
              ((Station.HalfSetA.Duplexer.waveTransmit <> Station.WaveTransmitB) and
              (Station.HalfSetA.Duplexer.waveReceive <> Station.WaveReceiveB) and
              (Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) and
              (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft)) then
              begin
                AddMessage('������� ���������� ������ � ����������');
              end;
            end;
          idMshuA:
            begin
              if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
              begin
                AddMessage('����������� ���������� ����� ������. ����: ' + inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave) + ' ����: ' + inttostr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet <> butPositionDown) then
              begin
                AddMessage('������������� ����� 1831 �� ���������� ���������');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet2 <> butPositionDown) then
              begin
                AddMessage('������������� ����� 1831-� �� ���������� ���������');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butMshu <> butPositionLeft) then
              begin
                AddMessage('������������� ������ ��������� ����� ����� �� �������� ''��������� ����''');
              end;
            end;
          idMshuB:
            begin
              if (Station.HalfSetB.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
              begin
                AddMessage('����������� ���������� ����� ������. ����: ' + inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave) + ' ����: ' + inttostr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet <> butPositionDown) then
              begin
                AddMessage('������������� ����� 1831 �� ���������� ���������');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet2 <> butPositionDown) then
              begin
                AddMessage('������������� ����� 1831-� �� ���������� ���������');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butMshu <> butPositionLeft) then
              begin
                AddMessage('������������� ������ ��������� ����� ����� �� �������� ''��������� ����''');
              end;
            end;
          idP321A:
            begin
              if (Station.HalfSetA.P321.butPower <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''����''');
              end;
              if (Station.HalfSetA.P321.butMeasure <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''����''');
              end;
              if (Station.HalfSetA.P321.but600Ohm <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''���. ����.''');
              end;
              if (Station.HalfSetA.P321.swNepGen <> 8) then
              begin
                AddMessage('������� ''���. ���.'' �� � ��� ���������');
              end;
              if (Station.HalfSetA.P321.swFrequency <> 4) then
              begin
                AddMessage('������� ''�������'' �� � ��� ���������');
              end;
              if (Station.HalfSetA.P321.swNepGenYY <> 7) then
              begin
                AddMessage('������� ''���. ��.'' �� � ��� ���������');
              end;
              if (Station.HalfSetA.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('������ ����� ��������� ������ ���������');
              end;
              if (Station.HalfSetA.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('������ ������ ���������� ���������');
              end;
            end;
          idP321B:
            begin
              if (Station.HalfSetB.P321.butPower <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''����''');
              end;
              if (Station.HalfSetB.P321.butMeasure <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''����''');
              end;
              if (Station.HalfSetB.P321.but600Ohm <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''���. ����.''');
              end;
              if (Station.HalfSetB.P321.swNepGen <> 8) then
              begin
                AddMessage('������� ''���. ���.'' �� � ��� ���������');
              end;
              if (Station.HalfSetB.P321.swFrequency <> 4) then
              begin
                AddMessage('������� ''�������'' �� � ��� ���������');
              end;
              if (Station.HalfSetB.P321.swNepGenYY <> 7) then
              begin
                AddMessage('������� ''���. ��.'' �� � ��� ���������');
              end;
              if (Station.HalfSetB.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('������ ����� ��������� ������ ���������');
              end;
              if (Station.HalfSetB.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('������ ������ ���������� ���������');
              end;
            end;
          idP321C:
            begin
              if (Station.P321C.butPower <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''����''');
              end;
              if (Station.P321C.butMeasure <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''����''');
              end;
              if (Station.P321C.but600Ohm <> butPositionUp) then
              begin
                AddMessage('������������� ������� � ��������� ''���. ����.''');
              end;
              if (Station.P321C.swNepGen <> 8) then
              begin
                AddMessage('������� ''���. ���.'' �� � ��� ���������');
              end;
              if (Station.P321C.swFrequency <> 4) then
              begin
                AddMessage('������� ''�������'' �� � ��� ���������');
              end;
              if (Station.P321C.swNepGenYY <> 7) then
              begin
                AddMessage('������� ''���. ��.'' �� � ��� ���������');
              end;
              if (Station.P321C.cblVhYY <> csDisconected) then
              begin
                AddMessage('������ ����� ��������� ������ ���������');
              end;
              if (Station.P321C.cblVhYY <> csDisconected) then
              begin
                AddMessage('������ ������ ���������� ���������');
              end;
            end;
          idRack1500B:
            begin
              if (Station.HalfSetB.Rack1500.btnAutomatic <> butPositionLeft) then
              begin
                AddMessage('������������� ���������� �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1500.swModeControl <> 6) then
              begin
                AddMessage('������� �������� ������� �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1500.butMode_R <> butPositionLeft) then
              begin
                AddMessage('������������� �������� ������� �� � ��� ���������');
              end;
              if (Station.HalfSetB.Rack1500.swWave1610_0 <> Station.WaveTransmitB) then
              begin
                AddMessage('����������� ���������� ����� �������� ����� 1610-0. ����: ' + inttostr(Station.HalfSetB.Rack1500.swWave1610_0) +
                ' ����: ' + inttostr(Station.WaveTransmitB));
              end;
              if (Station.HalfSetB.Rack1500.swWave1500 <> Station.WaveTransmitB) then
              begin
                AddMessage('����������� ���������� ����� �������� ����� 1500. ����: ' + inttostr(Station.HalfSetB.Rack1500.swWave1500) +
                ' ����: ' + inttostr(Station.WaveTransmitB));
              end;
              if (Station.HalfSetB.Rack1500.swWave161_R <> Station.WaveTransmitB) then
              begin
                AddMessage('����������� ���������� ����� �������� ����� 1610-�. ����: ' + inttostr(Station.HalfSetB.Rack1500.swWave161_R) +
                ' ����: ' + inttostr(Station.WaveTransmitB));
              end;
              if (Station.HalfSetB.Rack1500.stCableNoName <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('����������� ��������� ������ ��������');
              end;
              if (Station.HalfSetB.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('����������� ��������� ������ �1');
              end;
              if (Station.HalfSetB.Rack1500B.butMdOsn_1 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1550 �� � ��������� ''���.''');
              end;
              if (Station.HalfSetB.Rack1500B.butMdOsn_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1550 �� � ��������� ''���.''');
              end;
              if (Station.HalfSetB.Rack1500B.butMdOsn_3 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1550 �� � ��������� ''����.''');
              end;
              if (Station.HalfSetB.Rack1500B.but1622_1 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-0 �� �� ���������� ���������');
              end;
              if (Station.HalfSetB.Rack1500B.but1622_2 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-� �� �� ���������� ���������');
              end;
            end;
          idRack1500A:
            begin
              if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionLeft) then
              begin
                AddMessage('������������� ���������� �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1500.swModeControl <> 6) then
              begin
                AddMessage('������� �������� ������� �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1500.butMode_R <> butPositionLeft) then
              begin
                AddMessage('������������� �������� ������� �� � ��� ���������');
              end;
              if (Station.HalfSetA.Rack1500.swWave1610_0 <> Station.WaveTransmitA) then
              begin
                AddMessage('����������� ���������� ����� �������� ����� 1610-0. ����: ' + inttostr(Station.HalfSetA.Rack1500.swWave1610_0) +
                ' ����: ' + inttostr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Rack1500.swWave1500 <> Station.WaveTransmitA) then
              begin
                AddMessage('����������� ���������� ����� �������� ����� 1500. ����: ' + inttostr(Station.HalfSetA.Rack1500.swWave1500) +
                ' ����: ' + inttostr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Rack1500.swWave161_R <> Station.WaveTransmitA) then
              begin
                AddMessage('����������� ���������� ����� �������� ����� 1610-�. ����: ' + inttostr(Station.HalfSetA.Rack1500.swWave161_R) +
                ' ����: ' + inttostr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Rack1500.stCableNoName <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('����������� ��������� ������ ��������');
              end;
              if (Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('����������� ��������� ������ �1');
              end;
              if (Station.HalfSetA.Rack1500B.butMdOsn_1 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1550 �� � ��������� ''���.''');
              end;
              if (Station.HalfSetA.Rack1500B.butMdOsn_2 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1550 �� � ��������� ''���.''');
              end;
              if (Station.HalfSetA.Rack1500B.butMdOsn_3 <> butPositionLeft) then
              begin
                AddMessage('������������� ����� 1550 �� � ��������� ''����.''');
              end;
              if (Station.HalfSetA.Rack1500B.but1622_1 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-0 �� �� ���������� ���������');
              end;
              if (Station.HalfSetA.Rack1500B.but1622_2 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1622-� �� �� ���������� ���������');
              end;
            end;
          idRack1400B:
            begin
              if (Station.Rack1400.butPower <> butPositionLeft) then
              begin
                AddMessage('������� ������ �� ��������� ���������');
              end;
              if (Station.Rack1400.swKukushka <> 1) then
              begin
                AddMessage('������� �� � ������ ���������');
              end;
            end;
        end;
      end;
      {$ENDREGION}
    mdPowerOn:
      {$REGION '�������� ������������ ��������� ������'}
      begin
        case CurBlockId of
          idRack1920B:
            begin
              if (Station.HalfSetB.Rack1920.butPower <> butPositionUp) then
              begin
                AddMessage('������������� ������� ������ ��� �� �������');
              end;
              if (Station.HalfSetB.Rack1920.butPower2 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ������ ��� �� �������');
              end;
              if (Station.HalfSetB.Rack1920.but1910 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1910 �� �������');
              end;
              if (Station.HalfSetB.Rack1920.but1910A <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1910� �� �������');
              end;
              if (Station.HalfSetB.Rack1920.but1930 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1930 �� �������');
              end;
              if (Station.HalfSetB.Rack1920.but1960_1 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1960-1 �� �������');
              end;
            end;
          idRack1710A:
            begin
              if (Station.Rack1710.butPower <> butPositionRight) then
              begin
                AddMessage('������������� ������� ����� 1710 �� �������');
              end;
              if (Station.Rack1710.swKukushka <> butPositionRight) then
              begin
                AddMessage('������� ��������� ������� ����� 470 �� � ������ ���������');
              end;
            end;
          idRack1920A:
            begin
              if (Station.HalfSetA.Rack1920.butPower <> butPositionUp) then
              begin
                AddMessage('������������� ������� ������ ��� �� �������');
              end;
              if (Station.HalfSetA.Rack1920.butPower2 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ������ ��� �� �������');
              end;
              if (Station.HalfSetA.Rack1920.but1910 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1910 �� �������');
              end;
              if (Station.HalfSetA.Rack1920.but1910A <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1910� �� �������');
              end;
              if (Station.HalfSetA.Rack1920.but1930 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1930 �� �������');
              end;
              if (Station.HalfSetA.Rack1920.but1960_1 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ����� 1960-1 �� �������');
              end;
            end;
          idMshuA:
            begin
              if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
              begin
                AddMessage('�������� ����� ������. ����: ' + inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave) + ' ����: ' +
                inttostr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butMshu <> butMain) then
              begin
                AddMessage('������������� ������ ��������� ���������� �� ��������� �����');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet <> butPositionUp) then
              begin
                AddMessage('������������� ������� ��������� ����� ��������');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet2 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ���������� ����� ��������');
              end;
            end;
          idMshuB:
            begin
              if (Station.HalfSetB.LittleNoisyAmplifier.swWave <> Station.WaveReceiveB) then
              begin
                AddMessage('�������� ����� ������. ����: ' + inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave) + ' ����: ' +
                inttostr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butMshu <> butMain) then
              begin
                AddMessage('������������� ������ ��������� ���������� �� ��������� �����');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet <> butPositionUp) then
              begin
                AddMessage('������������� ������� ��������� ����� ��������');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet2 <> butPositionUp) then
              begin
                AddMessage('������������� ������� ���������� ����� ��������');
              end;
            end;
          idShield:
            begin
              if (Station.PowerPanel.swNet <> 1) then
              begin
                AddMessage('������������� ������ ���������� �� ��� � ����������� ���������');
              end;
              if (Station.PowerPanel.sw1700Power <> 1) then
              begin
                AddMessage('������������� ������� ����� 1700 � ����������� ���������');
              end;
              if (Station.PowerPanel.sw1900Power <> 1) then
              begin
                AddMessage('������������� ������� ����� 1900 (�) � ����������� ���������');
              end;
              if (Station.PowerPanel.sw1900Power_2 <> 1) then
              begin
                AddMessage('������������� ������� ����� 1900 (�) � ����������� ���������');
              end;
              if (Station.PowerPanel.sw1200Power <> 1) then
              begin
                AddMessage('������������� ������� ����� 1200 (�) � ����������� ���������');
              end;
              if (Station.PowerPanel.sw1200Power_2 <> 1) then
              begin
                AddMessage('������������� ������� ����� 1200 (�) � ����������� ���������');
              end;
              if (Station.PowerPanel.sw1400 <> 1) then
              begin
                AddMessage('������������� ������� ����� 1400 � ����������� ���������');
              end;
            end;
          idRack1400B:
            begin
              if Station.Rack1400.butPower = butPositionRight then
              begin
                AddMessage('������� ����� 1400 �� ��������');
              end;
            end;
        end;
      end;
      {$ENDREGION}
    mdReceiveAndTransmitTracksSetup:
      {$REGION '�������� ������������ ��������� ������'}
      case CurBlockId of
        idRack1500A:
          begin
            if not(Station.HalfSetA.Rack1500.GeterodinTunedMain) then
            begin
              AddMessage('��������� ��������� ������ �� ��������');
            end;
            if not(Station.HalfSetA.Rack1500.GeterodinTunedReserve) then
            begin
              AddMessage('��������� ���������� ������ �� ��������');
            end;
            if ((Station.HalfSetA.Rack1500.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain)) then
            begin
              AddMessage('� �������� ����������� ��������� ������ ��������� ��������');
            end;
            if (not(Station.HalfSetA.Rack1500.DropError)) then
            begin
              AddMessage('�� �������� ������');
            end;
            if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionRight) then
            begin
              AddMessage('������������� ���������� �� �������');
            end;
            if (Station.HalfSetA.Rack1500.swPhaseMover <> 10) then
            begin
              AddMessage('������������ �� ���������');
            end;
          end;
        idRack1920A:
          begin
            if not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('���������� �� ��� 1 �� ������');
            end;
            if not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('���������� �� ��� 2 �� ������');
            end;
            if not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('���������� �� �������� ��� 1');
            end;
            if not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('���������� �� �������� ��� 2');
            end;
          end;
        idRack1600A:
          begin
            if not(Station.HalfSetA.Rack1600.GeterodinTunedMain) then
            begin
              AddMessage('��������� ��������� ��������� ������ �� ��������');
            end;
            if not(Station.HalfSetA.Rack1600.GeterodinTunedReserve) then
            begin
              AddMessage('��������� ���������� ��������� ������ �� ��������');
            end;
            if ((Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and
            (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)) then
            begin
              AddMessage('� �������� ������� ������ ������� ���������');
            end;
            if not(Station.HalfSetA.Rack1600.DropError) then
            begin
              AddMessage('������ �� ��������');
            end;
            if (Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft) then
            begin
              AddMessage('���������� �� ��������');
            end;
          end;
        idRack1600B:
          begin
            if not(Station.HalfSetB.Rack1600.GeterodinTunedMain) then
            begin
              AddMessage('��������� ��������� ��������� ������ �� ��������');
            end;
            if not(Station.HalfSetB.Rack1600.GeterodinTunedReserve) then
            begin
              AddMessage('��������� ���������� ��������� ������ �� ��������');
            end;
            if ((Station.HalfSetB.Rack1600.SelectedMd = smdMain) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and
            (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain)) then
            begin
              AddMessage('� �������� ������� ������ ������� ���������');
            end;
            if not(Station.HalfSetB.Rack1600.DropError) then
            begin
              AddMessage('������ �� ��������');
            end;
            if (Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft) then
            begin
              AddMessage('���������� �� ��������');
            end;
          end;
        idRack1500B:
          begin
            if not(Station.HalfSetB.Rack1500.GeterodinTunedMain) then
            begin
              AddMessage('��������� ��������� ������ �� ��������');
            end;
            if not(Station.HalfSetB.Rack1500.GeterodinTunedReserve) then
            begin
              AddMessage('��������� ���������� ������ �� ��������');
            end;
            if ((Station.HalfSetB.Rack1500.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain)) then
            begin
              AddMessage('� �������� ����������� ��������� ������ ��������� ��������');
            end;
            if (not(Station.HalfSetB.Rack1500.DropError)) then
            begin
              AddMessage('�� �������� ������');
            end;
            if (Station.HalfSetB.Rack1500.btnAutomatic <> butPositionRight) then
            begin
              AddMessage('������������� ���������� �� �������');
            end;
            if (Station.HalfSetB.Rack1500.swPhaseMover <> 10) then
            begin
              AddMessage('������������ �� ���������');
            end;
          end;
        idRack1920B:
          begin
            if not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('���������� �� ��� 1 �� ������');
            end;
            if not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('���������� �� ��� 2 �� ������');
            end;
            if not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('���������� �� �������� ��� 1');
            end;
            if not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('���������� �� �������� ��� 2');
            end;
          end;
      end;
      {$ENDREGION}
    mdWorkWithLowFrequency:
      {$REGION '�������� ������������ ��������� ������'}
      begin
        if (stDeviation.Rack1200A_PRD <> stPassed) then
        begin
          AddMessage('�������� ������ 1200� ��� �� ���������');
        end;
        if (stDeviation.Rack1200A_PRM <> stPassed) then
        begin
          AddMessage('�������� ������ 1200� ��� �� ���������');
        end;
        if (stDeviation.Rack1200B_PRD <> stPassed) then
        begin
          AddMessage('�������� ������ 1200� ��� �� ���������');
        end;
        if (stDeviation.Rack1200B_PRM <> stPassed) then
        begin
          AddMessage('�������� ������ 1200� ��� �� ���������');
        end;
        if (GetNumberOfTunedChannelBlocks < 5) then
        begin
          AddMessage('���������� ����������� ��������� ������ ������ 5: ' + inttostr(GetNumberOfTunedChannelBlocks));
        end;
        if (GetNumberOfCallPassedThrough < 5) then
        begin
          AddMessage('���������� ������������� ������� ������ 5: ' + inttostr(GetNumberOfCallPassedThrough));
        end;
      end;
      {$ENDREGION}
    mdTransferToTerminalMode:
      {$REGION '�������� ������������ ��������� ������'}
      { TODO: ������� �������� ��������� ������ }
      {$ENDREGION}
  end;
  Result := strMessage;
end;
{$ENDREGION}

end.
