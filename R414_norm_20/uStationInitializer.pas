unit uStationInitializer;

interface


uses
  uTaskControllerDM,
  uStationStateDM,
  uConstantsDM,
  uNetWorkerDM;

/// <summary>
///   Настраивает станцию перед началом какого-либо задания
/// </summary>
type TStationInitializer = class

  private
    FStation: TStation;
    NetWorker: TClientNetWorker;

    procedure GenerateRandomWaves;

    procedure CommonInit;

    procedure InitForPowerOnTask;
    procedure InitForConnectToR415Task;
    procedure InitForWorkWithLowFrequencyTask;
    procedure InitForSingleCheckTask;
    procedure InitForTerminalMode;



  public
    property Station: TStation read FStation
                               write FStation;


    constructor Create(Station: TStation; NetWorker: TClientNetWorker);

    procedure InitForStartParametersSetupTask;      //перенести в приватные
    procedure SetStationTo2ChannelMode;
    procedure SetStationTo4ChannelMode;
    //procedure InitStationByTaskID(TaskID: TTaskType);
    procedure InitStationByTask(TaskType: TTaskType);
end;

 // procedure LoadInitialState;

implementation


uses
  uBlockRemoteControllerForm,
  uRandomMethods;

constructor TStationInitializer.Create(Station: TStation; NetWorker: TClientNetWorker);
begin
  Inherited Create;
  Self.Station := Station;
  self.NetWorker:=NetWorker;
end;

/// <summary>
///   Переводит станцию в 4-х проводный режим
/// </summary>
procedure TStationInitializer.SetStationTo4ChannelMode;
begin
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.Sw1240V := 4;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 4;
  Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V := 4;
  Station.HalfSetA.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V2 := 4;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := 4;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.Sw1240V := 4;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 4;
  Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V := 4;
  Station.HalfSetB.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := 4;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := 4;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedInCross;
end;

/// <summary>
///   Переводит станцию в 2-х проводный режим
/// </summary>
procedure TStationInitializer.SetStationTo2ChannelMode;
begin
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.Sw1240V := 1;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V := 1;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := 1;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;        //B
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.Sw1240V := 1;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetB.Rack1200Right.Sw1240V := 1;
  Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := 1;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := 1;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
end;

/// <summary>
///   Генерирует случайным образом значения волн приёма/передачи
///   для обоих полукомплектов и применяет их к станции
/// </summary>
procedure TStationInitializer.GenerateRandomWaves;
var
  wvTransmit, wvReceive: Byte;
begin
  if not(Debug) then
  begin
    Randomize;
    wvTransmit := Random(MAX_WAVE_VALUE - 15) + 10;
    wvReceive := Random(2);
    if wvReceive = 1 then
      wvReceive := wvTransmit - MIN_WAVE_DIFFERENCE
    else
      wvReceive := wvTransmit + MIN_WAVE_DIFFERENCE;
    Station.WaveTransmitA := wvTransmit;
    Station.WaveReceiveA := wvReceive;
    //---------------------B-----------------------
    wvTransmit := Random(MAX_WAVE_VALUE - 15) + 10;
    wvReceive := Random(2);
    if wvReceive = 1 then
      wvReceive := wvTransmit - MIN_WAVE_DIFFERENCE
    else
      wvReceive := wvTransmit + MIN_WAVE_DIFFERENCE;
    Station.WaveTransmitB := wvTransmit;
    Station.WaveReceiveB := wvReceive;
  end
  else
  begin
    Station.WaveTransmitA := 6;
    Station.WaveReceiveA := 12;
    Station.WaveTransmitB := 8;
    Station.WaveReceiveB := 16;
  end;
end;

/// <summary>
///   Выставляет параметры станции для выполнения задания
/// <param name='TaskID'>ID задания, для которого требутся
///   подготовить станцию<param>
/// </summary>
//procedure TStationInitializer.InitStationByTaskID(TaskID: TTaskType);
//var
//  TaskType: TTaskType;
//begin
//  //TaskType :=  TTaskController.GetTaskType(TaskID);
//
//  if TaskType <> ttNone then
//    //InitStationByTask(TaskType);
//    InitStationByTask(TaskID);
//end;

/// <summary>
///   Выставляет параметры станции для выполнения задания
/// <param name='TaskType'>Задание, для которого требутся
///   подготовить станцию<param>
/// </summary>
procedure TStationInitializer.InitStationByTask(TaskType: TTaskType);
begin
  //if TaskType = ttNone then Exit;

  CommonInit;
  case TaskType of
    //ttNone:
    //  begin
    //   InitForStartParametersSetupTask;
    //  end;
    ttPowerOn:
      begin
        InitForPowerOnTask;
      end;
    //ttConnectToR415:{ttReceiveAndTransmitTracksSetup:}
    //  begin
     //   InitForConnectToR415Task;
     // end;
      ttCheckStationInStandaloneControlMode:
      begin
          InitForSingleCheckTask;
      end;
    {ttWorkWithLowFrequency:
      begin
        InitForWorkWithLowFrequencyTask;
      end;}
      ttTransferToTerminalMode:
      begin
          InitForTerminalMode;
      end;
  end;
  SetStationTo4ChannelMode;
end;

/// <summary>
///   Выполняет общую первоначальную инициализацию станции
/// </summary>
procedure TStationInitializer.CommonInit;
  var
    i: Byte;
begin
  for i := 1 to 9 do
    Station.RemoteController.indCallLineVisible[i] := False;
  for i := 1 to 21 do
  begin
    Station.RemoteController.Channels.A[i].State := stChannelNotTuned;
    Station.RemoteController.Channels.B[i].State := stChannelNotTuned;
  end;


  Station.CableBlack1.stKonez1.stKonez := csDisconected;
  Station.CableBlack1.stKonez2.stKonez := csDisconected;
  Station.CableWhite2.stKonez1.stKonez := csDisconected;
  Station.CableWhite2.stKonez2.stKonez := csDisconected;
  //Station.cbGenerator.stConnectedToPlaceId := csDisconected;
  //Station.cbInputYY.stConnectedToPlaceId := csDisconected;
  Station.CableBlack1.stKonez1.stState:=csDisconected;
  Station.CableBlack1.stKonez2.stState:=csDisconected;
  Station.CableWhite2.stKonez1.stState:=csDisconected;
  Station.CableWhite2.stKonez2.stState:=csDisconected;

  {$REGION 'Инициализация параметров стоек случайными значениями'}
  Station.HalfSetA.Rack1200Left.sw1240GTunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240V2TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240VTunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G1TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G2TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G3TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G4TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G5TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G6TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G7TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G8TunedValue := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Left.sw1240GTunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240V2TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240VTunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G1TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G2TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G3TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G4TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G5TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G6TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G7TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G8TunedValue := GetRandomTuneValue;

  Station.HalfSetA.Rack1200Right.sw1240V1TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V2TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V3TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240GTunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G1TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G2TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G3TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G4TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G5TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G6TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G7TunedValue := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G8TunedValue := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Right.sw1240V1TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V2TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V3TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240GTunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G1TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G2TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G3TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G4TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G5TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G6TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G7TunedValue := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G8TunedValue := GetRandomTuneValue;
  {$ENDREGION}
end;

/// <summary>
///   Настраивает параметры станции для выполнения задания StartParametersSetup
/// </summary>
procedure TStationInitializer.InitForStartParametersSetupTask;
var
  i: Integer;
begin
  {$REGION 'Инициализация параметров стоек'}
  Station.WaveMeter.Int := 4;
  Station.WaveMeter.Float := 8;

  Station.PowerPanel.swPhase := 0;
  Station.PowerPanel.swNet := 0;
  Station.PowerPanel.butRetranslator := 0;
  Station.PowerPanel.sw1700Power := 0;
  Station.PowerPanel.butRetranslator2 := 0;
  Station.PowerPanel.sw1900Power := 0;
  Station.PowerPanel.swHeat5A := 0;
  Station.PowerPanel.sw1900Power_2 := 0;
  Station.PowerPanel.sw1200Power := 0;
  Station.PowerPanel.sw1400 := 0;
  Station.PowerPanel.sw1200Power_2 := 0;
  Station.PowerPanel.butVent1 := 0;
  Station.PowerPanel.butUnitBK := 0;
  Station.PowerPanel.butVipriamit4V := 0;
  Station.PowerPanel.butVent1_2 := 0;
  Station.PowerPanel.butVent3 := 0;

  Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.swWave := GetRandomWaveValue;

  Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.swWave := GetRandomWaveValue;

  Station.HalfSetA.Rack1200Left.butChannelControl := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1220ADMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1230AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.Sw1240K := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetA.Rack1200Left.but1240K := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1220ADReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1230AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.But1240GMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.But1240GMain2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240GPrmPrd := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240GOneTwo := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240V := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.Sw1240V := 1;
  Station.HalfSetA.Rack1200Left.but1240V2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetA.Rack1200Left.but1240G1 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G4 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G5 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G6 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G7 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1240G8 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.but1290Power := GetRandomButtonState;
  Station.HalfSetA.Rack1200Left.Sw1290 := 1;
  Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Left.butChannelControl := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1220ADMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1230AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.Sw1240K := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetB.Rack1200Left.but1240K := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1220ADReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1230AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.But1240GMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.But1240GMain2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240GPrmPrd := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240GOneTwo := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240V := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.Sw1240V := 1;
  Station.HalfSetB.Rack1200Left.but1240V2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetB.Rack1200Left.but1240G1 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G4 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G5 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G6 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G7 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1240G8 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.but1290Power := GetRandomButtonState;
  Station.HalfSetB.Rack1200Left.Sw1290 := 1;
  Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetA.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetB.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.HalfSetA.Duplexer.waveTransmit := GetRandomWaveValue;
  Station.HalfSetA.Duplexer.waveReceive := GetRandomWaveValue;
  Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetA.Duplexer.cb1840 := csDisconected;
  Station.HalfSetA.Duplexer.cbSh2 := csDisconected;

  Station.HalfSetB.Duplexer.waveTransmit := GetRandomWaveValue;
  Station.HalfSetB.Duplexer.waveReceive := GetRandomWaveValue;
  Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetB.Duplexer.cb1840 := csDisconected;
  Station.HalfSetB.Duplexer.cbSh2 := csDisconected;

  Station.Rack1400.butPower := butPositionRight;
  Station.Rack1400.swKukushka := 3;
  Station.Rack1400.butSpeaker := butPositionRight;

  Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1500.DropError := False;
  Station.HalfSetA.Rack1500.SelectedMd := NotSelected;
  Station.HalfSetA.Rack1500.SelectedRetr := NotSelected;
  Station.HalfSetA.Rack1500.swModeControl := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave1610_0 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave1500 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave161_R := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.stCableLoad := csDisconected;
  Station.HalfSetA.Rack1500.stCableSh1 := csDisconected;
  Station.HalfSetA.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetA.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1500.DropError := False;
  Station.HalfSetB.Rack1500.SelectedMd := NotSelected;
  Station.HalfSetB.Rack1500.SelectedRetr := NotSelected;
  Station.HalfSetB.Rack1500.swModeControl := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave1610_0 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave1500 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave161_R := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.stCableLoad := csDisconected;
  Station.HalfSetB.Rack1500.stCableSh1 := csDisconected;
  Station.HalfSetB.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetB.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetA.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1600.SelectedMd := NotSelected;
  Station.HalfSetA.Rack1600.SelectedUpch := NotSelected;
  Station.HalfSetA.Rack1600.SelectedDmch := NotSelected;
  Station.HalfSetA.Rack1600.butAutomatic := GetRandomButtonState;
  Station.HalfSetA.Rack1600.butDmch := GetRandomButtonState;
  Station.HalfSetA.Rack1600.butChannelControl := GetRandomButtonState;
  Station.HalfSetA.Rack1600.swChannelControl := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.wave1610_0 := GetRandomWaveValue;
  Station.HalfSetA.Rack1600.wave1610_R := GetRandomWaveValue;
  Station.HalfSetA.Rack1600.wave1600 := GetRandomWaveValue;
  Station.HalfSetA.Rack1600.DropError := False;
  Station.HalfSetA.Rack1600.stMoshnost := False;

  Station.HalfSetB.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1600.SelectedMd := NotSelected;
  Station.HalfSetB.Rack1600.SelectedUpch := NotSelected;
  Station.HalfSetB.Rack1600.SelectedDmch := NotSelected;
  Station.HalfSetB.Rack1600.butAutomatic := GetRandomButtonState;
  Station.HalfSetB.Rack1600.butDmch := GetRandomButtonState;
  Station.HalfSetB.Rack1600.butChannelControl := GetRandomButtonState;
  Station.HalfSetB.Rack1600.swChannelControl := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.wave1610_0 := GetRandomWaveValue;
  Station.HalfSetB.Rack1600.wave1610_R := GetRandomWaveValue;
  Station.HalfSetB.Rack1600.wave1600 := GetRandomWaveValue;
  Station.HalfSetB.Rack1600.DropError := False;
  Station.HalfSetB.Rack1600.stMoshnost := False;

  Station.HalfSetA.Rack1600B.but1622Main := GetRandomButtonState;
  Station.HalfSetA.Rack1600B.but1622Reserve := GetRandomButtonState;
  Station.HalfSetA.Rack1600B.swUGS :=  GetRandomButtonState;;
  Station.HalfSetA.Rack1600B.swUGS2 := GetRandomButtonState;
  Station.HalfSetA.Rack1600B.butUPT := GetRandomButtonState;
  Station.HalfSetA.Rack1600B.butUPT2 := GetRandomButtonState;
  Station.HalfSetA.Rack1600B.swKukushka := 1;
  Station.HalfSetA.Rack1600B.but1621Main := GetRandomButtonState;
  Station.HalfSetA.Rack1600B.but1621Reserve := GetRandomButtonState;

  Station.HalfSetB.Rack1600B.but1622Main := GetRandomButtonState;
  Station.HalfSetB.Rack1600B.but1622Reserve := GetRandomButtonState;
  Station.HalfSetB.Rack1600B.swUGS :=  GetRandomButtonState;;
  Station.HalfSetB.Rack1600B.swUGS2 := GetRandomButtonState;
  Station.HalfSetB.Rack1600B.butUPT := GetRandomButtonState;
  Station.HalfSetB.Rack1600B.butUPT2 := GetRandomButtonState;
  Station.HalfSetB.Rack1600B.swKukushka := 1;
  Station.HalfSetB.Rack1600B.but1621Main := GetRandomButtonState;
  Station.HalfSetB.Rack1600B.but1621Reserve := GetRandomButtonState;

  Station.Rack1710.butPower := GetRandomButtonState;
  Station.Rack1710.swKukushka := 1;
  Station.Rack1710.swWorkMode := 1;
  Station.Rack1710.butAutomat := GetRandomButtonState;
  Station.Rack1710.butEmergencyLine1 := GetRandomButtonState;
  Station.Rack1710.butEmergencyLine2 := GetRandomButtonState;
  Station.Rack1710.but1220AD := GetRandomButtonState;
  Station.Rack1710.but1230AD := GetRandomButtonState;
  Station.Rack1710.but1290 := GetRandomButtonState;
  Station.Rack1710.but1220AM := GetRandomButtonState;
  Station.Rack1710.but1230AM := GetRandomButtonState;
  Station.Rack1710.but1210A := GetRandomButtonState;
  Station.Rack1710.but1270 := GetRandomButtonState;
  Station.Rack1710.but1220AD_2 := GetRandomButtonState;
  Station.Rack1710.but1230AD_2 := GetRandomButtonState;
  Station.Rack1710.but1290_2 := GetRandomButtonState;
  Station.Rack1710.but1220AM_2:= GetRandomButtonState;
  Station.Rack1710.but1230AM_2:= GetRandomButtonState;
  Station.Rack1710.but1210A_2:= GetRandomButtonState;
  Station.Rack1710.but1270_2 := GetRandomButtonState;
  Station.Rack1710.swReductorCurrent := 1;
  Station.Rack1710.butPower := GetRandomButtonState;
  Station.Rack1710.butExternalUplotnenieA := GetRandomButtonState;
  Station.Rack1710.butExternalUplotnenieB := GetRandomButtonState;
  Station.Rack1710.butSpeaker := GetRandomButtonState;

  Station.HalfSetA.Rack1920.but1910 := butPositionDown;
  Station.HalfSetA.Rack1920.but1910A := butPositionDown;
  Station.HalfSetA.Rack1920.but1930 := butPositionDown;
  Station.HalfSetA.Rack1920.but1960_1 := butPositionDown;
  Station.HalfSetA.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetA.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetB.Rack1920.but1910 := butPositionDown;
  Station.HalfSetB.Rack1920.but1910A := butPositionDown;
  Station.HalfSetB.Rack1920.but1930 := butPositionDown;
  Station.HalfSetB.Rack1920.but1960_1 := butPositionDown;
  Station.HalfSetB.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetB.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetA.P321.butPower := butPositionUp;
  Station.HalfSetA.P321.butMeasure := GetRandomButtonState;
  Station.HalfSetA.P321.but600Ohm := GetRandomButtonState;
  Station.HalfSetA.P321.cblVihGen := csDisconected;
  Station.HalfSetA.P321.cblVhYY := csDisconected;
  Station.HalfSetA.P321.swGradPit := GetRandomSwitcherState;

  Station.HalfSetB.P321.butPower := butPositionUp;
  Station.HalfSetB.P321.butMeasure := GetRandomButtonState;
  Station.HalfSetB.P321.but600Ohm := GetRandomButtonState;
  Station.HalfSetB.P321.cblVihGen := csDisconected;
  Station.HalfSetB.P321.cblVhYY := csDisconected;
  Station.HalfSetB.P321.swGradPit := GetRandomSwitcherState;

  Station.P321C.butPower := butPositionUp;
  Station.P321C.butMeasure := GetRandomButtonState;
  Station.P321C.but600Ohm := GetRandomButtonState;
  Station.P321C.cblVihGen := csDisconected;
  Station.P321C.cblVhYY := csDisconected;
  Station.P321C.swGradPit := GetRandomSwitcherState;

  Station.HalfSetA.P321.swNepGen := 1;
  Station.HalfSetA.P321.swFrequency := 1;
  Station.HalfSetA.P321.swNepGenYY := 1;

  Station.HalfSetB.P321.swNepGen := 2;
  Station.HalfSetB.P321.swFrequency := 2;
  Station.HalfSetB.P321.swNepGenYY := 2;

  Station.P321C.swNepGen := 3;
  Station.P321C.swFrequency := 3;
  Station.P321C.swNepGenYY := 3;

  Station.HalfSetA.P321.swGradGen := Random(9) + 10;
  Station.HalfSetB.P321.swGradGen := Random(9) + 10;
  Station.P321C.swGradGen := Random(9) + 10;

  Station.HalfSetA.P321.swGradYY := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradYY := GetRandomWaveValue;
  Station.P321C.swGradYY := GetRandomWaveValue;

  Station.RemoteController.SwPVU := GetRandomSwitcherState;
  Station.RemoteController.butCall1 := GetRandomButtonState;
  Station.RemoteController.butCall2 := GetRandomButtonState;
  Station.RemoteController.butCall3 := GetRandomButtonState;
  Station.RemoteController.butCall4 := GetRandomButtonState;
  Station.RemoteController.butForceMachine := GetRandomButtonState;
  for i := 1 to 7 do
  begin
    Station.RemoteController.CrossA[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].Ud2PRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].Ud2PRD.stChannelState := stChannelNotTuned;
  end;
  Station.RemoteController.stGeneratorCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stGeneratorCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stGeneratorCableAType := NotSelected;
  Station.RemoteController.stGeneratorCableBType := NotSelected;
  {$ENDREGION}
