unit uDefinitionsDM;

  interface

  uses
    uVideoHelpForm,
    StdCtrls,
    WinSock,
    uP321DisplayForm,
    uBlockOscillographMinForm,
    uWaveMeterPanelForm,
    ExtCtrls,
    uMd5,
    SQLite3,
    SQLiteTable3,
    ComCtrls,
    Dialogs,
    Classes,
    Graphics,
    Windows,
    Forms,
    Messages,
    sysutils,
    uConstantsDM,
    uStationStateDM,
    uBackgroundForm;

  const
  {$REGION 'Объявление и инициализация констант'}

  nmLocalNet = 1;
  nmStandalone = 0;
  nmWeb = 2;

  PName = 'Радиорелейная станция P-414';
  Pversion = '1.1.0 dev';

  WebHost = 'uvc.ispu.ru';
  //WebHost = '192.168.0.12';
  WebPort = 80;
  DataScript = 'data.php';

  DefaultNetWorkMode = nmStandalone;

  menuFormsOffset = 2;
  BlocksCount = 27;
  NoOperations = 0;

  ttCommon = 2;
  ttTask = 3;
  ttFree = 1;

//  tkFree = 0;
//  tkOverview = 1;
//  tkInitialization = 2;
//  tkPowerOn = 3;
//  tkReceiveAndTrasmitDevicesSetup = 4;
//  tkWorkWithLowFrequencyDevices = 5;

  VerticalSwitcherUpPosition = 1;
  VerticalSwitcherDownPosition = 2;
  HorisontalSwitcherRightPosition = 2;
  HorisontalSwitcherLeftPosition = 3;
  Switcher1 = 4;
  Switcher2 = 5;

  sfMain = 0;
  sfOverview = 1;
  AllowToCloseNotTunedUnit: Boolean = True;

//  htGeneratorA = 'Генератор (полукомплект A)';
//  htMshuA = 'МШУ (полукомплект А)';
//  htDuplexerA = 'Дуплексер (полукомплект А)';
//  htRack1500A = 'Стойка 1500 (полукомплект А)';
//  htRack1920A = 'Стойка 1920 (полукомплект А)';
//  htRack1600A = 'Стойка 1600 (полукомплект А)';
//  htWaveMeterA = 'Волномер (полукомплект А)';
//  htRack1200A = 'Стойка 1200 (полукомплект А)';
//  htP321A = 'П-321 (полукомплект А)';
//  htRack1710A = 'Стойка 1710 (полукомплект А)';
//  htPultA = 'Коммутационный пульт (полукомплект А)';
//  htPultB = 'Коммутационный пульт (полукомплект Б)';
//  htP321C = 'П-321 (полукомплект С)';
//  htOscillographC = 'Осциллограф (полукомплект С)';
//  htPowerC = 'Питание (полукомплект С)';
//  htRack1400B = 'Стойка 1400 (полукомплект Б)';
//  htRack1200B = 'Стойка 1200 (полукомплект Б)';
//  htP321B = 'П-321 (полукомплект Б)';
//  htRack1600B = 'Стойка 1600 (полукомплект Б)';
//  htWaveMeterB = 'Волномер (полукомплект Б)';
//  htRack1920B = 'Стойка 1920 (полукомплект Б)';
//  htRack1500B = 'Стойка 1500 (полукомплект Б)';
//  htDuplexerB = 'Дуплексер (полукомплект Б)';
//  htMshuB = 'МШУ (полукомплект Б)';
//  htGeneratorB = 'Генератор (полукомплект Б)';
//  htShit = 'Распредилительный щит';

  stTaskPassed = 'Выполнено';
  stTaskOpened = 'Не выполнено';

  gtGeterodinTuned = 1;
  gtGeterodinNotTuned = 2;

  BaseFileName = 'base.db';

  sttpUdPrm = 2;
  sttpUd2Prm = 3;
  sttpAbonentPrm = 4;
  sttpChannelD = 5;

  sttpUdPrd = 6;
  sttpUd2Prd = 7;
  sttpAbonentPrd = 8;
  sttpChannelM = 9;

  mrYes = 6;
  mrCancel = 2;

  cmdPing = 02;
  cmdPong = 03;

  stGeneral = 1;
  stPassive = 2;

  CloseLabelXAxesOffset = 25;
  CloseLabelYAxesOffset = 150;

  MessageDelemiter = #13#10;

  stcblGenerator = 2;
  stcblInputYY = 3;
                          // Ну и названия им придумали...
  stcblUdlinitel1ST1 = 4; //Один конец первого удлинительного кабеля
  stcblUdlinitel1ST2 = 5; //Другой конец первого удлинительного кабеля
  stcblUdlinitel2ST1 = 6; //Один конец второго удлинительного кабеля
  stcblUdlinitel2ST2 = 7; //Другой конец второго удлинительного кабеля

  cell_PVU_PRD = 359;
  cell_PVU_PRM = 358;

  ScroolValue = 150;

  MaxTuneValue = 32;
  MaxErrorsAllowedWhileTesting = 1000;
  {$ENDREGION}

  {$REGION 'Описание пользовательских структур данных'}




  type pErrors = packed record
    ErrInRack: Integer;
    ErrDescription: string;
  end;

  type pCurUser = packed record
    Name: string;
    Surname: string;
    Patronomyc: string;
    Vzvod: Integer;
    Kurs: Integer;
    ID: LongInt;
    AccessLevelStudy: Byte;
    AccessLevelTrening: Byte;
  end;

  type pHelpImages = packed record
    HelpImage: TImage;
    HelpLabel: TLabel;
  end;

type pDeviation = packed record
  Rack1200A_PRD: Byte;
  Rack1200A_PRM: Byte;
  Rack1200B_PRD: Byte;
  Rack1200B_PRM: Byte;
end;

type pChannelStateEx = packed record
  State: Byte;
end;

type pChannelState = packed record
  ChannelA: array [1..21] of pChannelStateEx;
  ChannelB: array [1..21] of pChannelStateEx;
end;

type pCallPassed = packed record
  TwoChannelMode: pChannelState;
  FourChannelMode: pChannelState;
