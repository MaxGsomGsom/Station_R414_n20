unit uStationR414Form;

interface

uses
  Windows,
  uRackP321MinForm,
  uBlockOscillographMinForm,
  uP321DisplayForm,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  jpeg,
  ExtCtrls,
  pngimage,
  StdCtrls,
  ComCtrls,
  Menus,
  uAdditionalFormMethods,
  uCurrentTaskForm,
  uBackgroundForm,
  uStationStateDM,
  uTaskControllerDM,
  uBlockGeneratorForm,
  uButtonBackForm,
  uFilterForm,
  uClientStateDM,
  uStationR414MinForm,
  ChatForm,
  uNetWorkerDM;


type
  TStationR414Form = class(TForm)
    {$REGION 'Объявление элементов формы'}
    scrlbxMain: TScrollBox;
    lvTask: TListView;
    pmlvTask: TPopupMenu;
    N1: TMenuItem;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    img12: TImage;
    img13: TImage;
    img14: TImage;
    img15: TImage;
    img16: TImage;
    img17: TImage;
    img18: TImage;
    img19: TImage;
    img20: TImage;
    img21: TImage;
    img22: TImage;
    img23: TImage;
    img24: TImage;
    img25: TImage;
    img26: TImage;
    img27: TImage;
    img28: TImage;
    img100: TImage;
    img101: TImage;
    img102: TImage;
    img104: TImage;
    img105: TImage;
    img106: TImage;
    img107: TImage;
    imgBgStationR414Form: TImage;
    imgDuplexerA: TImage;
    imgDuplexerB: TImage;
    imgMshuB: TImage;
    imgGenerA: TImage;
    imgGenerB: TImage;
    imgOscillograph: TImage;
    imgVolnomerA: TImage;
    imgP321C: TImage;
    imgP321B: TImage;
    imgPower: TImage;
    imgPultA: TImage;
    imgPultB: TImage;
    imgRack1200A: TImage;
    imgRack1200A2: TImage;
    imgRack1200B: TImage;
    imgRack1200B2: TImage;
    imgRack1400: TImage;
    imgRack1500A: TImage;
    imgRack1500B: TImage;
    imgRack1600A: TImage;
    imgRack1600B: TImage;
    imgRack1710: TImage;
    imgRack1920A: TImage;
    imgRack1920B: TImage;
    imgShit: TImage;
    imgVolnomerB: TImage;
    imgRed: TImage;
    imgMshuA: TImage;
    imgP321A: TImage;
    N2: TMenuItem;
    {$ENDREGION}
    {$REGION 'Объявление стандартных событий формы'}
    procedure imgOscillographClick(Sender: TObject);
    procedure imgPultBClick(Sender: TObject);
    procedure imgPultAClick(Sender: TObject);
    procedure imgPowerClick(Sender: TObject);
    procedure img9Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure imgRack1200A2Click(Sender: TObject);
    procedure img5Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure img104Click(Sender: TObject);
    procedure img28Click(Sender: TObject);
    procedure img27Click(Sender: TObject);
    procedure imgRack1600AClick(Sender: TObject);
    procedure img26Click(Sender: TObject);
    procedure img105Click(Sender: TObject);
    procedure img19Click(Sender: TObject);
    procedure img106Click(Sender: TObject);
    procedure img8Click(Sender: TObject);
    procedure imgShitClick(Sender: TObject);
    procedure imgP321AClick(Sender: TObject);
    procedure imgRack1500BClick(Sender: TObject);
    procedure imgRack1600BClick(Sender: TObject);
    procedure img11Click(Sender: TObject);
    procedure img100Click(Sender: TObject);
    procedure img13Click(Sender: TObject);
    procedure imgVolnomerBClick(Sender: TObject);
    procedure imgVolnomerAClick(Sender: TObject);
    procedure img14Click(Sender: TObject);
    procedure img15Click(Sender: TObject);
    procedure img102Click(Sender: TObject);
    procedure img16Click(Sender: TObject);
    procedure img17Click(Sender: TObject);
    procedure img18Click(Sender: TObject);
    procedure img20Click(Sender: TObject);
    procedure img21Click(Sender: TObject);
    procedure img101Click(Sender: TObject);
    procedure img22Click(Sender: TObject);
    procedure img23Click(Sender: TObject);
    procedure img24Click(Sender: TObject);
    procedure imgGenerAClick(Sender: TObject);
    procedure imgMshuAClick(Sender: TObject);
    procedure imgGenerBClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgBgStationR414FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgMshuBClick(Sender: TObject);
    procedure img25Click(Sender: TObject);
    procedure img107Click(Sender: TObject);
    procedure imgRack1710Click(Sender: TObject);
    procedure imgDuplexerBClick(Sender: TObject);
    procedure imgRack1400Click(Sender: TObject);
    procedure imgDuplexerAClick(Sender: TObject);
    procedure imgP321BClick(Sender: TObject);
    procedure imgP321CClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvTaskCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure imgRack1500AClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ReloadProgress;
    procedure imgRedMouseEnter(Sender: TObject);
    procedure imgRack1920AClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure imgRack1920BClick(Sender: TObject);
    procedure lvTaskMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    {$ENDREGION}

  private
    { Private declarations }
    procedure UpdSubTaskList(Sender: TObject);
    procedure AddSubTasks;
    procedure TaskComplete(Sender: TObject);
    procedure ChangeTaskTextBlock(Sender: TObject);
    procedure StartNetTaskError(Sender: TObject);

  public
    { Public declarations }
    StationR414MinForm: TStationR414MinForm;
    procedure CheckProgress;
    procedure PassTask(TaskId: Byte);
    procedure SpawnForm(FormTag: Integer);
    procedure ShowResults;
    procedure TuneTaskList;
    procedure SetBlockRed(IdEnum: TRacksEnum);
    procedure ReloadProgressExam;
    constructor Create(Sender1: TComponent; Station1: TStation; TaskController1: TTaskController; NetWorker0: TClientNetWorker); reintroduce;




var
  //StationR414Form: TStationR414Form;
  BgImages: array [0..27] of ^TImage;
  lvTaskSelectedId: Byte;
  TaskController: TTaskController;
  CLientState: TClientState;
  Station: TStation;
  //ButtonBackForm: TButtonBackForm;
  Chat: TTChatForm;
  NetWorker: TClientNetWorker;
  end;


  var
  CloseStationR414FormFlag: Byte;



implementation

uses
  uDefinitionsDM,
  uRack1500bForm,
  uRack1500Form,
  uRack1920Form,
  uRack1600Form,
  uRack1600BForm,
  uRack1200LeftForm,
  uRack1200RightForm,
  uBlockPowerSupplyForm,
  uBlockRemoteControllerForm,
  uBlockOscillographForm,
  uBlockPowerPanelForm,
  uBlockWaveMeterForm,
  uRackP321Form,
  uPreparationToWorkForm,
  //uBlockGeneratorForm,
  uBlockLittleNoisyAmplifierForm,
  uEducationForm,
  uRack1710Form,
  uRack1400Form,
  uBlockDuplexerForm,
  uWaveMeterPanelForm,
  uReportForm,
  uLoaderForm,
  uCloseForm,
  uUsersForm,
  uHintForm,
  uConstantsDM,
  uTasksDM,
  uRandomMethods,
  uRequestDM;

{$R *.dfm}
var
BackgroundForm: TBackgroundForm;
CurrentTaskForm: TCurrentTaskForm;
  FilterForm: TFilterForm;



 constructor TStationR414Form.Create(Sender1: TComponent; Station1: TStation; TaskController1: TTaskController; NetWorker0: TClientNetWorker);
 begin
     inherited Create(Sender1);
     Station:= Station1;
     TaskController:= TaskController1;
     ClientState:=NetWorker0.ClientState;
     NetWorker:=NetWorker0;
     CLientState.OnStartNetTask:= StartNetTaskError;
     AddSubTasks;
     if (NetWorker.ClientState.TaskID = ttTransferToTerminalMode) then
      begin
         Chat:=TTChatForm.Create(Self, NetWorker, TaskController);
      Chat.Hide;
      if (NetWorker0.ClientState.LinkedR414Connected) then Chat.Show;
      end;
      TaskController.OnSubTaskComplete:=UpdSubTaskList;
      //UpdSubTaskList(nil);

     BackgroundForm:= TBackgroundForm.Create(Self);
     BackgroundForm.Show;
     StationR414MinForm:= TStationR414MinForm.Create(self);
     StationR414MinForm.Show;
    // ButtonBackForm:= TButtonBackForm.Create(self);
    // ButtonBackForm.Show;
     FilterForm:= TFilterForm.Create(self,TaskController, CLientState);
     FilterForm.Show;

     CurrentTaskForm:= TCurrentTaskForm.Create(self, Station);
     CurrentTaskForm.Show;

     TaskController.OnChangeText:= self.ChangeTaskTextBlock;
     TaskController.OnTaskComplete:= self.TaskComplete;

 end;


    procedure TStationR414Form.AddSubTasks;
var
  I: Integer;
  Item: TListItem;
    begin

      for I := 0 to Length(TaskController.CurrentTask.SubTasks)-1 do begin
        Item:=lvTask.Items.Add;
        Item.Caption:=  IntToStr(i+1);
        //Item.SubItems.Add(IntToStr(i+1));
        Item.SubItems.Add(TaskController.CurrentTask.SubTasks[i].Name);
        Item.SubItems.Add(TaskController.CurrentTask.SubTasks[i].Time);
        Item.SubItems.Add(stTaskOpened);
      end;

    end;

  //когда выполнено подзадание
  procedure TStationR414Form.UpdSubTaskList(Sender: TObject);
  var
  i: Integer;
  begin
         for I := 0 to Length(TaskController.CurrentTask.SubTasks)-1 do
         begin
            if (TaskController.CurrentTask.SubTasks[i].IsComplete) then
            begin
              lvTask.Items[i].SubItems[1]:= TaskController.CurrentTask.SubTasks[i].Time;
              lvTask.Items[i].SubItems[2]:= stTaskPassed;
            end;

         end;
         lvTask.Update;
  end;


  procedure TStationR414Form.imgRedMouseEnter(Sender: TObject);