end;

/// <summary>
///   Настраивает параметры станции для выполнения задания PowerOn
/// </summary>
procedure TStationInitializer.InitForPowerOnTask;
var
  i: Integer;
begin
  {$REGION 'Инициализация параметров стоек'}
  Station.WaveMeter.Int := 3;
  Station.WaveMeter.Float := 9;

  Station.PowerPanel.swPhase := 0;
  Station.PowerPanel.swNet := 0;
  Station.PowerPanel.butRetranslator := butPositionDown;
  Station.PowerPanel.sw1700Power := 0;
  Station.PowerPanel.butRetranslator2 := butPositionDown;
  Station.PowerPanel.sw1900Power := 0;
  Station.PowerPanel.swHeat5A := 0;
  Station.PowerPanel.sw1900Power_2 := 0;
  Station.PowerPanel.sw1200Power := 0;
  Station.PowerPanel.sw1400 := 0;
  Station.PowerPanel.sw1200Power_2 := 0;
  Station.PowerPanel.butVent1 := butPositionDown;
  Station.PowerPanel.butUnitBK := butPositionDown;
  Station.PowerPanel.butVipriamit4V := butPositionDown;
  Station.PowerPanel.butVent1_2 := butPositionDown;
  Station.PowerPanel.butVent3 := butPositionDown;

  Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionDown;
  Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionDown;
  Station.HalfSetA.LittleNoisyAmplifier.swWave := Station.WaveReceiveA;

  Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionDown;
  Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionDown;
  Station.HalfSetB.LittleNoisyAmplifier.swWave := Station.WaveReceiveB;

  Station.HalfSetA.Duplexer.waveTransmit := GetRandomWaveValue;
  Station.HalfSetA.Duplexer.waveReceive := GetRandomWaveValue;
  Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetA.Duplexer.cb1840 := csDisconected;
  Station.HalfSetA.Duplexer.cbSh2 := csDisconected;

  Station.HalfSetB.Duplexer.waveTransmit := GetRandomWaveValue;
  Station.HalfSetB.Duplexer.waveReceive := GetRandomWaveValue;
  Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetB.Duplexer.cb1840 := csDisconected;
  Station.HalfSetB.Duplexer.cbSh2 := csDisconected;

  Station.HalfSetA.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetA.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1240K := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetA.Rack1200Left.but1240K := butPositionDown;
  Station.HalfSetA.Rack1200Left.but1220ADReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V := 1;
  Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetA.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1290 := 1;
  Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1240K := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetB.Rack1200Left.but1240K := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1220ADReserve := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V := 1;
  Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetB.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1290 := 1;
  Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetA.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetB.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.Rack1400.butPower := butPositionLeft;
  Station.Rack1400.swKukushka := 1;
  Station.Rack1400.butSpeaker := butPositionLeft;

  Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1500.DropError := False;
  Station.HalfSetA.Rack1500.SelectedMd := NotSelected;
  Station.HalfSetA.Rack1500.SelectedRetr := NotSelected;
  Station.HalfSetA.Rack1500.swModeControl := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave1610_0 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave1500 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave161_R := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.stCableLoad := csDisconected;
  Station.HalfSetA.Rack1500.stCableSh1 := csDisconected;
  Station.HalfSetA.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetA.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1500.DropError := False;
  Station.HalfSetB.Rack1500.SelectedMd := NotSelected;
  Station.HalfSetB.Rack1500.SelectedRetr := NotSelected;
  Station.HalfSetB.Rack1500.swModeControl := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave1610_0 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave1500 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave161_R := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.stCableLoad := csDisconected;
  Station.HalfSetB.Rack1500.stCableSh1 := csDisconected;
  Station.HalfSetB.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetB.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetA.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1600.SelectedMd := NotSelected;
  Station.HalfSetA.Rack1600.SelectedUpch := NotSelected;
  Station.HalfSetA.Rack1600.SelectedDmch := NotSelected;
  Station.HalfSetA.Rack1600.butAutomatic := butPositionRight;
  Station.HalfSetA.Rack1600.butDmch := butPositionUp;
  Station.HalfSetA.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetA.Rack1600.swChannelControl := 9;
  Station.HalfSetA.Rack1600.wave1610_0 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1610_R := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1600 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.DropError := False;
  Station.HalfSetA.Rack1600.stMoshnost := False;

  Station.HalfSetB.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1600.SelectedMd := NotSelected;
  Station.HalfSetB.Rack1600.SelectedUpch := NotSelected;
  Station.HalfSetB.Rack1600.SelectedDmch := NotSelected;
  Station.HalfSetB.Rack1600.butAutomatic := butPositionRight;
  Station.HalfSetB.Rack1600.butDmch := butPositionUp;
  Station.HalfSetB.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetB.Rack1600.swChannelControl := 9;
  Station.HalfSetB.Rack1600.wave1610_0 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1610_R := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1600 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.DropError := False;
  Station.HalfSetB.Rack1600.stMoshnost := False;

  Station.HalfSetA.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetA.Rack1600B.swUGS :=  5;;
  Station.HalfSetA.Rack1600B.swUGS2 := 5;
  Station.HalfSetA.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetA.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetA.Rack1600B.swKukushka := 1;
  Station.HalfSetA.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1621Reserve := butPositionUp;

  Station.HalfSetB.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetB.Rack1600B.swUGS :=  5;;
  Station.HalfSetB.Rack1600B.swUGS2 := 5;
  Station.HalfSetB.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetB.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetB.Rack1600B.swKukushka := 1;
  Station.HalfSetB.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1621Reserve := butPositionUp;

  Station.Rack1710.butPower := butPositionLeft;
  Station.Rack1710.swKukushka := 1;
  Station.Rack1710.swWorkMode := 1;
  Station.Rack1710.butAutomat := butPositionUp;
  Station.Rack1710.butEmergencyLine1:= butPositionUp;
  Station.Rack1710.butEmergencyLine2:= butPositionUp;
  Station.Rack1710.but1220AD:= butPositionLeft;
  Station.Rack1710.but1230AD:= butPositionLeft;
  Station.Rack1710.but1290:= butPositionLeft;
  Station.Rack1710.but1220AM:= butPositionLeft;
  Station.Rack1710.but1230AM:= butPositionLeft;
  Station.Rack1710.but1210A:= butPositionLeft;
  Station.Rack1710.but1270:= butPositionLeft;
  Station.Rack1710.but1220AD_2:= butPositionLeft;
  Station.Rack1710.but1230AD_2:= butPositionLeft;
  Station.Rack1710.but1290_2:= butPositionLeft;
  Station.Rack1710.but1220AM_2:= butPositionLeft;
  Station.Rack1710.but1230AM_2:= butPositionLeft;
  Station.Rack1710.but1210A_2:= butPositionLeft;
  Station.Rack1710.but1270_2 := butPositionLeft;
  Station.Rack1710.swReductorCurrent := 1;
  Station.Rack1710.butPower := butPositionLeft;
  Station.Rack1710.butExternalUplotnenieA := butPositionLeft;
  Station.Rack1710.butExternalUplotnenieB := butPositionLeft;
  Station.Rack1710.butSpeaker := butPositionLeft;

  Station.HalfSetA.Rack1920.but1910 := butPositionDown;
  Station.HalfSetA.Rack1920.but1910A := butPositionDown;
  Station.HalfSetA.Rack1920.but1930 := butPositionDown;
  Station.HalfSetA.Rack1920.but1960_1 := butPositionDown;
  Station.HalfSetA.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetA.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetA.Rack1920.butPower := butPositionDown;
  Station.HalfSetA.Rack1920.butPower2 := butPositionDown;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetB.Rack1920.but1910 := butPositionDown;
  Station.HalfSetB.Rack1920.but1910A := butPositionDown;
  Station.HalfSetB.Rack1920.but1930 := butPositionDown;
  Station.HalfSetB.Rack1920.but1960_1 := butPositionDown;
  Station.HalfSetB.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetB.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetB.Rack1920.butPower := butPositionDown;
  Station.HalfSetB.Rack1920.butPower2 := butPositionDown;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetA.P321.butPower := butPositionUp;
  Station.HalfSetA.P321.butMeasure := butPositionUp;
  Station.HalfSetA.P321.but600Ohm := butPositionUp;
  Station.HalfSetA.P321.cblVihGen := csDisconected;
  Station.HalfSetA.P321.cblVhYY := csDisconected;
  Station.HalfSetA.P321.swGradPit := GetRandomSwitcherState;

  Station.HalfSetB.P321.butPower := butPositionUp;
  Station.HalfSetB.P321.butMeasure := butPositionUp;
  Station.HalfSetB.P321.but600Ohm := butPositionUp;
  Station.HalfSetB.P321.cblVihGen := csDisconected;
  Station.HalfSetB.P321.cblVhYY := csDisconected;
  Station.HalfSetB.P321.swGradPit := GetRandomSwitcherState;

  Station.P321C.butPower := butPositionDown;
  Station.P321C.butMeasure := butPositionDown;
  Station.P321C.but600Ohm := butPositionDown;
  Station.P321C.cblVihGen := csDisconected;
  Station.P321C.cblVhYY := csDisconected;
  Station.P321C.swGradPit := GetRandomSwitcherState;

  Station.HalfSetA.P321.swNepGen := 1;
  Station.HalfSetA.P321.swFrequency := 1;
  Station.HalfSetA.P321.swNepGenYY := 1;

  Station.HalfSetB.P321.swNepGen := 2;
  Station.HalfSetB.P321.swFrequency := 2;
  Station.HalfSetB.P321.swNepGenYY := 2;

  Station.P321C.swNepGen := 3;
  Station.P321C.swFrequency := 3;
  Station.P321C.swNepGenYY := 3;

  Station.PowerSupply.butPower:= butPositionDown;

  Station.HalfSetA.P321.swGradGen := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradGen := GetRandomWaveValue;
  Station.P321C.swGradGen := GetRandomWaveValue;

  Station.HalfSetA.P321.swGradYY := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradYY := GetRandomWaveValue;
  Station.P321C.swGradYY := GetRandomWaveValue;

  Station.RemoteController.SwPVU := GetRandomSwitcherState;
  Station.RemoteController.butCall1 := GetRandomButtonState;
  Station.RemoteController.butCall2 := GetRandomButtonState;
  Station.RemoteController.butCall3 := GetRandomButtonState;
  Station.RemoteController.butCall4 := GetRandomButtonState;
  Station.RemoteController.butForceMachine := GetRandomButtonState;
  for i := 1 to 21 do
  begin
    Station.RemoteController.CrossA[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].Ud2PRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].Ud2PRD.stChannelState := stChannelNotTuned;
  end;
  Station.RemoteController.stGeneratorCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stGeneratorCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stGeneratorCableAType := NotSelected;
  Station.RemoteController.stGeneratorCableBType := NotSelected;
  {$ENDREGION}
