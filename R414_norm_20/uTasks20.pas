unit uTasks20;

interface

uses
  forms,
  Controls,
  Classes,
  StdCtrls,
  ExtCtrls,
   ComCtrls,
  SysUtils,
  Windows,
  uStationStateDM,
  uNetWorkerDM,
  uErrorKeeper,
  uNetParamsList;


 type TSubTask = class
   public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; virtual; abstract;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; virtual;
   constructor Create; virtual;
   var
   EventFormName: String;
   Text: String;
   Name: String;
   Time: String;
   IsComplete: Boolean;

 end;



type TTask = class
      public
      TimeStart: TDateTime;
      TimeEnd: TDateTime;
      IsTaskComplete: Boolean;
      TaskNetParams: TNetParamsList;
       Name: String;
       procedure LastCheck(); virtual;


  constructor Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper); virtual;
  var
    CurrentSubTask: TSubTask;
    SubTasks: array of TSubTask;
    CurrentSubTaskNum: Integer;
    Sender: TObject;
    Station: TStation;
    NetWorker: TClientNetWorker;
    FullCheck: Boolean;
    ErrorKeeper: TErrorKeeper;



end;




 {$REGION 'Пустое задание'}
   //================
  type TTaskNone = class (TTask)
    public
   constructor Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);  override;
   procedure LastCheck(); override;
  end;


  type TTaskNoneSubTask1 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;
  //=============
 {$ENDREGION}

 {$REGION 'Включение питания, заголовки'}

    type TTaskPowerOn = class (TTask)
    public
   constructor Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);  override;
   procedure LastCheck(); override;
  end;

    type TTaskPowerOnSubTask1 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask2 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask3 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;


   type TTaskPowerOnSubTask4 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask5 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
   var Conditions: array [0..3] of Boolean;
  end;

   type TTaskPowerOnSubTask6 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
   var Conditions: array [0..3] of Boolean;
  end;

    type TTaskPowerOnSubTask7 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask8 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask9 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask10 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;


     type TTaskPowerOnSubTask11 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

       type TTaskPowerOnSubTask12 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskPowerOnSubTask13 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

  //================
  {$ENDREGION}

 {$REGION 'Автономный контроль, заголовки'}

   type TTaskSingleCheck = class (TTask)
    public
   constructor Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);  override;
   procedure LastCheck(); override;
  end;

    type TTaskSingleCheckSubTask1 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask2 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask3 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask4 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask5 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask6 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask7 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask8 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask9 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask10 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask11 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask12 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask13 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask14 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask15 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask16 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

          type TTaskSingleCheckSubTask17 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask18 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask19 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask20 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask21 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask22 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

             type TTaskSingleCheckSubTask23 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

             type TTaskSingleCheckSubTask24 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;


               type TTaskSingleCheckSubTask25 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

               type TTaskSingleCheckSubTask26 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;


               type TTaskSingleCheckSubTask27 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

                 type TTaskSingleCheckSubTask28 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

                 type TTaskSingleCheckSubTask29 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;
 {$ENDREGION}

  {$REGION 'Оконечный режим. Заголовки'}
    type TTaskTerminalMode = class (TTask)
    public
   constructor Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);  override;
   procedure LastCheck(); override;
  end;

    type TTaskTerminalModeSubTask1 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask2 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask3 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask4 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask5 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask6 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask7 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask8 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask9 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask10 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask11 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask12 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

  type TTaskTerminalModeSubTask13 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask14 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskTerminalModeSubTask15 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskTerminalModeSubTask16 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskTerminalModeSubTask17 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskTerminalModeSubTask18 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask19 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask20 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask21 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask22 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask23 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask24 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask25 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask26 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskTerminalModeSubTask27 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;
   type TTaskTerminalModeSubTask28 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;
   type TTaskTerminalModeSubTask29 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;
   type TTaskTerminalModeSubTask30 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;
   type TTaskTerminalModeSubTask31 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   function NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean; override;
   constructor Create;  override;
  end;
  {$ENDREGION}

implementation

uses

uBlockPowerPanelForm,
uConstantsDM;

 //создание задания
  constructor TTask.Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);
  begin
  Self.ErrorKeeper:=ErrorKeeper;
  Self.Sender := Sender;
  Self.Station := Station;
  Self.NetWorker := NetWorker;
    IsTaskComplete:= false;
       CurrentSubTaskNum:= 0;
        TimeStart:= Time;

  end;
  
       procedure TTask.LastCheck();
       begin
         
       end;
       
    constructor TSubTask.Create;
  begin

  end;

  function TSubTask.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
  begin
    Result:=True;
  end;



{$REGION 'Пустое задание'}

  constructor TTaskNone.Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);
  begin
  inherited Create(Station, NetWorker, ErrorKeeper);

  Name:='Свободный осмотр станции';

  SetLength(SubTasks, 1);

  SubTasks[0]:= TTaskNoneSubTask1.Create;



  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   function TTaskNoneSubTask1.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
        result:=true;
   end;


   constructor TTaskNoneSubTask1.Create;
   begin
   inherited Create;

        Name:='Свободный осмотр станции';
        Text:='';
        EventFormName:='nil';
        Time:= '';
   end;

   procedure TTaskNone.LastCheck();
       begin
         
       end;
{$ENDREGION}



{$REGION 'Включение питания'}

  constructor TTaskPowerOn.Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);
  begin
  inherited Create(Station, NetWorker, ErrorKeeper);
  FullCheck := False;
   
  Name:='Включение питания';

  SetLength(SubTasks, 13);

  SubTasks[0]:= TTaskPowerOnSubTask1.Create;
  SubTasks[1]:= TTaskPowerOnSubTask2.Create;
  SubTasks[2]:= TTaskPowerOnSubTask3.Create;
  SubTasks[3]:= TTaskPowerOnSubTask4.Create;
  SubTasks[4]:= TTaskPowerOnSubTask5.Create;
  SubTasks[5]:= TTaskPowerOnSubTask6.Create;
  SubTasks[6]:= TTaskPowerOnSubTask7.Create;
  SubTasks[7]:= TTaskPowerOnSubTask8.Create;
  SubTasks[8]:= TTaskPowerOnSubTask9.Create;
  SubTasks[9]:= TTaskPowerOnSubTask10.Create;
  SubTasks[10]:= TTaskPowerOnSubTask11.Create;
  SubTasks[11]:= TTaskPowerOnSubTask12.Create;
  SubTasks[12]:= TTaskPowerOnSubTask13.Create;

  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;


  procedure TTaskPowerOn.LastCheck;
  var i: Integer;
  var allRight: Boolean;
  begin
       allRight:= true;
        ErrorKeeper.ErrorMsg := 'Общая проверка правильности настройки:' + #10#13;;
    for I := 0 to Length(SubTasks) - 1 do
     begin
          if (SubTasks[i].CheckSubTask(FullCheck, Station, NetWorker, ErrorKeeper, Self.TaskNetParams) = False) then allRight := false;
     end;

    if (allRight = true) then
      begin
        IsTaskComplete:=true;
        TimeEnd:=Time;
      end
      else
      begin
        ErrorKeeper.ShowError;
      end;
  end;

   //===
   function TTaskPowerOnSubTask1.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.PowerPanel.swNet=1) and (Station.PowerPanel.swPhase=4) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.PowerPanel.swNet<>1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включено питание станции' + #10#13;
            if (Station.PowerPanel.swPhase<>4) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не проверено напряжение на фазах' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask1.Create;
   begin
   inherited Create;

        Name:='На щите питания нажать кнопку СЕТЬ';
        Text:='На щите питания 1820 нажать кнопку СЕТЬ. Загорается сигнальная лампа СЕТЬ. Проконтролировать с помощью переключателя КОНТРОЛЬ НАПРЯЖЕНИЙ наличие и величину напряжений на фазах 1-2, 2-3, 3-1';
        EventFormName:='Щит питания';
        Time:= '';
   end;

  //  ===

   function TTaskPowerOnSubTask2.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.PowerPanel.sw1700Power=1) and (Station.PowerPanel.sw1900Power=1) and (Station.PowerPanel.sw1900Power_2=1)
         and  (Station.PowerPanel.sw1200Power_2=1) and (Station.PowerPanel.sw1200Power=1) and (Station.PowerPanel.sw1400=1) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.PowerPanel.sw1700Power<>1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включено питание блока 1700' + #10#13;
            if (Station.PowerPanel.sw1900Power<>1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включено питание блока 1900А' + #10#13;
            if (Station.PowerPanel.sw1900Power_2<>1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включено питание блока 1900Б' + #10#13;
            if (Station.PowerPanel.sw1200Power<>1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включено питание блока 1200А' + #10#13;
            if (Station.PowerPanel.sw1200Power_2<>1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включено питание блока 1200Б' + #10#13;
            if (Station.PowerPanel.sw1400<>1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включено питание блока 1400' + #10#13;
           Result:=false;
         end;

   end;

   constructor TTaskPowerOnSubTask2.Create;
   begin
   inherited Create;

        Name:='На щите питания включить 1900А, 1900Б, 1200А, 1200Б, 1700';
        Text:='На щите питания 1820 выключатели 1900А, 1900Б, 1200А, 1200Б, 1700, 1400, установить в положение ВКЛ. При этом загораются сигнальные лампы над выключателями';
        EventFormName:='Щит питания';
        Time:= '';
   end;
         //==

   function TTaskPowerOnSubTask3.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.HalfSetA.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetA.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.LittleNoisyAmplifier.butNet2<>0) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
            if (Station.HalfSetA.LittleNoisyAmplifier.butNet<>0) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask3.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на МШУ 1830А';
        Text:='Тумблеры на блоке МШУ 1830А установить в положение ВКЛ. При этом загораются сигнальные лампы над выключателями';
        EventFormName:='МШУ А';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask4.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.HalfSetB.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetB.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.LittleNoisyAmplifier.butNet2<>0) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
            if (Station.HalfSetB.LittleNoisyAmplifier.butNet<>0) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask4.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на МШУ 1830Б';
        Text:='Тумблеры на блоке МШУ 1830Б установить в положение ВКЛ. При этом загораются сигнальные лампы над выключателями';
        EventFormName:='МШУ Б';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask5.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   var I: Integer;
   begin
          if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
          Conditions[0]:=False;
          Conditions[1]:=False;
          Conditions[2]:=False;
          Conditions[3]:=False;

          if (Station.HalfSetA.Rack1920.but1930=butPositionUp) then begin Conditions[0]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер на блоке 1930' + #10#13;
          if (Station.HalfSetA.Rack1920.but1910=butPositionUp) and (Station.HalfSetA.Rack1920.but1910A=butPositionUp) then begin Conditions[1]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включены тумблеры на блоках 1910' + #10#13;
          if (Station.HalfSetA.Rack1920.butPower=butPositionUp) and (Station.HalfSetA.Rack1920.butPower2=butPositionUp) then begin Conditions[2]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включены тумблеры на блоках 1920' + #10#13;
          if (Station.HalfSetA.Rack1920.but1960_1=butPositionUp) then begin Conditions[3]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер на блоке 1960' + #10#13;

          Result:= false;

          for I := 0 to Length(Conditions)-2 do
            begin
                if (Conditions[i]=False) and (Conditions[i+1]=True) then
                 begin
                    ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + #10#13 +'Неверная последоваельность включения тумблеров' + #10#13 + 'Правильно: 1930, 1910, 1920, 1960';
                    ErrorKeeper.ShowError;
                    Break;
                  end;
            end;

            if (Conditions[0]=True) and (Conditions[1]=True) and (Conditions[2]=True) and (Conditions[3]=True) then Result:=true;


   end;

   constructor TTaskPowerOnSubTask5.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на стойке 1920А';
        Text:='На стойке 1920А: тумблеры на блоках 1920 установить в положение ВКЛ. Тумблеры на блоках 1910 установить в положение ВКЛ. Тумблер на блоке 1930 установить в положение ВКЛ. Тумблер на блоке 1360 установить в положение ВКЛ.';
        EventFormName:='1920 А';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask6.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   var I: Integer;
   begin
          if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
          Conditions[0]:=False;
          Conditions[1]:=False;
          Conditions[2]:=False;
          Conditions[3]:=False;

          if (Station.HalfSetB.Rack1920.but1930=butPositionUp) then begin Conditions[0]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер на блоке 1930' + #10#13;
          if (Station.HalfSetB.Rack1920.but1910=butPositionUp) and (Station.HalfSetB.Rack1920.but1910A=butPositionUp) then begin Conditions[1]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включены тумблеры на блоках 1910' + #10#13;
          if (Station.HalfSetB.Rack1920.butPower=butPositionUp) and (Station.HalfSetB.Rack1920.butPower2=butPositionUp) then begin Conditions[2]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включены тумблеры на блоках 1920' + #10#13;
          if (Station.HalfSetB.Rack1920.but1960_1=butPositionUp) then begin Conditions[3]:=True;  end
          else ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер на блоке 1960' + #10#13;

          Result:= false;

          for I := 0 to Length(Conditions)-2 do
            begin
                if (Conditions[i]=False) and (Conditions[i+1]=True) then
                 begin
                    ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + #10#13 +'Неверная последоваельность включения тумблеров' + #10#13 + 'Правильно: 1930, 1910, 1920, 1960';
                    ErrorKeeper.ShowError;
                    Break;
                  end;
            end;

            if (Conditions[0]=True) and (Conditions[1]=True) and (Conditions[2]=True) and (Conditions[3]=True) then Result:=true;


   end;

   constructor TTaskPowerOnSubTask6.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на стойке 1920Б';
        Text:='На стойке 1920Б: тумблеры на блоках 1920 установить в положение ВКЛ. Тумблеры на блоках 1910 установить в положение ВКЛ. Тумблер на блоке 1930 установить в положение ВКЛ. Тумблер на блоке 1360 установить в положение ВКЛ.';
        EventFormName:='1920 Б';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask7.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.HalfSetA.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1200Left.but1240K<>butPositionUp) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер на блоке 1240к' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask7.Create;
   begin
   inherited Create;

        Name:='Включить СЕТЬ на стойке 1200 ПРМ А';
        Text:='На стойке 1200 ПРМ А тумблер СЕТЬ на блоке 1240К установить в положение ВКЛ. Загорается сигнальная лампа над тумблером';
        EventFormName:='1200 ПРМ А';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask8.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.HalfSetB.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1200Left.but1240K<>butPositionUp) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер на блоке 1240к' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask8.Create;
   begin
   inherited Create;

        Name:='Включить СЕТЬ на стойке 1200 ПРМ Б';
        Text:='На стойке 1200 ПРМ Б тумблер СЕТЬ на блоке 1240К установить в положение ВКЛ. Загорается сигнальная лампа над тумблером';
        EventFormName:='1200 ПРМ Б';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask9.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.Rack1710.butPower=butPositionRight) and (Station.Rack1710.butSpeaker=butPositionRight) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.Rack1710.butPower<>butPositionRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер питания на блоке 470' + #10#13;
            if (Station.Rack1710.butSpeaker<>butPositionRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер ГРОМКОГОВОРИТЕЛЬ на блоке 470' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask9.Create;
   begin
   inherited Create;

        Name:='На стойке 1710 ВКЛ ПИТ. на блоке 470';
        Text:='На стойке 1710 на блоке 470 тумблеры ПИТ. и ГРОМКОГОВОРИТЕЛЬ перевести в положение ВКЛ.';
        EventFormName:='1710';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask10.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.Rack1400.butPower = butPositionRight) and (Station.Rack1400.butSpeaker = butPositionRight) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.Rack1400.butPower<>butPositionRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер питания на блоке 470' + #10#13;
            if (Station.Rack1400.butSpeaker<>butPositionRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер ГРОМКОГОВОРИТЕЛЬ на блоке 470' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask10.Create;
   begin
   inherited Create;

        Name:='На стойке 1400 ВКЛ ПИТ. на блоке 470';
        Text:='На стойке 1400 на блоке 470 тумблеры ПИТ. и ГРОМКОГОВОРИТЕЛЬ перевести в положение ВКЛ.';
        EventFormName:='1400';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask11.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.P321C.butPower=butPositionUp) and (Station.P321C.butMeasure=butPositionUp) and (Station.P321C.but600Ohm=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.P321C.butPower<>butPositionUp) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер питания' + #10#13;
            if (Station.P321C.butMeasure<>butPositionUp) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер ИЗМЕРЕНИЕ' + #10#13;
            if (Station.P321C.but600Ohm<>butPositionUp) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер 600ом' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask11.Create;
   begin
   inherited Create;

        Name:='Включить питание П-321 С';
        Text:='На приборе П-321 С установить тумблеры на позиции: ПИТАНИЕ ВКЛ., ИЗМЕР., 600 Ом';
        EventFormName:='П-321 С';
        Time:= '';
   end;

     //==

   function TTaskPowerOnSubTask12.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.PowerSupply.butPower=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.PowerSupply.butPower<>butPositionUp) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер питания' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask12.Create;
   begin
   inherited Create;

        Name:='Включить питание П-323ИШ';
        Text:='На приборе П-323 ИШ установить тумблер питания на позицию ВКЛ.';
        EventFormName:='П-323 ИШ';
        Time:= '';
   end;


     //==

   function TTaskPowerOnSubTask13.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.Oscillograph.but1Khz = butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.Oscillograph.but1Khz<>butPositionUp) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не включен тумблер питания' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskPowerOnSubTask13.Create;
   begin
   inherited Create;

        Name:='Включить питание осциллографа';
        Text:='На осциллографе установить тумблер питания (в правом нижнем углу) на позицию ВКЛ.';
        EventFormName:='Осциллограф';
        Time:= '';
   end;