begin

  imgRed.Hide;
end;



procedure TStationR414Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//var executer: TForms_executer;
begin
  //CanClose := False;

  //executer.HideAllRacks;
  //executer.CloseAllMiniRacks;           //Закрыть окно осциллографа
                                       //и приборную шкалу стойки 321с,
                                        //которые открываются для задания 5
  //ShowResults;
  //executer.CloseAllInformationForms;    //Закрыть форму с текстом задания и
                                        //форму с частотами и таймером
  //CanClose := True;

  //(Owner as TPreparationToWorkForm).Show;
  StationR414MinForm.Close;
  BackgroundForm.Close;
  FilterForm.Close;
  CurrentTaskForm.Close;
  Chat.Close;
end;

procedure TStationR414Form.FormCreate(Sender: TObject);
begin
  //Инициализация
  BgImages[ord(Power_panel)] := @imgShit;
  BgImages[ord(Mshu_B)] := @imgMshuB;
  BgImages[ord(Generator_B)] := @imgGenerB;
  BgImages[ord(Duplexer_B)] := @imgDuplexerB;
  BgImages[ord(Rack_1500_B)] := @imgRack1500B;
  BgImages[ord(Rack_1920_B)] := @imgRack1920B;
  BgImages[ord(Rack_1600_B)] := @imgRack1600B;
  BgImages[ord(Wavemeter_B)] := @imgVolnomerB;
  BgImages[ord(Rack_1200_broadcaster_B)] := @imgRack1200B;
  BgImages[ord(Rack_1200_reciever_B)] := @imgRack1200B2;
  BgImages[ord(P321_B)] := @imgP321B;
  BgImages[ord(Rack_1400)] := @imgRack1400;
  BgImages[ord(Oscillograph_rack)] := @imgOscillograph;
  BgImages[ord(P321_C)] := @imgP321C;
  BgImages[ord(Console_A)] := @imgPultA;
  BgImages[ord(power_supply)] := @imgPower;
  BgImages[ord(Console_B)] := @imgPultB;
  BgImages[ord(Rack_1710)] := @imgRack1710;
  BgImages[ord(Rack_1200_broadcaster_A)] := @imgRack1200A2;
  BgImages[ord(Rack_1200_reciever_A)] := @imgRack1200A;
  BgImages[ord(P321_A)] := @imgP321A;
  BgImages[ord(Rack_1600_A)] := @imgRack1600A;
  BgImages[ord(Wavemeter_A)] := @imgVolnomerA;
  BgImages[ord(Rack_1920_A)] := @imgRack1920A;
  BgImages[ord(Rack_1500_A)] := @imgRack1500A;
  BgImages[ord(Duplexer_A)] := @imgDuplexerA;
  BgImages[ord(Generator_A)] := @imgGenerA;
  BgImages[ord(Mshu_A)] := @imgMshuA;

  //Установка позиций и размеров формы и её элементов в соответствии
  //с параметрами экрана пользователя
  if Screen.Width > 1310 then
    Width := 1310
  else
    Width := Screen.Width - 20;

  //Расположить форму сверху по центру:
  Top := 0;
  Left := Screen.Width div 2 - width div 2;

  //Ограничить высоту формы:
  //StationR414Form.ClientHeight:= Screen.Height - GetTaskBarHeight() - R414miniFormHeight;
  Height:= Screen.Height - GetTaskBarHeight() - R414miniFormHeight;

  //Убрать бордюр
  BorderStyle := bsNone;

  //Настройки полоски прокрутки... А она есть вообще?)
  //Полгода спустя: она есть, но только на win XP...
  scrlbxMain.Left := 10;
  scrlbxMain.Top := 10;
  scrlbxMain.Width := Width - 20;

  //Настройка списка заданий
  lvTask.Top := imgBgStationR414Form.Top + imgBgStationR414Form.Height + 20;
  if (scrlbxMain.HorzScrollBar.Visible) then lvTask.Top := lvTask.Top + 10;
  lvTask.Left := 10;
  lvTask.Width := Width - 20;
  lvTask.Height := Height - lvTask.Top - 10;


  ChangeTaskTextBlock(nil);
end;

/// <summary>
/// Обработчик события нажатия на клавишу в окне формы
/// </summary>
procedure TStationR414Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = 27) and (Station.WorkType = wtFree) then
  begin
    Self.Close;
  end;
end;

procedure TStationR414Form.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgRed.Show;
end;

procedure TStationR414Form.PassTask(TaskId: Byte);
begin
  //inc(XT, 1);
  if (Station.WorkMode = mdExternalView)then
  begin
    //StationR414Form.lvTask.Perform(LB_SETTOPINDEX, PimgRed(TaskId), 0);
    Task1PassTime[Taskid] := TimeToStr(Time);
    Task1Passed[TaskId] := stPassed;
    lvTask.Items[TaskId].SubItems[1] := stTaskPassed;
    lvTask.Items[TaskId].SubItems[2] := TimeToStr(Time);
  end
  else
  begin
    Application.ProcessMessages;
  end;
  //StationR414Form.lvTask.Perform(LB_SETTOPINDEX, TaskId, 0);
end;

procedure TStationR414Form.ShowResults;
var
    intA, intB, ErrorsCount: LongInt;
    i : LongInt;
    estimation: Real;                   // оценка
    strError: string;
    LI : TListItem;