end;
  {$ENDREGION}

  {$REGION 'Объявление функций'}
  procedure ReturnFromRack;

  function ShowVideoHelpInLearningMode(HelpTaskId: Byte; Error : Boolean): Boolean;
  procedure DisplayHint(ShowHint: Boolean = True);

  //--------------------Функции экспортируемые из DLL---------------------------
  function CreateUser(Name, Surname, Patronomyc: AnsiString; Vzvod, Kurs: Integer; Password: AnsiString): Boolean; cdecl; external 'SQLdll.dll';
  function IsUserExists(Name, Surname, Patronomyc, Password: AnsiString; Vzvod, Kurs: Integer): Boolean; cdecl; external 'SQLdll.dll';
  procedure DeleteUserById(UserId: Integer); cdecl; external 'SQLdll.dll';
  procedure UpdateUser(UserId: Integer; Name, Surname, Patronomyc: AnsiString; Vzvod, Kurs: Integer); cdecl; external 'SQLdll.dll';
  procedure PutLog(USER_ID: INTEGER; VALUE: AnsiString); cdecl; external 'SQLdll.dll';
  procedure ClearLog; cdecl; external 'SQLdll.dll';
  procedure AddAchieve(USER_ID: INTEGER; OZENKA: REAL; SecondsPassed: LongInt; TASK_ID: Integer; TASK_TYPE: Integer);cdecl;external 'SQLdll.dll';
  procedure ClearAchieveForUser(USER_ID: INTEGER); cdecl; external 'SQLdll.dll';
  procedure ClearAllAchieve; cdecl; external 'SQLdll.dll';
  procedure GetAchieve(USER_ID: Integer; var DataList: TListView); cdecl; external 'SQLdll.dll';
  procedure GetUserLog(USER_ID: Integer; var VALUE, DATA: TStringList); cdecl; external 'SQLdll.dll';
  procedure GetLog(var LogList,DataList: TStringList); cdecl; external 'SQLdll.dll';
  function GetUserId(Name, Surname, Patronomyc: AnsiString; Vzvod, Kurs: Integer): LongInt; cdecl; external 'SQLdll.dll';
  function GetHost: PAnsiChar; cdecl; external 'SQLdll.dll';
  function GetPort: Integer; cdecl; external 'SQLdll.dll';
  function GetNetWorkMode: Integer; cdecl; external 'SQLdll.dll';
  procedure SetHost(Host: AnsiString); cdecl; external 'SQLdll.dll';
  procedure SetPort(Port: Integer); cdecl; external 'SQLdll.dll';
  procedure SetNetworkMode(NetWorkMode: Byte); cdecl; external 'SQLdll.dll';
  function GetUserAccessLevelStudy(UserID: Integer): Byte; cdecl; external 'SQLdll.dll';
  procedure SetUserAccessLevelStudy(UserID: Integer; AccessLevel: Byte); cdecl; external 'SQLdll.dll';
  function GetUserAccessLevelTrening(UserID: Integer): Byte; cdecl; external 'SQLdll.dll';
  procedure SetUserAccessLevelTrening(UserID: Integer; AccessLevel: Byte); cdecl; external 'SQLdll.dll';


  procedure DisplayVideoHelpInTreningMode(HelpTaskId: Byte);
  function NotByte(InputByte: Byte): Byte;
  function IsReallyNedeedToSpawnThisRack(btSpawnedRackId: Byte): Boolean;

  function BoolToByteInv(tmpBool: Boolean): Byte;
  procedure SpawnTrubka(MKT_ID: Byte);

  function IsUdlinitelCableConnectedAtDeModulator(tmpUdlinitel: pUdlinitelCable): Boolean;
  function IsUdlinitelCableConnectedAtModulator(tmpUdlinitel: pUdlinitelCable): Boolean;
  function IsUdlinitelCableKonezConnectedAtModulator(tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  function IsUdlinitelCableKonezConnectedAtDeModulator(tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  function IsUdlinitelCableConnectedAtHighOhmInputCell(tmpUdlinitel: pUdlinitelCable): Boolean;
  function IsUdlinitelCableKonezConnectedAtHighOhmInputCell(tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  function IsUdlinitelCableConnectedAtReserveLineCell(tmpUdlinitel: pUdlinitelCable): Boolean;
  function GetChannelIdByCellId(tmpCellId: Integer): Integer;
  function IsUdlinitelCableKonezConnectedAtReserveLineCell(tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  function GetReserveLineCellIdByUdlinitelCableId(tmpUdlinitel: pUdlinitelCable): Byte;

  procedure Initialise;

  function GetPolukomplektCodeByCableKonez(CabelKonez: pUdlinitelKonez): Byte;
  procedure SendMyStationParams;
  function IsReadyToSoprajenie: Byte;
  //function IsAnyRackShowing: Boolean;
  function CompareStations(Station1, Station2: TStation): Boolean;
  procedure AddExamError(ErrInRack: Byte; ErrDescription: string);



  {$ENDREGION}

  var
    {$REGION 'Объявление переменных'}

    //FormsArr: array [0..31] of TForm; //pointers
    //CurFormId: Integer; //ID currently displaying form

    //Окна с подсказками
    HelpImages: array of pHelpImages;

    //Массивы содержащие ID гнезд модулятора/демодулятора пульта
    ModulatorPlacesA,
    ModulatorPlacesB,
    DeModulatorPlacesA,
    DeModulatorPlacesB: array [1..COUNT_CHANNELS] of Integer;

    stDeviation: pDeviation;
    stCallPassed: pCallPassed;

    CountAvailableHints: Integer;   //Количество доступных подсказок

    NeedToCountTime: Boolean;
    PassedSeconds: LongInt;
    JmpFormId: Byte = NotSelected;

    PassedLevelId: Byte;
    ErrorForLevelGiven: array [1..5] of Byte;
    ExamErrors, Errors: array of pErrors;

    CurUser: pCurUser;
    CurBlockSelected: Byte;
    CurTaskId: Byte;
    {$ENDREGION}
implementation

uses
  uBlockRemoteControllerForm,
  uUsersForm,
  uFilterForm,
  uHandsetForm,
  uRack1400Form,
  uRackP321Form,
  uBlockLittleNoisyAmplifierForm,
  uRack1500bForm,
  uRack1500Form,
  uRack1710Form,
  uRack1600BForm,
  uRack1600Form,
  uRack1920Form,
  uRack1200RightForm,
  uRack1200LeftForm,
  uBlockDuplexerForm,
  uPassWordForm,
  uStationR414Form,
  uAdditionalFormMethods,
  uCurrentTaskForm,
  uTasksDM,
  uMainMenuModernForm,
  uRandomMethods,
  uTaskControllerDM,
  uStationInitializer;

procedure AddExamError(ErrInRack: Byte; ErrDescription: string);
begin
  SetLength(ExamErrors, Length(ExamErrors) + 1);
  ExamErrors[Length(ExamErrors) - 1].ErrInRack := ErrInRack;
  ExamErrors[Length(ExamErrors) - 1].ErrDescription := ErrDescription;
end;

/// <summary>
///   Инициализирует систему при создании нового задания
/// </summary>
procedure Initialise;
var
  btA: Byte;
begin
  {$REGION 'Инициализация'}
  CloseStationR414FormFlag := 0;
  CountAvailableHints := 3;
  //_Pult.SelectedCable := NotSelected;

  SetLength(Errors, 0);                     // Очистить массив с ошибками
  SetLength(ExamErrors, 0);
  PassedLevelId := mdExternalView;          // Обнулить ID пройденного задания

  for btA := 1 to 5 do                      // Сбросить счётчик ошибок
    ErrorForLevelGiven[btA] := 0;           // для каждого задания

  //RackP321MinForm.Close;                    //  ??????????????
  //P321DisplayForm.Close;                    // Почему именно здесь надо закрывать?
  //BlockOscillographMinForm.Close;

  if Station.WorkType = wtExam then
  begin
    CurTaskId := mdExternalView;
    //FilterForm.SetCountHint(0);
    Station.WorkMode := mdExternalView;
  end;

  {$REGION 'Инициализация переменных для задания "Работа с низкочастотным оборудованием"'}
  //Девиация не проверена - 5 задание
  stDeviation.Rack1200A_PRD := stNotPassed;
  stDeviation.Rack1200A_PRM := stNotPassed;
  stDeviation.Rack1200B_PRD := stNotPassed;
  stDeviation.Rack1200B_PRM := stNotPassed;

  //Нет вызовов по каналам - 5 задание
  for btA := 1 to 21 do
  begin
    stCallPassed.FourChannelMode.ChannelA[btA].State := stNotPassed;
    stCallPassed.FourChannelMode.ChannelB[btA].State := stNotPassed;
    stCallPassed.TwoChannelMode.ChannelA[btA].State := stNotPassed;
    stCallPassed.TwoChannelMode.ChannelB[btA].State := stNotPassed;
  end;
  {$ENDREGION}

  if useBackground then
    //BackgroundForm.Show;

  if (Station.WorkType <> wtExam)
    and (Station.WorkMode = mdExternalView) then
    ShowMessage(Task1Description);

 // LoadSubject;                          // Загрузить список заданий
  //LoadInitialState;                     // Инициализировать стойки
  ClearPassedTasksLists;                // Очистить списки пройденных заданий

  if Station.WorkType = wtExam then
  begin
    ShowMessage('Выполните норматив 82');
  end;

  //StationR414Form.CheckProgress;

  //FilterForm.SetStationWave(Station.WaveTransmitA, Station.WaveTransmitB,
    //Station.WaveReceiveA, Station.WaveReceiveB);
  //FilterForm.StartTimer;

  {$ENDREGION}
end;

//Процедура посылает данные, необходимые для сопряжения двух ПК серверу
procedure SendMyStationParams;
var
  strStationParams: string;
begin
  strStationParams := '';
  //Определим каким полукомплектом входим в сопряжение
  if Station.IsPolukomplektATunedOK then
  begin
    strStationParams := '1' + IntToStr(Station.HalfSetA.Duplexer.waveTransmit) + ':'
      + IntToStr(Station.HalfSetA.Duplexer.waveReceive);
  end;

  if Station.IsPolukomplektBTunedOK then
  begin
    if strStationParams <> '' then
      strStationParams := strStationParams + ':';

    strStationParams := strStationParams + '2'
        + IntToStr(Station.HalfSetB.Duplexer.waveTransmit) + ':'
        + IntToStr(Station.HalfSetB.Duplexer.waveReceive);
  end;

  //PushToSocket(chMyParams, strStationParams);
end;

function GetPolukomplektCodeByCableKonez(CabelKonez: pUdlinitelKonez): Byte;
begin
  Result := NotSelected;
  if (1 < CabelKonez.stKonez) and (CabelKonez.stKonez < 169) then
  begin
    Result := 1;
  end;
  if (168 < CabelKonez.stKonez) and (CabelKonez.stKonez < 337) then
  begin
    Result := 2;
  end;
end;

procedure SpawnTrubka(MKT_ID: Byte);
begin
  HandsetForm.Tag := MKT_ID;
  HandsetForm.Show;
end;



function BoolToByteInv(tmpBool: Boolean): Byte;
begin
  if tmpBool then
    Result := 0
  else
    Result := 1;
end;

function IsReadyToSoprajenie: Byte;
begin
  Result := 0;
  if (Station.IsPolukomplektATunedOK and Station.IsPolukomplektBTunedOK) then
  begin
    Result := 1;
    Exit;
  end;
  if (Station.IsPolukomplektATunedOK) then
  begin
    Result := 2;
    Exit;
  end;
  if (Station.IsPolukomplektBTunedOK) then
  begin
    Result := 3;
    Exit;
  end;
end;

function NotByte(InputByte: Byte): Byte;
begin
  if InputByte = 1 then
    Result := 0
  else
    Result := 1;
end;

/// <summary>
///   Проверяет, нужно ли открывать окно стойки в режиме обучения
/// </summary>
function IsReallyNedeedToSpawnThisRack(btSpawnedRackId: Byte): Boolean;
var
  Passed: Boolean;
begin
  Passed := False;
  case Station.WorkMode of
    mdExternalView:
      begin
        Passed := True;
      end;
    mdStartParametersSetup:
      begin
        Passed := Boolean(Task2RackCodeArr[btSpawnedRackId] <> NotSelected);
      end;
    mdPowerOn:
      begin
        Passed := Boolean(Task3RackCodeArr[btSpawnedRackId] <> NotSelected);
      end;
    mdReceiveAndTransmitTracksSetup:
      begin
        Passed := Boolean(Task4RackCodeArr[btSpawnedRackId] <> NotSelected);
      end;
    mdWorkWithLowFrequency:
      begin
        Passed := Boolean(Task5RackCodeArr[btSpawnedRackId] <> NotSelected);
      end;
  end;
  Result := Passed;
end;

{$REGION 'Не известно, запускается ли вообще поток, в котором работают эти функции'}
{ TODO: перенести эту функцию на форму, которая отображает подсказку}

procedure DisplayHint(ShowHint: Boolean = True);
const
  HeightPerLine = 24;
  WidthPerLitera = 10;
var
  HintStr, OutHintStr: string;
  LinesCount: Byte;
  LitersCountPerLine: Integer;
  btA: Byte;
  textInTreningMode: string;        //Текст, показывающийся в режиме тренировки
begin
 // HintForm.lblHintString.Caption := '';
  if (Station.WorkType = wtTrening) then
  begin
    if ShowHint then
    begin
      if CountAvailableHints <= 0 then
      begin
        Application.MessageBox('У Вас больше не осталось подсказок! '
                              + 'Возможно Вам стоит пройти обучение еще раз?',
          PChar(PName), MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Dec(CountAvailableHints, 1);
    end;

    textInTreningMode := 'Кликните здесь, чтобы отобразить подсказку'
                          + #10
                          + 'Подсказок осталось: '
                          + IntToStr(CountAvailableHints);
    //if Station.WorkType = wtTrening then  //без этой ненужной проверки иногда
    //  TCurrentTaskForm.SetText(textInTreningMode);//вылетают exceptions

    //gfCurrentTaskForm.Perform(MM_SETTEXT, LongInt(@textInTreningMode), 0); //Инициируем событие SetText
  end;

  if Station.WorkType = wtLearn then
    //FilterForm.SetCountHint(99)
  else
    //FilterForm.SetCountHint(CountAvailableHints);

  if ShowHint then
  begin
    //HintStr := GetNextTaskString;

    if HintStr <> '' then
    begin
      OutHintStr := '';
      LinesCount := 0;

      //TCurrentTaskForm.SetText(HintStr);
      //CurrentTaskForm.Perform(MM_SETTEXT, LongInt(@HintStr), 0); //Инициируем событие SetText
    end;
  end;

  //CurrentTaskForm.Show;
end;

{
procedure THintThread.Execute;
begin
  if Station.WorkType = wtLearn then
  begin
    DisplayHint;
  end;
  if Station.WorkType = wtTrening then
  begin
    DisplayHint(False);
  end;
end;
 }
{$ENDREGION}


/// <summary>
/// Показывает видео-подсказку
/// </summary>
/// <param name="HelpTaskId"></param>
procedure DisplayVideoHelpInTreningMode(HelpTaskId: Byte);
begin
  if (Station.WorkType = wtLearn) or (Station.WorkType = wtTrening) then
  begin
    if (Station.WorkType = wtTrening) then
    begin
      if CountAvailableHints = 0 then
      begin
        Application.MessageBox('Вы исчерпали лимит подсказок!', PChar(PName),
          MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Dec(CountAvailableHints, 1);
    end;
    //Переназначение вызовов имен файлов справок, для того, чтобы не
    //вызывать разные файлы на одинаковые блоки разных полукомплектов
    if Station.WorkMode = mdStartParametersSetup then
    begin
      case HelpTaskId of
        10, 12:
          HelpTaskId := 6;
        13:
          HelpTaskId := 7;
        14:
          HelpTaskId := 8;
        15:
          HelpTaskId := 5;
        16:
          HelpTaskId := 4;
        17:
          HelpTaskId := 3;
        18:
          HelpTaskId := 2;
        19:
          HelpTaskId := 1;
      end;
    end;
    if Station.WorkMode = mdPowerOn then
    begin
      case HelpTaskId of
        7:
          HelpTaskId := 2;
        6:
          HelpTaskId := 3;
      end;
    end;
    if Station.WorkMode = mdReceiveAndTransmitTracksSetup then
    begin
      case HelpTaskId of
        5:
          HelpTaskId := 1;
        6:
          HelpTaskId := 2;
        4:
          HelpTaskId := 3;
      end;
    end;
    //VideoHelpForm.PlayVideo(IntToStr(Station.WorkMode) + '\' + IntToStr(HelpTaskId) + '.avi');
  end;
end;

function ShowVideoHelpInLearningMode(HelpTaskId: Byte; Error : Boolean): Boolean;
var
  mbRes, mbWindow: Integer;
  MessageString : string;
begin
  if (HelpTaskId <> NotSelected) and (HelpTaskId <> NotHint) then
  begin
    mbWindow := MB_YESNO;
    Result := False;
    MessageString := '';
    if Error then
    begin
        MessageString := 'Ошибка настройки блока. ';
        mbWindow := MB_YESNOCANCEL;
    end;
    MessageString := MessageString + 'Хотите воспроизвести подсказку?';
    mbRes := Application.MessageBox(PChar(MessageString),
      PChar(PName + ' version: ' + Pversion), mbWindow + MB_ICONINFORMATION
      + MB_TOPMOST);
    case mbRes of
      mrYes:
        DisplayVideoHelpInTreningMode(HelpTaskId);
      mrCancel:
        Exit(False);
    else
      Exit(True);
    end;
  end
  else if HelpTaskId = NotHint  then
  begin
     Application.MessageBox('Ошибка. Для данного блока не задана подсказка.',
      PChar(PName + ' version: ' + Pversion), MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
  end
  else
  begin
    Application.MessageBox('Ошибка. Выберите блок.',
      PChar(PName + ' version: ' + Pversion), MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
  end;
  Exit(False);
end;

/// <summary>
///   Проверяет, открыта ли хоть одна форма стойки
/// </summary>
//function IsAnyRackShowing: Boolean;
//var
//  btA: Byte;
//begin
//  Result := False;
////  for btA := 0 to Length(FormsArr) - 1 do
////    if FormsArr[btA].Showing then
////    begin
////      Result := True;
////      Break;
////    end;
//end;

procedure ReturnFromRack;
begin
//  if JmpFormId = NotSelected then
//  begin
//    if not(StationR414Form.Showing) and not(StationR414Form.Visible)
//       and (GetCountOpenedWindows() <= 6) then    //Этот параметр примерный. Может не работать
//                                                  //Нуждается в проверке
//    begin
//      StationR414Form.Show;
//      //StationR414Form.SendToBack;
//    end;
//  end;
//StationR414Form.CheckProgress;
//  JmpFormId := NotSelected;
//
//  if Station.WorkMode = mdReceiveAndTransmitTracksSetup then
//  begin
//    case CurFormId of
//      idRack1500A, idRack1500B, idRack1600A, idRack1600B:
//        begin
//          WaveMeterPanelForm.Close;
//          WaveMeterPanelForm.Tag := 0;
//        end;
//    end;
//  end;

//  if Station.WorkMode = mdWorkWithLowFrequency then
//  begin
//    case CurFormId of
//      idRack1200A1, idRack1200A2, idRack1200B1, idRack1200B2, idPultA, idPultB:
//        begin
//                                          //Гениальное решение...
//        end;                              //Я бы до такого не додумался
//    else
//      if BlockOscillographMinForm.Showing then
//        BlockOscillographMinForm.Close;
//      if P321DisplayForm.Showing then
//        P321DisplayForm.Close;
//    end;
//  end;
end;

  function IsUdlinitelCableKonezConnectedAtModulator(
    tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  var
    btA: Byte;
  begin
    Result := False;
    case KonezId of
      1:
        begin
          for btA := 1 to 21 do
          begin
            if (ModulatorPlacesA[btA] = tmpUdlinitel.stKonez1.stKonez)
              or (ModulatorPlacesB[btA] = tmpUdlinitel.stKonez1.stKonez) then
            begin
              Exit(True);
            end;
          end;
        end;
      2:
        begin
          for btA := 1 to 21 do
          begin
            if (ModulatorPlacesA[btA] = tmpUdlinitel.stKonez2.stKonez)
              or (ModulatorPlacesB[btA] = tmpUdlinitel.stKonez2.stKonez) then
            begin
              Exit(True);
            end;
          end;
        end;
    end;
  end;

  function IsUdlinitelCableKonezConnectedAtDeModulator(
    tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  var
    btA: Byte;
  begin
    Result := False;
    case KonezId of
      1:
        begin
          for btA := 1 to COUNT_CHANNELS do
          begin
            if (DeModulatorPlacesA[btA] = tmpUdlinitel.stKonez1.stKonez)
              or (DeModulatorPlacesB[btA] = tmpUdlinitel.stKonez1.stKonez) then
            begin
              Exit(True);
            end;
          end;
        end;
      2:
        begin
          for btA := 1 to COUNT_CHANNELS do
          begin
            if (DeModulatorPlacesA[btA] = tmpUdlinitel.stKonez2.stKonez) or
            (DeModulatorPlacesB[btA] = tmpUdlinitel.stKonez2.stKonez) then
            begin
              Exit(True);
            end;
          end;
        end;
    end;
  end;

  function IsUdlinitelCableKonezConnectedAtReserveLineCell(
    tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  var
    iCell: Integer;
  begin
    case KonezId of                            // Определяем ячейку, к которой
      1:                                       // подключен конец кабеля
        iCell := tmpUdlinitel.stKonez1.stKonez;
      2:
        iCell := tmpUdlinitel.stKonez2.stKonez;
    end;
    Result := (iCell >= 337)                   // По id ячейки смотрим, явл-ся
          and (iCell <= 357);                  // ли она ReserveLineCell
  end;

  function IsUdlinitelCableConnectedAtReserveLineCell(
    tmpUdlinitel: pUdlinitelCable): Boolean;
  begin
    Result := IsUdlinitelCableKonezConnectedAtReserveLineCell(tmpUdlinitel, 1)
      or IsUdlinitelCableKonezConnectedAtReserveLineCell(tmpUdlinitel, 2);
  end;

  function IsUdlinitelCableKonezConnectedAtHighOhmInputCell(
    tmpUdlinitel: pUdlinitelCable; KonezId: Byte): Boolean;
  var
    iCell: Integer;
  begin
    case KonezId of                             // Определяем ячейку, к которой
      1:                                        // подключен конец кабеля
        iCell := tmpUdlinitel.stKonez1.stKonez;
      2:
        iCell := tmpUdlinitel.stKonez2.stKonez;
    end;
    Result := (iCell >= 360)                    // По id ячейки смотрим, явл-ся
            and (iCell <= 367);                 // ли она HightOhnInputCell
  end;

  function IsUdlinitelCableConnectedAtHighOhmInputCell(
    tmpUdlinitel: pUdlinitelCable): Boolean;
  begin
    Result := IsUdlinitelCableKonezConnectedAtHighOhmInputCell(tmpUdlinitel, 1)
      or IsUdlinitelCableKonezConnectedAtHighOhmInputCell(tmpUdlinitel, 2);
  end;

  function GetReserveLineCellIdByUdlinitelCableId(
    tmpUdlinitel: pUdlinitelCable): Byte;
  begin
    Result := 0;
    if IsUdlinitelCableKonezConnectedAtReserveLineCell(tmpUdlinitel, 1) then
    begin
      case tmpUdlinitel.stKonez1.stKonez of
        337:
          Result := 1;
        338:
          Result := 2;
        339:
          Result := 3;
        340:
          Result := 4;
        341:
          Result := 5;
        342:
          Result := 9;
        343:
          Result := 10;
        344:
          Result := 11;
        345:
          Result := 12;
        346:
          Result := 13;
        347:
          Result := 14;
        348:
          Result := 15;
        349:
          Result := 20;
        350:
          Result := 21;
        351:
          Result := 6;
        352:
          Result := 7;
        353:
          Result := 8;
        354:
          Result := 16;
        355:
          Result := 17;
        356:
          Result := 18;
        357:
          Result := 19;
      end;
    end;

    if IsUdlinitelCableKonezConnectedAtReserveLineCell(tmpUdlinitel, 2) then
    begin
      case tmpUdlinitel.stKonez2.stKonez of
        337:
          Result := 1;
        338:
          Result := 2;
        339:
          Result := 3;
        340:
          Result := 4;
        341:
          Result := 5;
        342:
          Result := 9;
        343:
          Result := 10;
        344:
          Result := 11;
        345:
          Result := 12;
        346:
          Result := 13;
        347:
          Result := 14;
        348:
          Result := 15;
        349:
          Result := 20;
        350:
          Result := 21;
        351:
          Result := 6;
        352:
          Result := 7;
        353:
          Result := 8;
        354:
          Result := 16;
        355:
          Result := 17;
        356:
          Result := 18;
        357:
          Result := 19;
      end;
    end;
  end;

  function IsUdlinitelCableConnectedAtModulator(
    tmpUdlinitel: pUdlinitelCable): Boolean;
  var
    btA: Byte;
  begin
    Result := False;
    for btA := 1 to COUNT_CHANNELS do
    begin
      if   (ModulatorPlacesA[btA] = tmpUdlinitel.stKonez1.stKonez)
        or (ModulatorPlacesA[btA] = tmpUdlinitel.stKonez2.stKonez)
        or (ModulatorPlacesB[btA] = tmpUdlinitel.stKonez1.stKonez)
        or (ModulatorPlacesB[btA] = tmpUdlinitel.stKonez2.stKonez) then
      begin
        Exit(True);
      end;
    end;
  end;

  function GetChannelIdByCellId(tmpCellId: Integer): Integer;
  var
    iChannel: Integer;
  begin
    Result := 0;
    for iChannel := 1 to COUNT_CHANNELS do
    begin
      if (ModulatorPlacesA[iChannel] = tmpCellId) then
      begin
        Exit(iChannel);
      end;
      if (DeModulatorPlacesB[iChannel] = tmpCellId) then
      begin
        Exit(iChannel);
      end;
      if (DeModulatorPlacesA[iChannel] = tmpCellId) then
      begin
        Exit(iChannel);
      end;
      if (DeModulatorPlacesB[iChannel] = tmpCellId) then
      begin
        Exit(iChannel);
      end;
      // Если в этой функции что-то отвалится, то надо переписать с учётом того,
      // что id ячеек не уникальные
    end;
  end;

  function IsUdlinitelCableConnectedAtDeModulator(tmpUdlinitel: pUdlinitelCable): Boolean;
  var
    btA: Byte;
  begin
    Result := False;
    for btA := 1 to COUNT_CHANNELS do
    begin
      if   (DeModulatorPlacesA[btA] = tmpUdlinitel.stKonez1.stKonez)
        or (DeModulatorPlacesA[btA] = tmpUdlinitel.stKonez2.stKonez)
        or (DeModulatorPlacesB[btA] = tmpUdlinitel.stKonez1.stKonez)
        or (DeModulatorPlacesB[btA] = tmpUdlinitel.stKonez2.stKonez) then
      begin
        Exit(True);
      end;
    end;
  end;

  /// <summary>
  ///   Сравнивает две станций и возвращает Истину, если станции эквивалентны
  /// </summary>
  function CompareStations(Station1, Station2: TStation): Boolean;
  begin
    {$REGION 'Сравнение параметров двух станций'}
    Result := Boolean((Station1.HalfSetA.LittleNoisyAmplifier.butMshu = Station2.HalfSetA.LittleNoisyAmplifier.butMshu) and
    (Station1.HalfSetA.LittleNoisyAmplifier.swWave = Station2.HalfSetA.LittleNoisyAmplifier.swWave) and
    (Station1.HalfSetA.LittleNoisyAmplifier.butNet = Station2.HalfSetA.LittleNoisyAmplifier.butNet) and
    (Station1.HalfSetA.LittleNoisyAmplifier.butNet2 = Station2.HalfSetA.LittleNoisyAmplifier.butNet2) and
    (Station1.HalfSetB.LittleNoisyAmplifier.butMshu = Station2.HalfSetB.LittleNoisyAmplifier.butMshu) and
    (Station1.HalfSetB.LittleNoisyAmplifier.swWave = Station2.HalfSetB.LittleNoisyAmplifier.swWave) and
    (Station1.HalfSetB.LittleNoisyAmplifier.butNet = Station2.HalfSetB.LittleNoisyAmplifier.butNet) and
    (Station1.HalfSetB.LittleNoisyAmplifier.butNet2 = Station2.HalfSetB.LittleNoisyAmplifier.butNet2) and
    (Station1.HalfSetA.Duplexer.waveTransmit = Station2.HalfSetA.Duplexer.waveTransmit) and
    (Station1.HalfSetA.Duplexer.waveReceive = Station2.HalfSetA.Duplexer.waveReceive) and
    (Station1.HalfSetA.Duplexer.cbSh1 = Station2.HalfSetA.Duplexer.cbSh1) and
    (Station1.HalfSetA.Duplexer.cbSh2 = Station2.HalfSetA.Duplexer.cbSh2) and
    (Station1.HalfSetA.Duplexer.cb1840 = Station2.HalfSetA.Duplexer.cb1840) and
    (Station1.HalfSetB.Duplexer.waveTransmit = Station2.HalfSetB.Duplexer.waveTransmit) and
    (Station1.HalfSetB.Duplexer.waveReceive = Station2.HalfSetB.Duplexer.waveReceive) and
    (Station1.HalfSetB.Duplexer.cbSh1 = Station2.HalfSetB.Duplexer.cbSh1) and
    (Station1.HalfSetB.Duplexer.cbSh2 = Station2.HalfSetB.Duplexer.cbSh2) and
    (Station1.HalfSetB.Duplexer.cb1840 = Station2.HalfSetB.Duplexer.cb1840) and
    (Station1.HalfSetA.Rack1500.swModeControl = Station2.HalfSetA.Rack1500.swModeControl) and
    (Station1.HalfSetA.Rack1500.btnAutomatic = Station2.HalfSetA.Rack1500.btnAutomatic) and
    (Station1.HalfSetA.Rack1500.butMode_R = Station2.HalfSetA.Rack1500.butMode_R) and
    (Station1.HalfSetA.Rack1500.swPhaseMover = Station2.HalfSetA.Rack1500.swPhaseMover) and
    (Station1.HalfSetA.Rack1500.swWave1610_0 = Station2.HalfSetA.Rack1500.swWave1610_0) and
    (Station1.HalfSetA.Rack1500.swWave1500 = Station2.HalfSetA.Rack1500.swWave1500) and
    (Station1.HalfSetA.Rack1500.swWave161_R = Station2.HalfSetA.Rack1500.swWave161_R) and
    (Station1.HalfSetA.Rack1500.SelectedMd = Station2.HalfSetA.Rack1500.SelectedMd) and
    (Station1.HalfSetA.Rack1500.SelectedRetr = Station2.HalfSetA.Rack1500.SelectedRetr) and
    (Station1.HalfSetA.Rack1500.DropError = Station2.HalfSetA.Rack1500.DropError) and
    (Station1.HalfSetA.Rack1500.GeterodinTunedMain = Station2.HalfSetA.Rack1500.GeterodinTunedMain) and
    (Station1.HalfSetA.Rack1500.GeterodinTunedReserve = Station2.HalfSetA.Rack1500.GeterodinTunedReserve) and
    (Station1.HalfSetA.Rack1500.stCableLoad = Station2.HalfSetA.Rack1500.stCableLoad) and
    (Station1.HalfSetA.Rack1500.stCableSh1 = Station2.HalfSetA.Rack1500.stCableSh1) and     //
    (Station1.HalfSetB.Rack1500.swModeControl = Station2.HalfSetB.Rack1500.swModeControl) and
    (Station1.HalfSetB.Rack1500.btnAutomatic = Station2.HalfSetB.Rack1500.btnAutomatic) and
    (Station1.HalfSetB.Rack1500.butMode_R = Station2.HalfSetB.Rack1500.butMode_R) and
    (Station1.HalfSetB.Rack1500.swPhaseMover = Station2.HalfSetB.Rack1500.swPhaseMover) and
    (Station1.HalfSetB.Rack1500.swWave1610_0 = Station2.HalfSetB.Rack1500.swWave1610_0) and
    (Station1.HalfSetB.Rack1500.swWave1500 = Station2.HalfSetB.Rack1500.swWave1500) and
    (Station1.HalfSetB.Rack1500.swWave161_R = Station2.HalfSetB.Rack1500.swWave161_R) and
    (Station1.HalfSetB.Rack1500.SelectedMd = Station2.HalfSetB.Rack1500.SelectedMd) and
    (Station1.HalfSetB.Rack1500.SelectedRetr = Station2.HalfSetB.Rack1500.SelectedRetr) and
    (Station1.HalfSetB.Rack1500.DropError = Station2.HalfSetB.Rack1500.DropError) and
    (Station1.HalfSetB.Rack1500.GeterodinTunedMain = Station2.HalfSetB.Rack1500.GeterodinTunedMain) and
    (Station1.HalfSetB.Rack1500.GeterodinTunedReserve = Station2.HalfSetB.Rack1500.GeterodinTunedReserve) and
    (Station1.HalfSetB.Rack1500.stCableLoad = Station2.HalfSetB.Rack1500.stCableLoad) and
    (Station1.HalfSetB.Rack1500.stCableSh1 = Station2.HalfSetB.Rack1500.stCableSh1) and     //
    (Station1.HalfSetA.Rack1920.swAddInput = Station2.HalfSetA.Rack1920.swAddInput) and
    (Station1.HalfSetA.Rack1920.butPower = Station2.HalfSetA.Rack1920.butPower) and
    (Station1.HalfSetA.Rack1920.swAddInput2 = Station2.HalfSetA.Rack1920.swAddInput2) and
    (Station1.HalfSetA.Rack1920.butPower2 = Station2.HalfSetA.Rack1920.butPower2) and
    (Station1.HalfSetA.Rack1920.but1910 = Station2.HalfSetA.Rack1920.but1910) and
    (Station1.HalfSetA.Rack1920.but1910A = Station2.HalfSetA.Rack1920.but1910A) and
    (Station1.HalfSetA.Rack1920.but1930 = Station2.HalfSetA.Rack1920.but1930) and
    (Station1.HalfSetA.Rack1920.but1960_1 = Station2.HalfSetA.Rack1920.but1960_1) and
    (Station1.HalfSetA.Rack1920.butHighOn = Station2.HalfSetA.Rack1920.butHighOn) and
    (Station1.HalfSetA.Rack1920.butHighOff = Station2.HalfSetA.Rack1920.butHighOff) and
    (Station1.HalfSetA.Rack1920.butHighOn2 = Station2.HalfSetA.Rack1920.butHighOn2) and
    (Station1.HalfSetA.Rack1920.butHighOff2 = Station2.HalfSetA.Rack1920.butHighOff2) and
    (Station1.HalfSetA.Rack1920.butCurrent5MA = Station2.HalfSetA.Rack1920.butCurrent5MA) and
    (Station1.HalfSetA.Rack1920.butCurrent5MA2 = Station2.HalfSetA.Rack1920.butCurrent5MA2) and
    (Station1.HalfSetA.Rack1920.stZamedleniePodano_LVB1 = Station2.HalfSetA.Rack1920.stZamedleniePodano_LVB1) and
    (Station1.HalfSetA.Rack1920.stZamedleniePodano_LVB2 = Station2.HalfSetA.Rack1920.stZamedleniePodano_LVB2) and
    (Station1.HalfSetA.Rack1920.stLBV1_TurnedOn = Station2.HalfSetA.Rack1920.stLBV1_TurnedOn) and
    (Station1.HalfSetA.Rack1920.stLBV2_TurnedOn = Station2.HalfSetA.Rack1920.stLBV2_TurnedOn) and //
    (Station1.HalfSetB.Rack1920.swAddInput = Station2.HalfSetB.Rack1920.swAddInput) and
    (Station1.HalfSetB.Rack1920.butPower = Station2.HalfSetB.Rack1920.butPower) and
    (Station1.HalfSetB.Rack1920.swAddInput2 = Station2.HalfSetB.Rack1920.swAddInput2) and
    (Station1.HalfSetB.Rack1920.butPower2 = Station2.HalfSetB.Rack1920.butPower2) and
    (Station1.HalfSetB.Rack1920.but1910 = Station2.HalfSetB.Rack1920.but1910) and
    (Station1.HalfSetB.Rack1920.but1910A = Station2.HalfSetB.Rack1920.but1910A) and
    (Station1.HalfSetB.Rack1920.but1930 = Station2.HalfSetB.Rack1920.but1930) and
    (Station1.HalfSetB.Rack1920.but1960_1 = Station2.HalfSetB.Rack1920.but1960_1) and
    (Station1.HalfSetB.Rack1920.butHighOn = Station2.HalfSetB.Rack1920.butHighOn) and
    (Station1.HalfSetB.Rack1920.butHighOff = Station2.HalfSetB.Rack1920.butHighOff) and
    (Station1.HalfSetB.Rack1920.butHighOn2 = Station2.HalfSetB.Rack1920.butHighOn2) and
    (Station1.HalfSetB.Rack1920.butHighOff2 = Station2.HalfSetB.Rack1920.butHighOff2) and
    (Station1.HalfSetB.Rack1920.butCurrent5MA = Station2.HalfSetB.Rack1920.butCurrent5MA) and
    (Station1.HalfSetB.Rack1920.butCurrent5MA2 = Station2.HalfSetB.Rack1920.butCurrent5MA2) and
    (Station1.HalfSetB.Rack1920.stZamedleniePodano_LVB1 = Station2.HalfSetB.Rack1920.stZamedleniePodano_LVB1) and
    (Station1.HalfSetB.Rack1920.stZamedleniePodano_LVB2 = Station2.HalfSetB.Rack1920.stZamedleniePodano_LVB2) and
    (Station1.HalfSetB.Rack1920.stLBV1_TurnedOn = Station2.HalfSetB.Rack1920.stLBV1_TurnedOn) and
    (Station1.HalfSetB.Rack1920.stLBV2_TurnedOn = Station2.HalfSetB.Rack1920.stLBV2_TurnedOn) and //
    (Station1.HalfSetA.Rack1600.GeterodinTunedMain = Station2.HalfSetA.Rack1600.GeterodinTunedMain) and
    (Station1.HalfSetA.Rack1600.GeterodinTunedReserve = Station2.HalfSetA.Rack1600.GeterodinTunedReserve) and
    (Station1.HalfSetA.Rack1600.CableMdMainState = Station2.HalfSetA.Rack1600.CableMdMainState) and
    (Station1.HalfSetA.Rack1600.CableMdReservState = Station2.HalfSetA.Rack1600.CableMdReservState) and
    (Station1.HalfSetA.Rack1600.SelectedMd = Station2.HalfSetA.Rack1600.SelectedMd) and
    (Station1.HalfSetA.Rack1600.SelectedUpch = Station2.HalfSetA.Rack1600.SelectedUpch) and
    (Station1.HalfSetA.Rack1600.SelectedDmch = Station2.HalfSetA.Rack1600.SelectedDmch) and
    (Station1.HalfSetA.Rack1600.butAutomatic = Station2.HalfSetA.Rack1600.butAutomatic) and
    (Station1.HalfSetA.Rack1600.butDmch = Station2.HalfSetA.Rack1600.butDmch) and
    (Station1.HalfSetA.Rack1600.butChannelControl = Station2.HalfSetA.Rack1600.butChannelControl) and
    (Station1.HalfSetA.Rack1600.swChannelControl = Station2.HalfSetA.Rack1600.swChannelControl) and
    (Station1.HalfSetA.Rack1600.wave1610_0 = Station2.HalfSetA.Rack1600.wave1610_0) and
    (Station1.HalfSetA.Rack1600.wave1610_R = Station2.HalfSetA.Rack1600.wave1610_R) and
    (Station1.HalfSetA.Rack1600.wave1600 = Station2.HalfSetA.Rack1600.wave1600) and
    (Station1.HalfSetA.Rack1600.DropError = Station2.HalfSetA.Rack1600.DropError) and
    (Station1.HalfSetA.Rack1600.stMoshnost = Station2.HalfSetA.Rack1600.stMoshnost) and
    (Station1.HalfSetA.Rack1600.GeterodinTunedMain = Station2.HalfSetA.Rack1600.GeterodinTunedMain) and
    (Station1.HalfSetA.Rack1600.GeterodinTunedReserve = Station2.HalfSetA.Rack1600.GeterodinTunedReserve) and
    (Station1.HalfSetB.Rack1600.GeterodinTunedReserve = Station2.HalfSetB.Rack1600.GeterodinTunedReserve) and
    (Station1.HalfSetB.Rack1600.CableMdMainState = Station2.HalfSetB.Rack1600.CableMdMainState) and
    (Station1.HalfSetB.Rack1600.CableMdReservState = Station2.HalfSetB.Rack1600.CableMdReservState) and
    (Station1.HalfSetB.Rack1600.SelectedMd = Station2.HalfSetB.Rack1600.SelectedMd) and
    (Station1.HalfSetB.Rack1600.SelectedUpch = Station2.HalfSetB.Rack1600.SelectedUpch) and
    (Station1.HalfSetB.Rack1600.SelectedDmch = Station2.HalfSetB.Rack1600.SelectedDmch) and
    (Station1.HalfSetB.Rack1600.butAutomatic = Station2.HalfSetB.Rack1600.butAutomatic) and
    (Station1.HalfSetB.Rack1600.butDmch = Station2.HalfSetB.Rack1600.butDmch) and
    (Station1.HalfSetB.Rack1600.butChannelControl = Station2.HalfSetB.Rack1600.butChannelControl) and
    (Station1.HalfSetB.Rack1600.swChannelControl = Station2.HalfSetB.Rack1600.swChannelControl) and
    (Station1.HalfSetB.Rack1600.wave1610_0 = Station2.HalfSetB.Rack1600.wave1610_0) and
    (Station1.HalfSetB.Rack1600.wave1610_R = Station2.HalfSetB.Rack1600.wave1610_R) and
    (Station1.HalfSetB.Rack1600.wave1600 = Station2.HalfSetB.Rack1600.wave1600) and
    (Station1.HalfSetB.Rack1600.DropError = Station2.HalfSetB.Rack1600.DropError) and
    (Station1.HalfSetB.Rack1600.stMoshnost = Station2.HalfSetB.Rack1600.stMoshnost) and
    (Station1.HalfSetB.Rack1600.GeterodinTunedMain = Station2.HalfSetB.Rack1600.GeterodinTunedMain) and
    (Station1.HalfSetA.Rack1200Left.butChannelControl = Station2.HalfSetA.Rack1200Left.butChannelControl) and
    (Station1.HalfSetA.Rack1200Left.but1220ADMain = Station2.HalfSetA.Rack1200Left.but1220ADMain) and
    (Station1.HalfSetA.Rack1200Left.but1230AMain = Station2.HalfSetA.Rack1200Left.but1230AMain) and
    (Station1.HalfSetA.Rack1200Left.Sw1240K = Station2.HalfSetA.Rack1200Left.Sw1240K) and
    (Station1.HalfSetA.Rack1200Left.SwNumberOfUchastok = Station2.HalfSetA.Rack1200Left.SwNumberOfUchastok) and
    (Station1.HalfSetA.Rack1200Left.SwNumberOfStantion = Station2.HalfSetA.Rack1200Left.SwNumberOfStantion) and
    (Station1.HalfSetA.Rack1200Left.but1240K = Station2.HalfSetA.Rack1200Left.but1240K) and
    (Station1.HalfSetA.Rack1200Left.but1220ADReserve = Station2.HalfSetA.Rack1200Left.but1220ADReserve) and
    (Station1.HalfSetA.Rack1200Left.but1230AReserve = Station2.HalfSetA.Rack1200Left.but1230AReserve) and
    (Station1.HalfSetA.Rack1200Left.But1240GMain = Station2.HalfSetA.Rack1200Left.But1240GMain) and
    (Station1.HalfSetA.Rack1200Left.But1240GMain2 = Station2.HalfSetA.Rack1200Left.But1240GMain2) and
    (Station1.HalfSetA.Rack1200Left.but1240GPrmPrd = Station2.HalfSetA.Rack1200Left.but1240GPrmPrd) and
    (Station1.HalfSetA.Rack1200Left.but1240GOneTwo = Station2.HalfSetA.Rack1200Left.but1240GOneTwo) and
    (Station1.HalfSetA.Rack1200Left.but1240G = Station2.HalfSetA.Rack1200Left.but1240G) and
    (Station1.HalfSetA.Rack1200Left.but1240V = Station2.HalfSetA.Rack1200Left.but1240V) and
    (Station1.HalfSetA.Rack1200Left.Sw1240V = Station2.HalfSetA.Rack1200Left.Sw1240V) and
    (Station1.HalfSetA.Rack1200Left.but1240V2 = Station2.HalfSetA.Rack1200Left.but1240V2) and
    (Station1.HalfSetA.Rack1200Left.Sw1240V2 = Station2.HalfSetA.Rack1200Left.Sw1240V2) and
    (Station1.HalfSetA.Rack1200Left.but1240G1 = Station2.HalfSetA.Rack1200Left.but1240G1) and
    (Station1.HalfSetA.Rack1200Left.but1240G2 = Station2.HalfSetA.Rack1200Left.but1240G2) and
    (Station1.HalfSetA.Rack1200Left.but1240G3 = Station2.HalfSetA.Rack1200Left.but1240G3) and
    (Station1.HalfSetA.Rack1200Left.but1240G4 = Station2.HalfSetA.Rack1200Left.but1240G4) and
    (Station1.HalfSetA.Rack1200Left.but1240G5 = Station2.HalfSetA.Rack1200Left.but1240G5) and
    (Station1.HalfSetA.Rack1200Left.but1240G6 = Station2.HalfSetA.Rack1200Left.but1240G6) and
    (Station1.HalfSetA.Rack1200Left.but1240G7 = Station2.HalfSetA.Rack1200Left.but1240G7) and
    (Station1.HalfSetA.Rack1200Left.but1240G8 = Station2.HalfSetA.Rack1200Left.but1240G8) and
    (Station1.HalfSetA.Rack1200Left.but1290Power = Station2.HalfSetA.Rack1200Left.but1290Power) and
    (Station1.HalfSetA.Rack1200Left.Sw1290 = Station2.HalfSetA.Rack1200Left.Sw1290) and
    (Station1.HalfSetA.Rack1200Left.CableVhodPrm = Station2.HalfSetA.Rack1200Left.CableVhodPrm) and
    (Station1.HalfSetA.Rack1200Left.CableSinusOscill = Station2.HalfSetA.Rack1200Left.CableSinusOscill) and
    (Station1.HalfSetA.Rack1200Left.st1240G_ports = Station2.HalfSetA.Rack1200Left.st1240G_ports) and
    (Station1.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports = Station2.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports) and
    (Station1.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports = Station2.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports) and
    (Station1.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports = Station2.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports) and
    (Station1.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports = Station2.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports) and //
    (Station1.HalfSetB.Rack1200Left.butChannelControl = Station2.HalfSetB.Rack1200Left.butChannelControl) and
    (Station1.HalfSetB.Rack1200Left.but1220ADMain = Station2.HalfSetB.Rack1200Left.but1220ADMain) and
    (Station1.HalfSetB.Rack1200Left.but1230AMain = Station2.HalfSetB.Rack1200Left.but1230AMain) and
    (Station1.HalfSetB.Rack1200Left.Sw1240K = Station2.HalfSetB.Rack1200Left.Sw1240K) and
    (Station1.HalfSetB.Rack1200Left.SwNumberOfUchastok = Station2.HalfSetB.Rack1200Left.SwNumberOfUchastok) and
    (Station1.HalfSetB.Rack1200Left.SwNumberOfStantion = Station2.HalfSetB.Rack1200Left.SwNumberOfStantion) and
    (Station1.HalfSetB.Rack1200Left.but1240K = Station2.HalfSetB.Rack1200Left.but1240K) and
    (Station1.HalfSetB.Rack1200Left.but1220ADReserve = Station2.HalfSetB.Rack1200Left.but1220ADReserve) and
    (Station1.HalfSetB.Rack1200Left.but1230AReserve = Station2.HalfSetB.Rack1200Left.but1230AReserve) and
    (Station1.HalfSetB.Rack1200Left.But1240GMain = Station2.HalfSetB.Rack1200Left.But1240GMain) and
    (Station1.HalfSetB.Rack1200Left.But1240GMain2 = Station2.HalfSetB.Rack1200Left.But1240GMain2) and
    (Station1.HalfSetB.Rack1200Left.but1240GPrmPrd = Station2.HalfSetB.Rack1200Left.but1240GPrmPrd) and
    (Station1.HalfSetB.Rack1200Left.but1240GOneTwo = Station2.HalfSetB.Rack1200Left.but1240GOneTwo) and
    (Station1.HalfSetB.Rack1200Left.but1240G = Station2.HalfSetB.Rack1200Left.but1240G) and
    (Station1.HalfSetB.Rack1200Left.but1240V = Station2.HalfSetB.Rack1200Left.but1240V) and
    (Station1.HalfSetB.Rack1200Left.Sw1240V = Station2.HalfSetB.Rack1200Left.Sw1240V) and
    (Station1.HalfSetB.Rack1200Left.but1240V2 = Station2.HalfSetB.Rack1200Left.but1240V2) and
    (Station1.HalfSetB.Rack1200Left.Sw1240V2 = Station2.HalfSetB.Rack1200Left.Sw1240V2) and
    (Station1.HalfSetB.Rack1200Left.but1240G1 = Station2.HalfSetB.Rack1200Left.but1240G1) and
    (Station1.HalfSetB.Rack1200Left.but1240G2 = Station2.HalfSetB.Rack1200Left.but1240G2) and
    (Station1.HalfSetB.Rack1200Left.but1240G3 = Station2.HalfSetB.Rack1200Left.but1240G3) and
    (Station1.HalfSetB.Rack1200Left.but1240G4 = Station2.HalfSetB.Rack1200Left.but1240G4) and
    (Station1.HalfSetB.Rack1200Left.but1240G5 = Station2.HalfSetB.Rack1200Left.but1240G6) and
    (Station1.HalfSetB.Rack1200Left.but1240G6 = Station2.HalfSetB.Rack1200Left.but1240G6) and
    (Station1.HalfSetB.Rack1200Left.but1240G7 = Station2.HalfSetB.Rack1200Left.but1240G7) and
    (Station1.HalfSetB.Rack1200Left.but1240G8 = Station2.HalfSetB.Rack1200Left.but1240G8) and
    (Station1.HalfSetB.Rack1200Left.but1290Power = Station2.HalfSetB.Rack1200Left.but1290Power) and
    (Station1.HalfSetB.Rack1200Left.Sw1290 = Station2.HalfSetB.Rack1200Left.Sw1290) and
    (Station1.HalfSetB.Rack1200Left.CableVhodPrm = Station2.HalfSetB.Rack1200Left.CableVhodPrm) and
    (Station1.HalfSetB.Rack1200Left.CableSinusOscill = Station2.HalfSetB.Rack1200Left.CableSinusOscill) and
    (Station1.HalfSetB.Rack1200Left.st1240G_ports = Station2.HalfSetB.Rack1200Left.st1240G_ports) and
    (Station1.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports = Station2.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports) and
    (Station1.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports = Station2.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports) and
    (Station1.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports = Station2.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports) and
    (Station1.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports = Station2.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports) and //
    (Station1.HalfSetA.Rack1200Right.But1270Main = Station2.HalfSetA.Rack1200Right.But1270Main) and
    (Station1.HalfSetA.Rack1200Right.But1220AMMain = Station2.HalfSetA.Rack1200Right.But1220AMMain) and
    (Station1.HalfSetA.Rack1200Right.But1230AMain = Station2.HalfSetA.Rack1200Right.But1230AMain) and
    (Station1.HalfSetA.Rack1200Right.But1210AMain = Station2.HalfSetA.Rack1200Right.But1210AMain) and
    (Station1.HalfSetA.Rack1200Right.but1210ARetrMain = Station2.HalfSetA.Rack1200Right.but1210ARetrMain) and
    (Station1.HalfSetA.Rack1200Right.But1270Reserve = Station2.HalfSetA.Rack1200Right.But1270Reserve) and
    (Station1.HalfSetA.Rack1200Right.But1220AMReserve = Station2.HalfSetA.Rack1200Right.But1220AMReserve) and
    (Station1.HalfSetA.Rack1200Right.But1230AReserve = Station2.HalfSetA.Rack1200Right.But1230AReserve) and
    (Station1.HalfSetA.Rack1200Right.But1210AReserve = Station2.HalfSetA.Rack1200Right.But1210AReserve) and
    (Station1.HalfSetA.Rack1200Right.but1210ARetrReserve = Station2.HalfSetA.Rack1200Right.but1210ARetrReserve) and
    (Station1.HalfSetA.Rack1200Right.But1240V = Station2.HalfSetA.Rack1200Right.But1240V) and
    (Station1.HalfSetA.Rack1200Right.Sw1240V = Station2.HalfSetA.Rack1200Right.Sw1240V) and
    (Station1.HalfSetA.Rack1200Right.But1240V2 = Station2.HalfSetA.Rack1200Right.But1240V2) and
    (Station1.HalfSetA.Rack1200Right.Sw1240V2 = Station2.HalfSetA.Rack1200Right.Sw1240V2) and
    (Station1.HalfSetA.Rack1200Right.But1240V3 = Station2.HalfSetA.Rack1200Right.But1240V3) and
    (Station1.HalfSetA.Rack1200Right.Sw1240V3 = Station2.HalfSetA.Rack1200Right.Sw1240V3) and
    (Station1.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC = Station2.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC) and
    (Station1.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC = Station2.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC) and
    (Station1.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC = Station2.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC) and
    (Station1.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC = Station2.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC) and
    (Station1.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC = Station2.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC) and
    (Station1.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC = Station2.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC) and
    (Station1.HalfSetA.Rack1200Right.sw1290Power = Station2.HalfSetA.Rack1200Right.sw1290Power) and
    (Station1.HalfSetA.Rack1200Right.But1290Power = Station2.HalfSetA.Rack1200Right.But1290Power) and
    (Station1.HalfSetA.Rack1200Right.But1240G = Station2.HalfSetA.Rack1200Right.But1240G) and
    (Station1.HalfSetA.Rack1200Right.But1240G1 = Station2.HalfSetA.Rack1200Right.But1240G1) and
    (Station1.HalfSetA.Rack1200Right.But1240G2 = Station2.HalfSetA.Rack1200Right.But1240G2) and
    (Station1.HalfSetA.Rack1200Right.But1240G3 = Station2.HalfSetA.Rack1200Right.But1240G3) and
    (Station1.HalfSetA.Rack1200Right.But1240G4 = Station2.HalfSetA.Rack1200Right.But1240G4) and
    (Station1.HalfSetA.Rack1200Right.But1240G5 = Station2.HalfSetA.Rack1200Right.But1240G5) and
    (Station1.HalfSetA.Rack1200Right.But1240G6 = Station2.HalfSetA.Rack1200Right.But1240G6) and
    (Station1.HalfSetA.Rack1200Right.But1240G7 = Station2.HalfSetA.Rack1200Right.But1240G7) and
    (Station1.HalfSetA.Rack1200Right.But1240G8 = Station2.HalfSetA.Rack1200Right.But1240G8) and //
    (Station1.HalfSetB.Rack1200Right.But1270Main = Station2.HalfSetB.Rack1200Right.But1270Main) and
    (Station1.HalfSetB.Rack1200Right.But1220AMMain = Station2.HalfSetB.Rack1200Right.But1220AMMain) and
    (Station1.HalfSetB.Rack1200Right.But1230AMain = Station2.HalfSetB.Rack1200Right.But1230AMain) and
    (Station1.HalfSetB.Rack1200Right.But1210AMain = Station2.HalfSetB.Rack1200Right.But1210AMain) and
    (Station1.HalfSetB.Rack1200Right.but1210ARetrMain = Station2.HalfSetB.Rack1200Right.but1210ARetrMain) and
    (Station1.HalfSetB.Rack1200Right.But1270Reserve = Station2.HalfSetB.Rack1200Right.But1270Reserve) and
    (Station1.HalfSetB.Rack1200Right.But1220AMReserve = Station2.HalfSetB.Rack1200Right.But1220AMReserve) and
    (Station1.HalfSetB.Rack1200Right.But1230AReserve = Station2.HalfSetB.Rack1200Right.But1230AReserve) and
    (Station1.HalfSetB.Rack1200Right.But1210AReserve = Station2.HalfSetB.Rack1200Right.But1210AReserve) and
    (Station1.HalfSetB.Rack1200Right.but1210ARetrReserve = Station2.HalfSetB.Rack1200Right.but1210ARetrReserve) and
    (Station1.HalfSetB.Rack1200Right.But1240V = Station2.HalfSetB.Rack1200Right.But1240V) and
    (Station1.HalfSetB.Rack1200Right.Sw1240V = Station2.HalfSetB.Rack1200Right.Sw1240V) and
    (Station1.HalfSetB.Rack1200Right.But1240V2 = Station2.HalfSetB.Rack1200Right.But1240V2) and
    (Station1.HalfSetB.Rack1200Right.Sw1240V2 = Station2.HalfSetB.Rack1200Right.Sw1240V2) and
    (Station1.HalfSetB.Rack1200Right.But1240V3 = Station2.HalfSetB.Rack1200Right.But1240V3) and
    (Station1.HalfSetB.Rack1200Right.Sw1240V3 = Station2.HalfSetB.Rack1200Right.Sw1240V3) and
    (Station1.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC = Station2.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC) and
    (Station1.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC = Station2.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC) and
    (Station1.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC = Station2.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC) and
    (Station1.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC = Station2.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC) and
    (Station1.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC = Station2.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC) and
    (Station1.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC = Station2.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC) and
    (Station1.HalfSetB.Rack1200Right.sw1290Power = Station2.HalfSetB.Rack1200Right.sw1290Power) and
    (Station1.HalfSetB.Rack1200Right.But1240G = Station2.HalfSetB.Rack1200Right.But1240G) and
    (Station1.HalfSetB.Rack1200Right.But1240G1 = Station2.HalfSetB.Rack1200Right.But1240G1) and
    (Station1.HalfSetB.Rack1200Right.But1240G2 = Station2.HalfSetB.Rack1200Right.But1240G2) and
    (Station1.HalfSetB.Rack1200Right.But1240G3 = Station2.HalfSetB.Rack1200Right.But1240G3) and
    (Station1.HalfSetB.Rack1200Right.But1240G4 = Station2.HalfSetB.Rack1200Right.But1240G4) and
    (Station1.HalfSetB.Rack1200Right.But1240G5 = Station2.HalfSetB.Rack1200Right.But1240G5) and
    (Station1.HalfSetB.Rack1200Right.But1240G6 = Station2.HalfSetB.Rack1200Right.But1240G6) and
    (Station1.HalfSetB.Rack1200Right.But1240G7 = Station2.HalfSetB.Rack1200Right.But1240G7) and
    (Station1.HalfSetB.Rack1200Right.But1240G8 = Station2.HalfSetB.Rack1200Right.But1240G8) and
    (Station1.HalfSetA.P321.butPower = Station2.HalfSetA.P321.butPower) and
    (Station1.HalfSetA.P321.butMeasure = Station2.HalfSetA.P321.butMeasure) and
    (Station1.HalfSetA.P321.but600Ohm = Station2.HalfSetA.P321.but600Ohm) and
    (Station1.HalfSetA.P321.swNepGen = Station2.HalfSetA.P321.swNepGen) and
    (Station1.HalfSetA.P321.swFrequency = Station2.HalfSetA.P321.swFrequency) and
    (Station1.HalfSetA.P321.swNepGenYY = Station2.HalfSetA.P321.swNepGenYY) and
    (Station1.HalfSetB.P321.butPower = Station2.HalfSetB.P321.butPower) and
    (Station1.HalfSetB.P321.butMeasure = Station2.HalfSetB.P321.butMeasure) and
    (Station1.HalfSetB.P321.but600Ohm = Station2.HalfSetB.P321.but600Ohm) and
    (Station1.HalfSetB.P321.swNepGen = Station2.HalfSetB.P321.swNepGen) and
    (Station1.HalfSetB.P321.swFrequency = Station2.HalfSetB.P321.swFrequency) and
    (Station1.HalfSetB.P321.swNepGenYY = Station2.HalfSetB.P321.swNepGenYY) and
    (Station1.P321C.butPower = Station2.P321C.butPower) and
    (Station1.P321C.butMeasure = Station2.P321C.butMeasure) and
    (Station1.P321C.but600Ohm = Station2.P321C.but600Ohm) and
    (Station1.P321C.swNepGen = Station2.P321C.swNepGen) and
    (Station1.P321C.swFrequency = Station2.P321C.swFrequency) and
    (Station1.P321C.swNepGenYY = Station2.P321C.swNepGenYY) and
    (Station1.Rack1710.butPower = Station2.Rack1710.butPower) and
    (Station1.Rack1710.swKukushka = Station2.Rack1710.swKukushka) and
    (Station1.Rack1710.swWorkMode = Station2.Rack1710.swWorkMode) and
    (Station1.Rack1710.swReductorCurrent = Station2.Rack1710.swReductorCurrent) and
    (Station1.Rack1710.butAutomat = Station2.Rack1710.butAutomat) and
    (Station1.Rack1710.butEmergencyLine1 = Station2.Rack1710.butEmergencyLine1) and
    (Station1.Rack1710.butEmergencyLine2 = Station2.Rack1710.butEmergencyLine2) and
    (Station1.Rack1710.but1220AD = Station2.Rack1710.but1220AD) and
    (Station1.Rack1710.but1220AM = Station2.Rack1710.but1220AM) and
    (Station1.Rack1710.but1290 = Station2.Rack1710.but1290) and
    (Station1.Rack1710.but1230AM = Station2.Rack1710.but1230AM) and
    (Station1.Rack1710.but1210A = Station2.Rack1710.but1210A) and
    (Station1.Rack1710.but1270 = Station2.Rack1710.but1270) and
    (Station1.Rack1710.but1220AD_2 = Station2.Rack1710.but1220AD_2) and
    (Station1.Rack1710.but1230AD_2 = Station2.Rack1710.but1230AD_2) and
    (Station1.Rack1710.but1290_2 = Station2.Rack1710.but1290_2) and
    (Station1.Rack1710.but1220AM_2 = Station2.Rack1710.but1220AM_2) and
    (Station1.Rack1710.but1230AM_2 = Station2.Rack1710.but1230AM_2) and
    (Station1.Rack1710.but1210A_2 = Station2.Rack1710.but1210A_2) and
    (Station1.Rack1710.but1270_2 = Station2.Rack1710.but1270_2) and
    (Station1.Rack1710.butExternalUplotnenieA = Station2.Rack1710.butExternalUplotnenieA) and
    (Station1.Rack1710.butExternalUplotnenieB = Station2.Rack1710.butExternalUplotnenieB) and
    (Station1.Rack1710.butSpeaker = Station2.Rack1710.butSpeaker) and
    (Station1.Rack1400.butPower = Station2.Rack1400.butPower) and
    (Station1.Rack1400.swKukushka = Station2.Rack1400.swKukushka));
    //Пульт вообще не проверяем
    {$ENDREGION}
  end;

end.