{$ENDREGION}

{$REGION 'Автономный контроль'}

  constructor TTaskSingleCheck.Create;
  begin
  inherited Create(Station, NetWorker, ErrorKeeper);

  Name:='Проверка работоспособности станции в режиме "Автономный контроль"';

  SetLength(SubTasks, 29);

  SubTasks[0]:= TTaskSingleCheckSubTask1.Create;
  SubTasks[1]:= TTaskSingleCheckSubTask2.Create;
  SubTasks[2]:= TTaskSingleCheckSubTask3.Create;
  SubTasks[3]:= TTaskSingleCheckSubTask4.Create;
  SubTasks[4]:= TTaskSingleCheckSubTask5.Create;
  SubTasks[5]:= TTaskSingleCheckSubTask6.Create;
  SubTasks[6]:= TTaskSingleCheckSubTask7.Create;
  SubTasks[7]:= TTaskSingleCheckSubTask8.Create;
  SubTasks[8]:= TTaskSingleCheckSubTask9.Create;
  SubTasks[9]:= TTaskSingleCheckSubTask10.Create;
  SubTasks[10]:= TTaskSingleCheckSubTask11.Create;
  SubTasks[11]:= TTaskSingleCheckSubTask12.Create;
  SubTasks[12]:= TTaskSingleCheckSubTask13.Create;
  SubTasks[13]:= TTaskSingleCheckSubTask14.Create;
  SubTasks[14]:= TTaskSingleCheckSubTask15.Create;
  SubTasks[15]:= TTaskSingleCheckSubTask16.Create;
  SubTasks[16]:= TTaskSingleCheckSubTask17.Create;
  SubTasks[17]:= TTaskSingleCheckSubTask18.Create;
  SubTasks[18]:= TTaskSingleCheckSubTask19.Create;
  SubTasks[19]:= TTaskSingleCheckSubTask20.Create;
  SubTasks[20]:= TTaskSingleCheckSubTask21.Create;
  SubTasks[21]:= TTaskSingleCheckSubTask22.Create;
  SubTasks[22]:= TTaskSingleCheckSubTask23.Create;
  SubTasks[23]:= TTaskSingleCheckSubTask24.Create;
  SubTasks[24]:= TTaskSingleCheckSubTask25.Create;
  SubTasks[25]:= TTaskSingleCheckSubTask26.Create;
  SubTasks[26]:= TTaskSingleCheckSubTask27.Create;
  SubTasks[27]:= TTaskSingleCheckSubTask28.Create;
  SubTasks[28]:= TTaskSingleCheckSubTask29.Create;


  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

  procedure TTaskSingleCheck.LastCheck;
  var i: Integer;
  var allRight: Boolean;
  begin
       allRight:= true;
       ErrorKeeper.ErrorMsg := 'Общая проверка правильности настройки:' + #10#13;;
    for I := 0 to Length(SubTasks) - 1 do
     begin
          if (SubTasks[i].CheckSubTask(FullCheck, Station, NetWorker, ErrorKeeper, Self.TaskNetParams) = False) then allRight := false;
     end;

    if (allRight = true) then
      begin
        IsTaskComplete:=true;
        TimeEnd:=Time;
      end
      else
      begin
        ErrorKeeper.ShowError;
      end;
  end;

   //===
   function TTaskSingleCheckSubTask1.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.stCableLoad = csConnectedAtRack1500Sh1)
         and (Station.HalfSetA.Rack1500.stCableSh1 = csConnectedAtRack1500NoName) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Кабель НАГРУЗКА не подключен к разъему ВЫХОД СВЧ' + #10#13;
            if (Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500NoName) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель 1840 к пустому разъему' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask1.Create;
   begin
   inherited Create;

        Name:='Подключить кабели на стойке 1500А';
        Text:='На стойке 1500А от разьема ВЫХОД СВЧ. отключить кабель, идущий к дуплексеру и подключить к нему кабель НАГРУЗКА. Проверить подключены ли соотвествующие кабели к разъемам ВЫХОД АК 1500 и ВЫХОД АК 1600. Подключить кабель 1840 к пустому разъему';
        EventFormName:='1500 А';
        Time:= '';
   end;


        function TTaskSingleCheckSubTask2.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.swWave1610_0 = NetWorker.ClientState.TransmitterWaveA) and (Station.HalfSetA.Rack1500.swWave161_R = NetWorker.ClientState.TransmitterWaveA)
         and (Station.HalfSetA.Rack1500.swWave1500 = NetWorker.ClientState.TransmitterWaveA) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1500.swWave1610_0 <> NetWorker.ClientState.TransmitterWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи напереключателе 1610О' + #10#13;
            if (Station.HalfSetA.Rack1500.swWave161_R <> NetWorker.ClientState.TransmitterWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи напереключателе 1610Р' + #10#13;
            if (Station.HalfSetA.Rack1500.swWave1500 <> NetWorker.ClientState.TransmitterWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи напереключателе 1500' + #10#13;
           Result:=false;
         end;
   end;

    constructor TTaskSingleCheckSubTask2.Create;
   begin
   inherited Create;

        Name:='Установить волны на передатчике 1500 А';
        Text:='Установить рабочие волны передачи на стойке 1500 А, используя вращающиеся переключатели';
        EventFormName:='1500 А';
        Time:= '';
   end;


        function TTaskSingleCheckSubTask3.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.LittleNoisyAmplifier.swWave = NetWorker.ClientState.ReceiverWaveA) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> NetWorker.ClientState.ReceiverWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема' + #10#13;
           Result:=false;
         end;
   end;

    constructor TTaskSingleCheckSubTask3.Create;
   begin
   inherited Create;

        Name:='Установить волну приема на МШУ А';
        Text:='Установить рабочие волны приема на приборе МШУ А';
        EventFormName:='МШУ А';
        Time:= '';
   end;


   function TTaskSingleCheckSubTask4.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
         or ((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)))
          and (Station.HalfSetA.Duplexer.cb1840 = csDisconected) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель от разъема стойки 1600 ВЫХОД' + #10#13;
            if (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель Ф33 Ш2' + #10#13;
            if (Station.HalfSetA.Duplexer.cb1840 <> csDisconected) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не отключен кабель, идущий к дуплексеру' + #10#13;
           Result:=false;
         end;
   end;

          constructor TTaskSingleCheckSubTask4.Create;
   begin
   inherited Create;

        Name:='Подключить кабели к фильтру Ф-33 А';
        Text:='На фильтре Ф-33 А отключить от входа кабель, идущий к дуплексеру; подключить к входу кабель, идущий от разема стойки 1600 ВЫХОД АК 1600 другого полукомплекта (с красным наконечником) и кабель Ф33 Ш2';
        EventFormName:='Дуплексер А';
        Time:= '';
   end;
   


   function TTaskSingleCheckSubTask5.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Duplexer.waveTransmit = NetWorker.ClientState.TransmitterWaveA) and (Station.HalfSetA.Duplexer.waveReceive = NetWorker.ClientState.ReceiverWaveA) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Duplexer.waveTransmit <> NetWorker.ClientState.TransmitterWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи' + #10#13;
            if (Station.HalfSetA.Duplexer.waveReceive <> NetWorker.ClientState.ReceiverWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask5.Create;
   begin
   inherited Create;

        Name:='Установить волны на дуплексере А';
        Text:='Установить рабочие волны передачи и приема на дуплексере А, используя вращающиеся переключатели';
        EventFormName:='Дуплексер А';
        Time:= '';
   end;




    function TTaskSingleCheckSubTask6.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][0] = Station.HalfSetA.Rack1500.GeterodinIntMain)
      and (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] - 2) <= Station.HalfSetA.Rack1500.GeterodinFloatMain)
            and (Station.HalfSetA.Rack1500.GeterodinFloatMain <= (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] + 2)))

            and (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][0] = Station.HalfSetA.Rack1500.GeterodinIntReserve)
      and (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] - 2) <= Station.HalfSetA.Rack1500.GeterodinFloatReserve)
            and (Station.HalfSetA.Rack1500.GeterodinFloatReserve <= (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] + 2)))
            and (Station.HalfSetA.Rack1500.SelectedMd = smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain) then
         begin
         Station.HalfSetA.Rack1500.GeterodinTunedMain := True;
         Station.HalfSetA.Rack1500.GeterodinTunedReserve := True;
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][0] <> Station.HalfSetA.Rack1500.GeterodinIntMain)
                or (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] - 2) > Station.HalfSetA.Rack1500.GeterodinFloatMain)
                or (Station.HalfSetA.Rack1500.GeterodinFloatMain > (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи по волномеру основном канале. Для начала настройки нажмите на лампы МД-О и 1610-О и подключите кабель к разъему над переключателем 1610О' + #10#13;
            if (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][0] <> Station.HalfSetA.Rack1500.GeterodinIntReserve)
                or (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] - 2) > Station.HalfSetA.Rack1500.GeterodinFloatReserve)
                or (Station.HalfSetA.Rack1500.GeterodinFloatReserve > (GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи по волномеру на резервном канале. Для начала настройки нажмите на лампы МД-Р и 1610-Р и подключите кабель к разъему над переключателем 1610Р' + #10#13;
            if (Station.HalfSetA.Rack1500.SelectedMd <> smdMain) or (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не активированы лампы МД-О и 1610-О после настройки' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask6.Create;
   begin
   inherited Create;

        Name:='Настроить передатчик 1500 А по волномеру';
        Text:='Нажать на кнопки-лампы МД-О и 1610-О, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' + #10#13
        + ' Нажать на кнопки-лампы МД-Р и 1610-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'+ #10#13
        + 'Нажать на кнопки-лампы МД-О и 1610-О';
        EventFormName:='1500 А';
        Time:= '';


   end;

      function TTaskSingleCheckSubTask7.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.btnAutomatic = butPositionRight) and (Station.HalfSetA.Rack1500.DropError = True) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Тумблер АВТОМАТИКА не передней панели не включен' + #10#13;
            if (Station.HalfSetA.Rack1500.DropError <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не сброшена авария' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask7.Create;
   begin
   inherited Create;

        Name:='На стойке 1500 А сбросить аварию';
        Text:='Внутри стойки 1500 А нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1500 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask8.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn = True) and (Station.HalfSetA.Rack1920.stLBV1_TurnedOn = True) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не верхнем блоке не подано' + #10#13;
            if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не нижнем блоке не подано' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask8.Create;
   begin
   inherited Create;

        Name:='Включить высокое напряжение на стойке 1920 А';
        Text:='Для двух блоков 1920 включить высокое напряжение одновременным нажатием кнопок ВЫСОКОЕ ВКЛ. и ТОК 5 МА на стойке 1920 А. Проследить подачу напряжения по стрелочному индикатору';
        EventFormName:='1920 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask9.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.swModeControl = 6) and (Station.HalfSetA.Rack1500.swPhaseMover = 10) and (Station.HalfSetA.Rack1500.butMode_R = butPositionLeft) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1500.swModeControl <> 6) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Переключатель режима не установлен в положение МОЩН.-РАСФАЗ.' + #10#13;
            if (Station.HalfSetA.Rack1500.butMode_R <> butPositionLeft) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Тумблер МД-Р не переключен в левое положение' + #10#13;
            if (Station.HalfSetA.Rack1500.swPhaseMover <> 10) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Сигналы ЛБВ не сфазированы. Поворачивайте фазовращатель, пока разница в токах не будет нулевой' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask9.Create;
   begin
   inherited Create;

        Name:='Сфазировать сигналы ЛБВ на стойке 1500 А';
        Text:='На передней панели стойки 1500 А переключатель режима установить в положение МОЩН.-РАСФАЗ. Тумблер МД-Р переключить в левое положение. Сфазировать сигналы ЛБВ путем вращения ручки ФАЗОВРАЩАТЕЛЬ.';
        EventFormName:='1500 А';
        Time:= '';
   end;

    function TTaskSingleCheckSubTask10.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.wave1610_0 = NetWorker.ClientState.ReceiverWaveA) and (Station.HalfSetA.Rack1600.wave1610_R = NetWorker.ClientState.ReceiverWaveA) and (Station.HalfSetA.Rack1600.wave1600 = NetWorker.ClientState.ReceiverWaveA) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1600.wave1610_0 <> NetWorker.ClientState.ReceiverWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлены рабочие волны приема на пареключателе 1610О' + #10#13;
            if (Station.HalfSetA.Rack1600.wave1610_R <> NetWorker.ClientState.ReceiverWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлены рабочие волны приема на пареключателе 1610Р' + #10#13;
            if (Station.HalfSetA.Rack1600.wave1600 <> NetWorker.ClientState.ReceiverWaveA) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлены рабочие волны приема на пареключателе 1600' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask10.Create;
   begin
   inherited Create;

        Name:='Установить волны на приемнике 1600 А';
        Text:='Установить рабочие волны приема на стойке 1600 А, используя вращающиеся переключатели';
        EventFormName:='1600 А';
        Time:= '';
   end;


   
      function TTaskSingleCheckSubTask11.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)
         and (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][0] = Station.HalfSetA.Rack1600.GeterodinIntMain)
      and (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] - 2) <= Station.HalfSetA.Rack1600.GeterodinFloatMain)
            and (Station.HalfSetA.Rack1600.GeterodinFloatMain <= (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] + 2)))

            and (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][0] = Station.HalfSetA.Rack1600.GeterodinIntReserve)
      and (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] - 2) <= Station.HalfSetA.Rack1600.GeterodinFloatReserve)
            and (Station.HalfSetA.Rack1600.GeterodinFloatReserve <= (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] + 2)))
            then
         begin
         Station.HalfSetA.Rack1600.GeterodinTunedMain := True;
         Station.HalfSetA.Rack1600.GeterodinTunedReserve := True;
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][0] <> Station.HalfSetA.Rack1600.GeterodinIntMain)
              or (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] - 2) > Station.HalfSetA.Rack1600.GeterodinFloatMain)
              or (Station.HalfSetA.Rack1600.GeterodinFloatMain > (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема по волномеру на основном канале. Для начала настройки нажмите на лампы 1610-О, УПЧ-О и ДМЧ-О и подключите кабель к разъему над переключателем 1610О' + #10#13;
            if (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][0] <> Station.HalfSetA.Rack1600.GeterodinIntReserve)
              or (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] - 2) > Station.HalfSetA.Rack1600.GeterodinFloatReserve)
              or (Station.HalfSetA.Rack1600.GeterodinFloatReserve > (GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема по волномеру на резервном канале. Для начала настройки нажмите на лампы 1601-Р, УПЧ-Р, ДМЧ-Р и подключите кабель к разъему над переключателем 1610Р' + #10#13;
            if (Station.HalfSetA.Rack1600.SelectedMd <> smdMain) or (Station.HalfSetA.Rack1600.SelectedUpch <> sUpchMain) or (Station.HalfSetA.Rack1600.SelectedDmch <> sDmchMain) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не активированы лампы 1610-О, УПЧ-0 и ДМЧ-0 после настройки' + #10#13;

           Result:=false;
         end;
   end;


   constructor TTaskSingleCheckSubTask11.Create;
   begin
   inherited Create;

        Name:='Настроить приемник 1600 А по волномеру';
        Text:='Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' + #10#13
        + ' Нажать на кнопки-лампы 1601-Р, УПЧ-Р, ДМЧ-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'  + #10#13
        + 'Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0';
        EventFormName:='1600 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask12.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft) and (Station.HalfSetA.Rack1600.DropError = True) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1600.butAutomatic <> butPositionLeft) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Тумблер АВТОМАТИКА не включен' + #10#13;
            if (Station.HalfSetA.Rack1600.DropError <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Авария не сброшена' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask12.Create;
   begin
   inherited Create;

        Name:='На стойке 1600 А сбросить аварию';
        Text:='Внутри стойки 1600 А нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1600 А';
        Time:= '';
   end;

    //==================================================================================

  {$REGION 'Полукомплект Б'}


   function TTaskSingleCheckSubTask13.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.stCableLoad = csConnectedAtRack1500Sh1)
         and (Station.HalfSetB.Rack1500.stCableSh1 = csConnectedAtRack1500NoName) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Кабель НАГРУЗКА не подключен к разъему ВЫХОД СВЧ' + #10#13;
            if (Station.HalfSetB.Rack1500.stCableSh1 <> csConnectedAtRack1500NoName) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель 1840 к пустому разъему' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask13.Create;
   begin
   inherited Create;

        Name:='Подключить кабели на стойке 1500 Б';
        Text:='На стойке 1500 Б от разьема ВЫХОД СВЧ. отключить кабель, идущий к дуплексеру и подключить к нему кабель НАГРУЗКА. Проверить подключены ли соотвествующие кабели к разъемам ВЫХОД АК 1500 и ВЫХОД АК 1600. Подключить кабель 1840 к пустому разъему';
        EventFormName:='1500 Б';
        Time:= '';
   end;


        function TTaskSingleCheckSubTask14.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.swWave1610_0 = NetWorker.ClientState.TransmitterWaveB) and (Station.HalfSetB.Rack1500.swWave161_R = NetWorker.ClientState.TransmitterWaveB)
         and (Station.HalfSetB.Rack1500.swWave1500 = NetWorker.ClientState.TransmitterWaveB) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1500.swWave1610_0 <> NetWorker.ClientState.TransmitterWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи напереключателе 1610О' + #10#13;
            if (Station.HalfSetB.Rack1500.swWave161_R <> NetWorker.ClientState.TransmitterWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи напереключателе 1610Р' + #10#13;
            if (Station.HalfSetB.Rack1500.swWave1500 <> NetWorker.ClientState.TransmitterWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи напереключателе 1500' + #10#13;
           Result:=false;
         end;
   end;

    constructor TTaskSingleCheckSubTask14.Create;
   begin
   inherited Create;

        Name:='Установить волны на передатчике 1500 Б';
        Text:='Установить рабочие волны передачи на стойке 1500 Б, используя вращающиеся переключатели';
        EventFormName:='1500 Б';
        Time:= '';
   end;


         function TTaskSingleCheckSubTask15.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.LittleNoisyAmplifier.swWave = NetWorker.ClientState.ReceiverWaveB) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.LittleNoisyAmplifier.swWave <> NetWorker.ClientState.ReceiverWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема' + #10#13;
           Result:=false;
         end;
   end;


     constructor TTaskSingleCheckSubTask15.Create;
   begin
   inherited Create;

        Name:='Установить волну приема на МШУ Б';
        Text:='Установить рабочие волны приема на приборе МШУ Б';
        EventFormName:='МШУ Б';
        Time:= '';
   end;




   function TTaskSingleCheckSubTask16.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (((Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
         or ((Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)))
          and (Station.HalfSetB.Duplexer.cb1840 = csDisconected) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and (Station.HalfSetB.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель от разъема стойки 1600 ВЫХОД' + #10#13;
            if (Station.HalfSetB.Duplexer.cbSh2 <> csConnectedAtDuplexeRight) and (Station.HalfSetB.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель Ф33 Ш2' + #10#13;
            if (Station.HalfSetB.Duplexer.cb1840 <> csDisconected) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не отключен кабель, идущий к дуплексеру' + #10#13;
           Result:=false;
         end;
   end;

          constructor TTaskSingleCheckSubTask16.Create;
   begin
   inherited Create;

        Name:='Подключить кабели к фильтру Ф-33 Б';
        Text:='На фильтре Ф-33 Б отключить от входа кабель, идущий к дуплексеру; подключить к входу кабель, идущий от разема стойки 1600 ВЫХОД АК 1600 другого полукомплекта (с красным наконечником) и кабель Ф33 Ш2';
        EventFormName:='Дуплексер Б';
        Time:= '';
   end;
   


   function TTaskSingleCheckSubTask17.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Duplexer.waveTransmit = NetWorker.ClientState.TransmitterWaveB) and (Station.HalfSetB.Duplexer.waveReceive = NetWorker.ClientState.ReceiverWaveB) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Duplexer.waveTransmit <> NetWorker.ClientState.TransmitterWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи' + #10#13;
            if (Station.HalfSetB.Duplexer.waveReceive <> NetWorker.ClientState.ReceiverWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask17.Create;
   begin
   inherited Create;

        Name:='Установить волны на дуплексере Б';
        Text:='Установить рабочие волны передачи и приема на дуплексере Б, используя вращающиеся переключатели';
        EventFormName:='Дуплексер Б';
        Time:= '';
   end;




    function TTaskSingleCheckSubTask18.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][0] = Station.HalfSetB.Rack1500.GeterodinIntMain)
      and (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] - 2) <= Station.HalfSetB.Rack1500.GeterodinFloatMain)
            and (Station.HalfSetB.Rack1500.GeterodinFloatMain <= (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] + 2)))
            
            and (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][0] = Station.HalfSetB.Rack1500.GeterodinIntReserve)
      and (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] - 2) <= Station.HalfSetB.Rack1500.GeterodinFloatReserve)
            and (Station.HalfSetB.Rack1500.GeterodinFloatReserve <= (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] + 2)))
            and (Station.HalfSetB.Rack1500.SelectedMd = smdMain) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain) then
         begin
         Station.HalfSetB.Rack1500.GeterodinTunedMain := True;
         Station.HalfSetB.Rack1500.GeterodinTunedReserve := True;
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][0] <> Station.HalfSetB.Rack1500.GeterodinIntMain)
                or (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] - 2) > Station.HalfSetB.Rack1500.GeterodinFloatMain)
                or (Station.HalfSetB.Rack1500.GeterodinFloatMain > (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи по волномеру основном канале. Для начала настройки нажмите на лампы МД-О и 1610-О и подключите кабель к разъему над переключателем 1610О' + #10#13;
            if (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][0] <> Station.HalfSetB.Rack1500.GeterodinIntReserve)
                or (((GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] - 2) > Station.HalfSetB.Rack1500.GeterodinFloatReserve)
                or (Station.HalfSetB.Rack1500.GeterodinFloatReserve > (GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна передачи по волномеру на резервном канале. Для начала настройки нажмите на лампы МД-Р и 1610-Р и подключите кабель к разъему над переключателем 1610Р' + #10#13;
            if (Station.HalfSetB.Rack1500.SelectedMd <> smdMain) or (Station.HalfSetB.Rack1500.SelectedRetr <> sRetrMain) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не активированы лампы МД-О и 1610-О после настройки' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask18.Create;
   begin
   inherited Create;

        Name:='Настроить передатчик 1500 Б по волномеру';
        Text:='Нажать на кнопки-лампы МД-О и 1610-О, подключить волномер к основному каналу, на волномере установить шкалу для волны передачи в соответствии с номерами волн гетеродина.'
        + ' Нажать на кнопки-лампы МД-Р и 1610-Р, подключить волномер к резервному каналу, на волномере установить шкалу для волны передачи в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы МД-О и 1610-О';
        EventFormName:='1500 Б';
        Time:= '';


   end;

      function TTaskSingleCheckSubTask19.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.btnAutomatic = butPositionRight) and (Station.HalfSetB.Rack1500.DropError = True) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1500.btnAutomatic <> butPositionRight) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Тумблер АВТОМАТИКА не передней панели не включен' + #10#13;
            if (Station.HalfSetB.Rack1500.DropError <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не сброшена авария' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask19.Create;
   begin
   inherited Create;

        Name:='На стойке 1500 Б сбросить аварию';
        Text:='Внутри стойки 1500 Б нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1500 Б';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask20.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn = True) and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn = True) then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не верхнем блоке не подано' + #10#13;
            if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не нижнем блоке не подано' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask20.Create;
   begin
   inherited Create;

        Name:='Включить высокое напряжение на стойке 1920 Б';
        Text:='Включить высокое напряжение одновременным нажатием кнопок ВЫСОКОЕ ВКЛ. и ТОК 5 МА на стойке 1920 Б';
        EventFormName:='1920 Б';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask21.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.swModeControl = 6) and (Station.HalfSetB.Rack1500.swPhaseMover = 10) and (Station.HalfSetB.Rack1500.butMode_R = butPositionLeft) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1500.swModeControl <> 6) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Переключатель режима не установлен в положение МОЩН.-РАСФАЗ.' + #10#13;
            if (Station.HalfSetB.Rack1500.butMode_R <> butPositionLeft) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Тумблер МД-Р не переключен в левое положение' + #10#13;
            if (Station.HalfSetB.Rack1500.swPhaseMover <> 10) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Сигналы ЛБВ не сфазированы. Поворачивайте фазовращатель, пока разница в токах не будет нулевой' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask21.Create;
   begin
   inherited Create;

        Name:='Сфазировать сигналы ЛБВ на стойке 1500 Б';
        Text:='На передней панели стойки 1500 Б переключатель режима установить в положение МОЩН.-РАСФАЗ. Тумблер МД-Р переключить в левое положение. Сфазировать сигналы ЛБВ путем вращения ручки ФАЗОВРАЩАТЕЛЬ.';
        EventFormName:='1500 Б';
        Time:= '';
   end;

    function TTaskSingleCheckSubTask22.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.wave1610_0 = NetWorker.ClientState.ReceiverWaveB) and (Station.HalfSetB.Rack1600.wave1610_R = NetWorker.ClientState.ReceiverWaveB)
         and (Station.HalfSetB.Rack1600.wave1600 = NetWorker.ClientState.ReceiverWaveB) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1600.wave1610_0 <> NetWorker.ClientState.ReceiverWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлены рабочие волны приема на пареключателе 1610О' + #10#13;
            if (Station.HalfSetB.Rack1600.wave1610_R <> NetWorker.ClientState.ReceiverWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлены рабочие волны приема на пареключателе 1610Р' + #10#13;
            if (Station.HalfSetB.Rack1600.wave1600 <> NetWorker.ClientState.ReceiverWaveB) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлены рабочие волны приема на пареключателе 1600' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask22.Create;
   begin
   inherited Create;

        Name:='Установить волны на приемнике 1600 Б';
        Text:='Установить рабочие волны приема на стойке 1600 Б, используя вращающиеся переключатели';
        EventFormName:='1600 Б';
        Time:= '';
   end;


   
      function TTaskSingleCheckSubTask23.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.SelectedMd = smdMain) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain)
         and (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][0] = Station.HalfSetB.Rack1600.GeterodinIntMain)
      and (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] - 2) <= Station.HalfSetB.Rack1600.GeterodinFloatMain)
            and (Station.HalfSetB.Rack1600.GeterodinFloatMain <= (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] + 2)))
            
            and (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][0] = Station.HalfSetB.Rack1600.GeterodinIntReserve)
      and (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] - 2) <= Station.HalfSetB.Rack1600.GeterodinFloatReserve)
            and (Station.HalfSetB.Rack1600.GeterodinFloatReserve <= (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] + 2)))
            then
         begin
         Station.HalfSetB.Rack1600.GeterodinTunedMain := True;
         Station.HalfSetB.Rack1600.GeterodinTunedReserve := True;
           Result:=true;
         end
        else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][0] <> Station.HalfSetB.Rack1600.GeterodinIntMain)
              or (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] - 2) > Station.HalfSetB.Rack1600.GeterodinFloatMain)
              or (Station.HalfSetB.Rack1600.GeterodinFloatMain > (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема по волномеру на основном канале. Для начала настройки нажмите на лампы 1610-О, УПЧ-О и ДМЧ-О и подключите кабель к разъему над переключателем 1610О' + #10#13;
            if (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][0] <> Station.HalfSetB.Rack1600.GeterodinIntReserve)
              or (((GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] - 2) > Station.HalfSetB.Rack1600.GeterodinFloatReserve)
              or (Station.HalfSetB.Rack1600.GeterodinFloatReserve > (GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1] + 2)))
            then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не установлена рабочая волна приема по волномеру на резервном канале. Для начала настройки нажмите на лампы 1601-Р, УПЧ-Р, ДМЧ-Р и подключите кабель к разъему над переключателем 1610Р' + #10#13;
            if (Station.HalfSetB.Rack1600.SelectedMd <> smdMain) or (Station.HalfSetB.Rack1600.SelectedUpch <> sUpchMain) or (Station.HalfSetB.Rack1600.SelectedDmch <> sDmchMain) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не активированы лампы 1610-О, УПЧ-0 и ДМЧ-0 после настройки' + #10#13;

           Result:=false;
         end;
   end;


   constructor TTaskSingleCheckSubTask23.Create;
   begin
   inherited Create;

        Name:='Настроить приемник 1600 Б по волномеру';
        Text:='Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' 
        + ' Нажать на кнопки-лампы 1601-Р, УПЧ-Р, ДМЧ-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0';
        EventFormName:='1600 Б';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask24.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft) and (Station.HalfSetB.Rack1600.DropError = True) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1600.butAutomatic <> butPositionLeft) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Тумблер АВТОМАТИКА не включен' + #10#13;
            if (Station.HalfSetB.Rack1600.DropError <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Авария не сброшена' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask24.Create;
   begin
   inherited Create;

        Name:='На стойке 1600 Б сбросить аварию';
        Text:='Внутри стойки 1600 Б нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1600 Б';
        Time:= '';
   end;


       {$ENDREGION}
       

      function TTaskSingleCheckSubTask25.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.stMoshnost = True) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1600.stMoshnost <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Лампа не горит. Проверьте ещё раз правильность настройки станции' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskSingleCheckSubTask25.Create;
   begin
   inherited Create;

        Name:='Проверить настройку на стойке 1600 А';
        Text:='Убедиться в правильности настройки: безымянная кнопка лампа на стойке 1600 А горит';
        EventFormName:='1600 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask26.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.stMoshnost = True) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1600.stMoshnost <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Лампа не горит. Проверьте ещё раз правильность настройки станции' + #10#13;
           Result:=false;
         end;
   end;
   constructor TTaskSingleCheckSubTask26.Create;
   begin
   inherited Create;

        Name:='Проверить настройку на стойке 1600 Б';
        Text:='Убедиться в правильности настройки: безымянная кнопка лампа на стойке 1600 Б горит';
        EventFormName:='1600 Б';
        Time:= '';
   end;





      //======================




          function TTaskSingleCheckSubTask27.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.Oscillograph.cblCableUsilitelState = csConnectedAtPower) and (Station.Oscillograph.cblCabelSyncState = csConnectedAtSync) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.Oscillograph.cblCableUsilitelState <> csConnectedAtPower) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен серый провод' + #10#13;
            if (Station.Oscillograph.cblCabelSyncState <> csConnectedAtSync) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен черный провод' + #10#13;
           Result:=false;
         end;
   end;
   constructor TTaskSingleCheckSubTask27.Create;
   begin
   inherited Create;

        Name:='Проверка девиации: подключить провода к осциллографу';
        Text:='На осциллографе подключить серый провод в левое нижнее гнездо Y, подключить чёрный провод в правое верхнее гнездо X';
        EventFormName:='Осциллограф';
        Time:= '';
   end;


       function TTaskSingleCheckSubTask28.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1200Right.CableOscillographLineInput = csDisconected) and
         (Station.HalfSetA.Rack1200Right.CableUzlovoiInput = csDisconected) and