begin
  Application.ProcessMessages;

  //Остановим поток подсчета времени
  NeedToCountTime := False;
  CloseStationR414FormFlag := 2;

  //ReportForm.lvErrors.Clear;
  //ReportForm.lvTask.Clear;

  if Station.WorkType <> wtLearn then
  begin
    //Все ошибки которые были по ходу выполнения задачи сбрасываются
    //мы заново ведем учет состояния станции
    SetLength(Errors, 0);
    ErrorsCount := 0;
  end;

  estimation := 5;              //При наличии ошибки оценка уменьшается

  //Учет всех сделанных ошибок
  if Station.WorkType <> wtExam then
  begin
    case Station.WorkMode of
      mdExternalView:
        begin
          for i := 0 to 27 do
          begin
            //LI := ReportForm.lvTask.Items.Add;
            LI.Caption := IntToStr(i + 1);
            //Обратное направление
            LI.SubItems.Add(UnitsNames[i]);
            if Task1Passed[i] = stPassed then
              LI.SubItems.Add(stTaskPassed)
            else
            begin
              //task is not finished
              TaskController.AddError(i, 'Внешний осмотр не произведён!');
              LI.SubItems.Add(stTaskOpened);
              if estimation > 2 then estimation := estimation - 0.5;
            end;
            LI.SubItems.Add(Task1PassTime[i]);
          end;
        end;
      mdStartParametersSetup:
        begin
          for i := 1 to Length(Task2Arr) do
          begin
           // LI := ReportForm.lvTask.Items.Add;
            LI.Caption := IntToStr(i);
            //Обратное направление
            LI.SubItems.Add(Task2Arr[i]);
            if Task2Passed[i] = stPassed then
              LI.SubItems.Add(stTaskPassed)
            else
            begin
              //task is not finished
              strError :=  TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(i - 1), mdStartParametersSetup);
              if strError = '' then
              begin
                strError := 'Занятие 2, задание ' + IntToStr(i);
              end;
              TaskController.AddError(TaskController.GetRackCodeByTaskId(i - 1), strError);
              LI.SubItems.Add(stTaskOpened);
              if estimation > 2 then estimation := estimation - 1;
            end;
            LI.SubItems.Add(Task2PassTime[i]);
          end;
        end;
      mdPowerOn:
        begin
          for i := 1 to Length(Task3Arr) do
          begin
            //LI := ReportForm.lvTask.Items.Add;
            LI.Caption := IntToStr(i);
            //Обратное направление
            LI.SubItems.Add(Task3Arr[i]);
            if Task3Passed[i] = stPassed then
              LI.SubItems.Add(stTaskPassed)
            else
            begin
              //task is not finished
              strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(i - 1), mdPowerOn);
              if strError = '' then
              begin
                strError := 'Занятие 3, задание ' + IntToStr(i);
              end;
              TaskController.AddError(TaskController.GetRackCodeByTaskId(i - 1), strError);
              LI.SubItems.Add(stTaskOpened);
              if estimation > 2 then estimation := estimation - 2;
            end;
            LI.SubItems.Add(Task3PassTime[i]);
          end;
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          for i := 1 to Length(Task4Arr) do
          begin
            //LI := ReportForm.lvTask.Items.Add;
            LI.Caption := IntToStr(i);
            //Обратное направление
            LI.SubItems.Add(Task4Arr[i]);
            if Task4Passed[i] = stPassed then
              LI.SubItems.Add(stTaskPassed)
            else
            begin
              //task is not finished
              strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(i - 1),
                mdReceiveAndTransmitTracksSetup);
              if strError = '' then
              begin
                strError := 'Занятие 4, задание ' + IntToStr(i);
              end;
              TaskController.AddError(TaskController.GetRackCodeByTaskId(i - 1), strError);
              LI.SubItems.Add(stTaskOpened);
              if estimation > 2 then estimation := estimation - 2;
            end;
            LI.SubItems.Add(Task4PassTime[i]);
          end;
        end;
      mdWorkWithLowFrequency:
        begin
          for i := 1 to Length(Task5Arr) do
          begin
            //LI := ReportForm.lvTask.Items.Add;
            LI.Caption := IntToStr(i);
            //Обратное направление
            LI.SubItems.Add(Task5Arr[i]);
            if Task5Passed[i] = stPassed then
              LI.SubItems.Add(stTaskPassed)
            else
            begin
              //task is not finished
              strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(i - 1),
                                        mdWorkWithLowFrequency);
              if strError = '' then
              begin
                strError := 'Занятие 5, задание ' + IntToStr(i);
              end;
              TaskController.AddError(NotSelected, strError);
              LI.SubItems.Add(stTaskOpened);
              estimation := 2;                // За невыполнение одного из 2-х
                                              // заданий сразу 2 балла
            end;
            LI.SubItems.Add(Task5PassTime[i]);
          end;
        end;
      mdTransferToTerminalMode:
        begin
          for i := 1 to Length(Task6Arr) do
          begin
            //LI := ReportForm.lvTask.Items.Add;
            LI.Caption := IntToStr(i);
            //Обратное направление
            LI.SubItems.Add(Task6Arr[i]);
            if Task6Passed[i] = stPassed then
              LI.SubItems.Add(stTaskPassed)
            else
            begin
              //task is not finished
              strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(i - 1),
                                        mdTransferToTerminalMode);
              if strError = '' then
              begin
                strError := 'Занятие 6, задание ' + IntToStr(i);
              end;
              TaskController.AddError(NotSelected, strError);
              LI.SubItems.Add(stTaskOpened);
              { TODO: Сдклать расчёт оценки }
              estimation := 42;
            end;
            LI.SubItems.Add(Task6PassTime[i]);
          end;
        end;
    end;
  end
  else begin
    //  Task5Arr[1] := 'Проверить девиацию канальных импульсов блоков 1200 ПРД и ПРМ';
    //  Task5Arr[2] := 'Отрегулировать остаточное затухание пяти каналов, проверить прохождение вызова';
    if ((stDeviation.Rack1200A_PRD = stPassed) and
        (stDeviation.Rack1200A_PRM = stPassed) and
        (stDeviation.Rack1200B_PRD = stPassed) and
        (stDeviation.Rack1200B_PRM = stPassed))
        //and (Task5Passed[1] = stNotPassed)
    then begin
      Task5Passed[1] := stPassed;
      Task5PassTime[1] := TimeToStr(Time);
    end
    else begin
      Task5Passed[1] := stNotPassed;
      Task5PassTime[1] := InitialTimeString;
    end;

    if (((TaskController.GetNumberOfTunedChannelBlocks > 4) and
    (TaskController.GetNumberOfCallPassedThrough > 4)))  and (Task5Passed[2] = stNotPassed) then
    begin
      Task5Passed[2] := stPassed;
      Task5PassTime[2] := TimeToStr(Time);
    end
    else
    begin
      Task5Passed[2] := stNotPassed;
      Task5PassTime[2] := InitialTimeString;
    end;

    intB := 0;
    //Экзамен - выведем все
    for intA := 0 to 27 do
    begin
      inc(intB, 1);
      //LI := ReportForm.lvTask.Items.Add;
      LI.Caption := IntToStr(intB);
      //Обратное направление
      LI.SubItems.Add(UnitsNames[intA]);
      if Task1Passed[intA] = stPassed then
        LI.SubItems.Add(stTaskPassed)
      else
      begin
        //task is not finished
        TaskController.AddError(intA, 'Внешний осмотр не произведён!');
        LI.SubItems.Add(stTaskOpened);
        if estimation > 2 then estimation := estimation - 2;
      end;
      LI.SubItems.Add(Task1PassTime[intA]);
    end;
    for intA := 1 to Length(Task2Arr) do
    begin
      Inc(intB, 1);
      //LI := ReportForm.lvTask.Items.Add;
      LI.Caption := IntToStr(intB);
      //Обратное направление
      LI.SubItems.Add(Task2Arr[intA]);
      if Task2Passed[intA] = stPassed then
        LI.SubItems.Add(stTaskPassed)
      else
      begin
        //task is not finished
        strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(intA - 1), mdStartParametersSetup);
        if strError = '' then
        begin
          strError := 'Занятие 2, задание ' + IntToStr(intA);
        end;
        TaskController.AddError(TaskController.GetRackCodeByTaskId(intA - 1), strError);
        LI.SubItems.Add(stTaskOpened);
        if estimation > 2 then estimation := estimation - 2;
      end;
      LI.SubItems.Add(Task2PassTime[intA]);
    end;
    for intA := 1 to Length(Task3Arr) do
    begin
      Inc(intB, 1);
      //LI := ReportForm.lvTask.Items.Add;
      LI.Caption := IntToStr(intB);
      //Обратное направление
      LI.SubItems.Add(Task3Arr[intA]);
      if Task3Passed[intA] = stPassed then
        LI.SubItems.Add(stTaskPassed)
      else
      begin
        //task is not finished
        strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(intA - 1), mdPowerOn);
        if strError = '' then
        begin
          strError := 'Занятие 3, задание ' + IntToStr(intA);
        end;
        TaskController.AddError(TaskController.GetRackCodeByTaskId(intA - 1), strError);
        LI.SubItems.Add(stTaskOpened);
        if estimation > 2 then estimation := estimation - 2;
      end;
      LI.SubItems.Add(Task3PassTime[intA]);
    end;
    for intA := 1 to Length(Task4Arr) do
    begin
      Inc(intB, 1);
      //LI := ReportForm.lvTask.Items.Add;
      LI.Caption := IntToStr(intB);
      //Обратное направление
      LI.SubItems.Add(Task4Arr[intA]);
      if Task4Passed[intA] = stPassed then
        LI.SubItems.Add(stTaskPassed)
      else
      begin
        //task is not finished
        strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(intA - 1), mdReceiveAndTransmitTracksSetup);
        if strError = '' then
        begin
          strError := 'Занятие 4, задание ' + IntToStr(intA);
        end;
        TaskController.AddError(TaskController.GetRackCodeByTaskId(intA - 1), strError);
        LI.SubItems.Add(stTaskOpened);
        if estimation > 2 then estimation := estimation - 2;
      end;
      LI.SubItems.Add(Task4PassTime[intA]);
    end;
    for intA := 1 to Length(Task5Arr) do
    begin
      Inc(intB, 1);
      //LI := ReportForm.lvTask.Items.Add;
      LI.Caption := IntToStr(intB);
      //Обратное направление
      LI.SubItems.Add(Task5Arr[intA]);
      if Task5Passed[intA] = stPassed then
        LI.SubItems.Add(stTaskPassed)
      else
      begin
        //task is not finished
        strError := TaskController.AnalyseStation(TaskController.GetRackCodeByTaskId(intA - 1), mdWorkWithLowFrequency);
        if strError = '' then
        begin
          strError := 'Занятие 5, задание ' + IntToStr(intA);
        end;
        TaskController.AddError(NotSelected, strError);
        LI.SubItems.Add(stTaskOpened);
        estimation := 2;                      // За невыполнение одного из 2-х
                                              // заданий сразу 2 балла
      end;
      LI.SubItems.Add(Task5PassTime[intA]);
    end;
  end;

  if Abs(Frac(estimation) - 0.5) < 0.01 then
    estimation := Int(estimation) + 1;      // Если оценка с половинной долей
                                            // Округляем в большую сторону
  if estimation < 2 then estimation := 2;   // Оценка не может быть меньше 2

  //Подготовим форму отчета к показу
  //ReportForm.lblTaskName.Caption := Task1Description;
  //ReportForm.lblFIO.Caption := CurUser.Surname + ' ' + CurUser.Name + ' '
                            //+ CurUser.Patronomyc;
  //ReportForm.OtchetHideErorrs;
  ErrorsCount := Length(Errors);
  //ReportForm.lblMistakesCount.Caption := IntToStr(ErrorsCount);

  //Отобразим ошибки
  //ReportForm.lblOzenka.Caption := FloatToStr(estimation);         //Вывести оценку
  if Station.WorkType <> wtExam then
  begin
    case Station.WorkMode of
      mdExternalView:
        begin
          for intA := 0 to Length(Errors) - 1 do
          begin
            //LI := ReportForm.lvErrors.Items.Add;
            LI.Caption := IntToStr(intA + 1);
            //Обратное направление
            LI.SubItems.Add(UnitsNames[Errors[intA].ErrInRack]);
            LI.SubItems.Add(Errors[intA].ErrDescription);
          end;
        end;
      mdStartParametersSetup:
        begin
          //mdExternalView
          for intA := 0 to Length(Errors) - 1 do
          begin
            //LI := ReportForm.lvErrors.Items.Add;
            LI.Caption := IntToStr(intA + 1);
            //Обратное направление
            LI.SubItems.Add(UnitsNames[Errors[intA].ErrInRack]);
            LI.SubItems.Add(Errors[intA].ErrDescription);
          end;
        end;
      mdPowerOn:
        begin
          for intA := 0 to Length(Errors) - 1 do
          begin
            //LI := ReportForm.lvErrors.Items.Add;
            LI.Caption := IntToStr(intA + 1);
            //Обратное направление
            if Errors[intA].ErrInRack <> NotSelected then
              LI.SubItems.Add(UnitsNames[Errors[intA].ErrInRack])
            else
              LI.SubItems.Add('XZ');
            LI.SubItems.Add(Errors[intA].ErrDescription);
          end;
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          for intA := 0 to Length(Errors) - 1 do
          begin
            //LI := ReportForm.lvErrors.Items.Add;
            LI.Caption := IntToStr(intA + 1);
            //Обратное направление
            LI.SubItems.Add(UnitsNames[Errors[intA].ErrInRack]);
            LI.SubItems.Add(Errors[intA].ErrDescription);
          end;
        end;
      mdWorkWithLowFrequency:
        begin
          for intA := 0 to Length(Errors) - 1 do
          begin
            //LI := ReportForm.lvErrors.Items.Add;
            LI.Caption := IntToStr(intA + 1);
            //Обратное направление
            LI.SubItems.Add(UnitsNames[Errors[intA].ErrInRack]);
            LI.SubItems.Add(Errors[intA].ErrDescription);
          end;
        end;
    end;
  end
  else
  begin
    for intA := 0 to Length(Errors) - 1 do
    begin
      //LI := ReportForm.lvErrors.Items.Add;
      LI.Caption := IntToStr(intA + 1);
      if Errors[intA].ErrInRack <> NotSelected then
        LI.SubItems.Add(UnitsNames[Errors[intA].ErrInRack])
      else
        LI.SubItems.Add('N/A');
      LI.SubItems.Add(Errors[intA].ErrDescription);
    end;
  end;

  if Length(Errors) > 0 then                       //Настроить видимость кнопки
    //ReportForm.btnShowHideErrors.Visible := True      //отобразить/скрыть ошибки
  else
    //ReportForm.btnShowHideErrors.Visible := False;

  AddAchieve(CurUser.ID, estimation, PassedSeconds,
    Station.WorkMode, Station.WorkType);
  //ReportForm.Show;
  //ReportForm.SetFocus;
  //HideHint;