end;

/// <summary>
///   Настраивает параметры станции для выполнения задания SingleCheck
/// </summary>
procedure TStationInitializer.InitForSingleCheckTask;
var
  i: Integer;
begin
  {$REGION 'Инициализация параметров стоек'}
  Station.Deviation.Rack1200A_PRD := stNotPassed;
  Station.Deviation.Rack1200A_PRM := stNotPassed;
  Station.Deviation.Rack1200B_PRD := stNotPassed;
  Station.Deviation.Rack1200B_PRM := stNotPassed;

  Station.Oscillograph.swRazvertka := 1;
  Station.Oscillograph.swRazvertkaShortTune := 11;
  Station.Oscillograph.butDirectOrAlternative  := butPositionUp;
  Station.Oscillograph.swSyncType := 2;
  Station.Oscillograph.butLevelPosition := butPositionUp;
  Station.Oscillograph.cblCabelSyncState := csDisconected;
  Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
  Station.Oscillograph.swCalibrator := 1;
  Station.Oscillograph.but1Khz := butPositionUp;
  Station.Oscillograph.swHz := 2;
  Station.Oscillograph.swVvsDel := 7;
  Station.Oscillograph.swPowerType := 2;
  Station.Oscillograph.cblCableUsilitelState := csDisconected;
  Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;

  Station.WaveMeter.Int := 3;
  Station.WaveMeter.Float := 9;

  Station.PowerPanel.swPhase := 4;
  Station.PowerPanel.swNet := 1;
  Station.PowerPanel.butRetranslator := butPositionDown;
  Station.PowerPanel.sw1700Power := 1;
  Station.PowerPanel.butRetranslator2 := butPositionDown;
  Station.PowerPanel.sw1900Power := 1;
  Station.PowerPanel.swHeat5A := 0;
  Station.PowerPanel.sw1900Power_2 := 1;
  Station.PowerPanel.sw1200Power := 1;
  Station.PowerPanel.sw1400 := 1;
  Station.PowerPanel.sw1200Power_2 := 1;
  Station.PowerPanel.butVent1 := butPositionDown;
  Station.PowerPanel.butUnitBK := butPositionDown;
  Station.PowerPanel.butVipriamit4V := butPositionDown;
  Station.PowerPanel.butVent1_2 := butPositionDown;
  Station.PowerPanel.butVent3 := butPositionDown;

  Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.swWave := Station.WaveReceiveA;

  Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.swWave := Station.WaveReceiveB;

  Station.HalfSetA.Duplexer.waveTransmit := GetRandomWaveValue;
  Station.HalfSetA.Duplexer.waveReceive := GetRandomWaveValue;
  Station.HalfSetA.Duplexer.cbSh1 := csDisconected;
  Station.HalfSetA.Duplexer.cb1840 := csConnectedAtDuplexeRight;
  Station.HalfSetA.Duplexer.cbSh2 := csDisconected;

  Station.HalfSetB.Duplexer.waveTransmit := GetRandomWaveValue;
  Station.HalfSetB.Duplexer.waveReceive := GetRandomWaveValue;
  Station.HalfSetB.Duplexer.cbSh1 := csDisconected;
  Station.HalfSetB.Duplexer.cb1840 := csConnectedAtDuplexeRight;
  Station.HalfSetB.Duplexer.cbSh2 := csDisconected;

  Station.HalfSetA.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetA.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1240K := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetA.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1220ADReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V := 1;
  Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetA.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1290 := 1;
  Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1240K := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetB.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1220ADReserve := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V := 1;
  Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetB.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1290 := 1;
  Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetA.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetB.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.Rack1400.butPower := butPositionLeft;
  Station.Rack1400.swKukushka := 1;
  Station.Rack1400.butSpeaker := butPositionLeft;

  Station.HalfSetA.Rack1500.butMode_R := butPositionRight;
  Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1500.DropError := False;
  Station.HalfSetA.Rack1500.SelectedMd := NotSelected;
  Station.HalfSetA.Rack1500.SelectedRetr := NotSelected;
  Station.HalfSetA.Rack1500.swModeControl := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave1610_0 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave1500 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swWave161_R := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.stCableLoad := csDisconected;
  Station.HalfSetA.Rack1500.stCableSh1 := csConnected;
  Station.HalfSetA.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetA.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetB.Rack1500.butMode_R := butPositionRight;
  Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1500.DropError := False;
  Station.HalfSetB.Rack1500.SelectedMd := NotSelected;
  Station.HalfSetB.Rack1500.SelectedRetr := NotSelected;
  Station.HalfSetB.Rack1500.swModeControl := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave1610_0 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave1500 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swWave161_R := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.stCableLoad := csDisconected;
  Station.HalfSetB.Rack1500.stCableSh1 := csConnected;
  Station.HalfSetB.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetB.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetA.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1600.SelectedMd := smdMain;
  Station.HalfSetA.Rack1600.SelectedUpch := sUpchReserve;
  Station.HalfSetA.Rack1600.SelectedDmch := sDmchReserve;
  Station.HalfSetA.Rack1600.butAutomatic := butPositionRight;
  Station.HalfSetA.Rack1600.butDmch := butPositionUp;
  Station.HalfSetA.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetA.Rack1600.swChannelControl := 9;
  Station.HalfSetA.Rack1600.wave1610_0 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1610_R := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1600 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.DropError := False;
  Station.HalfSetA.Rack1600.stMoshnost := False;

  Station.HalfSetB.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1600.SelectedMd := smdMain;
  Station.HalfSetB.Rack1600.SelectedUpch := sUpchReserve;
  Station.HalfSetB.Rack1600.SelectedDmch := sDmchReserve;
  Station.HalfSetB.Rack1600.butAutomatic := butPositionRight;
  Station.HalfSetB.Rack1600.butDmch := butPositionUp;
  Station.HalfSetB.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetB.Rack1600.swChannelControl := 9;
  Station.HalfSetB.Rack1600.wave1610_0 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1610_R := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1600 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.DropError := False;
  Station.HalfSetB.Rack1600.stMoshnost := False;

  Station.HalfSetA.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetA.Rack1600B.swUGS :=  5;;
  Station.HalfSetA.Rack1600B.swUGS2 := 5;
  Station.HalfSetA.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetA.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetA.Rack1600B.swKukushka := 1;
  Station.HalfSetA.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1621Reserve := butPositionUp;

  Station.HalfSetB.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetB.Rack1600B.swUGS :=  5;;
  Station.HalfSetB.Rack1600B.swUGS2 := 5;
  Station.HalfSetB.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetB.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetB.Rack1600B.swKukushka := 1;
  Station.HalfSetB.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1621Reserve := butPositionUp;

  Station.Rack1710.butPower := butPositionRight;
  Station.Rack1710.swKukushka := 1;
  Station.Rack1710.swWorkMode := 1;
  Station.Rack1710.butAutomat := butPositionUp;
  Station.Rack1710.butEmergencyLine1:= butPositionUp;
  Station.Rack1710.butEmergencyLine2:= butPositionUp;
  Station.Rack1710.but1220AD:= butPositionLeft;
  Station.Rack1710.but1230AD:= butPositionLeft;
  Station.Rack1710.but1290:= butPositionLeft;
  Station.Rack1710.but1220AM:= butPositionLeft;
  Station.Rack1710.but1230AM:= butPositionLeft;
  Station.Rack1710.but1210A:= butPositionLeft;
  Station.Rack1710.but1270:= butPositionLeft;
  Station.Rack1710.but1220AD_2:= butPositionLeft;
  Station.Rack1710.but1230AD_2:= butPositionLeft;
  Station.Rack1710.but1290_2:= butPositionLeft;
  Station.Rack1710.but1220AM_2:= butPositionLeft;
  Station.Rack1710.but1230AM_2:= butPositionLeft;
  Station.Rack1710.but1210A_2:= butPositionLeft;
  Station.Rack1710.but1270_2 := butPositionLeft;
  Station.Rack1710.swReductorCurrent := 1;
  Station.Rack1710.butExternalUplotnenieA := butPositionLeft;
  Station.Rack1710.butExternalUplotnenieB := butPositionLeft;
  Station.Rack1710.butSpeaker := butPositionRight;

  Station.HalfSetA.Rack1920.but1910 := butPositionUp;
  Station.HalfSetA.Rack1920.but1910A := butPositionUp;
  Station.HalfSetA.Rack1920.but1930 := butPositionUp;
  Station.HalfSetA.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetA.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetA.Rack1920.butPower := butPositionUp;
  Station.HalfSetA.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetB.Rack1920.but1910 := butPositionUp;
  Station.HalfSetB.Rack1920.but1910A := butPositionUp;
  Station.HalfSetB.Rack1920.but1930 := butPositionUp;
  Station.HalfSetB.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetB.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetB.Rack1920.butPower := butPositionUp;
  Station.HalfSetB.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetA.P321.butPower := butPositionUp;
  Station.HalfSetA.P321.butMeasure := butPositionUp;
  Station.HalfSetA.P321.but600Ohm := butPositionUp;
  Station.HalfSetA.P321.cblVihGen := csDisconected;
  Station.HalfSetA.P321.cblVhYY := csDisconected;
  Station.HalfSetA.P321.swGradPit := GetRandomSwitcherState;

  Station.HalfSetB.P321.butPower := butPositionUp;
  Station.HalfSetB.P321.butMeasure := butPositionUp;
  Station.HalfSetB.P321.but600Ohm := butPositionUp;
  Station.HalfSetB.P321.cblVihGen := csDisconected;
  Station.HalfSetB.P321.cblVhYY := csDisconected;
  Station.HalfSetB.P321.swGradPit := GetRandomSwitcherState;

  Station.P321C.butPower := butPositionUp;
  Station.P321C.butMeasure := butPositionUp;
  Station.P321C.but600Ohm := butPositionUp;
  Station.P321C.cblVihGen := csDisconected;
  Station.P321C.cblVhYY := csDisconected;
  Station.P321C.swGradPit := GetRandomSwitcherState;

  Station.HalfSetA.P321.swNepGen := 1;
  Station.HalfSetA.P321.swFrequency := 1;
  Station.HalfSetA.P321.swNepGenYY := 1;

  Station.HalfSetB.P321.swNepGen := 2;
  Station.HalfSetB.P321.swFrequency := 2;
  Station.HalfSetB.P321.swNepGenYY := 2;

  Station.P321C.swNepGen := 3;
  Station.P321C.swFrequency := 3;
  Station.P321C.swNepGenYY := 3;

  Station.PowerSupply.butPower:= butPositionUp;

  Station.HalfSetA.P321.swGradGen := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradGen := GetRandomWaveValue;
  Station.P321C.swGradGen := GetRandomWaveValue;

  Station.HalfSetA.P321.swGradYY := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradYY := GetRandomWaveValue;
  Station.P321C.swGradYY := GetRandomWaveValue;

  Station.RemoteController.SwPVU := GetRandomSwitcherState;
  Station.RemoteController.butCall1 := GetRandomButtonState;
  Station.RemoteController.butCall2 := GetRandomButtonState;
  Station.RemoteController.butCall3 := GetRandomButtonState;
  Station.RemoteController.butCall4 := GetRandomButtonState;
  Station.RemoteController.butForceMachine := GetRandomButtonState;
  for i := 1 to 21 do
  begin
    Station.RemoteController.CrossA[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].Ud2PRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].Ud2PRD.stChannelState := stChannelNotTuned;
  end;
  Station.RemoteController.stGeneratorCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stGeneratorCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stGeneratorCableAType := NotSelected;
  Station.RemoteController.stGeneratorCableBType := NotSelected;
  {$ENDREGION}
end;



procedure TStationInitializer.InitForTerminalMode;
var
  i: Integer;