//         (Station.Oscillograph.swPowerType = 2) and
//        (Station.Oscillograph.swVvsDel = 7) and
//        (Station.Oscillograph.swHz = 2) and
//        (Station.Oscillograph.swSyncType = 2) and
//        (Station.Oscillograph.swPowerType = 2) and
//        (Station.Oscillograph.butLevelPosition = butPositionUp) and
//        (Station.Oscillograph.but1Khz = butPositionUp) and
//        (Station.Oscillograph.swRazvertkaShortTune = 11) and
//        (Station.Oscillograph.swCalibrator = 1) and

        (Station.Oscillograph.cblCabelSyncState = csConnectedAtSync) and
          (Station.Oscillograph.cblCableUsilitelState = csConnectedAtPower) and

          (Station.Deviation.Rack1200A_PRD = stPassed) and (Station.Deviation.Rack1200A_PRM = stPassed)
         then
         begin
           Result:=true;


{$REGION ''}

//  if (Station.HalfSetA.Rack1500.swPhaseMover <> 10) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Расфазировка не устранена ');
//  end;
//  if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionRight) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Автоматика не включена');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave1610_0 <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Волна блока 1610 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave1500 <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Волна блока 1500 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave161_R <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Волна 1610-Р выставлена не верно');
//  end;
//  if (((Station.HalfSetA.Rack1500.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain)) and
//  ((Station.HalfSetA.Rack1500.SelectedMd <> smdRetr) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrReserv))) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Не выбран передающий полукомплект оборудования');
//  end;
//  if (Station.HalfSetA.Rack1500.DropError <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Ошибка не сброшена');
//  end;
//  if (Station.HalfSetA.Rack1500.GeterodinTunedMain <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): гетеродин освного полукомплекта не настроен');
//  end;
//  if (Station.HalfSetA.Rack1500.GeterodinTunedReserve <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): гетеродин резервного полукомплекта не настроен');
//  end;
//  if (Station.HalfSetA.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Кабель нагрузки болтается в воздухе');
//  end;
//  if (Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500NoName) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Кабель Ш1 подключен не верно');
//  end;
//  if (Station.HalfSetA.Rack1920.butPower <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Питание на ЛБВ 1 не поступает');
//  end;
//  if (Station.HalfSetA.Rack1920.butPower2 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Питание на ЛБВ 2 не поступает');
//  end;
//  if (Station.HalfSetA.Rack1920.but1910 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Переключатель питания блока 1910 не включено');
//  end;
//  if (Station.HalfSetA.Rack1920.but1910A <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Перключатель питания резервного блока 1910 не включен');
//  end;
//  if (Station.HalfSetA.Rack1920.but1930 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Перключатель питания блока 1930 не включен');
//  end;
//  if (Station.HalfSetA.Rack1920.but1960_1 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Перключатель питания блока 1960 не включен');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOn <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи питания на ЛБВ1 не нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOn2 <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи питания на ЛБВ2 не нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOff <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка отключения питания ЛБВ 1 нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOff2 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка отключения питания ЛБВ 2 нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butCurrent5MA <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи тока на ЛБВ 1 не нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butCurrent5MA2 <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи тока на ЛБВ 2 не нажата');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Замедление на ЛБВ 1 не подано');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Замедление на ЛБВ 2 не подано');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ЛБВ 1 не включена');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ЛБВ 2 не включена');
//  end;
//  if (Station.HalfSetA.Rack1600.GeterodinTunedMain <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): основной гетеродин не настроен');
//  end;
//  if (Station.HalfSetA.Rack1600.GeterodinTunedReserve <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): запасной гетеродин не настроен');
//  end;
//  if (Station.HalfSetA.Rack1600.butAutomatic <> butPositionLeft) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Автоматика не включена');
//  end;
//  if (((Station.HalfSetA.Rack1600.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch <> sUpchMain) and (Station.HalfSetA.Rack1600.SelectedDmch <> sDmchMain)) and
//  ((Station.HalfSetA.Rack1600.SelectedMd <> smdRetr) and (Station.HalfSetA.Rack1600.SelectedUpch <> sUpchReserve) and (Station.HalfSetA.Rack1600.SelectedDmch <> sDmchReserve))) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Не выбран ни один из полукомплектов');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1610_0 <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Волна на блоке 1610 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1600 <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Волна на блоке 1600 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1610_R <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Волна на блоке 1610-Р выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1600.DropError <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Ошибка не сброшена');
//  end;
//  if (Station.HalfSetA.Rack1600.stMoshnost <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Нет мощности на входе блока 1600!');
//  end;
//  if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('Волна в МШУ(' + Litera + ') выставлена не верно');
//  end;
//  if ((Station.HalfSetA.LittleNoisyAmplifier.butNet <> butPositionUp) and (Station.HalfSetA.LittleNoisyAmplifier.butNet2 <> butPositionUp)) then
//  begin
//    AddAnalyseTuneError('МШУ (' + Litera + '): Переключатели включения основного или резервного блоков не включен');
//  end;
//  if (((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeRight)) and
//    ((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft))) then
//  begin
//    AddAnalyseTuneError('Дуплексер (' + Litera + ') кабели соеденены не верно');
//  end;
//  if not(Station.IsPowerPanelPoweredOn) then
//  begin
//    AddAnalyseTuneError('Питание в щите подано не на все блоки(не верно)');
//  end;
//
//  if strError <> '' then
//    strError := 'Ошибки настройки полукомплекта (' + Litera + '): '+ strError;
{$ENDREGION}

         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;

            if (Station.Oscillograph.cblCabelSyncState <> csConnectedAtSync) or
          (Station.Oscillograph.cblCableUsilitelState <> csConnectedAtPower) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'К осциллографу не подключены черный и серый провода, невозможно проверить девиацию' + #10#13;


           if (Station.Deviation.Rack1200A_PRD <> stPassed) or (Station.Deviation.Rack1200A_PRM <> stPassed) then
           begin
           if (Station.HalfSetA.Rack1200Right.CableOscillographLineInput = csDisconected) or
         (Station.HalfSetA.Rack1200Right.CableUzlovoiInput = csDisconected) then
          begin
            ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Вы забыли подключить провода к стойке 1200 Б ПРД для проверки девиации' + #10#13;
          end;
           ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Девиация на 2х трубках не проверена' + #10#13;

           end
           else
           if (Station.HalfSetA.Rack1200Right.CableOscillographLineInput <> csDisconected) or
         (Station.HalfSetA.Rack1200Right.CableUzlovoiInput <> csDisconected) then
            begin
         ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Вы забыли отключить провода от стойки 1200 Б ПРД после проверки девиации' + #10#13;
            end;
           Result:=false;
         end;
   end;
   constructor TTaskSingleCheckSubTask28.Create;
   begin
   inherited Create;

        Name:='Проверить девиацию на стойке 1200 А ПРД';
        Text:='На стойке 1200 А ПРД подключить чёрный провод к гнезду СИНХ. ОСЦИЛ., cерый провод подключить к гнезду ВХ. ПРМ. С помощью осциллографа на каждой из 2-х трубок проверить прохождение вызовов.'+
        'На стойке 1200 А ПРД подключить серый провод в гнездо "Вых. ПРД". Аналогично проверить прохождение вызовов.' +
        'Отключить провода от стойки 1200.';

        EventFormName:='1200 ПРД А';
        Time:= '';
   end;


          function TTaskSingleCheckSubTask29.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1200Right.CableOscillographLineInput = csDisconected) and
         (Station.HalfSetB.Rack1200Right.CableUzlovoiInput = csDisconected) and


        (Station.Oscillograph.cblCabelSyncState = csConnectedAtSync) and
          (Station.Oscillograph.cblCableUsilitelState = csConnectedAtPower) and

          (Station.Deviation.Rack1200B_PRD = stPassed) and (Station.Deviation.Rack1200B_PRM = stPassed)
         then
         begin
           Result:=true;


         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;

            if (Station.Oscillograph.cblCabelSyncState <> csConnectedAtSync) or
          (Station.Oscillograph.cblCableUsilitelState <> csConnectedAtPower) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'К осциллографу не подключены черный и серый провода, невозможно проверить девиацию' + #10#13;


           if (Station.Deviation.Rack1200B_PRD <> stPassed) or (Station.Deviation.Rack1200B_PRM <> stPassed) then
           begin
           if (Station.HalfSetB.Rack1200Right.CableOscillographLineInput = csDisconected) or
         (Station.HalfSetB.Rack1200Right.CableUzlovoiInput = csDisconected) then
          begin
            ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Вы забыли подключить провода к стойке 1200 Б ПРД для проверки девиации' + #10#13;
          end;
           ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Девиация на 2х трубках не проверена' + #10#13;

           end
           else
           if (Station.HalfSetB.Rack1200Right.CableOscillographLineInput <> csDisconected) or
         (Station.HalfSetB.Rack1200Right.CableUzlovoiInput <> csDisconected) then
            begin
         ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Вы забыли отключить провода от стойки 1200 Б ПРД после проверки девиации' + #10#13;
            end;
           Result:=false;
         end;
   end;
   constructor TTaskSingleCheckSubTask29.Create;
   begin
   inherited Create;

        Name:='Проверить девиацию на стойке 1200 Б ПРД';
        Text:='На стойке 1200 Б ПРД подключить чёрный провод к гнезду СИНХ. ОСЦИЛ., cерый провод подключить к гнезду ВХ. ПРМ. С помощью осциллографа на каждой из 2-х трубок проверить прохождение вызовов.'+
        'На стойке 1200 Б ПРД подключить серый провод в гнездо "Вых. ПРД". Аналогично проверить прохождение вызовов.' +
        'Отключить провода от стойки 1200.';

        EventFormName:='1200 ПРД Б';
        Time:= '';
   end;