end;

/// <summary>
/// Похоже, что эта функция возвращает, какое
/// упражнение сейчас сейчас выполняет пользователь
/// </summary>
/// <returns>Номер упражнения</returns>
function GetNumberOfHigherTaskStarted: Byte;
var
  btA: Byte;
  FoundPassed: Boolean;
begin
  FoundPassed := False;
  Result := 1;
  for btA := 0 to Length(Task1Passed) - 1 do
  begin
    if Task1Passed[btA] = stPassed then
    begin
      FoundPassed := True;
      Result := 1;
      Break;
    end;
  end;
  for btA := 1 to Length(Task2Passed) do
  begin
    if Task2Passed[btA] = stPassed then
    begin
      FoundPassed := True;
      Result := 2;
      Break;
    end;
  end;
  for btA := 1 to Length(Task3Passed) do
  begin
    if Task3Passed[btA] = stPassed then
    begin
      FoundPassed := True;
      Result := 3;
      Break;
    end;
  end;
  for btA := 1 to Length(Task4Passed) do
  begin
    if Task4Passed[btA] = stPassed then
    begin
      FoundPassed := True;
      Result := 4;
      Break;
    end;
  end;
  for btA := 1 to Length(Task5Passed) do
  begin
    if Task5Passed[btA] = stPassed then
    begin
      FoundPassed := True;
      Result := 5;
      Break;
    end;
  end;
  //Вы тоже не понимаете, зачем нужны была переменная FoundPassed?
end;

//Процедура проверки прогресса выполнения заданий входе экзамена
procedure TStationR414Form.ReloadProgressExam;
var
  btA, Progress, TotalTasksCount: Byte;

  {$REGION 'Процедура вычисления оценки'}
  procedure ProcessOzenka(LevelId: Byte);
  var
    ErrorsFound: Boolean;
    btA: Byte;
  begin
    ErrorsFound := False;
    case LevelId of
      mdExternalView:
        begin
          for btA := 0 to Length(Task1Passed) - 1 do
          begin
            //Если это новый режим и за него не ставилась оценка
            if Task1Passed[btA] = stNotPassed then
            begin
              ErrorsFound := True;
              TaskController.AddError(btA, 'Внешний осмотр не произведен!');
            end;

            if ErrorsFound then
            begin
              if ErrorForLevelGiven[mdExternalView] = 0 then
              begin
                ErrorForLevelGiven[mdExternalView] := 1;
                AddExamError(btA, 'Внешний осмотр не произведен!');
              end;
            end;
          end;
        end;
      mdStartParametersSetup:
        begin
          for btA := 1 to Length(Task2Passed) do
          begin
            //Если это новый режим и за него не ставилась оценка
            if Task2Passed[btA] = stNotPassed then
            begin
              ErrorsFound := True;
              TaskController.AddError(Task2RackCodeArr[btA], TaskController.AnalyseStation(Task2RackCodeArr[btA], mdStartParametersSetup));
            end;

            if ErrorsFound then
            begin
              if ErrorForLevelGiven[mdStartParametersSetup] = 0 then
              begin
                ErrorForLevelGiven[mdStartParametersSetup] := 1;
                AddExamError(Task2RackCodeArr[btA], TaskController.AnalyseStation(Task2RackCodeArr[btA], mdStartParametersSetup));
              end;
            end;
          end;
        end;
      mdPowerOn:
        begin
          for btA := 1 to Length(Task3Passed) do
          begin
            //Если это новый режим и за него не ставилась оценка
            if Task3Passed[btA] = stNotPassed then
            begin
              ErrorsFound := True;
              TaskController.AddError(Task3RackCodeArr[btA], TaskController.AnalyseStation(Task3RackCodeArr[btA], mdPowerOn));
            end;

            if ErrorsFound then
            begin
              if ErrorForLevelGiven[mdPowerOn] = 0 then
              begin
                ErrorForLevelGiven[mdPowerOn] := 1;
                AddExamError(Task3RackCodeArr[btA], TaskController.AnalyseStation(Task3RackCodeArr[btA], mdPowerOn));
              end;
            end;
          end;
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          for btA := 1 to Length(Task4Passed) do
          begin
            //Если это новый режим и за него не ставилась оценка
            if Task4Passed[btA] = stNotPassed then
            begin
              ErrorsFound := True;
              TaskController.AddError(Task4RackCodeArr[btA], TaskController.AnalyseStation(Task4RackCodeArr[btA], mdReceiveAndTransmitTracksSetup));
            end;

            if ErrorsFound then
            begin
              if ErrorForLevelGiven[mdReceiveAndTransmitTracksSetup] = 0 then
              begin
                ErrorForLevelGiven[mdReceiveAndTransmitTracksSetup] := 1;
                AddExamError(Task4RackCodeArr[btA], TaskController.AnalyseStation(Task4RackCodeArr[btA], mdReceiveAndTransmitTracksSetup));
              end;
            end;
          end;
        end;
      mdWorkWithLowFrequency:
        begin
          for btA := 1 to Length(Task5Passed) do
          begin
            //Если это новый режим и за него не ставилась оценка
            if Task5Passed[btA] = stNotPassed then
            begin
              ErrorsFound := True;
              TaskController.AddError(Task5RackCodeArr[btA], TaskController.AnalyseStation(Task5RackCodeArr[btA], mdWorkWithLowFrequency));
            end;

            if ErrorsFound then
            begin
              if ErrorForLevelGiven[mdWorkWithLowFrequency] = 0 then
              begin
                ErrorForLevelGiven[mdWorkWithLowFrequency] := 1;
                AddExamError(Task5RackCodeArr[btA], TaskController.AnalyseStation(Task5RackCodeArr[btA], mdWorkWithLowFrequency));
              end;
            end;
          end;
        end;
    end;
  end;
  {$ENDREGION}
begin
  btA := GetNumberOfHigherTaskStarted;  //"Получить число более высоких
                                        //задач начатых"? Mда...
                                        //Похоже, что это номер выполняемого
                                        //упражнения

  if btA > CurTaskId then               //Если пользователь перешёл к выполнению
                                        //следующего упражнения
    CurTaskId := btA;

  if TaskController.IsZaniatiePassed then              //Если станция находится в режиме уже
                                        //выполненного упражнения
    if (Station.WorkMode <= CurTaskId) and (CurTaskId < 5) then
      Inc(CurTaskId, 1);

  if CurTaskId <> NotSelected then
  begin
    if Station.WorkMode = CurTaskId then
    begin
      //Если пользователь выполняет тот же режим  //это не мой код и коммент)
    end
    else
    begin
      if CurTaskId > PassedLevelId then         //Пользователь начал выполнять
                                                //другое упражнение
      begin
        for btA := PassedLevelId to CurTaskId - 1 do
        begin
          ProcessOzenka(btA);                   //Проверка всех непроверенных,
                                                //но оконченных упражнений
        end;
        PassedLevelId := CurTaskId;
      end;

      Station.WorkMode := CurTaskId;            //Перевод станции в режимъ
                                                //текущего выполняемого упр-я
    end;
  end;

  //Закроем не нужные в данный момент формы
//  if (not(FormsArr[idRack1500A].Visible)) and (not(FormsArr[idRack1500B].Visible)) and
//  (not(FormsArr[idRack1600A].Visible)) and (not(FormsArr[idRack1600B].Visible)) then
//  begin
//    WaveMeterPanelForm.Close;
//  end;
//
//  if (not(FormsArr[idRack1200A1].Visible)) and (not(FormsArr[idRack1200A2].Visible)) and
//  (not(FormsArr[idRack1200B1].Visible)) and (not(FormsArr[idRack1200B2].Visible)) then
//  begin
//    BlockOscillographMinForm.Close;
//  end;
//
//  if (not(FormsArr[idPultA].Visible)) and (not(FormsArr[idPultB].Visible)) then
//  begin
//    P321DisplayForm.Close;
//    RackP321MinForm.Close;
//  end;
end;

