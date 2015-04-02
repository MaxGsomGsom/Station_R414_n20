unit uTaskControllerDM;

interface


uses
  uConstantsDM,
  uStationStateDM,
  uDefinitionsDM,
  forms,
  Controls,
  Classes,
  uNetWorkerDM,
  StdCtrls,
  ExtCtrls,
  uAdditionalFormMethods,
  uTasks20,
  uErrorKeeper;



/// <summary>
///   Реализует контроль заданий, проверку ошибок и прочее,
///   связанное с обучением (ПОКА НЕ РЕАЛИЗОВАН)
/// </summary>
///
///


type TTaskController = class
  private
    //FTasks: TList<TTask>;     // TTask - общий предок для классов, содержащих
                                // тексты заданий, проверку заданий и проч
                                // Каждому Task соответствует константа из
                                // перечисления TaskType
    FStation: TStation;
               FSubTaskComplete: TNotifyEvent;
      FTaskComplete: TNotifyEvent;
      FChangeText: TNotifyEvent;

       
    
    const                       // Временно, пока нет самих заданий,
                                // используем константы
      Count_Tasks = 3;
//      task_title_1 = 'Включение питания';
//      task_title_2 =
//        'Проверка работоспособности станции в режиме "Автономный контроль"';
//      task_title_3 = 'Установка служебной связи с кроссом' ;
//      task_title_4 = 'Перевод станции в оконечный режим работы' ;
//      task_title_5 =
//        'Измерение запаса СВЧ уровня на выходе приёмников обоих полукомплектов';
//      task_title_6 =
//        'Регулировка остаточного затухания двух каналов ТЧ  в режиме 4ПР.ОК.';




      function GetCountTasks: Integer;

      property Station: TStation read FStation
                                 write FStation;
  public


    procedure SetCurrentTask();
    procedure Subscribe (CurForm0: TForm);
    procedure NetCheckTask();
    procedure CheckRecievedParams(Param: string; Value: string);

           property OnChangeText: TNotifyEvent read FChangeText write FChangeText;
       property OnSubTaskComplete: TNotifyEvent read FSubTaskComplete write FSubTaskComplete;
       property OnTaskComplete: TNotifyEvent read FTaskComplete write FTaskComplete;
       procedure CheckTask(Sender0: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    constructor Create(Station: TStation; NetWorker: TClientNetWorker);
    //destructor Destroy; override; // Переопредел-й виртуальный метод,
                                    // делает Tasks.Free
    function GetTaskTitle(TaskID: Integer): string;
     function GetCurSubTaskBlock: TRacksEnum;
    
    //class function GetTaskType(TaskID: Integer): TTaskType; static;

    property CountTasks: Integer read GetCountTasks;
    var
    CurrentTask : TTask;
    CurrentForm: TForm;
    NetWorker: TClientNetWorker;
    ErrorKeeper: TErrorKeeper;
    //Tasks: array of TTask;






{$REGION 'Старые методы'}



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



  procedure CheckFormBeforeClosingInExamMode(var CanClose: Boolean);
  procedure MadeMistake(MistakeId: Integer);
  procedure LoadSubject;
  function AnalyseStation(CurBlockId: Byte = NotSelected;
                          WorkMode: Byte = NotSelected): string;
                 procedure CheckFormBeforeClosing(var CanClose: Boolean);
                 function ChangeEvent: Byte;
                 procedure AddError(ErrorInRackCode: Byte = NotSelected;
    ErrorDescription: string = '');
{$ENDREGION}  

 end;

implementation


uses
  ComCtrls,
  SysUtils,
  Windows,
  uTasksDM,
  uStationR414Form,
  uButtonBackForm;

constructor TTaskController.Create(Station: TStation; NetWorker: TClientNetWorker);
begin
  Inherited Create;
  Self.Station := Station;
ErrorKeeper := TErrorKeeper.Create;
        ErrorKeeper.ErrorMsg := '';

  self.NetWorker:=NetWorker;
   NetWorker.OnRecievedTaskParamsR414:=Self.CheckRecievedParams;
  //self.ClientState = ClientState;
  //Создать объекты Task в Tasks      SetLength(Tasks, 1);
      //Tasks[0] = TTaskNone.Create

end;

/// <summary>
///   Возвращает тип задания по его ID (индексация с 1)
/// <param name='TaskID'>ID Задания<param>
/// </summary>
//class function TTaskController.GetTaskType(TaskID: Integer): TTaskType;
//begin
//                                                     // Low = ttNone
//  if (TaskID > Ord(Low(TTaskType)))                  // Если такой ID
//    and (TaskID <= Ord(High(TTaskType))) then        // есть в перечислении
//  begin
//    Exit(TTaskType(TaskID));
//  end;
//  Exit(ttNone);
//end;

/// <summary>
///   Возвращает заголовок задания по его ID (индексация с 1)
/// <param name='TaskID'>ID Задания<param>
/// </summary>
function TTaskController.GetTaskTitle(TaskID: Integer): string;
  begin           {TODO: Реализовать метод, когда появятся сами объекты Task }
    Result := '';
    case TaskID of
      1: Result := 'Включение электропитания';
      2: Result := 'Проверка работоспособности станции в режиме "Автономный контроль"';
      3: Result := 'Перевод станции в оконечный режим работы';
    end;
  end;

  function TTaskController.GetCountTasks: Integer;
  begin
    //Result := Tasks.Count;
    Result := count_tasks;
  end;

  {$REGION 'Общие методы контроллера и заданий'}

    procedure TTaskController.SetCurrentTask();
    begin

    if Self.NetWorker.ClientState.WorkMode=TWorkMode.wmFree then
    begin
          CurrentTask := TTaskNone.Create(self.Station,self.NetWorker, self.ErrorKeeper);
    end
    else if (Self.NetWorker.ClientState.WorkMode=TWorkMode.wmLearning) or (Self.NetWorker.ClientState.WorkMode=TWorkMode.wmTraining) then
    begin
        case Self.NetWorker.ClientState.TaskID of
          ttPowerOn:  CurrentTask := TTaskPowerOn.Create(self.Station,self.NetWorker,self.ErrorKeeper);
          ttCheckStationInStandaloneControlMode:  CurrentTask := TTaskSingleCheck.Create(self.Station,self.NetWorker,Self.ErrorKeeper);
          ttTransferToTerminalMode: CurrentTask := TTaskTerminalMode.Create(self.Station,self.NetWorker,self.ErrorKeeper);
        else   CurrentTask := TTaskNone.Create(self.Station,self.NetWorker,self.ErrorKeeper);
        end;
    end;
    end;






     procedure TTaskController.Subscribe(CurForm0: TForm);
     var
     img: TComponent;
     begin



          //код подписки на все события click всех элементов формы
          for img in CurForm0 do
          begin
          if (img is TImage) then
          begin
            (img as TImage).OnMouseUp:= self.CheckTask;
            //if (CurForm0.Caption = 'Back') then
            //(img as TImage).OnMouseDown:= self.CheckTask;
          end;
          end;

              CheckTask(TImage.Create(CurForm0), TMouseButton.mbLeft, KeysToShiftState(0), 0,0);

     end;





   procedure TTaskController.NetCheckTask();
   begin
      CurrentTask.SubTasks[CurrentTask.CurrentSubTaskNum].NetCheckSubTask(CurrentTask.FullCheck, self.Station, self.NetWorker, self.ErrorKeeper, Self.CurrentTask);
   end;


  procedure TTaskController.CheckRecievedParams(Param: string; Value: string);
  begin
      try

        if (Value='True') then
        begin
          //self.CurrentTask.FieldAddress(Param):=True;
        end
        else if (Value='False') then
        begin
          //self.CurrentTask.FieldAddress(Param):=False;
        end;

      finally

      end;
       CheckTask(Self, TMouseButton.mbLeft, KeysToShiftState(0),0,0);
  end;
  

  //медот вызывающийся на каждое клик событие для проверки текущего задания
  procedure TTaskController.CheckTask(Sender0: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
  SubResult: Boolean;
  Sender: TObject;
  begin
          if (CurrentTask.IsTaskComplete=false) then
             begin

        Sender:=Sender0 as TControl;
        SubResult:= false;

         if (((Sender as TComponent).Owner as TForm).Caption=CurrentTask.SubTasks[CurrentTask.CurrentSubTaskNum].EventFormName)
          or (CurrentTask.SubTasks[CurrentTask.CurrentSubTaskNum].EventFormName='')
          then
         begin
             SubResult:=CurrentTask.SubTasks[CurrentTask.CurrentSubTaskNum].CheckSubTask(CurrentTask.FullCheck, self.Station, self.NetWorker, self.ErrorKeeper, Self.CurrentTask);
         end;

         if SubResult then begin
          CurrentTask.SubTasks[CurrentTask.CurrentSubTaskNum].IsComplete:= true;
          CurrentTask.SubTasks[CurrentTask.CurrentSubTaskNum].Time:= TimeToStr(Time-CurrentTask.TimeStart);

          if (CurrentTask.CurrentSubTaskNum=Length(CurrentTask.SubTasks)-1) then
          begin
            Self.CurrentTask.FullCheck:= True;
            self.FSubTaskComplete(nil);
            self.FTaskComplete(nil);


          end
          else
          begin
            CurrentTask.CurrentSubTaskNum:=CurrentTask.CurrentSubTaskNum+1;
          CurrentTask.CurrentSubTask:= CurrentTask.SubTasks[CurrentTask.CurrentSubTaskNum];
          self.FSubTaskComplete(nil);
          self.FChangeText(nil);
          ErrorKeeper.ErrorMsg := '';
          CheckTask(Sender0, TMouseButton.mbLeft, KeysToShiftState(0), 0,0);
          end;
          end;
          end;
  end;







  {$ENDREGION}  



{$REGION 'Старые методы'}

{*************************************************************************}
{ Далее следуют старые функции, которые должны быть реализованы в классах }
{*************************************************************************}

function TTaskController.GetNumberOfCallPassedThrough2ChannelMode: Byte;
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

function TTaskController.GetNumberOfCallPassedThrough4ChannelMode;
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

function TTaskController.GetNumberOfTunedChannelBlocks: Byte;
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

function TTaskController.GetNumberOfTunedChannelBlocksA: Byte;
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

function TTaskController.GetNumberOfTunedChannelBlocksB: Byte;
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

function TTaskController.GetNextTaskString: string;
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
            Result := 'Произвести внешний осмотр: ' + UnitsNames[btA];
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

function TTaskController.IsZaniatiePassed: Boolean;
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
///   Возвращает количество проверенных вызовом каналов (оба направления)
///    оба режима (2х и 4х проводные)
/// </summary>
function TTaskController.GetNumberOfCallPassedThrough: Byte;
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
///   Возвращает Id первого невыполненного задания в текущем упражнении
/// </summary>
function TTaskController.GetNotPassedTaskId: Byte;
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
///   Проверяет, в правильном ли порядке включается питание на блоках
///   (сначала первый, потом второй и т.д.)
/// </summary>
function TTaskController.ChangeEvent: Byte;
var
  PowerArr: array [1..7] of Byte;
  stPowered: Boolean;
  btA: Byte;

const
  ErrMessageText = 'Неверный порядок блоков при включении питания';

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

procedure TTaskController.AddError(ErrorInRackCode: Byte = NotSelected; ErrorDescription: string = '');
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
    Application.MessageBox('Допущено слишком много ошибок, пожалуйста начните прохождение заново!',
      PChar(PName), MB_OK + MB_ICONINFORMATION);
    CurBlockSelected := 255;
    //StationR414Form.lvTask.Clear;
    Initialise;
    //StationR414Form.Show;
    Exit;
  end;
end;

/// <summary>
///   Возвращает ID следующего блока для настройки (по списку задания)
/// </summary>
function TTaskController.GetNextBlockId: LongInt;
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
///   Возвращает id стойки по номеру задания
/// </summary>
/// <param name="TaskId">Номер задания</param>
function TTaskController.GetRackCodeByTaskId(TaskId: Integer): Integer;
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

procedure TTaskController.MadeMistake(MistakeId: Integer);
begin
  AddError(MistakeId, 'Ошибка при выполнении задачи ');
end;

/// <summary>
///   Загружает список заданий, отображающийся на общем виде Р414
/// </summary>
procedure TTaskController.LoadSubject;

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
//      //Обратное направление               //Что за обратное направение нах??
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

function TTaskController.GetNumberOfPassedExamTasks: Byte;
var
  btA: Byte;
  intCount: Byte;
begin
  intCount := 0;
  for btA := 0 to Length(Task1Passed) - 1 do
  begin
    //Если это новый режим и за него не ставилась оценка
    if Task1Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task2Passed) do
  begin
    //Если это новый режим и за него не ставилась оценка
    if Task2Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task3Passed) do
  begin
    //Если это новый режим и за него не ставилась оценка
    if Task3Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task4Passed) do
  begin
    //Если это новый режим и за него не ставилась оценка
    if Task4Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  for btA := 1 to Length(Task5Passed) do
  begin
    //Если это новый режим и за него не ставилась оценка
    if Task5Passed[btA] = stPassed then
    begin
      Inc(intCount, 1);
    end;
  end;
  Result := intCount;