{$ENDREGION}


{$REGION 'Оконечный режим'}

  constructor TTaskTerminalMode.Create(Station: TStation; NetWorker: TClientNetWorker;  ErrorKeeper: TErrorKeeper);
  begin
  inherited Create(Station, NetWorker, ErrorKeeper);
  FullCheck := False;

  TaskNetParams:= TNetParamsList.Create;

  TaskNetParams.AddKeyValue('WeInTerminalMode', 'False');
  TaskNetParams.AddKeyValue('TheyInTerminalMode', 'False');
  TaskNetParams.AddKeyValue('MessageListenFromMainSent', 'False');
  TaskNetParams.AddKeyValue('MessageListenFromSubSent', 'False');

  TaskNetParams.AddKeyValue('MessageCheckLvlFromMainSent', 'False');
  TaskNetParams.AddKeyValue('MessageCheckLvlFromSubSent', 'False');

  TaskNetParams.AddKeyValue('OurRecieverTuned', 'False');
  TaskNetParams.AddKeyValue('TheirRecieverTuned', 'False');
  TaskNetParams.AddKeyValue('MessageRecieverTunedFromMainSent', 'False');
  TaskNetParams.AddKeyValue('MessageRecieverTunedFromSubSent', 'False');

  TaskNetParams.AddKeyValue('MessageGeneratorFromMainSent1', 'False');
  TaskNetParams.AddKeyValue('MessageGeneratorFromSubSent1', 'False');
  TaskNetParams.AddKeyValue('MessageMainStartTune1', 'False');
  TaskNetParams.AddKeyValue('MessageSubStartTune1', 'False');
  TaskNetParams.AddKeyValue('MessageMainEndTune1', 'False');
  TaskNetParams.AddKeyValue('MessageSubEndTune1', 'False');

    TaskNetParams.AddKeyValue('MessageGeneratorFromMainSent2', 'False');
  TaskNetParams.AddKeyValue('MessageGeneratorFromSubSent2', 'False');
  TaskNetParams.AddKeyValue('MessageMainStartTune2', 'False');
  TaskNetParams.AddKeyValue('MessageSubStartTune2', 'False');
  TaskNetParams.AddKeyValue('MessageMainEndTune2', 'False');
  TaskNetParams.AddKeyValue('MessageSubEndTune2', 'False');

  TaskNetParams.AddKeyValue('MessageStartFrequencyMain1_1', 'False');
  TaskNetParams.AddKeyValue('MessageStartFrequencySub1_1', 'False');
  TaskNetParams.AddKeyValue('MessageEndFrequencyMain1_1', 'False');
  TaskNetParams.AddKeyValue('MessageEndFrequencySub1_1', 'False');
  TaskNetParams.AddKeyValue('MessageEndFrequencyMain1_2', 'False');
  TaskNetParams.AddKeyValue('MessageEndFrequencySub1_2', 'False');



  NetWorker.ClientState.CanSendChatMessages:=False;
  NetWorker.ClientState.CanGetChatMessages:=False;

  Name:='Перевод станции в оконечный режим работы. Имерение параметров';

  SetLength(SubTasks, 31);

  SubTasks[0]:= TTaskTerminalModeSubTask1.Create;
  SubTasks[1]:= TTaskTerminalModeSubTask2.Create;
  SubTasks[2]:= TTaskTerminalModeSubTask3.Create;
  SubTasks[3]:= TTaskTerminalModeSubTask4.Create;
  SubTasks[4]:= TTaskTerminalModeSubTask5.Create;
  SubTasks[5]:= TTaskTerminalModeSubTask6.Create;
  SubTasks[6]:= TTaskTerminalModeSubTask7.Create;
  SubTasks[7]:= TTaskTerminalModeSubTask8.Create;
  SubTasks[8]:= TTaskTerminalModeSubTask9.Create;
  SubTasks[9]:= TTaskTerminalModeSubTask10.Create;
  SubTasks[10]:= TTaskTerminalModeSubTask11.Create;
    SubTasks[11]:= TTaskTerminalModeSubTask12.Create;
    SubTasks[12]:= TTaskTerminalModeSubTask13.Create;
    SubTasks[13]:= TTaskTerminalModeSubTask14.Create;
    SubTasks[14]:= TTaskTerminalModeSubTask15.Create;
    SubTasks[15]:= TTaskTerminalModeSubTask16.Create;
    SubTasks[16]:= TTaskTerminalModeSubTask17.Create;
    SubTasks[17]:= TTaskTerminalModeSubTask18.Create;
    SubTasks[18]:= TTaskTerminalModeSubTask19.Create;
    SubTasks[19]:= TTaskTerminalModeSubTask20.Create;
    SubTasks[20]:= TTaskTerminalModeSubTask21.Create;
    SubTasks[21]:= TTaskTerminalModeSubTask22.Create;
    SubTasks[22]:= TTaskTerminalModeSubTask23.Create;
    SubTasks[23]:= TTaskTerminalModeSubTask24.Create;
    SubTasks[24]:= TTaskTerminalModeSubTask25.Create;
    SubTasks[25]:= TTaskTerminalModeSubTask26.Create;
    SubTasks[26]:= TTaskTerminalModeSubTask27.Create;
    SubTasks[27]:= TTaskTerminalModeSubTask28.Create;
    SubTasks[28]:= TTaskTerminalModeSubTask29.Create;
    SubTasks[29]:= TTaskTerminalModeSubTask30.Create;
    SubTasks[30]:= TTaskTerminalModeSubTask30.Create;


  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;



  procedure TTaskTerminalMode.LastCheck;
  var i: Integer;
  var allRight: Boolean;
  begin
       allRight:= true;
        ErrorKeeper.ErrorMsg := 'Общая проверка правильности настройки:' + #10#13;;
    for I := 0 to Length(SubTasks) - 1 do
     begin
          if (SubTasks[i].CheckSubTask(FullCheck, Station, NetWorker, ErrorKeeper, Self.TaskNetParams) = False) then allRight := false;
     end;

    if (allRight = true) then
      begin
        IsTaskComplete:=true;
        TimeEnd:=Time;
      end
      else
      begin
        ErrorKeeper.ShowError;
      end;
  end;

   //===========================



      function TTaskTerminalModeSubTask1.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1920.butHighOff = butPositionDown) and (Station.HalfSetA.Rack1920.butHighOff2 = butPositionDown) then
         begin
         Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
         Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1920.butHighOff <> butPositionDown) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не верхнем блоке не отключено' + #10#13;
            if (Station.HalfSetA.Rack1920.butHighOff2 <> butPositionDown) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не нижнем блоке не отключено' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask1.Create;
   begin
   inherited Create;

        Name:='Отключить высокое напряжение на стойке 1920 А';
        Text:='Для двух блоков 1920 отключить высокое напряжение нажатием кнопки ВЫСОКОЕ ВЫКЛ.';
        EventFormName:='1920 А';
        Time:= '';
   end;

   //===========================
      function TTaskTerminalModeSubTask2.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

        if (Station.HalfSetB.Rack1920.butHighOff = butPositionDown) and (Station.HalfSetB.Rack1920.butHighOff2 = butPositionDown) then
         begin
         Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
         Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1920.butHighOff <> butPositionDown) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не верхнем блоке не отключено' + #10#13;
            if (Station.HalfSetB.Rack1920.butHighOff2 <> butPositionDown) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не нижнем блоке не отключено' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask2.Create;
   begin
   inherited Create;

        Name:='Отключить высокое напряжение на стойке 1920 Б';
        Text:='Для двух блоков 1920 отключить высокое напряжение нажатием кнопки ВЫСОКОЕ ВЫКЛ.';
        EventFormName:='1920 Б';
        Time:= '';
   end;

   //========================
   function TTaskTerminalModeSubTask3.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.stCableSh1 = csConnectedAtRack1500Sh1) and (Station.HalfSetA.Rack1500.stCableLoad = csConnectedAtRack1500NoName) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Кабель от дуплексера не подключен к выходу свч' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask3.Create;
   begin
   inherited Create;

        Name:='На стойке 1500 А подключить кабель от дуплексера';
        Text:='На стойке 1500 А от разъема ВЫХОД СВЧ отключить кабель нагрузка, подключить кабель идущий к дуплексеру (разьем ПЕРЕДАЧА), нагрузку к безымянному разъему';
        EventFormName:='1500 А';
        Time:= '';
   end;

   //========================
   function TTaskTerminalModeSubTask4.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.stCableSh1 = csConnectedAtRack1500Sh1) and (Station.HalfSetB.Rack1500.stCableLoad = csConnectedAtRack1500NoName) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Кабель от дуплексера не подключен к выходу свч' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask4.Create;
   begin
   inherited Create;

        Name:='На стойке 1500 Б подключить кабель от дуплексера';
        Text:='На стойке 1500 Б от разъема ВЫХОД СВЧ отключить кабель нагрузка, подключить кабель идущий к дуплексеру (разьем ПЕРЕДАЧА), нагрузку к безымянному разъему';
        EventFormName:='1500 Б';
        Time:= '';
   end;

   //==================================
      function TTaskTerminalModeSubTask5.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if ((Station.HalfSetA.Duplexer.cb1840 = csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
          or ((Station.HalfSetA.Duplexer.cb1840 = csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Duplexer.cb1840 = csDisconected) or (Station.HalfSetA.Duplexer.cbSh2 = csDisconected) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель от дуплексера ко фходу Ф-33' + #10#13;
           Result:=false;
         end;
   end;

          constructor TTaskTerminalModeSubTask5.Create;
   begin
   inherited Create;

        Name:='Подключить кабели к фильтру Ф-33 А';
        Text:='На фильтре Ф-33 А отключить от входа кабель, идущий от разъема ВЫХОД АК стойки 1600 (с красным наконечником); подключить к входу кабель, идущий к дуплексеру (разъем ПРИЕМ)';
        EventFormName:='Дуплексер А';
        Time:= '';
   end;

   //===============================
      function TTaskTerminalModeSubTask6.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if ((Station.HalfSetB.Duplexer.cb1840 = csConnectedAtDuplexeLeft) and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
          or ((Station.HalfSetB.Duplexer.cb1840 = csConnectedAtDuplexeRight) and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Duplexer.cb1840 = csDisconected) or (Station.HalfSetB.Duplexer.cbSh2 = csDisconected) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Не подключен кабель от дуплексера ко фходу Ф-33' + #10#13;
           Result:=false;
         end;
   end;

          constructor TTaskTerminalModeSubTask6.Create;
   begin
   inherited Create;

        Name:='Подключить кабели к фильтру Ф-33 Б';
        Text:='На фильтре Ф-33 Б отключить от входа кабель, идущий от разъема ВЫХОД АК стойки 1600 (с красным наконечником); подключить к входу кабель, идущий к дуплексеру (разъем ПРИЕМ)';
        EventFormName:='Дуплексер Б';
        Time:= '';
   end;

   //===================
      function TTaskTerminalModeSubTask7.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn = True) and (Station.HalfSetA.Rack1920.stLBV1_TurnedOn = True) then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не верхнем блоке не подано' + #10#13;
            if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не нижнем блоке не подано' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask7.Create;
   begin
   inherited Create;

        Name:='Включить высокое напряжение на стойке 1920 А';
        Text:='Включить высокое напряжение одновременным нажатием кнопок ВЫСОКОЕ ВКЛ. и ТОК 5 МА на стойке 1920 А';
        EventFormName:='1920 А';
        Time:= '';
   end;
    //=====================

       function TTaskTerminalModeSubTask8.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn = True) and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn = True) then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не верхнем блоке не подано' + #10#13;
            if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Высокое напряжение не нижнем блоке не подано' + #10#13;
           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask8.Create;
   begin
   inherited Create;

        Name:='Включить высокое напряжение на стойке 1920 Б';
        Text:='Включить высокое напряжение одновременным нажатием кнопок ВЫСОКОЕ ВКЛ. и ТОК 5 МА на стойке 1920 Б';
        EventFormName:='1920 Б';
        Time:= '';
   end;

   //=====================

       function TTaskTerminalModeSubTask9.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.stMoshnost = True) then
         begin

           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1600.stMoshnost <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Связь не нестроена, лампа-табло не горит' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask9.Create;
   begin
   inherited Create;

        Name:='Убедиться в наличии сигнала на стойке 1600А';
        Text:='Убедиться в наличии сигнала от корреспондента - горит лампа-табло на мнемосхеме стойки 1600А';
        EventFormName:='1600 А';
        Time:= '';
   end;

   //=====================

       function TTaskTerminalModeSubTask10.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.HalfSetB.Rack1600.stMoshnost = True) then
         begin
            TaskNetParams.ChangeValue('WeInTerminalMode', 'True');
            NetWorker.ClientState.CanSendChatMessages:=True;
            NetWorker.ClientState.CanGetChatMessages:=True;
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1600.stMoshnost <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Связь не нестроена, лампа-табло не горит' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask10.Create;
   begin
   inherited Create;

        Name:='Убедиться в наличии сигнала на стойке 1600Б';
        Text:='Убедиться в наличии сигнала от корреспондента - горит лампа-табло на мнемосхеме стойки 1600Б';
        EventFormName:='1600 Б';
        Time:= '';
   end;

    //=============================

        function TTaskTerminalModeSubTask11.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.IsChannelBlocksTunedAt4ChannelMode = True) then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Станция не настроена в 2х или 4х проводный режим' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask11.Create;
   begin
   inherited Create;

        Name:='Настроить станцию в 4х проводный режим';
        Text:='!!!(пропуск) Настроить блоки 1200 ПРМ и ПРД обоих полукомплектов в 4х проводный режим';
        EventFormName:='1200 ПРД Б';
        Time:= '';
   end;

   //=============================


       function TTaskTerminalModeSubTask12.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('WeInTerminalMode') = True) and (TaskNetParams.GetBoolValue('TheyInTerminalMode') = True)
         and (TaskNetParams.GetBoolValue('MessageListenFromMainSent') = True) and (TaskNetParams.GetBoolValue('MessageListenFromSubSent') = True)then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('WeInTerminalMode') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Наша станция не настроена' + #10#13;
            if (TaskNetParams.GetBoolValue('TheyInTerminalMode') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Сопряженная станция не настроена' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask12.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin
              if (TaskNetParams.GetBoolValue('WeInTerminalMode') = True) then
              begin
              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageListenFromMainSent', 'True');
                  NetWorker.SendTaskParams('TheyInTerminalMode', 'True');
                  NetWorker.SendTaskParams('MessageListenFromMainSent', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) then //and (TaskNetParams.GetBoolValue('MessageListenFromMainSent') = True) then
              begin
              TaskNetParams.ChangeValue('MessageListenFromSubSent', 'True');
                  NetWorker.SendTaskParams('TheyInTerminalMode', 'True');
                  NetWorker.SendTaskParams('MessageListenFromSubSent', 'True');
              end;
              end;
              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask12.Create;
   begin
   inherited Create;

        Name:='Вызвать корреспондента по служебному каналу';
        Text:='Вызвать корреспондента по служебному каналу. Старшая станция "1460, я 1450. Как меня слышите". Подчиненная станция: "Слышу Вас хорошо"';
        EventFormName:='';
        Time:= '';
   end;



     //=============================


       function TTaskTerminalModeSubTask13.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageCheckLvlFromMainSent') = True) and (TaskNetParams.GetBoolValue('MessageCheckLvlFromSubSent') = True)
         then
         begin
         //Station.HalfSetA.Rack1600.wave1610_0:=Station.HalfSetA.Rack1600.wave1610_0-(Random(3)+2);
         //Station.HalfSetB.Rack1600.wave1610_0:=Station.HalfSetB.Rack1600.wave1610_0-(Random(3)+2);
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageCheckLvlFromMainSent') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageCheckLvlFromSubSent') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask13.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageCheckLvlFromMainSent', 'True');
                  NetWorker.SendTaskParams('MessageCheckLvlFromMainSent', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageCheckLvlFromMainSent') = True) then
              begin
              TaskNetParams.ChangeValue('MessageCheckLvlFromSubSent', 'True');
                  NetWorker.SendTaskParams('MessageCheckLvlFromSubSent', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask13.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту';
        Text:='Доложить корреспонденту. Главная станция: "Выставить "0" ДМЧ и измерить запас уровня СВЧ сигнала". Подчиненная станция: "Вас понял. Выполняю".';
        EventFormName:='';
        Time:= '';
   end;

    //=====================

       function TTaskTerminalModeSubTask14.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.HalfSetA.Rack1600.deltaWaveO=0) then
         begin

           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (True <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Приемник не нестроен' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask14.Create;
   begin
   inherited Create;

        Name:='Выполнить точную настройку приемника 1600 А';
        Text:='Выполнить точную настройку приемника 1600 А. При работе основного прибора (лампа 1610-О) тумблер "0" ДМЧ установить в положение ОСН., тумблер КОНТРОЛЬ РЕЖИМОВ установить в положение ОСН., переключатель КОНТРОЛЬ РЕЖИМОВ установить в положение ИЗУ.';
        Text:=Text+  'Вращением ручки ВОЛНА 1610-О установить стрелку верхнего прибора на отметку 0, стрелка нижнего прибора показывает максимальное значение.';
        EventFormName:='1600 А';
        Time:= '';
   end;

     //=====================

       function TTaskTerminalModeSubTask15.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.HalfSetB.Rack1600.deltaWaveO=0) then
         begin
            TaskNetParams.ChangeValue('OurRecieverTuned', 'True');
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (True <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Приемник не нестроен' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask15.Create;
   begin
   inherited Create;

        Name:='Выполнить точную настройку приемника 1600 Б';
        Text:='Выполнить точную настройку приемника 1600 Б. При работе основного прибора (лампа 1610-О) тумблер "0" ДМЧ установить в положение ОСН., тумблер КОНТРОЛЬ РЕЖИМОВ установить в положение ОСН.,';
        Text:=Text+' переключатель КОНТРОЛЬ РЕЖИМОВ установить в положение ИЗУ. Вращением ручки ВОЛНА 1610-О установить стрелку верхнего прибора на отметку 0, стрелка нижнего прибора показывает максимальное значение.';
        EventFormName:='1600 Б';
        Time:= '';
   end;



     //=============================


       function TTaskTerminalModeSubTask16.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('OurRecieverTuned') = True) and (TaskNetParams.GetBoolValue('TheirRecieverTuned') = True) and
         (TaskNetParams.GetBoolValue('MessageRecieverTunedFromMainSent') = True) and (TaskNetParams.GetBoolValue('MessageRecieverTunedFromSubSent') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageRecieverTunedFromMainSent') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageRecieverTunedFromSubSent') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask16.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageRecieverTunedFromMainSent', 'True');
                  NetWorker.SendTaskParams('MessageRecieverTunedFromMainSent', 'True');
                  NetWorker.SendTaskParams('TheirRecieverTuned', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageRecieverTunedFromMainSent') = True) then
              begin
              TaskNetParams.ChangeValue('MessageRecieverTunedFromSubSent', 'True');
                  NetWorker.SendTaskParams('MessageRecieverTunedFromSubSent', 'True');
                  NetWorker.SendTaskParams('TheirRecieverTuned', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask16.Create;
   begin
   inherited Create;

        Name:='Определить значение запаса СВЧ. Доложить корреспонденту.';
        Text:='Определить значение запаса СВЧ по графику вверху стойки с помощью показаний нижнего прибора для двух полукомплектов. Доложить корреспонденту. ';
        Text:=Text+'Старшая станция: "1460, я 1450. "0" ДМЧ выставил. Запас СВЧ уровня: полукомплект А - 15 дБ, полукомплект Б - 20 дБ". Подчненная станция - аналогично.';
        EventFormName:='';
        Time:= '';
   end;


    //=============================


       function TTaskTerminalModeSubTask17.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageGeneratorFromMainSent1') = True) and (TaskNetParams.GetBoolValue('MessageGeneratorFromSubSent1') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageGeneratorFromMainSent1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageGeneratorFromSubSent1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask17.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageGeneratorFromMainSent1', 'True');
                  NetWorker.SendTaskParams('MessageGeneratorFromMainSent1', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageGeneratorFromMainSent1') = True) then
              begin
              TaskNetParams.ChangeValue('MessageGeneratorFromSubSent1', 'True');
                  NetWorker.SendTaskParams('MessageGeneratorFromSubSent1', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask17.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Доложить корреспонденту о начале проверки затухания ТЧ. Старшая станция: "1460, я 1450. Приступаем к регулировке остатчного затухания каналов. Дайте генератор по первому каналу полукомплекта А. Даю вам." Подчиненная станция: "Вас понял. Даю генератор".';
        EventFormName:='';
        Time:= '';
   end;




   //=====================

       function TTaskTerminalModeSubTask18.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.P321C.but600Ohm = butPositionUp) and (Station.P321C.swNepGen = 5) and (Station.P321C.swNepGenYY = 6) and
          ((Station.CableBlack1.stKonez1.stState = csP321CGen) or (Station.CableBlack1.stKonez2.stState = csP321CGen))
          and ((Station.CableWhite2.stKonez1.stState = csP321CYY) or (Station.CableWhite2.stKonez2.stState = csP321CYY))  then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (True <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Приемник не нестроен' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask18.Create;
   begin
   inherited Create;

        Name:='Подготовить П-321С к работе';

        Text:='Подготовить П-321С к работе. Настроить ГРАД.ПИТ., ГРАД.ГЕН., ГРАД.УУ. Переключатель НЕП.ГЕН. перевести в положение -1.5 Нп, переключатель НЕП.УУ. в положение +1, переключатель КГЦ в положение 0.8, ';
        Text:=Text+'тумблер входного сопротивления в полодение 600 Ом. Подключить черный провод к ВЫХ.ГЕН., белый провод к ВХ.УУ.';

        EventFormName:='П-321 С';
        Time:= '';
   end;




   //=====================

       function TTaskTerminalModeSubTask19.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if ((Station.CurrentChannel(Station.CableBlack1.stKonez1.stKonez) = 1) or (Station.CurrentChannel(Station.CableBlack1.stKonez2.stKonez) = 1))
         and ( (Station.CurrentPort(Station.CableBlack1.stKonez1.stKonez) = 3) or (Station.CurrentPort(Station.CableBlack1.stKonez2.stKonez) = 3))
         and ((Station.CurrentChannel(Station.CableWhite2.stKonez1.stKonez) = 1) or (Station.CurrentChannel(Station.CableWhite2.stKonez2.stKonez) = 1))
         and ( (Station.CurrentPort(Station.CableWhite2.stKonez1.stKonez) = 4) or (Station.CurrentPort(Station.CableWhite2.stKonez2.stKonez) = 4))  then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (True <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Приемник не нестроен' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask19.Create;
   begin
   inherited Create;

        Name:='Подключить П-321С к каналу 1 на пульте';
        Text:='Подключить П-321С к каналу 1 на пульте: черный провод к разьему КАН. М., белый к разъему КАН. Д.';
        EventFormName:='Пульт';
        Time:= '';
   end;


      //=============================


       function TTaskTerminalModeSubTask20.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageMainStartTune1') = True) and (TaskNetParams.GetBoolValue('MessageSubStartTune1') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageMainStartTune1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageSubStartTune1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask20.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageMainStartTune1', 'True');
                  NetWorker.SendTaskParams('MessageMainStartTune1', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageMainStartTune1') = True) then
              begin
              TaskNetParams.ChangeValue('MessageSubStartTune1', 'True');
                  NetWorker.SendTaskParams('MessageSubStartTune1', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask20.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Убедиться в необходимости подстройки канала: на приборе П-321 стрелка отклонена от значения -0.5 Нп. Доложить корреспонденту о начале регулировки. Старшая станция: "Вижу, регулирую". Подчиненная станция: "Вижу, регулирую".';
        EventFormName:='';
        Time:= '';
   end;

     //=====================

   function TTaskTerminalModeSubTask21.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.RemoteController.Channels.A[1].stChannelState = stChannelTuned)  then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.RemoteController.Channels.A[1].stChannelState <> stChannelTuned) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Канал 1 не нестроен' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask21.Create;
   begin
   inherited Create;

        Name:='Отрегулировать канал 1';
        Text:='На стойке 1200 А ПРМ отрегулировать затухание канала 1 потенциометром УРОВЕНЬ на канальном блоке 1220.';
        EventFormName:='1200 ПРМ А';
        Time:= '';
   end;


    //=============================


       function TTaskTerminalModeSubTask22.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageMainEndTune1') = True) and (TaskNetParams.GetBoolValue('MessageSubEndTune1') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageMainEndTune1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageSubEndTune1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask22.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageMainEndTune1', 'True');
                  NetWorker.SendTaskParams('MessageMainEndTune1', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageMainEndTune1') = True) then
              begin
              TaskNetParams.ChangeValue('MessageSubEndTune1', 'True');
                  NetWorker.SendTaskParams('MessageSubEndTune1', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask22.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Доложить о завершении настройки канала 1. Старшая станция: "Готово". Подчиненная станция: "Готово".';
        EventFormName:='';
        Time:= '';
   end;


    //=============================


       function TTaskTerminalModeSubTask23.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageGeneratorFromMainSent2') = True) and (TaskNetParams.GetBoolValue('MessageGeneratorFromSubSent2') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageGeneratorFromMainSent2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageGeneratorFromSubSent2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask23.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageGeneratorFromMainSent2', 'True');
                  NetWorker.SendTaskParams('MessageGeneratorFromMainSent2', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageGeneratorFromMainSent2') = True) then
              begin
              TaskNetParams.ChangeValue('MessageGeneratorFromSubSent2', 'True');
                  NetWorker.SendTaskParams('MessageGeneratorFromSubSent2', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask23.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Доложить о начале регулировки канала 2. Старшая станция: "Дайте генератор по второму каналу. Даю вам". Подчиненная станция: "Вас поял. Даю генератор".';
        EventFormName:='';
        Time:= '';
   end;


    //=====================

       function TTaskTerminalModeSubTask24.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if ((Station.CurrentChannel(Station.CableBlack1.stKonez1.stKonez) = 2) or (Station.CurrentChannel(Station.CableBlack1.stKonez2.stKonez) = 2))
         and ( (Station.CurrentPort(Station.CableBlack1.stKonez1.stKonez) = 3) or (Station.CurrentPort(Station.CableBlack1.stKonez2.stKonez) = 3))
         and ((Station.CurrentChannel(Station.CableWhite2.stKonez1.stKonez) = 2) or (Station.CurrentChannel(Station.CableWhite2.stKonez2.stKonez) = 2))
         and ( (Station.CurrentPort(Station.CableWhite2.stKonez1.stKonez) = 4) or (Station.CurrentPort(Station.CableWhite2.stKonez2.stKonez) = 4))  then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (True <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Приемник не нестроен' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask24.Create;
   begin
   inherited Create;

        Name:='Подключить П-321С к каналу 2 на пульте';
        Text:='Подключить П-321С к каналу 2 на пульте: черный провод к разьему КАН. М., белый к разъему КАН. Д.';
        EventFormName:='Пульт';
        Time:= '';
   end;


      //=============================


       function TTaskTerminalModeSubTask25.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageMainStartTune2') = True) and (TaskNetParams.GetBoolValue('MessageSubStartTune2') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageMainStartTune2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageSubStartTune2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask25.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageMainStartTune2', 'True');
                  NetWorker.SendTaskParams('MessageMainStartTune2', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageMainStartTune2') = True) then
              begin
              TaskNetParams.ChangeValue('MessageSubStartTune2', 'True');
                  NetWorker.SendTaskParams('MessageSubStartTune2', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask25.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Убедиться в необходимости настройки: на приборе П-321 стрелка отклонена от значения -0.5 Нп. Доложить корреспонденту о начале регулировки. Старшая станция: "Вижу, регулирую". Подчиненная станция: "Вижу, регулирую".';
        EventFormName:='';
        Time:= '';
   end;

     //=====================

       function TTaskTerminalModeSubTask26.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin
         if (Station.RemoteController.Channels.A[2].stChannelState = stChannelTuned)  then
         begin
           Result:=true;
         end
          else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (Station.RemoteController.Channels.A[2].stChannelState <> stChannelTuned) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Канал 1 не нестроен' + #10#13;

           Result:=false;
         end;
   end;

   constructor TTaskTerminalModeSubTask26.Create;
   begin
   inherited Create;

        Name:='Отрегулировать канал 2';
        Text:='На стойке 1200 А ПРМ отрегулировать затухание канала 2 потенциометром УРОВЕНЬ на канальном блоке 1220.';
        EventFormName:='1200 ПРМ А';
        Time:= '';
   end;


    //=============================


       function TTaskTerminalModeSubTask27.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageMainEndTune2') = True) and (TaskNetParams.GetBoolValue('MessageSubEndTune2') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageMainEndTune2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageSubEndTune2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask27.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageMainEndTune2', 'True');
                  NetWorker.SendTaskParams('MessageMainEndTune2', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageMainEndTune2') = True) then
              begin
              TaskNetParams.ChangeValue('MessageSubEndTune2', 'True');
                  NetWorker.SendTaskParams('MessageSubEndTune2', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask27.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Доложить о завершении настройки канала 2. Старшая станция: "Готово". Подчиненная станция: "Готово".';
        EventFormName:='';
        Time:= '';
   end;















   //=============================


       function TTaskTerminalModeSubTask28.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageStartFrequencyMain1_1') = True) and (TaskNetParams.GetBoolValue('MessageStartFrequencySub1_1') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageStartFrequencyMain1_1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageStartFrequencySub1_1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask28.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageStartFrequencyMain1_1', 'True');
                  NetWorker.SendTaskParams('MessageStartFrequencyMain1_1', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageStartFrequencyMain1_1') = True) then
              begin
              TaskNetParams.ChangeValue('MessageStartFrequencySub1_1', 'True');
                  NetWorker.SendTaskParams('MessageStartFrequencySub1_1', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask28.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Доложить корреспонденту о начале измерения частотной характеристики. Старшая станция: "Приступаем к измерению частотной характеристики. ';
        Text:=Text+' Дайте генератор с частотой 0.3кГц по первому каналу полукомплекта А. Даю вам." Подчиненная станция: "Вас понял. Даю генератор".';
        EventFormName:='';
        Time:= '';
   end;


    //=============================


       function TTaskTerminalModeSubTask29.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.P321C.swFrequency = 1) and (TaskNetParams.GetBoolValue('MessageEndFrequencyMain1_1') = True) and (TaskNetParams.GetBoolValue('MessageEndFrequencySub1_1') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageEndFrequencyMain1_1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageEndFrequencySub1_1') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
            if (Station.P321C.swFrequency <> 1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Переключатель КГЦ не устанвлен в нужное положение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask29.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin
               if (Station.P321C.swFrequency = 1) then
               begin
                    if (NetWorker.ClientState.IsMainStation = True) then
                    begin
                      TaskNetParams.ChangeValue('MessageEndFrequencyMain1_1', 'True');
                        NetWorker.SendTaskParams('MessageEndFrequencyMain1_1', 'True');
                    end;
                    if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageEndFrequencyMain1_1') = True) then
                    begin
                    TaskNetParams.ChangeValue('MessageEndFrequencySub1_1', 'True');
                        NetWorker.SendTaskParams('MessageEndFrequencySub1_1', 'True');
                    end;
               end;
              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask29.Create;
   begin
   inherited Create;

        Name:='Измерить частотную характеристику.';
        Text:='На приборе П-321С переключатель КГЦ установить в положение 0.3, измерить частотную характеристику. Доложить корреспонденту. Старшая станция: "Отклонение ...". Подчиненная станция: "Отклонение ...".';
        EventFormName:='П-321 С';
        Time:= '';
   end;



   //=============================


       function TTaskTerminalModeSubTask30.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (TaskNetParams.GetBoolValue('MessageStartFrequencyMain1_2') = True) and (TaskNetParams.GetBoolValue('MessageStartFrequencySub1_2') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageStartFrequencyMain1_2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageStartFrequencySub1_2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask30.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin

              if (NetWorker.ClientState.IsMainStation = True) then
              begin
                TaskNetParams.ChangeValue('MessageStartFrequencyMain1_2', 'True');
                  NetWorker.SendTaskParams('MessageStartFrequencyMain1_2', 'True');
              end;
              if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageStartFrequencyMain1_1') = True) then
              begin
              TaskNetParams.ChangeValue('MessageStartFrequencySub1_2', 'True');
                  NetWorker.SendTaskParams('MessageStartFrequencySub1_2', 'True');
              end;

              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask30.Create;
   begin
   inherited Create;

        Name:='Доложить корреспонденту.';
        Text:='Доложить корреспонденту . Старшая станция: "Дайте генератор с частотой 0.4кГц по первому каналу полукомплекта А. Даю вам." Подчиненная станция: "Вас понял. Даю генератор".';
        EventFormName:='';
        Time:= '';
   end;


    //=============================


       function TTaskTerminalModeSubTask31.CheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList): Boolean;
   begin

         if (Station.P321C.swFrequency = 2) and (TaskNetParams.GetBoolValue('MessageEndFrequencyMain1_2') = True) and (TaskNetParams.GetBoolValue('MessageEndFrequencySub1_2') = True)
         then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then ErrorKeeper.ErrorMsg := '' ;
            if (TaskNetParams.GetBoolValue('MessageEndFrequencyMain1_2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Старшая станция не отправила сообщение' + #10#13;
            if (TaskNetParams.GetBoolValue('MessageEndFrequencySub1_2') <> True) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Подчиненная станция не отправила сообщение' + #10#13;
            if (Station.P321C.swFrequency <> 1) then ErrorKeeper.ErrorMsg:= ErrorKeeper.ErrorMsg + 'Переключатель КГЦ не устанвлен в нужное положение' + #10#13;
           Result:=false;
         end;
   end;

   function TTaskTerminalModeSubTask31.NetCheckSubTask(FullCheck: Boolean; Station: TStation; NetWorker: TClientNetWorker; ErrorKeeper: TErrorKeeper; TaskNetParams: TNetParamsList):  Boolean;
   begin
               if (Station.P321C.swFrequency = 2) then
               begin
                    if (NetWorker.ClientState.IsMainStation = True) then
                    begin
                      TaskNetParams.ChangeValue('MessageEndFrequencyMain1_2', 'True');
                        NetWorker.SendTaskParams('MessageEndFrequencyMain1_2', 'True');
                    end;
                    if (NetWorker.ClientState.IsMainStation = False) and (TaskNetParams.GetBoolValue('MessageEndFrequencyMain1_2') = True) then
                    begin
                    TaskNetParams.ChangeValue('MessageEndFrequencySub1_2', 'True');
                        NetWorker.SendTaskParams('MessageEndFrequencySub1_2', 'True');
                    end;
               end;
              Result:=True;
   end;

   constructor TTaskTerminalModeSubTask31.Create;
   begin
   inherited Create;

        Name:='Измерить частотную характеристику.';
        Text:='На приборе П-321С переключатель КГЦ установить в положение 0.4, измерить частотную характеристику. Доложить корреспонденту. Старшая станция: "Отклонение ...". Подчиненная станция: "Отклонение ...".';
        EventFormName:='П-321 С';
        Time:= '';
   end;

{$ENDREGION}

end.