begin
  {$REGION 'Инициализация параметров стоек'}
  Station.Deviation.Rack1200A_PRD := stPassed;
  Station.Deviation.Rack1200A_PRM := stPassed;
  Station.Deviation.Rack1200B_PRD := stPassed;
  Station.Deviation.Rack1200B_PRM := stPassed;

  Station.Oscillograph.swRazvertka := 1;
  Station.Oscillograph.swRazvertkaShortTune := 11;
  Station.Oscillograph.butDirectOrAlternative  := butPositionUp;
  Station.Oscillograph.swSyncType := 2;
  Station.Oscillograph.butLevelPosition := butPositionUp;
  Station.Oscillograph.cblCabelSyncState := csDisconected;
  Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
  Station.Oscillograph.swCalibrator := 1;
  Station.Oscillograph.but1Khz := butPositionUp;
  Station.Oscillograph.swHz := 2;
  Station.Oscillograph.swVvsDel := 7;
  Station.Oscillograph.swPowerType := 2;
  Station.Oscillograph.cblCableUsilitelState := csDisconected;
  Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;

  Station.WaveMeter.Int := 3;
  Station.WaveMeter.Float := 9;

  Station.PowerPanel.swPhase := 4;
  Station.PowerPanel.swNet := 1;
  Station.PowerPanel.butRetranslator := butPositionDown;
  Station.PowerPanel.sw1700Power := 1;
  Station.PowerPanel.butRetranslator2 := butPositionDown;
  Station.PowerPanel.sw1900Power := 1;
  Station.PowerPanel.swHeat5A := 0;
  Station.PowerPanel.sw1900Power_2 := 1;
  Station.PowerPanel.sw1200Power := 1;
  Station.PowerPanel.sw1400 := 1;
  Station.PowerPanel.sw1200Power_2 := 1;
  Station.PowerPanel.butVent1 := butPositionDown;
  Station.PowerPanel.butUnitBK := butPositionDown;
  Station.PowerPanel.butVipriamit4V := butPositionDown;
  Station.PowerPanel.butVent1_2 := butPositionDown;
  Station.PowerPanel.butVent3 := butPositionDown;

  Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.swWave := NetWorker.ClientState.ReceiverWaveA;

  Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.swWave := NetWorker.ClientState.ReceiverWaveB;

  Station.HalfSetA.Duplexer.waveTransmit := NetWorker.ClientState.TransmitterWaveA;
  Station.HalfSetA.Duplexer.waveReceive := NetWorker.ClientState.ReceiverWaveA;
  Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeLeft;
  Station.HalfSetA.Duplexer.cb1840 := csDisconected;
  Station.HalfSetA.Duplexer.cbSh2 := csConnectedAtDuplexeRight;

  Station.HalfSetB.Duplexer.waveTransmit := NetWorker.ClientState.TransmitterWaveB;
  Station.HalfSetB.Duplexer.waveReceive := NetWorker.ClientState.ReceiverWaveB;
  Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeLeft;
  Station.HalfSetB.Duplexer.cb1840 := csDisconected;
  Station.HalfSetB.Duplexer.cbSh2 := csConnectedAtDuplexeRight;

  Station.HalfSetA.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetA.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1240K := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetA.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1220ADReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V := 1;
  Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetA.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1290 := 1;
  Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1240K := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetB.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1220ADReserve := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V := 1;
  Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetB.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1290 := 1;
  Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetA.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetA.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetA.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetB.Rack1200Right.But1270Main := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1270Reserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1220AMReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1230AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1210AReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240V := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240G := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G1 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G2 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G3 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G4 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G5 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G6 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G7 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1240G8 := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.But1290Power := GetRandomButtonState;
  Station.HalfSetB.Rack1200Right.sw1290Power := GetRandomSwitcherState;
  Station.HalfSetB.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.Rack1400.butPower := butPositionLeft;
  Station.Rack1400.swKukushka := 1;
  Station.Rack1400.butSpeaker := butPositionLeft;

  Station.HalfSetA.Rack1500.butMode_R := butPositionLeft;
  Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1500.DropError := True;
  Station.HalfSetA.Rack1500.SelectedMd := smdMain;
  Station.HalfSetA.Rack1500.SelectedRetr := sRetrMain;
  Station.HalfSetA.Rack1500.swModeControl := 6;
  Station.HalfSetA.Rack1500.swWave1610_0 := NetWorker.ClientState.TransmitterWaveA;
  Station.HalfSetA.Rack1500.swWave1500 := NetWorker.ClientState.TransmitterWaveA;
  Station.HalfSetA.Rack1500.swWave161_R := NetWorker.ClientState.TransmitterWaveA;
  Station.HalfSetA.Rack1500.swPhaseMover := 10;
  Station.HalfSetA.Rack1500.GeterodinTunedMain := True;
  Station.HalfSetA.Rack1500.GeterodinTunedReserve := True;
  Station.HalfSetA.Rack1500.GeterodinIntMain := GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][0];
  Station.HalfSetA.Rack1500.GeterodinFloatMain := GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1];
  Station.HalfSetA.Rack1500.GeterodinIntReserve := GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][0];
  Station.HalfSetA.Rack1500.GeterodinFloatReserve := GeterodinWaves[NetWorker.ClientState.TransmitterWaveA][1];
  Station.HalfSetA.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
  Station.HalfSetA.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;
  Station.HalfSetA.Rack1500.btnAutomatic := butPositionRight;

  Station.HalfSetA.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetB.Rack1500.butMode_R := butPositionLeft;
  Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1500.DropError := True;
  Station.HalfSetB.Rack1500.SelectedMd := smdMain;
  Station.HalfSetB.Rack1500.SelectedRetr := sRetrMain;
  Station.HalfSetB.Rack1500.swModeControl := 6;
  Station.HalfSetB.Rack1500.swWave1610_0 := NetWorker.ClientState.TransmitterWaveB;
  Station.HalfSetB.Rack1500.swWave1500 := NetWorker.ClientState.TransmitterWaveB;
  Station.HalfSetB.Rack1500.swWave161_R := NetWorker.ClientState.TransmitterWaveB;
  Station.HalfSetB.Rack1500.swPhaseMover := 10;
  Station.HalfSetB.Rack1500.GeterodinTunedMain := True;
  Station.HalfSetB.Rack1500.GeterodinTunedReserve := True;
  Station.HalfSetB.Rack1500.GeterodinIntMain := GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][0];
  Station.HalfSetB.Rack1500.GeterodinFloatMain := GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1];
  Station.HalfSetB.Rack1500.GeterodinIntReserve := GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][0];
  Station.HalfSetB.Rack1500.GeterodinFloatReserve := GeterodinWaves[NetWorker.ClientState.TransmitterWaveB][1];
  Station.HalfSetB.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
  Station.HalfSetB.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;
  Station.HalfSetB.Rack1500.btnAutomatic := butPositionRight;

  Station.HalfSetB.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetA.Rack1600.GeterodinTunedMain := True;
  Station.HalfSetA.Rack1600.GeterodinTunedReserve := True;
  Station.HalfSetA.Rack1600.GeterodinIntMain := GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][0];
  Station.HalfSetA.Rack1600.GeterodinFloatMain := GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1];
  Station.HalfSetA.Rack1600.GeterodinIntReserve := GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][0];
  Station.HalfSetA.Rack1600.GeterodinFloatReserve := GeterodinWaves[NetWorker.ClientState.ReceiverWaveA][1];
  Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1600.SelectedMd := smdMain;
  Station.HalfSetA.Rack1600.SelectedUpch := sUpchMain;
  Station.HalfSetA.Rack1600.SelectedDmch := sDmchMain;
  Station.HalfSetA.Rack1600.butAutomatic := butPositionLeft;
  Station.HalfSetA.Rack1600.butDmch := butPositionDown;
  Station.HalfSetA.Rack1600.butChannelControl := butPositionDown;
  Station.HalfSetA.Rack1600.swChannelControl := 9;
  Station.HalfSetA.Rack1600.wave1610_0 := NetWorker.ClientState.ReceiverWaveA;
  Station.HalfSetA.Rack1600.wave1610_R := NetWorker.ClientState.ReceiverWaveA;
  Station.HalfSetA.Rack1600.wave1600 := NetWorker.ClientState.ReceiverWaveA;
  Station.HalfSetA.Rack1600.DropError := True;
  Station.HalfSetA.Rack1600.stMoshnost := True;

  Station.HalfSetB.Rack1600.GeterodinTunedMain := True;
  Station.HalfSetB.Rack1600.GeterodinTunedReserve := True;
  Station.HalfSetB.Rack1600.GeterodinIntMain := GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][0];
  Station.HalfSetB.Rack1600.GeterodinFloatMain := GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1];
  Station.HalfSetB.Rack1600.GeterodinIntReserve := GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][0];
  Station.HalfSetB.Rack1600.GeterodinFloatReserve := GeterodinWaves[NetWorker.ClientState.ReceiverWaveB][1];
  Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1600.SelectedMd := smdMain;
  Station.HalfSetB.Rack1600.SelectedUpch := sUpchMain;
  Station.HalfSetB.Rack1600.SelectedDmch := sDmchMain;
  Station.HalfSetB.Rack1600.butAutomatic := butPositionLeft;
  Station.HalfSetB.Rack1600.butDmch := butPositionDown;
  Station.HalfSetB.Rack1600.butChannelControl := butPositionDown;
  Station.HalfSetB.Rack1600.swChannelControl := 9;
  Station.HalfSetB.Rack1600.wave1610_0 := NetWorker.ClientState.ReceiverWaveB;
  Station.HalfSetB.Rack1600.wave1610_R := NetWorker.ClientState.ReceiverWaveB;
  Station.HalfSetB.Rack1600.wave1600 := NetWorker.ClientState.ReceiverWaveB;
  Station.HalfSetB.Rack1600.DropError := True;
  Station.HalfSetB.Rack1600.stMoshnost := True;

  Station.HalfSetA.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetA.Rack1600B.swUGS :=  5;;
  Station.HalfSetA.Rack1600B.swUGS2 := 5;
  Station.HalfSetA.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetA.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetA.Rack1600B.swKukushka := 1;
  Station.HalfSetA.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1621Reserve := butPositionUp;

  Station.HalfSetB.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetB.Rack1600B.swUGS :=  5;;
  Station.HalfSetB.Rack1600B.swUGS2 := 5;
  Station.HalfSetB.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetB.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetB.Rack1600B.swKukushka := 1;
  Station.HalfSetB.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1621Reserve := butPositionUp;

  Station.Rack1710.butPower := butPositionRight;
  Station.Rack1710.swKukushka := 1;
  Station.Rack1710.swWorkMode := 1;
  Station.Rack1710.butAutomat := butPositionUp;
  Station.Rack1710.butEmergencyLine1:= butPositionUp;
  Station.Rack1710.butEmergencyLine2:= butPositionUp;
  Station.Rack1710.but1220AD:= butPositionLeft;
  Station.Rack1710.but1230AD:= butPositionLeft;
  Station.Rack1710.but1290:= butPositionLeft;
  Station.Rack1710.but1220AM:= butPositionLeft;
  Station.Rack1710.but1230AM:= butPositionLeft;
  Station.Rack1710.but1210A:= butPositionLeft;
  Station.Rack1710.but1270:= butPositionLeft;
  Station.Rack1710.but1220AD_2:= butPositionLeft;
  Station.Rack1710.but1230AD_2:= butPositionLeft;
  Station.Rack1710.but1290_2:= butPositionLeft;
  Station.Rack1710.but1220AM_2:= butPositionLeft;
  Station.Rack1710.but1230AM_2:= butPositionLeft;
  Station.Rack1710.but1210A_2:= butPositionLeft;
  Station.Rack1710.but1270_2 := butPositionLeft;
  Station.Rack1710.swReductorCurrent := 1;
  Station.Rack1710.butExternalUplotnenieA := butPositionLeft;
  Station.Rack1710.butExternalUplotnenieB := butPositionLeft;
  Station.Rack1710.butSpeaker := butPositionRight;

  Station.HalfSetA.Rack1920.but1910 := butPositionUp;
  Station.HalfSetA.Rack1920.but1910A := butPositionUp;
  Station.HalfSetA.Rack1920.but1930 := butPositionUp;
  Station.HalfSetA.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOn := butPositionDown;
  Station.HalfSetA.Rack1920.butHighOff := butPositionUp;
  Station.HalfSetA.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetA.Rack1920.stLBV1_TurnedOn := True;
  Station.HalfSetA.Rack1920.stLBV2_TurnedOn := True;
  Station.HalfSetA.Rack1920.butHighOn2 := butPositionDown;
  Station.HalfSetA.Rack1920.butHighOff2 := butPositionUp;
  Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionDown;
  Station.HalfSetA.Rack1920.butPower := butPositionUp;
  Station.HalfSetA.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := True;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := True;

  Station.HalfSetB.Rack1920.but1910 := butPositionUp;
  Station.HalfSetB.Rack1920.but1910A := butPositionUp;
  Station.HalfSetB.Rack1920.but1930 := butPositionUp;
  Station.HalfSetB.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOn := butPositionDown;
  Station.HalfSetB.Rack1920.butHighOff := butPositionUp;
  Station.HalfSetB.Rack1920.butCurrent5MA := butPositionDown;
  Station.HalfSetB.Rack1920.stLBV1_TurnedOn := True;
  Station.HalfSetB.Rack1920.stLBV2_TurnedOn := True;
  Station.HalfSetB.Rack1920.butHighOn2 := butPositionDown;
  Station.HalfSetB.Rack1920.butHighOff2 := butPositionUp;
  Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetB.Rack1920.butPower := butPositionUp;
  Station.HalfSetB.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := True;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := True;

  Station.HalfSetA.P321.butPower := butPositionUp;
  Station.HalfSetA.P321.butMeasure := butPositionUp;
  Station.HalfSetA.P321.but600Ohm := butPositionUp;
  Station.HalfSetA.P321.cblVihGen := csDisconected;
  Station.HalfSetA.P321.cblVhYY := csDisconected;
  Station.HalfSetA.P321.swGradPit := GetRandomSwitcherState;

  Station.HalfSetB.P321.butPower := butPositionUp;
  Station.HalfSetB.P321.butMeasure := butPositionUp;
  Station.HalfSetB.P321.but600Ohm := butPositionUp;
  Station.HalfSetB.P321.cblVihGen := csDisconected;
  Station.HalfSetB.P321.cblVhYY := csDisconected;
  Station.HalfSetB.P321.swGradPit := GetRandomSwitcherState;

  Station.P321C.butPower := butPositionUp;
  Station.P321C.butMeasure := butPositionUp;
  Station.P321C.but600Ohm := butPositionUp;
  Station.P321C.cblVihGen := csDisconected;
  Station.P321C.cblVhYY := csDisconected;
  Station.P321C.swGradPit := 31;

  Station.HalfSetA.P321.swNepGen := 1;
  Station.HalfSetA.P321.swFrequency := 1;
  Station.HalfSetA.P321.swNepGenYY := 1;

  Station.HalfSetB.P321.swNepGen := 2;
  Station.HalfSetB.P321.swFrequency := 2;
  Station.HalfSetB.P321.swNepGenYY := 2;

  Station.P321C.swNepGen := 3;
  Station.P321C.swFrequency := 3;
  Station.P321C.swNepGenYY := 3;

  Station.PowerSupply.butPower:= butPositionUp;

  Station.HalfSetA.P321.swGradGen := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradGen := GetRandomWaveValue;
  Station.P321C.swGradGen := 31;

  Station.HalfSetA.P321.swGradYY := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradYY := GetRandomWaveValue;
  Station.P321C.swGradYY := 31;

  Station.RemoteController.SwPVU := GetRandomSwitcherState;
  Station.RemoteController.butCall1 := GetRandomButtonState;
  Station.RemoteController.butCall2 := GetRandomButtonState;
  Station.RemoteController.butCall3 := GetRandomButtonState;
  Station.RemoteController.butCall4 := GetRandomButtonState;
  Station.RemoteController.butForceMachine := GetRandomButtonState;
  for i := 1 to 21 do
  begin
    Station.RemoteController.CrossA[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].AbonentPRM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].ChannelD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].Ud2PRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].UdPRM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].Ud2PRM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].AbonentPRM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].ChannelD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].Ud2PRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].UdPRM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].Ud2PRM.stChannelState := stChannelNotTuned;
  end;
  Station.RemoteController.stGeneratorCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stGeneratorCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stGeneratorCableAType := NotSelected;
  Station.RemoteController.stGeneratorCableBType := NotSelected;
  {$ENDREGION}