procedure TStationR414Form.ReloadProgress;
var
  btA, NotPassedTaskId        : Byte;
  PassedTasks, TotalTasksCount: Byte;

  function GetBlockIdByNotPassedTaskId: Byte;
  var
    btAA: Byte;
  begin
    Result := NotSelected;
    case Station.WorkMode of
      mdExternalView:
        begin
          for btAA := 0 to Length(Task1RackCodeArr) - 1 do
          begin
            if Task1RackCodeArr[btAA] = NotPassedTaskId then
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
            if Task2RackCodeArr[btAA] = NotPassedTaskId then
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
            if Task3RackCodeArr[btAA] = NotPassedTaskId then
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
            if Task4RackCodeArr[btAA] = NotPassedTaskId then
            begin
              Result := btAA;
              Break;
            end;
          end;
        end;
    end;
  end;

  function GetTaskId: Byte;
  var
    btAA: Byte;
  begin
    Result := NotSelected;
    for btAA := 0 to 27 do
    begin
      if Task1Passed[btAA] = stNotPassed then
      begin
        Result := btAA;
        Break;
      end;
    end;
  end;

begin
  NotPassedTaskId := NotSelected;
  PassedTasks := 0;
  TotalTasksCount := 0;
  case Station.WorkMode of
    mdExternalView:
      begin
        TotalTasksCount := Length(Task1Passed);
        for btA := Length(Task1Passed) downto 1 do
        begin
          if Task1Passed[btA - 1] = stPassed then
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskPassed;
            lvTask.Items[btA - 1].SubItems[2] := Task1PassTime[btA - 1];
            Inc(PassedTasks, 1);
          end
          else
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
            lvTask.Items[btA - 1].SubItems[2] := InitialTimeString;
            //if NotPassedTaskId = NotSelected then
            NotPassedTaskId := btA;
          end;
        end;
      end;
    mdStartParametersSetup:
      begin
        TotalTasksCount := Length(Task2Passed);
        for btA := Length(Task2Passed)  downto 1 do
        begin
          if Task2Passed[btA] = stPassed then
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskPassed;
            lvTask.Items[btA - 1].SubItems[2] := Task2PassTime[btA];
            Inc(PassedTasks, 1);
          end
          else
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
            lvTask.Items[btA - 1].SubItems[2] := InitialTimeString;
            NotPassedTaskId := btA;
          end;
        end;
      end;
    mdPowerOn:
      begin
        TotalTasksCount := Length(Task3Passed);
        for btA := Length(Task3Passed) downto 1 do
        begin
          if Task3Passed[btA] = stPassed then
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskPassed;
            lvTask.Items[btA - 1].SubItems[2] := Task3PassTime[btA];
            Inc(PassedTasks, 1);
          end
          else
          begin
            //lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
            lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
            lvTask.Items[btA - 1].SubItems[2] := InitialTimeString;
            //if NotPassedTaskId = NotSelected then
            NotPassedTaskId := btA;
          end;
        end;
      end;
    mdReceiveAndTransmitTracksSetup:
      begin
        TotalTasksCount := Length(Task4Passed);
        for btA := Length(Task4Passed) downto 1 do
        begin
          if Task4Passed[btA] = stPassed then
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskPassed;
            lvTask.Items[btA - 1].SubItems[2] := Task4PassTime[btA];
            Inc(PassedTasks, 1);
          end
          else
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
            lvTask.Items[btA - 1].SubItems[2] := InitialTimeString;
            NotPassedTaskId := btA;
          end;
        end;
      end;
    mdWorkWithLowFrequency:
      begin
        if ((stDeviation.Rack1200A_PRD = stPassed) and
            (stDeviation.Rack1200A_PRM = stPassed) and
            (stDeviation.Rack1200B_PRD = stPassed) and
            (stDeviation.Rack1200B_PRM = stPassed))
            //and (Task5Passed[1] = stNotPassed)
        then begin
          Task5Passed[1] := stPassed;
          Task5PassTime[1] := TimeToStr(Time);
        end
        else begin
          Task5Passed[1] := stNotPassed;
          Task5PassTime[1] := InitialTimeString;
        end;

        if (((TaskController.GetNumberOfTunedChannelBlocks) > 4) and
        (TaskController.GetNumberOfCallPassedThrough > 4))  and (Task5Passed[2] = stNotPassed) then
        begin
          Task5Passed[2] := stPassed;
          Task5PassTime[2] := TimeToStr(Time);
        end
        else
        begin
          Task5Passed[2] := stNotPassed;
          Task5PassTime[2] := InitialTimeString;
        end;
        TotalTasksCount := Length(Task5Passed);

        for btA := Length(Task5Passed) downto 1 do
        begin
          if Task5Passed[btA] = stPassed then
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskPassed;
            lvTask.Items[btA - 1].SubItems[2] := Task5PassTime[btA];
            Inc(PassedTasks, 1);
          end
          else
          begin
            lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
            lvTask.Items[btA - 1].SubItems[2] := InitialTimeString;
            //if NotPassedTaskId = NotSelected then
            NotPassedTaskId := btA;
          end;
        end;
      end;
  end;

  //-----------------Отобразим следующий блок для настройки---------------------
  if Station.WorkType = wtLearn then
  begin
    case Station.WorkMode of
      mdExternalView:
        begin
          btA := TaskController.GetNextBlockId;
          case btA of
            0:
              begin
                btA := 1;
              end;
            1:
              begin
                btA := 0;
              end;
            13:
              begin
                btA := 19;
              end;
            19:
              begin
                btA := 13;
              end;
            25:
              begin
                btA := 26;
              end;
            26:
              begin
                btA := 25;
              end;
          end;

          if btA <> NotSelected then
          begin
            imgRed.Visible := True;
            imgRed.BringToFront;
            imgRed.Left := BgImages[btA].Left;
            imgRed.Top := BgImages[btA].Top;
            imgRed.Height := BgImages[btA].Height;
            imgRed.Width := BgImages[btA].Width;
            imgRed.Repaint;
            imgRed.Invalidate;
            imgBgStationR414Form.Repaint;
            imgBgStationR414Form.Invalidate;
          end;
        end;
      mdStartParametersSetup:
        begin
          btA := GetBlockIdByNotPassedTaskId;
          case btA of
            0:
              begin
                btA := 1;
              end;
            26:
              begin
                btA := 25;
              end;
            13:
              begin
                btA := 19;
              end;
            19:
              begin
                btA := 13;
              end;
  {          10:
              begin
                btA := 12;
              end;
            12:
              begin
                btA := 10;
              end;
              }
          end;

          if btA <> NotSelected then
          begin
            imgRed.Visible := True;
            imgRed.BringToFront;
            imgRed.Left := BgImages[btA].Left;
            imgRed.Top := BgImages[btA].Top;
            imgRed.Height := BgImages[btA].Height;
            imgRed.Width := BgImages[btA].Width;
            imgRed.Repaint;
            imgRed.Invalidate;
            imgBgStationR414Form.Repaint;
            imgBgStationR414Form.Invalidate;
          end;
        end;
      mdPowerOn:
        begin
          btA := GetBlockIdByNotPassedTaskId;
          case btA of
            0:
              begin
                btA := 1;
              end;
            26:
              begin
                btA := 25;
              end;
          end;
          if btA <> NotSelected then
          begin
            imgRed.Visible := True;
            imgRed.BringToFront;
            imgRed.Left := BgImages[btA].Left;
            imgRed.Top := BgImages[btA].Top;
            imgRed.Height := BgImages[btA].Height;
            imgRed.Width := BgImages[btA].Width;
            imgRed.Repaint;
            imgRed.Invalidate;
            imgBgStationR414Form.Repaint;
            imgBgStationR414Form.Invalidate;
          end;
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          imgRed.Visible := False;
          imgRed.Invalidate;
        end;
      mdWorkWithLowFrequency:
        begin
          imgRed.Visible := False;
          imgRed.Invalidate;
        end;
    end;
  end
  else
  begin
    imgRed.Visible := False;
    imgRed.Invalidate;
  end;
end;

procedure TStationR414Form.CheckProgress;
var
  filterHWND: HWND;      //Дескриптор окна filter
begin
  if Station.WorkType <> wtExam then
  begin
    ReloadProgress;
  end;
  if Station.WorkType = wtExam then
  begin
    ReloadProgressExam;
    Exit;
  end;

  if (Station.WorkType = wtLearn) and     // Чтоб в обучении автоматически
    TaskController.IsZaniatiePassed then                 // нажималось завершение работы
  begin
    //if not(ReportForm.Showing) or not(ReportForm.Visible) then
    //begin
    //  //Инициировать событие клика по кнопке завершения упражнения
     // filterHWND := FindWindow('TFilterForm', 'FilterForm');
     // PostMessage(filterHWND, MM_CLICK_BUTTON, 0, 0)
    //end;
    imgRed.BringToFront;
  end;
end;

procedure TStationR414Form.FormShow(Sender: TObject);
var
  executer : TForms_executer;
  btA: Byte;