end;


/// <summary>
/// Возвращает номер задания, связанного с формой, id которой передаётся
/// в параметрах.
/// </summary>
/// <param name="FormId">id стойки, для которой необходимо получить
/// номер задания.</param>
function TTaskController.GetNumberHelp (FormId : Integer) : Integer;
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
///   Проверяет, настроена ли закрываемая форма в соответствии
///   с текущим заданием
/// <param name = 'CanClose'> Изменяемый параметр, показывающий,
///   можно ли закрывать форму </param>
/// </summary>
procedure TTaskController.CheckFormBeforeClosing(var CanClose: Boolean);
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
        {$REGION 'Начальная настройка органов управления'}
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
                  and (Station.HalfSetB.Rack1500.stCableLoad = csConnectedAtRack1500Sh1)
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
                  and (Station.HalfSetA.Rack1500.stCableLoad = csConnectedAtRack1500Sh1)
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
        {$REGION 'Включение питания'}
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
        {$REGION 'Настройка приёмо-передающего тракта'}
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
///   Проверяет, настроена ли закрываемая форма в соответствии
///   с текущим заданием в режиме экзамена
/// <param name = 'CanClose'> Изменяемый параметр, показывающий,
///   можно ли закрывать форму </param>
/// </summary>
procedure TTaskController.CheckFormBeforeClosingInExamMode(var CanClose: Boolean);
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
    {$REGION 'Начальная настройка'}
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
          //-----------------Левый дуплексер-------------------------------------------
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
          (Station.HalfSetB.Rack1500.stCableLoad = csConnectedAtRack1500Sh1) and
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
          (Station.HalfSetA.Rack1500.stCableLoad = csConnectedAtRack1500Sh1) and
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
    {$REGION 'Включение питания'}
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
    {$REGION 'Настройка приёмо-передающего тракта'}
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

    //=====================================5 занятие===========================================
    {$REGION 'Работа с низкочастотным оборудованием'}
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
/// Анализирует станцию на предмет ошибок в настройке и возвращает
/// строку расшифровки ошибки
/// </summary>
/// <param name="CurBlockId"></param>
/// <param name="WorkMode"></param>
/// <returns></returns>
function TTaskController.AnalyseStation(CurBlockId: Byte = NotSelected;
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
      {$REGION 'Проверка правильности настройки блоков'}
      begin
        case CurBlockId of
          idDuplexerB:
          begin
            if (Station.HalfSetB.Duplexer.waveTransmit <> Station.WaveTransmitB) then
            begin
              AddMessage('Неверная волна передачи. Есть: ' + IntToStr(Station.HalfSetB.Duplexer.waveTransmit) + ' Надо: ' +
              IntToStr(Station.WaveTransmitB));
            end;
            if (Station.HalfSetB.Duplexer.waveTransmit <> Station.WaveTransmitB) then
            begin
              AddMessage('Неверная волна приема. Есть: ' + IntToStr(Station.HalfSetB.Duplexer.waveReceive) + ' Надо: ' +
              IntToStr(Station.WaveReceiveB));
            end;
            if ((Station.HalfSetB.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and
            (Station.HalfSetB.Duplexer.cbSh2 <> csConnectedAtDuplexeRight)) or
            ((Station.HalfSetB.Duplexer.waveTransmit <> Station.WaveTransmitB) and
            (Station.HalfSetB.Duplexer.waveReceive <> Station.WaveReceiveB) and
            (Station.HalfSetB.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) and
            (Station.HalfSetB.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft)) then
            begin
              AddMessage('Неверно подключены кабели к дуплексеру');
            end;
          end;
          idRack1920B:
            begin
              if (Station.HalfSetB.Rack1920.butPower <> butPositionDown) then
              begin
                AddMessage('Переключатель ''Сеть'' во включенном положении');
              end;
              if (Station.HalfSetB.Rack1920.butPower2 <> butPositionDown) then
              begin
                AddMessage('Переключатель ''Сеть'' 2 во включенном положении');
              end;
              if (Station.HalfSetB.Rack1920.but1910 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1910'' во включенном положении');
              end;
              if (Station.HalfSetB.Rack1920.but1930 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1930'' во включенном положении');
              end;
              if (Station.HalfSetB.Rack1920.but1910A <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1910A'' во включенном положении');
              end;
              if (Station.HalfSetB.Rack1920.but1960_1 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1360-1'' во включенном положении');
              end;
            end;
          idRack1200B2:
            begin
              if (Station.HalfSetB.Rack1200Right.But1270Main <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1270'' в нижнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1220AMMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1220AM'' в нижнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1230AMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1230A'' в нижнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1210AMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1210A'' в нижнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1270Reserve <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1270'' в нижнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1220AMReserve <> butPositionUp) then
              begin
                AddMessage('Переключатель резервного блока ''1220AM'' в нижнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240V <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока ''1240В'' в положении ''РЕТР''');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240V2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока ''1240В-2'' в положении ''РЕТР''');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240V3 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока ''1240В-3'' в нижнем положении ''РЕТР''');
              end;
              if (Station.HalfSetB.Rack1200Right.Sw1240V <> butPositionUp) then
              begin
                AddMessage('Кукушка блока ''1240В'' не в первой позиции');
              end;
              if (Station.HalfSetB.Rack1200Right.Sw1240V2 <> butPositionUp) then
              begin
                AddMessage('Кукушка блока ''1240В-2'' не в первой позиции');
              end;
              if (Station.HalfSetB.Rack1200Right.Sw1240V3 <> butPositionUp) then
              begin
                AddMessage('Кукушка блока ''1240В-3'' не в первой позиции');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G1 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-1'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G2 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-2'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G3 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-3'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G4 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-4'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G5 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-5'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G6 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-6'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G7 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-7'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.But1240G8 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-8'' не в верхнем положении');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В'' в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В'' в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-2'' в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-2'' в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-3'' в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-3'' в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Right.But1290Power <> butPositionDown) then
              begin
                AddMessage('Заглушка блока ''1290'' в положении включено');
              end;
            end;
          idShield:
            begin
              if (Station.PowerPanel.swNet <> 0) or (Station.PowerPanel.swNet <> 2) then
              begin
                AddMessage('Переключатель основного питания включен');
              end;
              if (Station.PowerPanel.butRetranslator <> butPositionDown) then
              begin
                AddMessage('Переключатель питания ретранслятора включен');
              end;
              if (Station.PowerPanel.sw1700Power <> 0) or (Station.PowerPanel.sw1700Power <> 2) then
              begin
                AddMessage('Питание на стойку 1700 подано');
              end;
              if (Station.PowerPanel.butRetranslator2 <> butPositionDown) then
              begin
                AddMessage('Переключатель питания второго ретранслятора включен');
              end;
              if (Station.PowerPanel.sw1900Power <> 0) or (Station.PowerPanel.sw1900Power <> 2) then
              begin
                AddMessage('Переключатель питания стойки 1920 А включен');
              end;
              if (Station.PowerPanel.sw1900Power <> 0) or (Station.PowerPanel.sw1900Power <> 2) then
              begin
                AddMessage('Переключатель питания стойки 1920 Б включен');
              end;
              if (Station.PowerPanel.swHeat5A <> 0) or (Station.PowerPanel.swHeat5A <> 2) then
              begin
                AddMessage('Переключатель питания обогревателя включен');
              end;
              if (Station.PowerPanel.sw1200Power <> 0) or (Station.PowerPanel.sw1200Power <> 2) then
              begin
                AddMessage('Переключатель питания стойки 1200 А включен');
              end;
              if (Station.PowerPanel.sw1200Power_2 <> 0) or (Station.PowerPanel.sw1200Power_2 <> 2) then
              begin
                AddMessage('Переключатель питания стойки 1200 Б включен');
              end;
              if (Station.PowerPanel.sw1400 <> 0) or (Station.PowerPanel.sw1400 <> 2) then
              begin
                AddMessage('Переключатель питания стойки 1400 включен');
              end;
              if (Station.PowerPanel.butVent1 <> butPositionDown) then
              begin
                AddMessage('Переключатель питания вентилятора включен');
              end;
              if (Station.PowerPanel.butUnitBK <> butPositionDown) then
              begin
                AddMessage('Переключатель питания блока БК включен');
              end;
              if (Station.PowerPanel.butVent1_2 <> butPositionDown) then
              begin
                AddMessage('Переключатель питания вентилятора включен');
              end;
              if (Station.PowerPanel.butVipriamit4V <> butPositionDown) then
              begin
                AddMessage('Переключатель питания выпрямителя 4В включен');
              end;
              if (Station.PowerPanel.butVent3 <> butPositionDown) then
              begin
                AddMessage('Переключатель питания вентилятора 3 включен');
              end;
            end;
          idRack1200A2:
            begin
              if (Station.HalfSetA.Rack1200Right.But1270Main <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1270'' в нижнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1220AMMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1220AM'' в нижнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1230AMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1230A'' в нижнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1210AMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1210A'' в нижнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1270Reserve <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1270'' в нижнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1220AMReserve <> butPositionUp) then
              begin
                AddMessage('Переключатель резервного блока ''1220AM'' в нижнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240V <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока ''1240В'' в положении ''РЕТР''');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240V2 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240В-2'' в положении ''РЕТР''');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240V3 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240В-3'' в положении ''РЕТР''');
              end;
              if (Station.HalfSetA.Rack1200Right.Sw1240V <> butPositionUp) then
              begin
                AddMessage('Кукушка блока ''1240В'' не в первой позиции');
              end;
              if (Station.HalfSetA.Rack1200Right.Sw1240V2 <> butPositionUp) then
              begin
                AddMessage('Кукушка блока ''1240В-2'' не в первой позиции');
              end;
              if (Station.HalfSetA.Rack1200Right.Sw1240V3 <> butPositionUp) then
              begin
                AddMessage('Кукушка блока ''1240В-3'' не в первой позиции');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G1 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-1'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G2 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-2'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G3 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-3'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G4 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-4'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G5 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-5'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G6 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-6'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G7 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-7'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.But1240G8 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока ''1240Г-8'' не в верхнем положении');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В'' в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В'' в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-2'' в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-2'' в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-3'' в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC <> stPluggedIn) then
              begin
                AddMessage('Заглушка блока ''1240В-3'' в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Right.But1290Power <> butPositionDown) then
              begin
                AddMessage('Заглушка блока ''1290'' в положении включено');
              end;
            end;
          idRack1600B, idRack1600Bback:
            begin
              if (Station.HalfSetB.Rack1600.butAutomatic <> butPositionRight) then
              begin
                AddMessage('Переключатель автоматики включен');
              end;
              if (Station.HalfSetB.Rack1600.butDmch <> butPositionUp) then
              begin
                AddMessage('Переключатель ДМЧ не включен');
              end;
              if (Station.HalfSetB.Rack1600.butDmch <> butPositionUp) then
              begin
                AddMessage('Переключатель ДМЧ не включен');
              end;
              if (Station.HalfSetB.Rack1600.butChannelControl <> butPositionUp) then
              begin
                AddMessage('Переключатель контроля каналов не включен');
              end;
              if (Station.HalfSetB.Rack1600.wave1610_0 <> Station.WaveReceiveB) then
              begin
                AddMessage('Неправильно выставлена волна 1610-0. Есть ' + inttostr(Station.HalfSetB.Rack1600.wave1610_0) + ' Надо:' +
                IntToStr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.Rack1600.swChannelControl <> 9) then
              begin
                AddMessage('Кукушка контроля каналов не в том положении');
              end;
              if (Station.HalfSetB.Rack1600.wave1610_R <> Station.WaveReceiveB) then
              begin
                AddMessage('Неправильно выставлена волна 1610-Р. Есть ' + inttostr(Station.HalfSetB.Rack1600.wave1610_R) + ' Надо:' +
                IntToStr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.Rack1600.wave1610_R <> Station.WaveReceiveB) then
              begin
                AddMessage('Неправильно выставлена волна 1600. Есть ' + inttostr(Station.HalfSetB.Rack1600.wave1600) + ' Надо:' +
                IntToStr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.Rack1600B.swKukushka <> 1) then
              begin
                AddMessage('Кукушка не в положении ''ФИМ''');
              end;
              if (Station.HalfSetB.Rack1600B.but1621Main <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1621-0 не во включенном состоянии');
              end;
              if (Station.HalfSetB.Rack1600B.but1621Reserve <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1621-Р не во включенном состоянии');
              end;
              if (Station.HalfSetB.Rack1600B.butUPT <> butPositionRight) then
              begin
                AddMessage('Переключатель блока УПТ не в положении ''АРУ''');
              end;
              if (Station.HalfSetB.Rack1600B.butUPT2 <> butPositionRight) then
              begin
                AddMessage('Переключатель блока УПТ-2 не в положении ''АРУ''');
              end;
              if (Station.HalfSetB.Rack1600B.swUGS2 <> 5) then
              begin
                AddMessage('Переключатель блока УГС-2 не на отметке ''5''');
              end;
              if (Station.HalfSetB.Rack1600B.swUGS <> 5) then
              begin
                AddMessage('Переключатель блока УГС не на отметке ''5''');
              end;
              if (Station.HalfSetB.Rack1600B.but1622Main <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-0 не во включенном состоянии');
              end;
              if (Station.HalfSetB.Rack1600B.but1622Reserve <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-0 не во включенном состоянии');
              end;
            end;
          idRack1710A:
            begin
              if (Station.Rack1710.swWorkMode <> 1) then
              begin
                AddMessage('Переключатель режима работы не в том положении');
              end;
              if (Station.Rack1710.butEmergencyLine1 <> butPositionUp) then
              begin
                AddMessage('Переключатель аварийной линии не во включенном положении');
              end;
              if (Station.Rack1710.butEmergencyLine2 <> butPositionUp) then
              begin
                AddMessage('Переключатель аварийной линии 2 не во включенном положении');
              end;
              if (Station.Rack1710.but1220AD <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1220АД (А) на резервном блоке');
              end;
              if (Station.Rack1710.but1220AD <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1230АД (А) на резервном блоке');
              end;
              if (Station.Rack1710.but1290 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1290 (А) на резервном блоке');
              end;
              if (Station.Rack1710.but1220AM <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1220АМ (А) на резервном блоке');
              end;
              if (Station.Rack1710.but1230AM <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1230АМ (А) на резервном блоке');
              end;
              if (Station.Rack1710.but1210A <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1210А (А) на резервном блоке');
              end;
              if (Station.Rack1710.but1270 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1270 (А) на резервном блоке');
              end;
              if (Station.Rack1710.but1220AD_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1220АД (Б) на резервном блоке');
              end;
              if (Station.Rack1710.but1230AD_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1230АД (Б) на резервном блоке');
              end;
              if (Station.Rack1710.but1290_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1290 (Б) на резервном блоке');
              end;
              if (Station.Rack1710.but1220AM_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1220АМ (Б) на резервном блоке');
              end;
              if (Station.Rack1710.but1230AM_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1230АМ (Б) на резервном блоке');
              end;
              if (Station.Rack1710.but1210A_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1210А (Б) на резервном блоке');
              end;
              if (Station.Rack1710.but1270_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1270 (Б) на резервном блоке');
              end;
              if (Station.Rack1710.swReductorCurrent <> 1) then
              begin
                AddMessage('Переключатель блока 310 не в том положении');
              end;
              if (Station.Rack1710.butExternalUplotnenieA <> butPositionLeft) then
              begin
                AddMessage('Переключатель внешнего уплотнения А в положении ''Абонент''');
              end;
              if (Station.Rack1710.butExternalUplotnenieB <> butPositionLeft) then
              begin
                AddMessage('Переключатель внешнего уплотнения Б в положении ''Абонент''');
              end;
              if (Station.Rack1710.butPower <> butPositionLeft) then
              begin
                AddMessage('Переключатель питания блока 470 во включенном состоянии''');
              end;
              if (Station.Rack1710.butSpeaker <> butPositionLeft) then
              begin
                AddMessage('Громкоговоритель включен''');
              end;
              if (Station.Rack1710.swKukushka <> 1) then
              begin
                AddMessage('Кукушка переключения частоты блока 470 включена''');
              end;
            end;
          idRack1200B1:
            begin
              if (Station.HalfSetB.Rack1200Left.butChannelControl <> butPositionDown) then
              begin
                AddMessage('Переключатель контроля каналов во включенном положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1220ADMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1220АД в положении ''проверка''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1230AMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1230 в положении ''проверка''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1220ADReserve <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1220АД (запасной) не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1230AReserve <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1230 (запасной) не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.But1240GMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-0 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.But1240GMain2 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-0 (резервный) не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240GPrmPrd <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г в положении ''ПР''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240GOneTwo <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г в положении ''2''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г не в положении ''ОТВ.''');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240G_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240Г в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240V <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1240В  в положении ''РЕТР''');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240V2 <> butPositionLeft) then
              begin
                AddMessage('Заглушки блока 1240В2 в положении ''РЕТР''');
              end;
              if (Station.HalfSetB.Rack1200Left.Sw1240V <> 1) then
              begin
                AddMessage('Кукушка блока 1240В не в первом положении');
              end;
              if (Station.HalfSetB.Rack1200Left.Sw1240V2 <> 1) then
              begin
                AddMessage('Кукушка блока 1240В2 не в первом положении');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В в положении кросс');
              end;
               if (Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В-2 в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В-2 в положении кросс');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G1 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-1 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G2 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-2 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G3 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-3 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G4 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-4 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G5 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-5 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G6 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-6 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G7 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-7 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1240G8 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-8 не в том положении');
              end;
              if (Station.HalfSetB.Rack1200Left.but1290Power <> butPositionDown) then
              begin
                AddMessage('Питание блока 1290 включено');
              end;
            end;
          idRack1200A1:
            begin
              if (Station.HalfSetA.Rack1200Left.butChannelControl <> butPositionDown) then
              begin
                AddMessage('Переключатель контроля каналов во включенном положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1220ADMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1220АД в положении ''проверка''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1230AMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1230 в положении ''проверка''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1220ADReserve <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1220АД (запасной) не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1230AReserve <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1230 (запасной) не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.But1240GMain <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-0 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.But1240GMain2 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-0 (резервный) не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240GPrmPrd <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г в положении ''ПР''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240GOneTwo <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г в положении ''2''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г не в положении ''ОТВ.''');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240G_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240Г в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240V <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1240В в положении ''РЕТР''');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240V2 <> butPositionLeft) then
              begin
                AddMessage('Заглушки блока 1240В2 в положении ''РЕТР''');
              end;
              if (Station.HalfSetA.Rack1200Left.Sw1240V <> 1) then
              begin
                AddMessage('Кукушка блока 1240В не в первом положении');
              end;
              if (Station.HalfSetA.Rack1200Left.Sw1240V2 <> 1) then
              begin
                AddMessage('Кукушка блока 1240В2 не в первом положении');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В в положении кросс');
              end;
               if (Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В-2 в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports <> stPluggedIn) then
              begin
                AddMessage('Заглушки блока 1240В-2 в положении кросс');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G1 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-1 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G2 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-2 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G3 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-3 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G4 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-4 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G5 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-5 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G6 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-6 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G7 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-7 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1240G8 <> butPositionUp) then
              begin
                AddMessage('Переключатель блока 1240Г-8 не в том положении');
              end;
              if (Station.HalfSetA.Rack1200Left.but1290Power <> butPositionDown) then
              begin
                AddMessage('Питание блока 1290 включено');
              end;
            end;
          idRack1600A, idRack1600Aback:
            begin
              if (Station.HalfSetA.Rack1600.butAutomatic <> butPositionRight) then
              begin
                AddMessage('Переключатель автоматики включен');
              end;
              if (Station.HalfSetA.Rack1600.butDmch <> butPositionUp) then
              begin
                AddMessage('Переключатель ДМЧ не включен');
              end;
              if (Station.HalfSetA.Rack1600.butChannelControl <> butPositionUp) then
              begin
                AddMessage('Переключатель контроля каналов не включен');
              end;
              if (Station.HalfSetA.Rack1600.wave1610_0 <> Station.WaveReceiveA) then
              begin
                AddMessage('Неправильно выставлена волна 1610-0. Есть ' + inttostr(Station.HalfSetA.Rack1600.wave1610_0) + ' Надо:' +
                IntToStr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.Rack1600.swChannelControl <> 9) then
              begin
                AddMessage('Кукушка контроля каналов не в том положении');
              end;
              if (Station.HalfSetA.Rack1600.wave1610_R <> Station.WaveReceiveA) then
              begin
                AddMessage('Неправильно выставлена волна 1610-Р. Есть ' + inttostr(Station.HalfSetA.Rack1600.wave1610_R) + ' Надо:' +
                IntToStr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.Rack1600.wave1610_R <> Station.WaveReceiveA) then
              begin
                AddMessage('Неправильно выставлена волна 1600. Есть ' + inttostr(Station.HalfSetA.Rack1600.wave1600) + ' Надо:' +
                IntToStr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.Rack1600B.swKukushka <> 1) then
              begin
                AddMessage('Кукушка не в положении ''ФИМ''');
              end;
              if (Station.HalfSetA.Rack1600B.but1621Main <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1621-0 не во включенном состоянии');
              end;
              if (Station.HalfSetA.Rack1600B.but1621Reserve <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1621-Р не во включенном состоянии');
              end;
              if (Station.HalfSetA.Rack1600B.butUPT <> butPositionRight) then
              begin
                AddMessage('Переключатель блока УПТ не в положении ''АРУ''');
              end;
              if (Station.HalfSetA.Rack1600B.butUPT2 <> butPositionRight) then
              begin
                AddMessage('Переключатель блока УПТ-2 не в положении ''АРУ''');
              end;
              if (Station.HalfSetA.Rack1600B.swUGS2 <> 5) then
              begin
                AddMessage('Переключатель блока УГС-2 не на отметке ''5''');
              end;
              if (Station.HalfSetA.Rack1600B.swUGS <> 5) then
              begin
                AddMessage('Переключатель блока УГС не на отметке ''5''');
              end;
              if (Station.HalfSetA.Rack1600B.but1622Main <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-0 не во включенном состоянии');
              end;
              if (Station.HalfSetA.Rack1600B.but1622Reserve <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-0 не во включенном состоянии');
              end;
            end;
          idRack1920A:
            begin
              if (Station.HalfSetA.Rack1920.butPower <> butPositionDown) then
              begin
                AddMessage('Переключатель ''Сеть'' во включенном положении');
              end;
              if (Station.HalfSetA.Rack1920.butPower2 <> butPositionDown) then
              begin
                AddMessage('Переключатель ''Сеть'' 2 во включенном положении');
              end;
              if (Station.HalfSetA.Rack1920.but1910 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1910'' во включенном положении');
              end;
              if (Station.HalfSetA.Rack1920.but1930 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1930'' во включенном положении');
              end;
              if (Station.HalfSetA.Rack1920.but1910A <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1910A'' во включенном положении');
              end;
              if (Station.HalfSetA.Rack1920.but1960_1 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока ''1360-1'' во включенном положении');
              end;
            end;
          idDuplexerA:
            begin
              //-----------------Левый дуплексер-------------------------------------------
              if (Station.HalfSetA.Duplexer.waveTransmit <> Station.WaveTransmitA) then
              begin
                AddMessage('Неверная волна передачи. Есть: ' + IntToStr(Station.HalfSetA.Duplexer.waveTransmit) + ' Надо: ' +
                IntToStr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Duplexer.waveReceive <> Station.WaveReceiveA) then
              begin
                AddMessage('Неверная волна приема. Есть: ' + IntToStr(Station.HalfSetA.Duplexer.waveReceive) + ' Надо: ' +
                IntToStr(Station.WaveReceiveA));
              end;
              if ((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and
              (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeRight)) or
              ((Station.HalfSetA.Duplexer.waveTransmit <> Station.WaveTransmitB) and
              (Station.HalfSetA.Duplexer.waveReceive <> Station.WaveReceiveB) and
              (Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) and
              (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft)) then
              begin
                AddMessage('Неверно подключены кабели к дуплексеру');
              end;
            end;
          idMshuA:
            begin
              if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
              begin
                AddMessage('Неправильно выставлена волна приема. Есть: ' + inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave) + ' Надо: ' + inttostr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet <> butPositionDown) then
              begin
                AddMessage('Переключатель блока 1831 во включенном положении');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet2 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока 1831-Р во включенном положении');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butMshu <> butPositionLeft) then
              begin
                AddMessage('Переключатель выбора основного блока стоит на значении ''резервный блок''');
              end;
            end;
          idMshuB:
            begin
              if (Station.HalfSetB.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
              begin
                AddMessage('Неправильно выставлена волна приема. Есть: ' + inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave) + ' Надо: ' + inttostr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet <> butPositionDown) then
              begin
                AddMessage('Переключатель блока 1831 во включенном положении');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet2 <> butPositionDown) then
              begin
                AddMessage('Переключатель блока 1831-Р во включенном положении');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butMshu <> butPositionLeft) then
              begin
                AddMessage('Переключатель выбора основного блока стоит на значении ''резервный блок''');
              end;
            end;
          idP321A:
            begin
              if (Station.HalfSetA.P321.butPower <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''ВЫКЛ''');
              end;
              if (Station.HalfSetA.P321.butMeasure <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''УСИЛ''');
              end;
              if (Station.HalfSetA.P321.but600Ohm <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''ВЫС. СОПР.''');
              end;
              if (Station.HalfSetA.P321.swNepGen <> 8) then
              begin
                AddMessage('Кукушка ''НЕП. ГЕН.'' не в том положении');
              end;
              if (Station.HalfSetA.P321.swFrequency <> 4) then
              begin
                AddMessage('Кукушка ''Частота'' не в том положении');
              end;
              if (Station.HalfSetA.P321.swNepGenYY <> 7) then
              begin
                AddMessage('Кукушка ''НЕП. УУ.'' не в том положении');
              end;
              if (Station.HalfSetA.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('Кабель входа указателя уровня подключен');
              end;
              if (Station.HalfSetA.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('Кабель выхода генератора подключен');
              end;
            end;
          idP321B:
            begin
              if (Station.HalfSetB.P321.butPower <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''ВЫКЛ''');
              end;
              if (Station.HalfSetB.P321.butMeasure <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''УСИЛ''');
              end;
              if (Station.HalfSetB.P321.but600Ohm <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''ВЫС. СОПР.''');
              end;
              if (Station.HalfSetB.P321.swNepGen <> 8) then
              begin
                AddMessage('Кукушка ''НЕП. ГЕН.'' не в том положении');
              end;
              if (Station.HalfSetB.P321.swFrequency <> 4) then
              begin
                AddMessage('Кукушка ''Частота'' не в том положении');
              end;
              if (Station.HalfSetB.P321.swNepGenYY <> 7) then
              begin
                AddMessage('Кукушка ''НЕП. УУ.'' не в том положении');
              end;
              if (Station.HalfSetB.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('Кабель входа указателя уровня подключен');
              end;
              if (Station.HalfSetB.P321.cblVhYY <> csDisconected) then
              begin
                AddMessage('Кабель выхода генератора подключен');
              end;
            end;
          idP321C:
            begin
              if (Station.P321C.butPower <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''ВЫКЛ''');
              end;
              if (Station.P321C.butMeasure <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''УСИЛ''');
              end;
              if (Station.P321C.but600Ohm <> butPositionUp) then
              begin
                AddMessage('Переключатель питания в положении ''ВЫС. СОПР.''');
              end;
              if (Station.P321C.swNepGen <> 8) then
              begin
                AddMessage('Кукушка ''НЕП. ГЕН.'' не в том положении');
              end;
              if (Station.P321C.swFrequency <> 4) then
              begin
                AddMessage('Кукушка ''Частота'' не в том положении');
              end;
              if (Station.P321C.swNepGenYY <> 7) then
              begin
                AddMessage('Кукушка ''НЕП. УУ.'' не в том положении');
              end;
              if (Station.P321C.cblVhYY <> csDisconected) then
              begin
                AddMessage('Кабель входа указателя уровня подключен');
              end;
              if (Station.P321C.cblVhYY <> csDisconected) then
              begin
                AddMessage('Кабель выхода генератора подключен');
              end;
            end;
          idRack1500B:
            begin
              if (Station.HalfSetB.Rack1500.btnAutomatic <> butPositionLeft) then
              begin
                AddMessage('Переключатель автоматики во включенном положении');
              end;
              if (Station.HalfSetB.Rack1500.swModeControl <> 6) then
              begin
                AddMessage('Кукушка контроля режимов не в том положении');
              end;
              if (Station.HalfSetB.Rack1500.butMode_R <> butPositionLeft) then
              begin
                AddMessage('Переключатель контроля режимов не в том положении');
              end;
              if (Station.HalfSetB.Rack1500.swWave1610_0 <> Station.WaveTransmitB) then
              begin
                AddMessage('Неправильно выставлена волна передачи блока 1610-0. Есть: ' + inttostr(Station.HalfSetB.Rack1500.swWave1610_0) +
                ' Надо: ' + inttostr(Station.WaveTransmitB));
              end;
              if (Station.HalfSetB.Rack1500.swWave1500 <> Station.WaveTransmitB) then
              begin
                AddMessage('Неправильно выставлена волна передачи блока 1500. Есть: ' + inttostr(Station.HalfSetB.Rack1500.swWave1500) +
                ' Надо: ' + inttostr(Station.WaveTransmitB));
              end;
              if (Station.HalfSetB.Rack1500.swWave161_R <> Station.WaveTransmitB) then
              begin
                AddMessage('Неправильно выставлена волна передачи блока 1610-Р. Есть: ' + inttostr(Station.HalfSetB.Rack1500.swWave161_R) +
                ' Надо: ' + inttostr(Station.WaveTransmitB));
              end;
              if (Station.HalfSetB.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('Неправильно подключен кабель нагрузки');
              end;
              if (Station.HalfSetB.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('Неправильно подключен кабель Ш1');
              end;
              if (Station.HalfSetB.Rack1500B.butMdOsn_1 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1550 не в положении ''РАБ.''');
              end;
              if (Station.HalfSetB.Rack1500B.butMdOsn_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1550 не в положении ''РАБ.''');
              end;
              if (Station.HalfSetB.Rack1500B.butMdOsn_3 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1550 не в положении ''ОКОН.''');
              end;
              if (Station.HalfSetB.Rack1500B.but1622_1 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-0 не во включенном положении');
              end;
              if (Station.HalfSetB.Rack1500B.but1622_2 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-Р не во включенном положении');
              end;
            end;
          idRack1500A:
            begin
              if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionLeft) then
              begin
                AddMessage('Переключатель автоматики во включенном положении');
              end;
              if (Station.HalfSetA.Rack1500.swModeControl <> 6) then
              begin
                AddMessage('Кукушка контроля режимов не в том положении');
              end;
              if (Station.HalfSetA.Rack1500.butMode_R <> butPositionLeft) then
              begin
                AddMessage('Переключатель контроля режимов не в том положении');
              end;
              if (Station.HalfSetA.Rack1500.swWave1610_0 <> Station.WaveTransmitA) then
              begin
                AddMessage('Неправильно выставлена волна передачи блока 1610-0. Есть: ' + inttostr(Station.HalfSetA.Rack1500.swWave1610_0) +
                ' Надо: ' + inttostr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Rack1500.swWave1500 <> Station.WaveTransmitA) then
              begin
                AddMessage('Неправильно выставлена волна передачи блока 1500. Есть: ' + inttostr(Station.HalfSetA.Rack1500.swWave1500) +
                ' Надо: ' + inttostr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Rack1500.swWave161_R <> Station.WaveTransmitA) then
              begin
                AddMessage('Неправильно выставлена волна передачи блока 1610-Р. Есть: ' + inttostr(Station.HalfSetA.Rack1500.swWave161_R) +
                ' Надо: ' + inttostr(Station.WaveTransmitA));
              end;
              if (Station.HalfSetA.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('Неправильно подключен кабель нагрузки');
              end;
              if (Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1) then
              begin
                AddMessage('Неправильно подключен кабель Ш1');
              end;
              if (Station.HalfSetA.Rack1500B.butMdOsn_1 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1550 не в положении ''РАБ.''');
              end;
              if (Station.HalfSetA.Rack1500B.butMdOsn_2 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1550 не в положении ''РАБ.''');
              end;
              if (Station.HalfSetA.Rack1500B.butMdOsn_3 <> butPositionLeft) then
              begin
                AddMessage('Переключатель блока 1550 не в положении ''ОКОН.''');
              end;
              if (Station.HalfSetA.Rack1500B.but1622_1 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-0 не во включенном положении');
              end;
              if (Station.HalfSetA.Rack1500B.but1622_2 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1622-Р не во включенном положении');
              end;
            end;
          idRack1400B:
            begin
              if (Station.Rack1400.butPower <> butPositionLeft) then
              begin
                AddMessage('Питание стойки во включеном положении');
              end;
              if (Station.Rack1400.swKukushka <> 1) then
              begin
                AddMessage('Кукушка не в первом положении');
              end;
            end;
        end;
      end;
      {$ENDREGION}
    mdPowerOn:
      {$REGION 'Проверка правильности настройки блоков'}
      begin
        case CurBlockId of
          idRack1920B:
            begin
              if (Station.HalfSetB.Rack1920.butPower <> butPositionUp) then
              begin
                AddMessage('Переключатель питания первой ЛБВ не включен');
              end;
              if (Station.HalfSetB.Rack1920.butPower2 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания второй ЛБВ не включен');
              end;
              if (Station.HalfSetB.Rack1920.but1910 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1910 не включен');
              end;
              if (Station.HalfSetB.Rack1920.but1910A <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1910А не включен');
              end;
              if (Station.HalfSetB.Rack1920.but1930 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1930 не включен');
              end;
              if (Station.HalfSetB.Rack1920.but1960_1 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1960-1 не включен');
              end;
            end;
          idRack1710A:
            begin
              if (Station.Rack1710.butPower <> butPositionRight) then
              begin
                AddMessage('Переключатель питания стоки 1710 не включен');
              end;
              if (Station.Rack1710.swKukushka <> butPositionRight) then
              begin
                AddMessage('Кукушка указателя частоты блока 470 не в первом положении');
              end;
            end;
          idRack1920A:
            begin
              if (Station.HalfSetA.Rack1920.butPower <> butPositionUp) then
              begin
                AddMessage('Переключатель питания первой ЛБВ не включен');
              end;
              if (Station.HalfSetA.Rack1920.butPower2 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания второй ЛБВ не включен');
              end;
              if (Station.HalfSetA.Rack1920.but1910 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1910 не включен');
              end;
              if (Station.HalfSetA.Rack1920.but1910A <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1910А не включен');
              end;
              if (Station.HalfSetA.Rack1920.but1930 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1930 не включен');
              end;
              if (Station.HalfSetA.Rack1920.but1960_1 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания блока 1960-1 не включен');
              end;
            end;
          idMshuA:
            begin
              if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
              begin
                AddMessage('Неверная волна приема. Есть: ' + inttostr(Station.HalfSetA.LittleNoisyAmplifier.swWave) + ' Надо: ' +
                inttostr(Station.WaveReceiveA));
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butMshu <> butMain) then
              begin
                AddMessage('Переключатель выбора основного устройства на резервном блоке');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet <> butPositionUp) then
              begin
                AddMessage('Переключатель питания основного блока выключен');
              end;
              if (Station.HalfSetA.LittleNoisyAmplifier.butNet2 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания резервного блока выключен');
              end;
            end;
          idMshuB:
            begin
              if (Station.HalfSetB.LittleNoisyAmplifier.swWave <> Station.WaveReceiveB) then
              begin
                AddMessage('Неверная волна приема. Есть: ' + inttostr(Station.HalfSetB.LittleNoisyAmplifier.swWave) + ' Надо: ' +
                inttostr(Station.WaveReceiveB));
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butMshu <> butMain) then
              begin
                AddMessage('Переключатель выбора основного устройства на резервном блоке');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet <> butPositionUp) then
              begin
                AddMessage('Переключатель питания основного блока выключен');
              end;
              if (Station.HalfSetB.LittleNoisyAmplifier.butNet2 <> butPositionUp) then
              begin
                AddMessage('Переключатель питания резервного блока выключен');
              end;
            end;
          idShield:
            begin
              if (Station.PowerPanel.swNet <> 1) then
              begin
                AddMessage('Переключатель подачи напряжения на щит в выключенном положении');
              end;
              if (Station.PowerPanel.sw1700Power <> 1) then
              begin
                AddMessage('Переключатель питания блока 1700 в выключенном положении');
              end;
              if (Station.PowerPanel.sw1900Power <> 1) then
              begin
                AddMessage('Переключатель питания блока 1900 (А) в выключенном положении');
              end;
              if (Station.PowerPanel.sw1900Power_2 <> 1) then
              begin
                AddMessage('Переключатель питания блока 1900 (Б) в выключенном положении');
              end;
              if (Station.PowerPanel.sw1200Power <> 1) then
              begin
                AddMessage('Переключатель питания блока 1200 (А) в выключенном положении');
              end;
              if (Station.PowerPanel.sw1200Power_2 <> 1) then
              begin
                AddMessage('Переключатель питания блока 1200 (Б) в выключенном положении');
              end;
              if (Station.PowerPanel.sw1400 <> 1) then
              begin
                AddMessage('Переключатель питания блока 1400 в выключенном положении');
              end;
            end;
          idRack1400B:
            begin
              if Station.Rack1400.butPower = butPositionRight then
              begin
                AddMessage('Питание блока 1400 не включено');
              end;
            end;
        end;
      end;
      {$ENDREGION}
    mdReceiveAndTransmitTracksSetup:
      {$REGION 'Проверка правильности настройки блоков'}
      case CurBlockId of
        idRack1500A:
          begin
            if not(Station.HalfSetA.Rack1500.GeterodinTunedMain) then
            begin
              AddMessage('Гетеродин основного канала не настроен');
            end;
            if not(Station.HalfSetA.Rack1500.GeterodinTunedReserve) then
            begin
              AddMessage('Гетеродин резервного канала не настроен');
            end;
            if ((Station.HalfSetA.Rack1500.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain)) then
            begin
              AddMessage('В качестве передающего комплекта выбран резервный комплект');
            end;
            if (not(Station.HalfSetA.Rack1500.DropError)) then
            begin
              AddMessage('Не сброшена ошибка');
            end;
            if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionRight) then
            begin
              AddMessage('Переключатель автоматики не включен');
            end;
            if (Station.HalfSetA.Rack1500.swPhaseMover <> 10) then
            begin
              AddMessage('Расфазировка не устранена');
            end;
          end;
        idRack1920A:
          begin
            if not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('Напряжение на ЛБВ 1 не подано');
            end;
            if not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('Напряжение на ЛБВ 2 не подано');
            end;
            if not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('Замедление не включено ЛБВ 1');
            end;
            if not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('Замедление не включено ЛБВ 2');
            end;
          end;
        idRack1600A:
          begin
            if not(Station.HalfSetA.Rack1600.GeterodinTunedMain) then
            begin
              AddMessage('Гетеродин основного приемного канала не настроен');
            end;
            if not(Station.HalfSetA.Rack1600.GeterodinTunedReserve) then
            begin
              AddMessage('Гетеродин резервного приемного канала не настроен');
            end;
            if ((Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and
            (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)) then
            begin
              AddMessage('В качестве рабочих блоков выбраны резервные');
            end;
            if not(Station.HalfSetA.Rack1600.DropError) then
            begin
              AddMessage('Ошибка не сброшена');
            end;
            if (Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft) then
            begin
              AddMessage('Автоматика не включена');
            end;
          end;
        idRack1600B:
          begin
            if not(Station.HalfSetB.Rack1600.GeterodinTunedMain) then
            begin
              AddMessage('Гетеродин основного приемного канала не настроен');
            end;
            if not(Station.HalfSetB.Rack1600.GeterodinTunedReserve) then
            begin
              AddMessage('Гетеродин резервного приемного канала не настроен');
            end;
            if ((Station.HalfSetB.Rack1600.SelectedMd = smdMain) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and
            (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain)) then
            begin
              AddMessage('В качестве рабочих блоков выбраны резервные');
            end;
            if not(Station.HalfSetB.Rack1600.DropError) then
            begin
              AddMessage('Ошибка не сброшена');
            end;
            if (Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft) then
            begin
              AddMessage('Автоматика не включена');
            end;
          end;
        idRack1500B:
          begin
            if not(Station.HalfSetB.Rack1500.GeterodinTunedMain) then
            begin
              AddMessage('Гетеродин основного канала не настроен');
            end;
            if not(Station.HalfSetB.Rack1500.GeterodinTunedReserve) then
            begin
              AddMessage('Гетеродин резервного канала не настроен');
            end;
            if ((Station.HalfSetB.Rack1500.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain)) then
            begin
              AddMessage('В качестве передающего комплекта выбран резервный комплект');
            end;
            if (not(Station.HalfSetB.Rack1500.DropError)) then
            begin
              AddMessage('Не сброшена ошибка');
            end;
            if (Station.HalfSetB.Rack1500.btnAutomatic <> butPositionRight) then
            begin
              AddMessage('Переключатель автоматики не включен');
            end;
            if (Station.HalfSetB.Rack1500.swPhaseMover <> 10) then
            begin
              AddMessage('Расфазировка не устранена');
            end;
          end;
        idRack1920B:
          begin
            if not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('Напряжение на ЛБВ 1 не подано');
            end;
            if not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('Напряжение на ЛБВ 2 не подано');
            end;
            if not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
            begin
              AddMessage('Замедление не включено ЛБВ 1');
            end;
            if not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            begin
              AddMessage('Замедление не включено ЛБВ 2');
            end;
          end;
      end;
      {$ENDREGION}
    mdWorkWithLowFrequency:
      {$REGION 'Проверка правильности настройки блоков'}
      begin
        if (stDeviation.Rack1200A_PRD <> stPassed) then
        begin
          AddMessage('Девиация стойки 1200А ПРД не проверена');
        end;
        if (stDeviation.Rack1200A_PRM <> stPassed) then
        begin
          AddMessage('Девиация стойки 1200А ПРМ не проверена');
        end;
        if (stDeviation.Rack1200B_PRD <> stPassed) then
        begin
          AddMessage('Девиация стойки 1200Б ПРД не проверена');
        end;
        if (stDeviation.Rack1200B_PRM <> stPassed) then
        begin
          AddMessage('Девиация стойки 1200Б ПРМ не проверена');
        end;
        if (GetNumberOfTunedChannelBlocks < 5) then
        begin
          AddMessage('Количество настроенных канальных блоков меньше 5: ' + inttostr(GetNumberOfTunedChannelBlocks));
        end;
        if (GetNumberOfCallPassedThrough < 5) then
        begin
          AddMessage('Количество произведенных вызовов меньше 5: ' + inttostr(GetNumberOfCallPassedThrough));
        end;
      end;
      {$ENDREGION}
    mdTransferToTerminalMode:
      {$REGION 'Проверка правильности настройки блоков'}
      { TODO: Вписать проверку настройки блоков }
      {$ENDREGION}
  end;
  Result := strMessage;
end;
{$ENDREGION}


   function TTaskController.GetCurSubTaskBlock: TRacksEnum;
   begin
   result:=none;

      if  (self.CurrentTask.CurrentSubTask.EventFormName='Щит питания')  then result:=Power_panel;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='МШУ Б') then result:=Mshu_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1920 Б') then result:=Rack_1920_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='МШУ А') then result:=Mshu_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1920 А') then result:=Rack_1920_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1200 ПРМ А') then result:=Rack_1200_reciever_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1200 ПРМ Б') then result:=Rack_1200_reciever_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1710') then result:=Rack_1710;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1400') then result:=Rack_1400;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='П-321 С') then result:=P321_C;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='П-323 ИШ') then result:=power_supply;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1500 А') then result:=Rack_1500_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1500 Б') then result:=Rack_1500_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='Дуплексер А') then result:=Duplexer_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='Дуплексер Б') then result:=Duplexer_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1600 А') then result:=Rack_1600_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1600 Б') then result:=Rack_1600_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1200 ПРД А') then result:=Rack_1200_broadcaster_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='1200 ПРД Б') then result:=Rack_1200_broadcaster_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='Волномер А') then result:=Wavemeter_A;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='Волномер Б') then result:=Wavemeter_B;
      if  (self.CurrentTask.CurrentSubTask.EventFormName='Осциллограф') then result:=Oscillograph_rack;


   end;

end.