end;

/// <summary>
///   Настраивает параметры станции для выполнения задания
///   ConnectToR415
/// </summary>
procedure TStationInitializer.InitForConnectToR415Task;
var
  i: Integer;
begin
  {$REGION 'Инициализация параметров стоек'}
  Station.PowerSupply.butPower:= butPositionUp;

  Station.WaveMeter.Int := 14;
  Station.WaveMeter.Float := 84;

  Station.PowerPanel.swPhase := 0;
  Station.PowerPanel.swNet := 1;
  Station.PowerPanel.butRetranslator := 0;
  Station.PowerPanel.sw1700Power := 1;
  Station.PowerPanel.butRetranslator2 := 0;
  Station.PowerPanel.sw1900Power := 1;
  Station.PowerPanel.swHeat5A := 0;
  Station.PowerPanel.sw1900Power_2 := 1;
  Station.PowerPanel.sw1200Power := 1;
  Station.PowerPanel.sw1400 := 1;
  Station.PowerPanel.sw1200Power_2 := 1;
  Station.PowerPanel.butVent1 := 0;
  Station.PowerPanel.butUnitBK := 0;
  Station.PowerPanel.butVipriamit4V := 0;
  Station.PowerPanel.butVent1_2 := 0;
  Station.PowerPanel.butVent3 := 0;

  Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.swWave := Station.WaveReceiveA;

  Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.swWave := Station.WaveReceiveB;

  Station.HalfSetA.Duplexer.waveTransmit := Station.WaveTransmitA;
  Station.HalfSetA.Duplexer.waveReceive := Station.WaveReceiveA;
  Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetA.Duplexer.cb1840 := csDisconected;
  Station.HalfSetA.Duplexer.cbSh2 := csConnectedAtDuplexeLeft;

  Station.HalfSetB.Duplexer.waveTransmit := Station.WaveTransmitB;
  Station.HalfSetB.Duplexer.waveReceive := Station.WaveReceiveB;
  Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetB.Duplexer.cb1840 := csDisconected;
  Station.HalfSetB.Duplexer.cbSh2 := csConnectedAtDuplexeLeft;

  Station.HalfSetA.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetA.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1240K := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetA.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1220ADReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V := 1;
  Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetA.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1290 := 1;
  Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetA.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1240K := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetB.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1220ADReserve := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V := 1;
  Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 1;
  Station.HalfSetB.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1290 := 1;
  Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
  Station.HalfSetB.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetA.Rack1200Right.But1270Main := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1220AMMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1230AMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1210AMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.but1210ARetrMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1270Reserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1220AMReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1230AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1210AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.but1210ARetrReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V := 4;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V2 := 4;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := 4;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetA.Rack1200Right.But1240G := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G1 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G2 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G3 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G4 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G5 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G6 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G7 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G8 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1290Power := butPositionUp;
  Station.HalfSetA.Rack1200Right.sw1290Power := 1;
  Station.HalfSetA.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetB.Rack1200Right.But1270Main := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1220AMMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1230AMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1210AMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.but1210ARetrMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1270Reserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1220AMReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1230AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1210AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.but1210ARetrReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V := 4;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := 4;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := 4;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
  Station.HalfSetB.Rack1200Right.But1240G := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G1 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G2 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G3 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G4 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G5 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G6 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G7 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G8 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1290Power := butPositionUp;
  Station.HalfSetB.Rack1200Right.sw1290Power := 1;
  Station.HalfSetB.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.Rack1400.butPower := butPositionRight;
  Station.Rack1400.swKukushka := 1;
  Station.Rack1400.butSpeaker := butPositionRight;

  Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1500.DropError := False;
  Station.HalfSetA.Rack1500.SelectedMd := smdRetr;
  Station.HalfSetA.Rack1500.SelectedRetr := sRetrMain;
  Station.HalfSetA.Rack1500.swModeControl := 6;
  Station.HalfSetA.Rack1500.swWave1610_0 := Station.WaveTransmitA;
  Station.HalfSetA.Rack1500.swWave1500 := Station.WaveTransmitA;
  Station.HalfSetA.Rack1500.swWave161_R := Station.WaveTransmitA;
  Station.HalfSetA.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
  Station.HalfSetA.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;
  Station.HalfSetA.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetA.Rack1500B.but1622_1 := butPositionUp;
  Station.HalfSetA.Rack1500B.but1622_2 := butPositionUp;
  Station.HalfSetA.Rack1500B.butMdOsn_1 := butPositionLeft;
  Station.HalfSetA.Rack1500B.butMdOsn_2 := butPositionLeft;
  Station.HalfSetA.Rack1500B.butMdOsn_3 := butPositionLeft;

  Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1500.DropError := False;
  Station.HalfSetB.Rack1500.SelectedMd := smdMain;
  Station.HalfSetB.Rack1500.SelectedRetr := sRetrReserv;
  Station.HalfSetB.Rack1500.swModeControl := 6;
  Station.HalfSetB.Rack1500.swWave1610_0 := Station.WaveTransmitB;
  Station.HalfSetB.Rack1500.swWave1500 := Station.WaveTransmitB;
  Station.HalfSetB.Rack1500.swWave161_R := Station.WaveTransmitB;
  Station.HalfSetB.Rack1500.swPhaseMover := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1500.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
  Station.HalfSetB.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;
  Station.HalfSetB.Rack1500.btnAutomatic := butPositionLeft;

  Station.HalfSetB.Rack1500B.but1622_1 := butPositionUp;
  Station.HalfSetB.Rack1500B.but1622_2 := butPositionUp;
  Station.HalfSetB.Rack1500B.butMdOsn_1 := butPositionLeft;
  Station.HalfSetB.Rack1500B.butMdOsn_2 := butPositionLeft;
  Station.HalfSetB.Rack1500B.butMdOsn_3 := butPositionLeft;

  Station.HalfSetA.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetA.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetA.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1600.SelectedMd := smdMain;
  Station.HalfSetA.Rack1600.SelectedUpch := sUpchReserve;
  Station.HalfSetA.Rack1600.SelectedDmch := sDmchMain;
  Station.HalfSetA.Rack1600.butAutomatic := butPositionRight;
  Station.HalfSetA.Rack1600.butDmch := butPositionUp;
  Station.HalfSetA.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetA.Rack1600.swChannelControl := 9;
  Station.HalfSetA.Rack1600.wave1610_0 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1610_R := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1600 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.DropError := False;
  Station.HalfSetA.Rack1600.stMoshnost := False;

  Station.HalfSetB.Rack1600.GeterodinTunedMain := False;
  Station.HalfSetB.Rack1600.GeterodinTunedReserve := False;
  Station.HalfSetB.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1600.SelectedMd := smdMain;
  Station.HalfSetB.Rack1600.SelectedUpch := sUpchReserve;
  Station.HalfSetB.Rack1600.SelectedDmch := sDmchMain;
  Station.HalfSetB.Rack1600.butAutomatic := butPositionRight;
  Station.HalfSetB.Rack1600.butDmch := butPositionUp;
  Station.HalfSetB.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetB.Rack1600.swChannelControl := 9;
  Station.HalfSetB.Rack1600.wave1610_0 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1610_R := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1600 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.DropError := False;
  Station.HalfSetB.Rack1600.stMoshnost := False;

  Station.HalfSetA.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetA.Rack1600B.swUGS :=  5;;
  Station.HalfSetA.Rack1600B.swUGS2 := 5;
  Station.HalfSetA.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetA.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetA.Rack1600B.swKukushka := 1;
  Station.HalfSetA.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1621Reserve := butPositionUp;

  Station.HalfSetB.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetB.Rack1600B.swUGS :=  5;;
  Station.HalfSetB.Rack1600B.swUGS2 := 5;
  Station.HalfSetB.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetB.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetB.Rack1600B.swKukushka := 1;
  Station.HalfSetB.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1621Reserve := butPositionUp;

  Station.Rack1710.butPower := butPositionRight;
  Station.Rack1710.swKukushka := 1;
  Station.Rack1710.swWorkMode := 1;
  Station.Rack1710.butAutomat := butPositionUp;
  Station.Rack1710.butEmergencyLine1:= butPositionUp;
  Station.Rack1710.butEmergencyLine2:= butPositionUp;
  Station.Rack1710.but1220AD:= butPositionLeft;
  Station.Rack1710.but1230AD:= butPositionLeft;
  Station.Rack1710.but1290:= butPositionLeft;
  Station.Rack1710.but1220AM:= butPositionLeft;
  Station.Rack1710.but1230AM:= butPositionLeft;
  Station.Rack1710.but1210A:= butPositionLeft;
  Station.Rack1710.but1270:= butPositionLeft;
  Station.Rack1710.but1220AD_2:= butPositionLeft;
  Station.Rack1710.but1230AD_2:= butPositionLeft;
  Station.Rack1710.but1290_2:= butPositionLeft;
  Station.Rack1710.but1220AM_2:= butPositionLeft;
  Station.Rack1710.but1230AM_2:= butPositionLeft;
  Station.Rack1710.but1210A_2:= butPositionLeft;
  Station.Rack1710.but1270_2 := butPositionLeft;
  Station.Rack1710.swReductorCurrent := 1;
  Station.Rack1710.butPower := butPositionRight;
  Station.Rack1710.butExternalUplotnenieA := butPositionLeft;
  Station.Rack1710.butExternalUplotnenieB := butPositionLeft;
  Station.Rack1710.butSpeaker := butPositionRight;

  Station.HalfSetA.Rack1920.but1910 := butPositionUp;
  Station.HalfSetA.Rack1920.but1910A := butPositionUp;
  Station.HalfSetA.Rack1920.but1930 := butPositionUp;
  Station.HalfSetA.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetA.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetA.Rack1920.butPower := butPositionUp;
  Station.HalfSetA.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetB.Rack1920.but1910 := butPositionUp;
  Station.HalfSetB.Rack1920.but1910A := butPositionUp;
  Station.HalfSetB.Rack1920.but1930 := butPositionUp;
  Station.HalfSetB.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOn := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA := butPositionUp;
  Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
  Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
  Station.HalfSetB.Rack1920.butHighOn2 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOff2 := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionUp;
  Station.HalfSetB.Rack1920.butPower := butPositionUp;
  Station.HalfSetB.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;

  Station.HalfSetA.P321.butPower := butPositionUp;
  Station.HalfSetA.P321.butMeasure := butPositionUp;
  Station.HalfSetA.P321.but600Ohm := butPositionUp;
  Station.HalfSetA.P321.cblVihGen := csDisconected;
  Station.HalfSetA.P321.cblVhYY := csDisconected;

  Station.HalfSetB.P321.butPower := butPositionUp;
  Station.HalfSetB.P321.butMeasure := butPositionUp;
  Station.HalfSetB.P321.but600Ohm := butPositionUp;
  Station.HalfSetB.P321.cblVihGen := csDisconected;
  Station.HalfSetB.P321.cblVhYY := csDisconected;

  Station.P321C.butPower := butPositionUp;
  Station.P321C.butMeasure := butPositionUp;
  Station.P321C.but600Ohm := butPositionUp;
  Station.P321C.cblVihGen := csDisconected;
  Station.P321C.cblVhYY := csDisconected;

  Station.HalfSetA.P321.swNepGen := 1;
  Station.HalfSetA.P321.swFrequency := 1;
  Station.HalfSetA.P321.swNepGenYY := 1;
  Station.HalfSetA.P321.swGradPit := GetRandomSwitcherState;

  Station.HalfSetB.P321.swNepGen := 2;
  Station.HalfSetB.P321.swFrequency := 2;
  Station.HalfSetB.P321.swNepGenYY := 2;
  Station.HalfSetB.P321.swGradPit := GetRandomSwitcherState;

  Station.P321C.swNepGen := 3;
  Station.P321C.swFrequency := 3;
  Station.P321C.swNepGenYY := 3;
  Station.P321C.swGradPit := GetRandomSwitcherState;

  Station.HalfSetA.P321.swGradGen := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradGen := GetRandomWaveValue;
  Station.P321C.swGradGen := GetRandomWaveValue;

  Station.HalfSetA.P321.swGradYY := GetRandomWaveValue;
  Station.HalfSetB.P321.swGradYY := GetRandomWaveValue;
  Station.P321C.swGradYY := GetRandomWaveValue;

  Station.RemoteController.SwPVU := 1;
  Station.RemoteController.butCall1 := butPositionDown;
  Station.RemoteController.butCall2 := butPositionDown;
  Station.RemoteController.butCall3 := butPositionDown;
  Station.RemoteController.butCall4 := butPositionDown;
  Station.RemoteController.butForceMachine := GetRandomButtonState;
  Station.RemoteController.stInputYYCableAType := NotSelected;
  Station.RemoteController.stInputYYCableBType := NotSelected;
  for i := 1 to 21 do
  begin
    Station.RemoteController.CrossA[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].Ud2PRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].Ud2PRD.stChannelState := stChannelNotTuned;
  end;
  Station.RemoteController.stGeneratorCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stGeneratorCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stGeneratorCableAType := NotSelected;
  Station.RemoteController.stGeneratorCableBType := NotSelected;
  {$ENDREGION}