begin
  //ButtonBackForm.Hide;                //Совместно с общ видом Р414
                                      //кнопка "назад" не нужна

  //Отменить выделение прямоугольником открытой стойки (т.к. нет открытых)
  StationR414MinForm.SelectRack(uAdditionalFormMethods.TRacksEnum.None);

  if ((not StationR414MinForm.Visible)
      and (Station.WorkType <> wtFree)) then
  begin
    StationR414MinForm.Show;
  end;

  if (Station.WorkType = wtExam)
      or (Station.WorkType = wtFree) then
  begin
    lvTask.Visible := False;          //Не показывать задания в режиме экзамена
                                      //И в режиме предварительного просмотра
    Height := scrlbxMain.Height;
    if scrlbxMain.HorzScrollBar.Visible then
      Height := Height
      + GetSystemMetrics(SM_CXHSCROLL);;
  end
  else
  begin
    if not lvTask.Visible then
    begin
      lvTask.Visible := True;
      Height:= Screen.Height - GetTaskBarHeight() - R414miniFormHeight;
    end;

    case Station.WorkMode of
      mdStartParametersSetup:
        begin
          for btA := 1 to Length(Task2Passed) do
          begin
            if Task2Passed[btA] = stPassed then
              lvTask.Items[btA - 1].SubItems[1] := stTaskPassed
            else
            begin
              lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
              lvTask.Items[btA - 1].SubItems[1] := InitialTimeString;
            end;
          end;
        end;
      mdPowerOn:
        begin
          for btA := 1 to Length(Task3Passed) do
          begin
            if Task3Passed[btA] = stPassed then
              lvTask.Items[btA - 1].SubItems[1] := stTaskPassed
            else
            begin
              lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
              lvTask.Items[btA - 1].SubItems[1] := InitialTimeString;
            end;
          end;
        end;
      mdReceiveAndTransmitTracksSetup:
        begin
          for btA := 1 to Length(Task4Passed) do
          begin
            if Task4Passed[btA] = stPassed then
              lvTask.Items[btA - 1].SubItems[1] := stTaskPassed
            else
            begin
              lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
              lvTask.Items[btA - 1].SubItems[1] := InitialTimeString;
            end;
          end;
        end;
      mdWorkWithLowFrequency:
        begin
          for btA := 1 to Length(Task5Passed) do
          begin
            if Task5Passed[btA] = stPassed then
              lvTask.Items[btA - 1].SubItems[1] := stTaskPassed
            else
            begin
              lvTask.Items[btA - 1].SubItems[1] := stTaskOpened;
              lvTask.Items[btA - 1].SubItems[1] := InitialTimeString;
            end;
          end;
        end;
    end;
  end;


   scrlbxMain.HorzScrollBar.Position :=  (imgBgStationR414Form.Width - scrlbxMain.Width) div 2;


end;


procedure TStationR414Form.imgBgStationR414FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Station.WorkType = wtLearn then
  begin
    if (Station.WorkMode = mdWorkWithLowFrequency)
      or (Station.WorkMode = mdReceiveAndTransmitTracksSetup) then
    begin
      imgRed.Visible := False;
      imgRed.Invalidate;
    end
    else
    begin
      imgBgStationR414Form.Invalidate;
      imgRed.Visible := True;
      imgRed.Invalidate;
    end;
  end
end;

procedure TStationR414Form.SpawnForm(FormTag: Integer);

var
  //tmpA: Byte;
  //Exercise1Done: Boolean;           //Флаг: упражнение 1 выполнено
  SelectedRack: TRacksEnum;

begin
//  if (Station.WorkMode <> mdReceiveAndTransmitTracksSetup)
//    and (Station.WorkMode <> mdWorkWithLowFrequency)
//    and (Station.WorkType <> wtExam)
//    and (Station.WorkType <> wtTrening)
//    and not(IsReallyNedeedToSpawnThisRack(CurFormId)) then
//  begin
//    AddError(CurFormId, 'Нет необходимости в настройке данного блока');
//    Application.MessageBox('Нет необходимости в настройке данного блока!',
//    PChar(PName), MB_OK + MB_ICONSTOP);
//    Exit;
//  end;

//  if Station.WorkType = wtLearn then
//  begin
//    if (Station.WorkMode <> mdReceiveAndTransmitTracksSetup) and
//    (Station.WorkMode <> mdWorkWithLowFrequency) then
//    begin
//      tmpA := GetNextBlockId;
//      if (tmpA <> FormTag) and ((FormTag <> idRack1500Aback)
//        and (FormTag <> idRack1500Bback) and (FormTag <> idRack1600Aback)
//        and (FormTag <> idRack1600Bback)) then
//      begin
//        Application.MessageBox(
//          'В режиме обучения Вы обязаны выполнять задания строго по порядку!',
//          PChar(PName), MB_OK + MB_ICONINFORMATION);
//        Exit;
//      end;
//    end;
//  end;

  //CurFormId := FormTag;

//  if Station.WorkMode = mdReceiveAndTransmitTracksSetup then
//  begin
//    case CurFormId of
//      idRack1600A, idRack1600B, idRack1500A, idRack1500B:
//        begin
//          WaveMeterPanelForm.Show;
//        end;
//    end;
//  end;
//  if Station.WorkMode = mdWorkWithLowFrequency then
//  begin
//    case CurFormId of
//      idRack1200A2, idRack1200B2:
//        begin
//          Exercise1Done := True;
//          //Exercise1Done := False;
//          if Task5Passed[1] <> stPassed then
//            begin
//              Exercise1Done := False;
//            end;
//          if (not Exercise1Done) then BlockOscillographMinForm.Show;
//          P321DisplayForm.Show;
//        end;

//      idRack1200A1, idRack1200B1:
//        begin
//          P321DisplayForm.Show;
//        end;
//    end;
  //end;

//  if Station.WorkType = wtExam then
//  begin
//    case CurFormId of
//      idRack1600A, idRack1600B, idRack1500A, idRack1500B:
//        begin
//          WaveMeterPanelForm.Show;
//        end;
//      idRack1200A1, idRack1200A2, idRack1200B1, idRack1200B2:
//        begin
//          BlockOscillographMinForm.Show;
//          P321DisplayForm.Show;
//        end;
//    end;
//  end;


//  if Station.WorkMode = mdExternalView then
//  begin
//    if (FormTag < 28) or (FormTag = 0) then
//    begin
//      if Task1Passed[FormTag] = stNotPassed then
//      begin
//        PassTask(FormTag);
//      end;
//    end;
//  end
//  else
//  begin
    //Перенаправление вызова формы
//    case FormTag of
//      11:
//        FormsArr[FormTag].Tag := 5;
//      14:
//        FormsArr[FormTag].Tag := 10;
//      21:
//        FormsArr[FormTag].Tag := 10;
//      idRack1920A:
//        FormsArr[FormTag].Tag := idRack1920A;
//      idRack1920B:
//        FormsArr[FormTag].Tag := idRack1920B;
//      idRack1600A:
//        FormsArr[FormTag].Tag := idRack1600A;
//      idRack1600B:
//        FormsArr[FormTag].Tag := idRack1600B;
//    end;
//  end;
  CurBlockSelected := FormTag;

//  if FormsArr[FormTag].Showing then
//  begin
//    FormsArr[FormTag].SetFocus;
//  end
//  else
//  begin
//    FormsArr[FormTag].Caption := UnitsNames[FormTag];
//    if FormTag <> idOscillographC then
//    begin
      //FormsArr[FormTag].AutoScroll := True;
      //FormsArr[FormTag].Align := alNone;
    //end;
//                                          Показать кнопку "Назад" поверх
//                                          всех форм, кроме StationR414Form
//                                          Она потеряет фокус но останется
//                                          наверху Z-последовательности
//                                          При этом учитывается, не
//                                          перекрывает ли она форму-стойку
//    ButtonBackForm.ShowConsideringOtherForm(
//      FormsArr[FormTag].Left + FormsArr[FormTag].Width,
//      FormsArr[FormTag].VertScrollBar.Visible);

//    FormsArr[FormTag].Show;               //Показать форму-стойку
//  end;

  case FormTag of
    //Слева от пульта:
    0 : SelectedRack := Mshu_A;
    1 : SelectedRack := Generator_A;
    2 : SelectedRack := Duplexer_A;
    3 : SelectedRack := Rack_1500_A;
    4 : SelectedRack := Rack_1920_A;
    5 : SelectedRack := Rack_1600_A;
    6 : SelectedRack := Wavemeter_A;
    7 : SelectedRack := Rack_1200_reciever_A;
    8 : SelectedRack := Rack_1200_broadcaster_A;
    9 : SelectedRack := P321_A;
    10: SelectedRack := Rack_1710;

    //В районе пульта:
    11: SelectedRack := Console_A;
    12: SelectedRack := Console_B;
    13: SelectedRack := P321_C;       //Полукомплект, стоящий над пультом
                                      //Не известно, кто в коде назвал его "B",
                                      //но для пользователя он обозначен как "C"
    14: SelectedRack := Oscillograph_rack;
    15: SelectedRack := Power_supply;

    //Справа от пульта:
    19: SelectedRack := P321_B;
    16: SelectedRack := Rack_1400;
    17: SelectedRack := Rack_1200_reciever_B;
    18: SelectedRack := Rack_1200_broadcaster_B;
    20: SelectedRack := Rack_1600_B;
    21: SelectedRack := Wavemeter_B;
    22: SelectedRack := Rack_1920_B;
    23: SelectedRack := Rack_1500_B;
    24: SelectedRack := Duplexer_B;
    25: SelectedRack := Generator_B;
    26: SelectedRack := Mshu_B;
    27: SelectedRack := Power_panel;

    //Боковые части стоек
    28: SelectedRack := Rack_1500_back_A;
    29: SelectedRack := Rack_1500_back_B;
    30: SelectedRack := Rack_1600_back_A;
    31: SelectedRack := Rack_1600_back_B

    //По идее, это недостижимое состояние и предназначено
    //для того, чтобы в случае чего обнаружить отсутствие
    //в операторе case выбора какой-либо стойки
    else SelectedRack := Generator_A;
  end;
  StationR414MinForm.SelectRack(SelectedRack);
  Hide;
end;


{$REGION 'Обработчики кликов по блокам'}