end;

/// <summary>
///   Настраивает параметры станции для выполнения задания WorkWithLowFrequency
/// </summary>
procedure TStationInitializer.InitForWorkWithLowFrequencyTask;
var
  i: Integer;
begin
  {$REGION 'Инициализация параметров стоек'}
  //Случайная расстановка
  Station.WaveMeter.Int := 14;
  Station.WaveMeter.Float := 84;

  Station.Oscillograph.swRazvertka := 1;
  Station.Oscillograph.swRazvertkaShortTune := 11;
  Station.Oscillograph.butDirectOrAlternative  := butPositionUp;
  Station.Oscillograph.swSyncType := 2;
  Station.Oscillograph.butLevelPosition := butPositionUp;
  Station.Oscillograph.cblCabelSyncState := csDisconected;
  Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
  Station.Oscillograph.swCalibrator := 1;
  Station.Oscillograph.but1Khz := butPositionUp;
  Station.Oscillograph.swHz := 2;
  Station.Oscillograph.swVvsDel := 7;
  Station.Oscillograph.swPowerType := 2;
  Station.Oscillograph.cblCableUsilitelState := csDisconected;
  Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;

  Station.PowerPanel.swPhase := 0;
  Station.PowerPanel.swNet := 1;
  Station.PowerPanel.butRetranslator := 0;
  Station.PowerPanel.sw1700Power := 1;
  Station.PowerPanel.butRetranslator2 := 0;
  Station.PowerPanel.sw1900Power := 1;
  Station.PowerPanel.swHeat5A := 0;
  Station.PowerPanel.sw1900Power_2 := 1;
  Station.PowerPanel.sw1200Power := 1;
  Station.PowerPanel.sw1400 := 1;
  Station.PowerPanel.sw1200Power_2 := 1;
  Station.PowerPanel.butVent1 := 0;
  Station.PowerPanel.butUnitBK := 0;
  Station.PowerPanel.butVipriamit4V := 0;
  Station.PowerPanel.butVent1_2 := 0;
  Station.PowerPanel.butVent3 := 0;

  Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetA.LittleNoisyAmplifier.swWave := Station.WaveReceiveA;

  Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
  Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionUp;
  Station.HalfSetB.LittleNoisyAmplifier.swWave := Station.WaveReceiveB;

  Station.HalfSetA.Duplexer.waveTransmit := Station.WaveTransmitA;
  Station.HalfSetA.Duplexer.waveReceive := Station.WaveReceiveA;
  Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetA.Duplexer.cb1840 := csDisconected;
  Station.HalfSetA.Duplexer.cbSh2 := csConnectedAtDuplexeLeft;

  Station.HalfSetB.Duplexer.waveTransmit := Station.WaveTransmitB;
  Station.HalfSetB.Duplexer.waveReceive := Station.WaveReceiveB;
  Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
  Station.HalfSetB.Duplexer.cb1840 := csDisconected;
  Station.HalfSetB.Duplexer.cbSh2 := csConnectedAtDuplexeLeft;

  Station.HalfSetA.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetA.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1240K := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetA.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetA.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1220ADReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetA.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V := 4;
  Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Left.Sw1240V2 := 4;
  Station.HalfSetA.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetA.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetA.Rack1200Left.Sw1290 := 1;
  Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetA.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetA.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetB.Rack1200Left.butChannelControl := butPositionDown;
  Station.HalfSetB.Rack1200Left.but1220ADMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1230AMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1240K := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfUchastok := 1;
  Station.HalfSetB.Rack1200Left.SwNumberOfStantion := 1;
  Station.HalfSetB.Rack1200Left.but1240K := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1220ADReserve := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1230AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain := butPositionUp;
  Station.HalfSetB.Rack1200Left.But1240GMain2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GPrmPrd := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240GOneTwo := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V := 4;
  Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Left.Sw1240V2 := 4;
  Station.HalfSetB.Rack1200Left.but1240G1 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G2 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G3 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G4 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G5 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G6 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G7 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1240G8 := butPositionUp;
  Station.HalfSetB.Rack1200Left.but1290Power := butPositionUp;
  Station.HalfSetB.Rack1200Left.Sw1290 := 1;
  Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
  Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
  Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
  Station.HalfSetB.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240VTune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
  Station.HalfSetB.Rack1200Left.sw1240GTune := GetRandomTuneValue;

  Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetA.Rack1200Right.But1270Main := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1220AMMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1230AMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1210AMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.but1210ARetrMain := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1270Reserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1220AMReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1230AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1210AReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.but1210ARetrReserve := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V := 4;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V2 := 4;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetA.Rack1200Right.Sw1240V3 := 4;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetA.Rack1200Right.But1240G := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G1 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G2 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G3 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G4 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G5 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G6 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G7 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1240G8 := butPositionUp;
  Station.HalfSetA.Rack1200Right.But1290Power := butPositionUp;
  Station.HalfSetA.Rack1200Right.sw1290Power := 1;
  Station.HalfSetA.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetA.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
  Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
  Station.HalfSetB.Rack1200Right.But1270Main := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1220AMMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1230AMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1210AMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.but1210ARetrMain := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1270Reserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1220AMReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1230AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1210AReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.but1210ARetrReserve := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240V := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V := 4;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.But1240V2 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V2 := 4;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.But1240V3 := butPositionLeft;
  Station.HalfSetB.Rack1200Right.Sw1240V3 := 4;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedInCross;
  Station.HalfSetB.Rack1200Right.But1240G := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G1 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G2 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G3 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G4 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G5 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G6 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G7 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1240G8 := butPositionUp;
  Station.HalfSetB.Rack1200Right.But1290Power := butPositionUp;
  Station.HalfSetB.Rack1200Right.sw1290Power := 1;
  Station.HalfSetB.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240GTune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
  Station.HalfSetB.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

  Station.Rack1400.butPower := butPositionRight;
  Station.Rack1400.swKukushka := 1;
  Station.Rack1400.butSpeaker := butPositionRight;

  Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1500.DropError := True;
  Station.HalfSetA.Rack1500.SelectedMd := smdMain;
  Station.HalfSetA.Rack1500.SelectedRetr := sRetrMain;
  Station.HalfSetA.Rack1500.btnAutomatic := butPositionRight;
  Station.HalfSetA.Rack1500.swModeControl := 6;
  Station.HalfSetA.Rack1500.swWave1610_0 := Station.WaveTransmitA;
  Station.HalfSetA.Rack1500.swWave1500 := Station.WaveTransmitA;
  Station.HalfSetA.Rack1500.swWave161_R := Station.WaveTransmitA;
  Station.HalfSetA.Rack1500.swPhaseMover := 10;
  Station.HalfSetA.Rack1500.GeterodinTunedMain := True;
  Station.HalfSetA.Rack1500.GeterodinTunedReserve := True;
  Station.HalfSetA.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
  Station.HalfSetA.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;

  Station.HalfSetA.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetA.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1500.DropError := True;
  Station.HalfSetB.Rack1500.SelectedMd := smdMain;
  Station.HalfSetB.Rack1500.SelectedRetr := sRetrMain;
  Station.HalfSetB.Rack1500.btnAutomatic := butPositionRight;
  Station.HalfSetB.Rack1500.swModeControl := 6;
  Station.HalfSetB.Rack1500.swWave1610_0 := Station.WaveTransmitB;
  Station.HalfSetB.Rack1500.swWave1500 := Station.WaveTransmitB;
  Station.HalfSetB.Rack1500.swWave161_R := Station.WaveTransmitB;
  Station.HalfSetB.Rack1500.swPhaseMover := 10;
  Station.HalfSetB.Rack1500.GeterodinTunedMain := True;
  Station.HalfSetB.Rack1500.GeterodinTunedReserve := True;
  Station.HalfSetB.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
  Station.HalfSetB.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;

  Station.HalfSetB.Rack1500B.but1622_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.but1622_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_1 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_2 := GetRandomButtonState;
  Station.HalfSetB.Rack1500B.butMdOsn_3 := GetRandomButtonState;

  Station.HalfSetA.Rack1600.GeterodinTunedMain := True;
  Station.HalfSetA.Rack1600.GeterodinTunedReserve := True;
  Station.HalfSetA.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetA.Rack1600.SelectedMd := smdMain;
  Station.HalfSetA.Rack1600.SelectedUpch := sUpchMain;
  Station.HalfSetA.Rack1600.SelectedDmch := sDmchMain;
  Station.HalfSetA.Rack1600.butAutomatic := butPositionLeft;
  Station.HalfSetA.Rack1600.butDmch := butPositionUp;
  Station.HalfSetA.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetA.Rack1600.swChannelControl := 9;
  Station.HalfSetA.Rack1600.wave1610_0 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1610_R := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.wave1600 := Station.WaveReceiveA;
  Station.HalfSetA.Rack1600.DropError := True;
  Station.HalfSetA.Rack1600.stMoshnost := True;

  Station.HalfSetB.Rack1600.GeterodinTunedMain := True;
  Station.HalfSetB.Rack1600.GeterodinTunedReserve := True;
  Station.HalfSetB.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
  Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
  Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
  Station.HalfSetB.Rack1600.SelectedMd := smdMain;
  Station.HalfSetB.Rack1600.SelectedUpch := sUpchMain;
  Station.HalfSetB.Rack1600.SelectedDmch := sDmchMain;
  Station.HalfSetB.Rack1600.butAutomatic := butPositionLeft;
  Station.HalfSetB.Rack1600.butDmch := butPositionUp;
  Station.HalfSetB.Rack1600.butChannelControl := butPositionUp;
  Station.HalfSetB.Rack1600.swChannelControl := 9;
  Station.HalfSetB.Rack1600.wave1610_0 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1610_R := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.wave1600 := Station.WaveReceiveB;
  Station.HalfSetB.Rack1600.DropError := True;
  Station.HalfSetB.Rack1600.stMoshnost := True;

  Station.HalfSetA.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetA.Rack1600B.swUGS :=  5;;
  Station.HalfSetA.Rack1600B.swUGS2 := 5;
  Station.HalfSetA.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetA.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetA.Rack1600B.swKukushka := 1;
  Station.HalfSetA.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetA.Rack1600B.but1621Reserve := butPositionUp;

  Station.HalfSetB.Rack1600B.but1622Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1622Reserve := butPositionUp;
  Station.HalfSetB.Rack1600B.swUGS :=  5;;
  Station.HalfSetB.Rack1600B.swUGS2 := 5;
  Station.HalfSetB.Rack1600B.butUPT := butPositionRight;
  Station.HalfSetB.Rack1600B.butUPT2 := butPositionRight;
  Station.HalfSetB.Rack1600B.swKukushka := 1;
  Station.HalfSetB.Rack1600B.but1621Main := butPositionUp;
  Station.HalfSetB.Rack1600B.but1621Reserve := butPositionUp;

  Station.Rack1710.butPower := butPositionLeft;
  Station.Rack1710.swKukushka := 1;
  Station.Rack1710.swWorkMode := 1;
  Station.Rack1710.butAutomat := butPositionUp;
  Station.Rack1710.butEmergencyLine1:= butPositionUp;
  Station.Rack1710.butEmergencyLine2:= butPositionUp;
  Station.Rack1710.but1220AD:= butPositionLeft;
  Station.Rack1710.but1230AD:= butPositionLeft;
  Station.Rack1710.but1290:= butPositionLeft;
  Station.Rack1710.but1220AM:= butPositionLeft;
  Station.Rack1710.but1230AM:= butPositionLeft;
  Station.Rack1710.but1210A:= butPositionLeft;
  Station.Rack1710.but1270:= butPositionLeft;
  Station.Rack1710.but1220AD_2:= butPositionLeft;
  Station.Rack1710.but1230AD_2:= butPositionLeft;
  Station.Rack1710.but1290_2:= butPositionLeft;
  Station.Rack1710.but1220AM_2:= butPositionLeft;
  Station.Rack1710.but1230AM_2:= butPositionLeft;
  Station.Rack1710.but1210A_2:= butPositionLeft;
  Station.Rack1710.but1270_2 := butPositionLeft;
  Station.Rack1710.swReductorCurrent := 1;
  Station.Rack1710.butPower := butPositionLeft;
  Station.Rack1710.butExternalUplotnenieA := butPositionLeft;
  Station.Rack1710.butExternalUplotnenieB := butPositionLeft;
  Station.Rack1710.butSpeaker := butPositionLeft;

  Station.HalfSetA.Rack1920.but1910 := butPositionUp;
  Station.HalfSetA.Rack1920.but1910A := butPositionUp;
  Station.HalfSetA.Rack1920.but1930 := butPositionUp;
  Station.HalfSetA.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetA.Rack1920.butHighOn := butPositionDown;
  Station.HalfSetA.Rack1920.butHighOff := butPositionUp;
  Station.HalfSetA.Rack1920.butCurrent5MA := butPositionDown;
  Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionDown;
  Station.HalfSetA.Rack1920.stLBV1_TurnedOn := True;
  Station.HalfSetA.Rack1920.stLBV2_TurnedOn := True;
  Station.HalfSetA.Rack1920.butHighOn2 := butPositionDown;
  Station.HalfSetA.Rack1920.butHighOff2 := butPositionUp;
  Station.HalfSetA.Rack1920.butPower := butPositionUp;
  Station.HalfSetA.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := True;
  Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := True;

  Station.HalfSetB.Rack1920.but1910 := butPositionUp;
  Station.HalfSetB.Rack1920.but1910A := butPositionUp;
  Station.HalfSetB.Rack1920.but1930 := butPositionUp;
  Station.HalfSetB.Rack1920.but1960_1 := butPositionUp;
  Station.HalfSetB.Rack1920.butHighOn := butPositionDown;
  Station.HalfSetB.Rack1920.butHighOff := butPositionUp;
  Station.HalfSetB.Rack1920.butCurrent5MA := butPositionDown;
  Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionDown;
  Station.HalfSetB.Rack1920.stLBV1_TurnedOn := True;
  Station.HalfSetB.Rack1920.stLBV2_TurnedOn := True;
  Station.HalfSetB.Rack1920.butHighOn2 := butPositionDown;
  Station.HalfSetB.Rack1920.butHighOff2 := butPositionUp;
  Station.HalfSetB.Rack1920.butPower := butPositionUp;
  Station.HalfSetB.Rack1920.butPower2 := butPositionUp;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := True;
  Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := True;

  Station.HalfSetA.P321.butPower := butPositionUp;
  Station.HalfSetA.P321.butMeasure := butPositionUp;
  Station.HalfSetA.P321.but600Ohm := butPositionUp;
  Station.HalfSetA.P321.cblVihGen := csDisconected;
  Station.HalfSetA.P321.cblVhYY := csDisconected;
  Station.HalfSetA.P321.swGradPit := Random(30) + 1;;

  Station.HalfSetB.P321.butPower := butPositionUp;
  Station.HalfSetB.P321.butMeasure := butPositionUp;
  Station.HalfSetB.P321.but600Ohm := butPositionUp;
  Station.HalfSetB.P321.cblVihGen := csDisconected;
  Station.HalfSetB.P321.cblVhYY := csDisconected;
  Station.HalfSetB.P321.swGradPit := Random(30) + 1;;

  Station.P321C.butPower := butPositionUp;
  Station.P321C.butMeasure := butPositionUp;
  Station.P321C.but600Ohm := butPositionUp;
  Station.P321C.cblVihGen := csDisconected;
  Station.P321C.cblVhYY := csDisconected;
  Station.P321C.swGradPit := Random(30) + 1;;

  Station.HalfSetA.P321.swNepGen := Random(3) + 1;
  Station.HalfSetA.P321.swFrequency := Random(7) + 1;
  Station.HalfSetA.P321.swNepGenYY := Random(6) + 1;

  Station.HalfSetB.P321.swNepGen := Random(3) + 1;
  Station.HalfSetB.P321.swFrequency := Random(7) + 1;
  Station.HalfSetB.P321.swNepGenYY := Random(6) + 1;

  Station.P321C.swNepGen := Random(3) + 1;
  Station.P321C.swFrequency := Random(7) + 1;
  Station.P321C.swNepGenYY := Random(6) + 1;

  Station.HalfSetA.P321.swGradGen := Random(30) + 1;
  Station.HalfSetB.P321.swGradGen := Random(30) + 1;
  Station.P321C.swGradGen := Random(30) + 1;

  Station.HalfSetA.P321.swGradYY := Random(30) + 1;
  Station.HalfSetB.P321.swGradYY := Random(30) + 1;
  Station.P321C.swGradYY := Random(30) + 1;

  Station.RemoteController.SwPVU := 1;
  Station.RemoteController.butCall1 := butPositionDown;
  Station.RemoteController.butCall2 := butPositionDown;
  Station.RemoteController.butCall3 := butPositionDown;
  Station.RemoteController.butCall4 := butPositionDown;
  Station.RemoteController.butForceMachine := butPositionDown;
  for i := 1 to 21 do
  begin
    Station.RemoteController.CrossA[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossA[i].Ud2PRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].AbonentPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].ChannelM.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].UdPRD.stChannelState := stChannelNotTuned;
    Station.RemoteController.CrossB[i].Ud2PRD.stChannelState := stChannelNotTuned;
  end;
  Station.RemoteController.stGeneratorCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortA := NotSelected;
  Station.RemoteController.stGeneratorCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stInputYYCableConnectedAtPortB := NotSelected;
  Station.RemoteController.stGeneratorCableAType := NotSelected;
  Station.RemoteController.stGeneratorCableBType := NotSelected;
  {$ENDREGION}