procedure TStationR414Form.img104Click(Sender: TObject);
var Rack1200A_PRM: TRack1200LeftForm;
begin
  Rack1200A_PRM:=TRack1200LeftForm.Create(self,1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRM.VertScrollBar.Position:=1297;
end;

procedure TStationR414Form.img1Click(Sender: TObject);
var Rack1200A_PRM: TRack1200LeftForm;
begin
  Rack1200A_PRM:=TRack1200LeftForm.Create(self,1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRM.VertScrollBar.Position:=1651;
end;

procedure TStationR414Form.img2Click(Sender: TObject);
var Rack1200A_PRM: TRack1200LeftForm;
begin
  Rack1200A_PRM:=TRack1200LeftForm.Create(self,1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRM.VertScrollBar.Position:=2215;
end;

procedure TStationR414Form.img3Click(Sender: TObject);
var Rack1200A_PRM: TRack1200LeftForm;
begin
  Rack1200A_PRM:=TRack1200LeftForm.Create(self,1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRM.VertScrollBar.Position:=2773;
end;

procedure TStationR414Form.imgRack1600BClick(Sender: TObject);
var
Rack1600B: TRack1600Form;
begin
  Rack1600B:= TRack1600Form.Create(Self, 2, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1600B.VertScrollBar.Position:=0;
end;


procedure TStationR414Form.imgShitClick(Sender: TObject);
var PowerPanel: TBlockPowerPanelForm;
begin
PowerPanel:=TBlockPowerPanelForm.Create(self, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgP321AClick(Sender: TObject);
var RackP321A: TRackP321Form;
begin
RackP321A:=TRackP321Form.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgRack1500AClick(Sender: TObject);
var Rack1500A: TRack1500Form;
begin
Rack1500A:=TRack1500Form.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1500A.VertScrollBar.Position := 0;
  //Rack1500A.Show;
end;

procedure TStationR414Form.imgRack1500BClick(Sender: TObject);
var Rack1500B: TRack1500Form;
begin
Rack1500B:=TRack1500Form.Create(self, 2, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  //Rack1500B.VertScrollBar.Position := 948;
end;

procedure TStationR414Form.img11Click(Sender: TObject);
var Rack1920B: TRack1920Form;
begin
Rack1920B:=TRack1920Form.Create(self, 2, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1920B.VertScrollBar.Position := 0;
end;


procedure TStationR414Form.img8Click(Sender: TObject);
var
  Rack1500A: TRack1500Form;
begin
  Rack1500A := TRack1500Form.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  //Rack1500a.Show;
  Rack1500A.VertScrollBar.Position:=0;
end;

procedure TStationR414Form.img100Click(Sender: TObject);
  var
  Rack1920B: TRack1920Form;
begin
  Rack1920B := TRack1920Form.Create(self, 2, Station, TaskController);
  //Rack1920B.Show;

  SpawnForm((Sender as TImage).Tag);
  Rack1920B.VertScrollBar.Position:=779;
end;

procedure TStationR414Form.img13Click(Sender: TObject);
  var
  Rack1600B: TRack1600Form;
begin
  Rack1600B := TRack1600Form.Create(self, 2, Station, TaskController);
  //Rack1600B.Show;

  SpawnForm((Sender as TImage).Tag);
  Rack1600B.VertScrollBar.Position:=1506;
end;

procedure TStationR414Form.imgVolnomerBClick(Sender: TObject);
var WaveMeterB: TBlockWaveMeterForm;
begin
  WaveMeterB:= TBlockWaveMeterForm.Create(self, 0, Station, TaskController);
  //WaveMeterB.Show;

  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgVolnomerAClick(Sender: TObject);
var WaveMeterA: TBlockWaveMeterForm;
begin
WaveMeterA:=TBlockWaveMeterForm.Create(self, 0, Station, TaskController);
//WaveMeterA.Show;
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.img14Click(Sender: TObject);
var
Rack1200B_PRM:TRack1200LeftForm;
begin
Rack1200B_PRM:= TRack1200LeftForm.Create(Self, 2, Station, TaskController);
//Rack1200B_PRM.Show;

  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRM.VertScrollBar.Position:=0;
end;

procedure TStationR414Form.img15Click(Sender: TObject);
var
Rack1200B_PRM:TRack1200LeftForm;
begin
Rack1200B_PRM:= TRack1200LeftForm.Create(Self, 2, Station, TaskController);
//Rack1200B_PRM.Show;

  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRM.VertScrollBar.Position:=729;
end;

procedure TStationR414Form.img102Click(Sender: TObject);
var
Rack1200B_PRM:TRack1200LeftForm;
begin
Rack1200B_PRM:= TRack1200LeftForm.Create(Self, 2, Station, TaskController);
//Rack1200B_PRM.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRM.VertScrollBar.Position:=1297;
end;

procedure TStationR414Form.img16Click(Sender: TObject);
var
Rack1200B_PRM:TRack1200LeftForm;
begin
Rack1200B_PRM:= TRack1200LeftForm.Create(Self, 2, Station, TaskController);
//Rack1200B_PRM.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRM.VertScrollBar.Position:=1651;
end;

procedure TStationR414Form.img17Click(Sender: TObject);
var
Rack1200B_PRM:TRack1200LeftForm;
begin
Rack1200B_PRM:= TRack1200LeftForm.Create(Self, 2, Station, TaskController);
//Rack1200B_PRM.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRM.VertScrollBar.Position:=2215;
end;

procedure TStationR414Form.img18Click(Sender: TObject);
var
Rack1200B_PRM:TRack1200LeftForm;
begin
Rack1200B_PRM:= TRack1200LeftForm.Create(Self,2, Station, TaskController);
//Rack1200B_PRM.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRM.VertScrollBar.Position:=2773;
end;

procedure TStationR414Form.img106Click(Sender: TObject);
var Rack1500A: TRack1500Form;
begin
  Rack1500A:= TRack1500Form.Create(self, 1, Station, TaskController);
  CurBlockSelected := 5;
  SpawnForm((Sender as TImage).Tag);
  //Rack1500A.Show;
  Rack1500A.VertScrollBar.Position:=948;
end;

procedure TStationR414Form.img20Click(Sender: TObject);
var  Rack1200B_PRD: TRack1200RightForm;
begin
  Rack1200B_PRD:=TRack1200RightForm.Create(Self, 2, Station, TaskController);
  //Rack1200B_PRD.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRD.VertScrollBar.Position:=0;
end;

procedure TStationR414Form.img21Click(Sender: TObject);
var  Rack1200B_PRD: TRack1200RightForm;
begin
Rack1200B_PRD:= TRack1200RightForm.Create(self, 2, Station, TaskController);
//Rack1200B_PRD.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRD.VertScrollBar.Position:=673;
end;

procedure TStationR414Form.img101Click(Sender: TObject);
var   Rack1200B_PRD: TRack1200RightForm;
begin
Rack1200B_PRD:=  TRack1200RightForm.Create(Self, 2, Station, TaskController);
//Rack1200B_PRD.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRD.VertScrollBar.Position:=1235;
end;

procedure TStationR414Form.img22Click(Sender: TObject);
var  Rack1200B_PRD: TRack1200RightForm;
begin
Rack1200B_PRD:= TRack1200RightForm.Create(self, 2, Station, TaskController);
//Rack1200B_PRD.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRD.VertScrollBar.Position:=1772;
end;

procedure TStationR414Form.img23Click(Sender: TObject);
var  Rack1200B_PRD: TRack1200RightForm;
begin
Rack1200B_PRD:= TRack1200RightForm.Create(self, 2, Station, TaskController);
//Rack1200B_PRD.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRD.VertScrollBar.Position:=2315;
end;

procedure TStationR414Form.img24Click(Sender: TObject);
var  Rack1200B_PRD: TRack1200RightForm;
begin
Rack1200B_PRD:= TRack1200RightForm.Create(self, 2, Station, TaskController);
//Rack1200B_PRD.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1200B_PRD.VertScrollBar.Position:=2703;
end;

procedure TStationR414Form.imgGenerAClick(Sender: TObject);
var GeneratorA: TBlockGeneratorForm;
begin
  GeneratorA:= TBlockGeneratorForm.Create(Self, 1, Station, TaskController);
  //GeneratorA.Show;
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgMshuAClick(Sender: TObject);
var Mshu: TBlockLittleNoisyAmplifierForm;
begin
Mshu:= TBlockLittleNoisyAmplifierForm.Create(self,1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgGenerBClick(Sender: TObject);
var GeneratorB: TBlockGeneratorForm;
begin
GeneratorB:= TBlockGeneratorForm.Create(Self, 2, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgMshuBClick(Sender: TObject);
var MshuB: TBlockLittleNoisyAmplifierForm;
begin
MshuB:= TBlockLittleNoisyAmplifierForm.Create(Self,2, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.img19Click(Sender: TObject);
var Rack1920A: TRack1920Form;
begin
  Rack1920A:=TRack1920Form.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1920A.VertScrollBar.Position:=0;
end;

procedure TStationR414Form.img25Click(Sender: TObject);
var Rack1710A: TRack1710Form;
begin
Rack1710A:=TRack1710Form.Create(self, Station, TaskController);
//Rack1710A.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1710A.VertScrollBar.Position:=0;
end;

procedure TStationR414Form.img107Click(Sender: TObject);
var Rack1710A: TRack1710Form;
begin
Rack1710A:=TRack1710Form.Create(self, Station, TaskController);
//Rack1710A.Show;
  SpawnForm((Sender as TImage).Tag);
  Rack1710A.VertScrollBar.Position:=426;
end;

procedure TStationR414Form.imgRack1710Click(Sender: TObject);
var Rack1710A: TRack1710Form;
begin
Rack1710A:=TRack1710Form.Create(self, Station, TaskController);
  //Rack1710A.Show;
  Rack1710A.VertScrollBar.Position:=871;
end;

procedure TStationR414Form.imgRack1920AClick(Sender: TObject);
var Rack1920A: TRack1920Form;
begin
Rack1920A:=TRack1920Form.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgRack1920BClick(Sender: TObject);
var Rack1920B: TRack1920Form;
begin
      Rack1920B:=TRack1920Form.Create(self, 2, Station, TaskController);
      //Rack1920B.Show;
  SpawnForm((Sender as TImage).Tag);
end;



procedure TStationR414Form.imgDuplexerBClick(Sender: TObject);
var DuplexerB: TBlockDuplexerForm;
begin
DuplexerB:= TBlockDuplexerForm.Create(self, 2, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgRack1400Click(Sender: TObject);
var RackB1400: TRack1400Form;
begin
RackB1400:=TRack1400Form.Create(self, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  RackB1400.VertScrollBar.Position:=2283;
end;

procedure TStationR414Form.imgDuplexerAClick(Sender: TObject);
var DuplexerA: TBlockDuplexerForm;
begin
DuplexerA:= TBlockDuplexerForm.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgP321CClick(Sender: TObject);
var RackP321C: TRackP321Form;
begin
RackP321C  := TRackP321Form.Create(self,3, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgP321BClick(Sender: TObject);
var RackP321B: TRackP321Form;
begin
RackP321B  := TrackP321Form.Create(self, 2, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.img105Click(Sender: TObject);
var Rack1920A: TRack1920Form;
begin
Rack1920A:=TRack1920Form.Create(Self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1920A.VertScrollBar.Position:=779;
end;

procedure TStationR414Form.img26Click(Sender: TObject);
var Rack1920A: TRack1920Form;
begin
  Rack1920A:=TRack1920Form.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1920A.VertScrollBar.Position:=1506;
end;

procedure TStationR414Form.imgRack1600AClick(Sender: TObject);
var
Rack1600A: TRack1600Form;
begin
  Rack1600A:= TRack1600Form.Create(self, 1, Station, TaskController);
  SpawnForm(idRack1600A);
  Rack1600A.VertScrollBar.Position := 0;
end;

procedure TStationR414Form.img27Click(Sender: TObject);
var Rack1200A_PRM: TRack1200LeftForm;
begin
  Rack1200A_PRM:=TRack1200LeftForm.Create(self,1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRM.VertScrollBar.Position:=0;
end;

procedure TStationR414Form.img28Click(Sender: TObject);
var Rack1200A_PRM: TRack1200LeftForm;
begin
  Rack1200A_PRM:=TRack1200LeftForm.Create(self,1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRM.VertScrollBar.Position:=729;
end;



procedure TStationR414Form.img4Click(Sender: TObject);
var Rack1200A_PRD: TRack1200RightForm;
begin
Rack1200A_PRD:= TRack1200RightForm.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRD.VertScrollBar.Position:=0;
end;

procedure TStationR414Form.img5Click(Sender: TObject);
var Rack1200A_PRD: TRack1200RightForm;
begin
Rack1200A_PRD:= TRack1200RightForm.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRD.VertScrollBar.Position:=673;
end;

procedure TStationR414Form.imgRack1200A2Click(Sender: TObject);
var Rack1200A_PRD: TRack1200RightForm;
begin
Rack1200A_PRD:= TRack1200RightForm.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRD.VertScrollBar.Position:=1235;
end;

procedure TStationR414Form.img6Click(Sender: TObject);
var Rack1200A_PRD: TRack1200RightForm;
begin
Rack1200A_PRD:= TRack1200RightForm.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRD.VertScrollBar.Position:=1772;
end;

procedure TStationR414Form.img7Click(Sender: TObject);
var Rack1200A_PRD: TRack1200RightForm;
begin
Rack1200A_PRD:= TRack1200RightForm.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRD.VertScrollBar.Position:=2315;
end;


procedure TStationR414Form.img9Click(Sender: TObject);
var Rack1200A_PRD: TRack1200RightForm;
begin
Rack1200A_PRD:= TRack1200RightForm.Create(self, 1, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  Rack1200A_PRD.VertScrollBar.Position := 2703;
end;

procedure TStationR414Form.imgPowerClick(Sender: TObject);
var PowerSupply: TBlockPowerSupplyForm;
begin
PowerSupply:=TBlockPowerSupplyForm.Create(self, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;

procedure TStationR414Form.imgPultAClick(Sender: TObject);
var RemotePult: T_Pult;
begin
RemotePult:=T_Pult.Create(Self, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  RemotePult.VertScrollBar.Position:=0;
  RemotePult.HorzScrollBar.Position:=0;
end;

procedure TStationR414Form.imgPultBClick(Sender: TObject);
var RemotePult: T_Pult;
begin
RemotePult:=T_Pult.Create(Self, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
  RemotePult.VertScrollBar.Position:=0;
  RemotePult.HorzScrollBar.Position:=411;
end;

procedure TStationR414Form.imgOscillographClick(Sender: TObject);
var BlockOscillograph: TBlockOscillographForm;
begin
BlockOscillograph:= TBlockOscillographForm.Create(self, Station, TaskController);
  SpawnForm((Sender as TImage).Tag);
end;
{$ENDREGION}


procedure TStationR414Form.lvTaskCustomDrawItem(Sender: TCustomListView; Item: TListItem;
  State: TCustomDrawState; var DefaultDraw: Boolean);
var
  intA: Integer;
begin
  If Item.SubItems[2] = stTaskPassed then
    lvTask.Canvas.Brush.Color := clLime
  else
  begin
    lvTask.Canvas.Brush.Color := RGB($FD, $BF, $C1);
  end;
end;

procedure TStationR414Form.lvTaskMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  li: TListItem;
  SpawnedFormId: Byte;
begin
  with lvTask do
  begin
    li := GetItemAt(10, Y);
    if Assigned(li) then
    begin
      lvTaskSelectedId := StrToInt(li.Caption);
      if Station.WorkType = wtLearn then
      begin
        if Button = mbLeft then
        begin
          SpawnedFormId := TaskController.GetRackCodeByTaskId(lvTaskSelectedId);
          if SpawnedFormId <> NotSelected then
          begin
            SpawnForm(SpawnedFormId);
          end;
        end;
      end;
    end;
  end;
end;

procedure TStationR414Form.N1Click(Sender: TObject);
var
  SpawnedFormId: Byte;
begin
  if lvTaskSelectedId <> NotSelected then
  begin
    if Station.WorkType = wtLearn then
    begin
      SpawnedFormId := TaskController.GetRackCodeByTaskId(lvTaskSelectedId);
      if SpawnedFormId <> NotSelected then
      begin
        SpawnForm(SpawnedFormId);
      end;
    end;
  end;
end;

procedure TStationR414Form.N2Click(Sender: TObject);
begin
  if lvTaskSelectedId <> NotSelected then
  begin
    DisplayVideoHelpInTreningMode(lvTaskSelectedId);
  end;
end;

/// <summary>
/// Настраивает вид списка заданий на крупном виде Р414
/// </summary>
procedure TStationR414Form.TuneTaskList;
begin
  case Station.WorkType of
    wtLearn:
    begin
      lvTask.Columns.Items[1].MaxWidth := lvTask.Width
        - lvTask.Columns.Items[0].Width
        - lvTask.Columns.Items[2].Width
        - lvTask.Columns.Items[3].Width       // Ширина столбика с заданиями
        - GetSystemMetrics(SM_CXHSCROLL);     // - всё свободное пространство
      lvTask.Columns.Items[1].Width := lvTask.Columns.Items[1].MaxWidth;
      lvTask.Update;
    end;

    wtTrening:
    begin
      lvTask.Columns.Items[1].MinWidth := 0; // Скрываем столбик с заданиями,
      lvTask.Columns.Items[1].MaxWidth := 1; // которые расцениваются как
      lvTask.Columns.Items[1].Width := 0;    // подсказки
      lvTask.Update;
                      //Способ не очень удачный, но лучше ничего не придумал
    end;
  end;

end;


 procedure TStationR414Form.SetBlockRed(IdEnum: TRacksEnum);
 var Id: integer;
 begin
       if IdEnum<>none then
       begin
         Id:= Ord(IdEnum);
              imgRed.Visible := True;
              imgRed.BringToFront;
              imgRed.Left := BgImages[Id].Left;
              imgRed.Top := BgImages[Id].Top;
              imgRed.Height := BgImages[Id].Height;
              imgRed.Width := BgImages[Id].Width;
              imgRed.Repaint;
              imgRed.Invalidate;
              imgBgStationR414Form.Repaint;
              imgBgStationR414Form.Invalidate;
       end
       else
       begin
           imgRed.Visible := False;
              imgRed.Left := 0;
              imgRed.Top := 0;
              imgRed.Height := 0;
              imgRed.Width := 0;
              imgRed.Repaint;
              imgRed.Invalidate;
              imgBgStationR414Form.Repaint;
              imgBgStationR414Form.Invalidate;
       end;
 end;


 //отмечает блок красным прямоугольником и меняет текст задания
 procedure TStationR414Form.ChangeTaskTextBlock(Sender: TObject);
 begin
     SetBlockRed(TaskController.GetCurSubTaskBlock);
     CurrentTaskForm.SetMyText(TaskController.CurrentTask.CurrentSubTask.Text);
     CurrentTaskForm.TaskInfo.Color:= clLime;
     CurrentTaskForm.ReturnWhite:= 3;
     CurrentTaskForm.Repaint;
 end;

 procedure TStationR414Form.TaskComplete(Sender: TObject);
 begin
      SetBlockRed(TRacksEnum.none);
     CurrentTaskForm.SetMyText( 'Задание выполнено. Нажмите кнопку "Завершить выполнение" для выхода и получения статистики');
 end;

   procedure TStationR414Form.StartNetTaskError(Sender: TObject);
  begin
    ClientState.StartNetTaskStatus:='done';  // если уже запущено задание невозможно начать по сети задание
    NetWorker.SendParams(KEY_STARTNETTASK, 'done');
  end;

end.