end;

{$REGION ''}

{
/// <summary>
///   Загружает начальное состояние станции на момент начала задания (2.5k строк...)
/// </summary>
procedure LoadInitialState;
  var
    i: Byte;
  begin
    CommonInit;
    case Station.WorkType of
      wtLearn, wtTrening:
        begin
          case Station.WorkMode of
            mdExternalView, mdStartParametersSetup:
              begin
                InitForStartParametersSetupTask;
              end;
            mdPowerOn:
              begin
                InitForPowerOnTask;
              end;
            mdReceiveAndTransmitTracksSetup:
              begin
                InitForReceiveAndTransmitTracksSetupTask;
              end;
            mdWorkWithLowFrequency:
              begin
                InitForWorkWithLowFrequencyTask;
              end;
          end;
        end;

        //======================================Экзамен=======================================
      wtExam:
        begin
          Station.Oscillograph.swRazvertka := 1;
          Station.Oscillograph.swRazvertkaShortTune := 11;
          Station.Oscillograph.butDirectOrAlternative  := butPositionUp;
          Station.Oscillograph.swSyncType := 2;
          Station.Oscillograph.butLevelPosition := butPositionUp;
          Station.Oscillograph.cblCabelSyncState := csDisconected;
          Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
          Station.Oscillograph.swCalibrator := 1;
          Station.Oscillograph.but1Khz := butPositionUp;
          Station.Oscillograph.swHz := 2;
          Station.Oscillograph.swVvsDel := 7;
          Station.Oscillograph.swPowerType := 2;
          Station.Oscillograph.cblCableUsilitelState := csDisconected;
          Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;


          Station.WaveMeter.Int := 4;
          Station.WaveMeter.Float := 8;

          Station.PowerPanel.swPhase := Random(2) + 1;
          Station.PowerPanel.swNet := 0;
          Station.PowerPanel.butRetranslator := 0;
          Station.PowerPanel.sw1700Power := 0;
          Station.PowerPanel.butRetranslator2 := 0;
          Station.PowerPanel.sw1900Power := 0;
          Station.PowerPanel.swHeat5A := Random(2) + 1;
          Station.PowerPanel.sw1900Power_2 := Random(2) + 1;
          Station.PowerPanel.sw1200Power := Random(2) + 1;
          Station.PowerPanel.sw1400 := Random(2) + 1;
          Station.PowerPanel.sw1200Power_2 := Random(2) + 1;
          Station.PowerPanel.butVent1 := 0;
          Station.PowerPanel.butUnitBK := 0;
          Station.PowerPanel.butVipriamit4V := 0;
          Station.PowerPanel.butVent1_2 := 0;
          Station.PowerPanel.butVent3 := 0;

          Station.HalfSetA.LittleNoisyAmplifier.butMshu := butMain;
          Station.HalfSetA.LittleNoisyAmplifier.butNet := butPositionUp;
          Station.HalfSetA.LittleNoisyAmplifier.butNet2 := butPositionUp;
          Station.HalfSetA.LittleNoisyAmplifier.swWave := GetRandomWaveValue;

          Station.HalfSetB.LittleNoisyAmplifier.butMshu := butMain;
          Station.HalfSetB.LittleNoisyAmplifier.butNet := butPositionUp;
          Station.HalfSetB.LittleNoisyAmplifier.butNet2 := butPositionUp;
          Station.HalfSetB.LittleNoisyAmplifier.swWave := GetRandomWaveValue;

          Station.HalfSetA.Rack1200Left.butChannelControl := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1220ADMain := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1230AMain := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.Sw1240K := 1;
          Station.HalfSetA.Rack1200Left.SwNumberOfUchastok := 1;
          Station.HalfSetA.Rack1200Left.SwNumberOfStantion := 1;
          Station.HalfSetA.Rack1200Left.but1240K := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1220ADReserve := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1230AReserve := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.But1240GMain := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.But1240GMain2 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240GPrmPrd := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240GOneTwo := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240V := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.Sw1240V := Random(4) + 1;
          Station.HalfSetA.Rack1200Left.but1240V2 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.Sw1240V2 := Random(4) + 1;
          Station.HalfSetA.Rack1200Left.but1240G1 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G2 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G3 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G4 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G5 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G6 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G7 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1240G8 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.but1290Power := GetRandomButtonState;
          Station.HalfSetA.Rack1200Left.Sw1290 := 1;
          Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
          Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
          Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
          Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := Random(2) + 1;
          Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := Random(2) + 1;
          Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := Random(2) + 1;
          Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := Random(2) + 1;
          Station.HalfSetA.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240VTune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
          Station.HalfSetA.Rack1200Left.sw1240GTune := GetRandomTuneValue;

          Station.HalfSetB.Rack1200Left.butChannelControl := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1220ADMain := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1230AMain := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.Sw1240K := 1;
          Station.HalfSetB.Rack1200Left.SwNumberOfUchastok := 1;
          Station.HalfSetB.Rack1200Left.SwNumberOfStantion := 1;
          Station.HalfSetB.Rack1200Left.but1240K := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1220ADReserve := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1230AReserve := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.But1240GMain := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.But1240GMain2 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240GPrmPrd := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240GOneTwo := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240V := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.Sw1240V := Random(4) + 1;
          Station.HalfSetB.Rack1200Left.but1240V2 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.Sw1240V2 := Random(4) + 1;
          Station.HalfSetB.Rack1200Left.but1240G1 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G2 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G3 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G4 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G5 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G6 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G7 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1240G8 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.but1290Power := GetRandomButtonState;
          Station.HalfSetB.Rack1200Left.Sw1290 := Random(4) + 1;
          Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
          Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
          Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;
          Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedInCross;
          Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
          Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
          Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
          Station.HalfSetB.Rack1200Left.sw1240GMainTune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240GMain2Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240V2Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240VTune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G1Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G2Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G3Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G4Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G5Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G6Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G7Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240G8Tune := GetRandomTuneValue;
          Station.HalfSetB.Rack1200Left.sw1240GTune := GetRandomTuneValue;

          Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
          Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
          Station.HalfSetA.Rack1200Right.But1270Main := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1220AMMain := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1230AMain := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1210AMain := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1270Reserve := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1220AMReserve := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1230AReserve := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1210AReserve := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240V := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.Sw1240V := GetRandomSwitcherState;
          Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
          Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
          Station.HalfSetA.Rack1200Right.But1240V2 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
          Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedInCross;
          Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
          Station.HalfSetA.Rack1200Right.But1240V3 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
          Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedInCross;
          Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
          Station.HalfSetA.Rack1200Right.But1240G := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G1 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G2 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G3 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G4 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G5 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G6 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G7 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1240G8 := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.But1290Power := GetRandomButtonState;
          Station.HalfSetA.Rack1200Right.sw1290Power := GetRandomSwitcherState;
          Station.HalfSetA.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240GTune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
          Station.HalfSetA.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

          Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
          Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
          Station.HalfSetB.Rack1200Right.But1270Main := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1220AMMain := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1230AMain := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1210AMain := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.but1210ARetrMain := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1270Reserve := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1220AMReserve := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1230AReserve := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1210AReserve := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.but1210ARetrReserve := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240V := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.Sw1240V := GetRandomSwitcherState;
          Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedInCross;
          Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
          Station.HalfSetB.Rack1200Right.But1240V2 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.Sw1240V2 := GetRandomSwitcherState;
          Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
          Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
          Station.HalfSetB.Rack1200Right.But1240V3 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.Sw1240V3 := GetRandomSwitcherState;
          Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
          Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
          Station.HalfSetB.Rack1200Right.But1240G := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G1 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G2 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G3 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G4 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G5 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G6 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G7 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1240G8 := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.But1290Power := GetRandomButtonState;
          Station.HalfSetB.Rack1200Right.sw1290Power := GetRandomSwitcherState;
          Station.HalfSetB.Rack1200Right.sw1240V1Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240V2Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240V3Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240GTune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G1Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G2Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G3Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G4Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G5Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G6Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G7Tune := GetrandomTuneValue;
          Station.HalfSetB.Rack1200Right.sw1240G8Tune := GetrandomTuneValue;

          Station.HalfSetA.Duplexer.waveTransmit := GetRandomWaveValue;
          Station.HalfSetA.Duplexer.waveReceive := GetRandomWaveValue;
          Station.HalfSetA.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
          Station.HalfSetA.Duplexer.cb1840 := csDisconected;
          Station.HalfSetA.Duplexer.cbSh2 := csDisconected;

          Station.HalfSetB.Duplexer.waveTransmit := GetRandomWaveValue;
          Station.HalfSetB.Duplexer.waveReceive := GetRandomWaveValue;
          Station.HalfSetB.Duplexer.cbSh1 := csConnectedAtDuplexeRight;
          Station.HalfSetB.Duplexer.cb1840 := csDisconected;
          Station.HalfSetB.Duplexer.cbSh2 := csDisconected;

          Station.Rack1400.butPower := butPositionRight;
          Station.Rack1400.swKukushka := 3;

          Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
          Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
          Station.HalfSetA.Rack1500.DropError := False;
          Station.HalfSetA.Rack1500.SelectedMd := NotSelected;
          Station.HalfSetA.Rack1500.SelectedRetr := NotSelected;
          Station.HalfSetA.Rack1500.swModeControl := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.swWave1610_0 := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.swWave1500 := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.swWave161_R := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.swPhaseMover := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.GeterodinTunedMain := False;
          Station.HalfSetA.Rack1500.GeterodinTunedReserve := False;
          Station.HalfSetA.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
          Station.HalfSetA.Rack1500.stCableLoad := csDisconected;
          Station.HalfSetA.Rack1500.stCableSh1 := csDisconected;

          Station.HalfSetA.Rack1500B.but1622_1 := GetRandomButtonState;
          Station.HalfSetA.Rack1500B.but1622_2 := GetRandomButtonState;
          Station.HalfSetA.Rack1500B.butMdOsn_1 := GetRandomButtonState;
          Station.HalfSetA.Rack1500B.butMdOsn_2 := GetRandomButtonState;
          Station.HalfSetA.Rack1500B.butMdOsn_3 := GetRandomButtonState;

          Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
          Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
          Station.HalfSetB.Rack1500.DropError := False;
          Station.HalfSetB.Rack1500.SelectedMd := NotSelected;
          Station.HalfSetB.Rack1500.SelectedRetr := NotSelected;
          Station.HalfSetB.Rack1500.swModeControl := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.swWave1610_0 := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.swWave1500 := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.swWave161_R := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.swPhaseMover := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.GeterodinTunedMain := False;
          Station.HalfSetB.Rack1500.GeterodinTunedReserve := False;
          Station.HalfSetB.Rack1500.GeterodinIntMain := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.GeterodinFloatMain := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.GeterodinIntReserve := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.GeterodinFloatReserve := GetRandomSwitcherState;
          Station.HalfSetB.Rack1500.stCableLoad := csDisconected;
          Station.HalfSetB.Rack1500.stCableSh1 := csDisconected;

          Station.HalfSetB.Rack1500B.but1622_1 := GetRandomButtonState;
          Station.HalfSetB.Rack1500B.but1622_2 := GetRandomButtonState;
          Station.HalfSetB.Rack1500B.butMdOsn_1 := GetRandomButtonState;
          Station.HalfSetB.Rack1500B.butMdOsn_2 := GetRandomButtonState;
          Station.HalfSetB.Rack1500B.butMdOsn_3 := GetRandomButtonState;

          Station.HalfSetA.Rack1600.GeterodinTunedMain := False;
          Station.HalfSetA.Rack1600.GeterodinTunedReserve := False;
          Station.HalfSetA.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
          Station.HalfSetA.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
          Station.HalfSetA.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
          Station.HalfSetA.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
          Station.HalfSetA.Rack1600.CableMdMainState := csDisconected;
          Station.HalfSetA.Rack1600.CableMdReservState := csDisconected;
          Station.HalfSetA.Rack1600.SelectedMd := NotSelected;
          Station.HalfSetA.Rack1600.SelectedUpch := NotSelected;
          Station.HalfSetA.Rack1600.SelectedDmch := NotSelected;
          Station.HalfSetA.Rack1600.butAutomatic := GetRandomButtonState;
          Station.HalfSetA.Rack1600.butDmch := GetRandomButtonState;
          Station.HalfSetA.Rack1600.butChannelControl := GetRandomButtonState;
          Station.HalfSetA.Rack1600.swChannelControl := GetRandomSwitcherState;
          Station.HalfSetA.Rack1600.wave1610_0 := GetRandomWaveValue;
          Station.HalfSetA.Rack1600.wave1610_R := GetRandomWaveValue;
          Station.HalfSetA.Rack1600.wave1600 := GetRandomWaveValue;
          Station.HalfSetA.Rack1600.DropError := False;
          Station.HalfSetA.Rack1600.stMoshnost := False;

          Station.HalfSetB.Rack1600.GeterodinTunedMain := False;
          Station.HalfSetB.Rack1600.GeterodinTunedReserve := False;
          Station.HalfSetB.Rack1600.GeterodinIntMain := GetRandomSwitcherState;
          Station.HalfSetB.Rack1600.GeterodinFloatMain := GetRandomSwitcherState;
          Station.HalfSetB.Rack1600.GeterodinIntReserve := GetRandomSwitcherState;
          Station.HalfSetB.Rack1600.GeterodinFloatReserve := GetRandomSwitcherState;
          Station.HalfSetB.Rack1600.CableMdMainState := csDisconected;
          Station.HalfSetB.Rack1600.CableMdReservState := csDisconected;
          Station.HalfSetB.Rack1600.SelectedMd := NotSelected;
          Station.HalfSetB.Rack1600.SelectedUpch := NotSelected;
          Station.HalfSetB.Rack1600.SelectedDmch := NotSelected;
          Station.HalfSetB.Rack1600.butAutomatic := GetRandomButtonState;
          Station.HalfSetB.Rack1600.butDmch := GetRandomButtonState;
          Station.HalfSetB.Rack1600.butChannelControl := GetRandomButtonState;
          Station.HalfSetB.Rack1600.swChannelControl := GetRandomSwitcherState;
          Station.HalfSetB.Rack1600.wave1610_0 := GetRandomWaveValue;
          Station.HalfSetB.Rack1600.wave1610_R := GetRandomWaveValue;
          Station.HalfSetB.Rack1600.wave1600 := GetRandomWaveValue;
          Station.HalfSetB.Rack1600.DropError := False;
          Station.HalfSetB.Rack1600.stMoshnost := False;

          Station.HalfSetA.Rack1600B.but1622Main := GetRandomButtonState;
          Station.HalfSetA.Rack1600B.but1622Reserve := GetRandomButtonState;
          Station.HalfSetA.Rack1600B.swUGS :=  GetRandomButtonState;;
          Station.HalfSetA.Rack1600B.swUGS2 := GetRandomButtonState;
          Station.HalfSetA.Rack1600B.butUPT := GetRandomButtonState;
          Station.HalfSetA.Rack1600B.butUPT2 := GetRandomButtonState;
          Station.HalfSetA.Rack1600B.swKukushka := 1;
          Station.HalfSetA.Rack1600B.but1621Main := GetRandomButtonState;
          Station.HalfSetA.Rack1600B.but1621Reserve := GetRandomButtonState;

          Station.HalfSetB.Rack1600B.but1622Main := GetRandomButtonState;
          Station.HalfSetB.Rack1600B.but1622Reserve := GetRandomButtonState;
          Station.HalfSetB.Rack1600B.swUGS :=  GetRandomButtonState;;
          Station.HalfSetB.Rack1600B.swUGS2 := GetRandomButtonState;
          Station.HalfSetB.Rack1600B.butUPT := GetRandomButtonState;
          Station.HalfSetB.Rack1600B.butUPT2 := GetRandomButtonState;
          Station.HalfSetB.Rack1600B.swKukushka := 1;
          Station.HalfSetB.Rack1600B.but1621Main := GetRandomButtonState;
          Station.HalfSetB.Rack1600B.but1621Reserve := GetRandomButtonState;

          Station.Rack1710.butPower := GetRandomButtonState;
          Station.Rack1710.swKukushka := 1;
          Station.Rack1710.swWorkMode := 1;
          Station.Rack1710.butAutomat := GetRandomButtonState;
          Station.Rack1710.butEmergencyLine1 := GetRandomButtonState;
          Station.Rack1710.butEmergencyLine2 := GetRandomButtonState;
          Station.Rack1710.but1220AD := GetRandomButtonState;
          Station.Rack1710.but1230AD := GetRandomButtonState;
          Station.Rack1710.but1290 := GetRandomButtonState;
          Station.Rack1710.but1220AM := GetRandomButtonState;
          Station.Rack1710.but1230AM := GetRandomButtonState;
          Station.Rack1710.but1210A := GetRandomButtonState;
          Station.Rack1710.but1270 := GetRandomButtonState;
          Station.Rack1710.but1220AD_2 := GetRandomButtonState;
          Station.Rack1710.but1230AD_2 := GetRandomButtonState;
          Station.Rack1710.but1290_2 := GetRandomButtonState;
          Station.Rack1710.but1220AM_2:= GetRandomButtonState;
          Station.Rack1710.but1230AM_2:= GetRandomButtonState;
          Station.Rack1710.but1210A_2:= GetRandomButtonState;
          Station.Rack1710.but1270_2 := GetRandomButtonState;
          Station.Rack1710.swReductorCurrent := 1;
          Station.Rack1710.butPower := GetRandomButtonState;
          Station.Rack1710.butExternalUplotnenieA := GetRandomButtonState;
          Station.Rack1710.butExternalUplotnenieB := GetRandomButtonState;
          Station.Rack1710.butSpeaker := GetRandomButtonState;

          Station.HalfSetA.Rack1920.but1910 := butPositionDown;
          Station.HalfSetA.Rack1920.but1910A := butPositionDown;
          Station.HalfSetA.Rack1920.but1930 := butPositionDown;
          Station.HalfSetA.Rack1920.but1960_1 := butPositionDown;
          Station.HalfSetA.Rack1920.butHighOn := butPositionUp;
          Station.HalfSetA.Rack1920.butHighOff := butPositionDown;
          Station.HalfSetA.Rack1920.butCurrent5MA := butPositionUp;
          Station.HalfSetA.Rack1920.stLBV1_TurnedOn := False;
          Station.HalfSetA.Rack1920.stLBV2_TurnedOn := False;
          Station.HalfSetA.Rack1920.butHighOn2 := butPositionUp;
          Station.HalfSetA.Rack1920.butHighOff2 := butPositionDown;
          Station.HalfSetA.Rack1920.butCurrent5MA2 := butPositionUp;
          Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1 := False;
          Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2 := False;

          Station.HalfSetB.Rack1920.but1910 := butPositionDown;
          Station.HalfSetB.Rack1920.but1910A := butPositionDown;
          Station.HalfSetB.Rack1920.but1930 := butPositionDown;
          Station.HalfSetB.Rack1920.but1960_1 := butPositionDown;
          Station.HalfSetB.Rack1920.butHighOn := butPositionUp;
          Station.HalfSetB.Rack1920.butHighOff := butPositionDown;
          Station.HalfSetB.Rack1920.butCurrent5MA := butPositionUp;
          Station.HalfSetB.Rack1920.stLBV1_TurnedOn := False;
          Station.HalfSetB.Rack1920.stLBV2_TurnedOn := False;
          Station.HalfSetB.Rack1920.butHighOn2 := butPositionUp;
          Station.HalfSetB.Rack1920.butHighOff2 := butPositionDown;
          Station.HalfSetB.Rack1920.butCurrent5MA2 := butPositionUp;
          Station.HalfSetB.Rack1920.stZamedleniePodano_LVB1 := False;
          Station.HalfSetB.Rack1920.stZamedleniePodano_LVB2 := False;

          Station.HalfSetA.P321.butPower := butPositionUp;
          Station.HalfSetA.P321.butMeasure := GetRandomButtonState;
          Station.HalfSetA.P321.but600Ohm := GetRandomButtonState;
          Station.HalfSetA.P321.cblVihGen := csDisconected;
          Station.HalfSetA.P321.cblVhYY := csDisconected;
          Station.HalfSetA.P321.swGradPit := GetRandomSwitcherState;

          Station.HalfSetB.P321.butPower := butPositionUp;
          Station.HalfSetB.P321.butMeasure := GetRandomButtonState;
          Station.HalfSetB.P321.but600Ohm := GetRandomButtonState;
          Station.HalfSetB.P321.cblVihGen := csDisconected;
          Station.HalfSetB.P321.cblVhYY := csDisconected;
          Station.HalfSetB.P321.swGradPit := GetRandomSwitcherState;

          Station.P321C.butPower := butPositionUp;
          Station.P321C.butMeasure := GetRandomButtonState;
          Station.P321C.but600Ohm := GetRandomButtonState;
          Station.P321C.cblVihGen := csDisconected;
          Station.P321C.cblVhYY := csDisconected;
          Station.P321C.swGradPit := GetRandomSwitcherState;

          Station.HalfSetA.P321.swNepGen := 1;
          Station.HalfSetA.P321.swFrequency := 1;
          Station.HalfSetA.P321.swNepGenYY := 1;

          Station.HalfSetB.P321.swNepGen := 2;
          Station.HalfSetB.P321.swFrequency := 2;
          Station.HalfSetB.P321.swNepGenYY := 2;

          Station.P321C.swNepGen := 3;
          Station.P321C.swFrequency := 3;
          Station.P321C.swNepGenYY := 3;

          Station.HalfSetA.P321.swGradGen := Random(9) + 15;
          Station.HalfSetB.P321.swGradGen := Random(9) + 15;
          Station.P321C.swGradGen := Random(9) + 15;

          Station.HalfSetA.P321.swGradYY := GetRandomWaveValue;
          Station.HalfSetB.P321.swGradYY := GetRandomWaveValue;
          Station.P321C.swGradYY := GetRandomWaveValue;

          Station.RemoteController.SwPVU := GetRandomSwitcherState;
          Station.RemoteController.butCall1 := GetRandomButtonState;
          Station.RemoteController.butCall2 := GetRandomButtonState;
          Station.RemoteController.butCall3 := GetRandomButtonState;
          Station.RemoteController.butCall4 := GetRandomButtonState;
          Station.RemoteController.butForceMachine := GetRandomButtonState;
          for i := 1 to 7 do
          begin
            Station.RemoteController.CrossA[i].AbonentPRD.stChannelState := stChannelNotTuned;
            Station.RemoteController.CrossA[i].ChannelM.stChannelState := stChannelNotTuned;
            Station.RemoteController.CrossA[i].UdPRD.stChannelState := stChannelNotTuned;
            Station.RemoteController.CrossA[i].Ud2PRD.stChannelState := stChannelNotTuned;
            Station.RemoteController.CrossB[i].AbonentPRD.stChannelState := stChannelNotTuned;
            Station.RemoteController.CrossB[i].ChannelM.stChannelState := stChannelNotTuned;
            Station.RemoteController.CrossB[i].UdPRD.stChannelState := stChannelNotTuned;
            Station.RemoteController.CrossB[i].Ud2PRD.stChannelState := stChannelNotTuned;
            Station.RemoteController.stGeneratorCableConnectedAtPortA := NotSelected;
            Station.RemoteController.stInputYYCableConnectedAtPortA := NotSelected;
            Station.RemoteController.stGeneratorCableConnectedAtPortB := NotSelected;
            Station.RemoteController.stInputYYCableConnectedAtPortB := NotSelected;
            Station.RemoteController.stGeneratorCableAType := NotSelected;
            Station.RemoteController.stGeneratorCableBType := NotSelected;
          end;
        end;
    end;
  end;
}
{$ENDREGION}


end.
