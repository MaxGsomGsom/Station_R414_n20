unit uStationStateDM;


interface

const
  butPositionUp = 0;
  butPositionDown = 1;
  butPositionLeft = 0;
  butPositionRight = 1;

  swOff = 1;
  swOn = 2;


  type pGenerator = packed record

  end;

  type pLittleNoisyAmplifier = packed record
    butMshu: Byte;
    swWave: Byte;
    butNet: Byte;
    butNet2: Byte;
  end;

  type pDuplexer = packed record
    waveTransmit: Byte;
    waveReceive: Byte;
    cbSh1: Byte;
    cb1840: Byte;
    cbSh2: Byte;
  end;

  type pRack1500 = packed record
    swModeControl: Byte;
    btnAutomatic: Byte;
    butMode_R: Byte;
    swPhaseMover: Byte;
    swWave1610_0: Byte;
    swWave1500: Byte;
    swWave161_R: Byte;
    SelectedMd: Byte;
    SelectedRetr: Byte;
    DropError: Boolean;
    CableMdMainState: Byte;
    CableMdReservState: Byte;
    GeterodinTunedMain: Boolean;
    GeterodinTunedReserve: Boolean;
    GeterodinIntMain: Byte;
    GeterodinFloatMain: Byte;
    GeterodinIntReserve: Byte;
    GeterodinFloatReserve: Byte;
    stCableLoad: Byte;
    stCableSh1: Byte;
  end;

  type pRack1920 = packed record
    swAddInput: Byte;
    butPower: Byte;
    swAddInput2: Byte;
    butPower2: Byte;
    but1910: Byte;
    but1910A: Byte;
    but1930: Byte;
    but1960_1: Byte;
    butHighOn: Byte;
    butHighOff: Byte;
    butHighOn2: Byte;
    butHighOff2: Byte;
    butCurrent5MA: Byte;
    butCurrent5MA2: Byte;
    stZamedleniePodano_LVB1: Boolean;
    stZamedleniePodano_LVB2: Boolean;
    stLBV1_TurnedOn: Boolean;
    stLBV2_TurnedOn: Boolean;
  end;

  type pRack1600 = packed record
    GeterodinTunedMain: Boolean;
    GeterodinTunedReserve: Boolean;
    GeterodinIntMain: Byte;
    GeterodinFloatMain: Byte;
    GeterodinIntReserve: Byte;
    GeterodinFloatReserve: Byte;
    CableMdMainState: Byte;
    CableMdReservState: Byte;
    SelectedMd: Byte;
    SelectedUpch: Byte;
    SelectedDmch: Byte;

    butAutomatic: Byte;
    butDmch: Byte;
    butChannelControl: Byte;
    swChannelControl: Byte;
    wave1610_0: Byte;
    wave1610_R: Byte;
    wave1600: Byte;
    DropError: Boolean;

    stMoshnost: Boolean;
    stDmchTuneValue: Byte;
  end;

  type pWaveMeter = packed record
    Int: Byte;
    Float: Byte;
  end;

  type pRack1200_PRD = packed record

    CableOscillographLineInput: Byte;
    CableUzlovoiInput: Byte;

    But1270Main: Byte;
    But1220AMMain: Byte;
    But1230AMain: Byte;
    But1210AMain: Byte;
    but1210ARetrMain: Byte;

    But1270Reserve: Byte;
    But1220AMReserve: Byte;
    But1230AReserve: Byte;
    But1210AReserve: Byte;
    but1210ARetrReserve: Byte;

    But1240V: Byte;
    Sw1240V: Byte;
    st1240V_Zaglushka_4PDC: Byte;
    st1240V_Zaglushka_KDC: Byte;

    But1240V2: Byte;
    Sw1240V2: Byte;
    st1240V2_Zaglushka_4PDC: Byte;
    st1240V2_Zaglushka_KDC: Byte;

    But1240V3: Byte;
    Sw1240V3: Byte;
    st1240V3_Zaglushka_4PDC: Byte;
    st1240V3_Zaglushka_KDC: Byte;

    But1240G: Byte;

    But1240G1: Byte;
    But1240G2: Byte;
    But1240G3: Byte;
    But1240G4: Byte;
    But1240G5: Byte;
    But1240G6: Byte;
    But1240G7: Byte;
    But1240G8: Byte;

    But1290Power: Byte;
    sw1290Power: Byte;

    sw1240V1Tune: Byte;
    sw1240V2Tune: Byte;
    sw1240V3Tune: Byte;
    sw1240GTune: Byte;
    sw1240G1Tune: Byte;
    sw1240G2Tune: Byte;
    sw1240G3Tune: Byte;
    sw1240G4Tune: Byte;
    sw1240G5Tune: Byte;
    sw1240G6Tune: Byte;
    sw1240G7Tune: Byte;
    sw1240G8Tune: Byte;

    sw1240V1TunedValue: Byte;
    sw1240V2TunedValue: Byte;
    sw1240V3TunedValue: Byte;
    sw1240GTunedValue: Byte;
    sw1240G1TunedValue: Byte;
    sw1240G2TunedValue: Byte;
    sw1240G3TunedValue: Byte;
    sw1240G4TunedValue: Byte;
    sw1240G5TunedValue: Byte;
    sw1240G6TunedValue: Byte;
    sw1240G7TunedValue: Byte;
    sw1240G8TunedValue: Byte;
  end;

  type pRack1200_PRM = packed record

    butChannelControl: Byte;
    but1220ADMain: Byte;
    but1230AMain: Byte;
    Sw1240K: Byte;
    SwNumberOfUchastok: Byte;
    SwNumberOfStantion: Byte;
    but1240K: Byte;
    but1220ADReserve: Byte;
    but1230AReserve: Byte;
    But1240GMain: Byte;
    But1240GMain2: Byte;
    but1240GPrmPrd: Byte;
    but1240GOneTwo: Byte;
    but1240G: Byte;
    but1240V: Byte;
    Sw1240V: Byte;
    but1240V2: Byte;
    Sw1240V2: Byte;
    but1240G1: Byte;
    but1240G2: Byte;
    but1240G3: Byte;
    but1240G4: Byte;
    but1240G5: Byte;
    but1240G6: Byte;
    but1240G7: Byte;
    but1240G8: Byte;
    but1290Power: Byte;
    Sw1290: Byte;
    CableVhodPrm: Byte;
    CableSinusOscill: Byte;
    st1240G_ports: Byte;
    st1240V1_4PDC_1_ports: Byte;
    st1240V1_4PDC_2_ports: Byte;
    st1240V2_4PDC_1_ports: Byte;
    st1240V2_4PDC_2_ports: Byte;

    sw1240GMainTune: Byte;
    sw1240GMain2Tune: Byte;
    sw1240GTune: Byte;
    sw1240GPrmPrdTune: Byte;
    sw1240V2Tune: Byte;
    sw1240VTune: Byte;
    sw1240G1Tune: Byte;
    sw1240G2Tune: Byte;
    sw1240G3Tune: Byte;
    sw1240G4Tune: Byte;
    sw1240G5Tune: Byte;
    sw1240G6Tune: Byte;
    sw1240G7Tune: Byte;
    sw1240G8Tune: Byte;

    sw1240GTunedValue: Byte;
    sw1240GPrmPrdTunedValue: Byte;
    sw1240V2TunedValue: Byte;
    sw1240VTunedValue: Byte;
    sw1240G1TunedValue: Byte;
    sw1240G2TunedValue: Byte;
    sw1240G3TunedValue: Byte;
    sw1240G4TunedValue: Byte;
    sw1240G5TunedValue: Byte;
    sw1240G6TunedValue: Byte;
    sw1240G7TunedValue: Byte;
    sw1240G8TunedValue: Byte;
  end;

  type pP321 = packed record
    butPower: Byte;
    butMeasure: Byte;
    but600Ohm: Byte;
    swNepGen: Byte;
    swFrequency: Byte;
    swNepGenYY: Byte;
    cblVihGen: Byte;
    cblVhYY: Byte;
    swGradPit: Byte;
    swGradGen: Byte;
    swGradYY: Byte;
  end;

  type pRack1710 = packed record
    butPower: Byte;
    swKukushka: Byte;
    swWorkMode: Byte;
    butAutomat: Byte;
    butEmergencyLine1: Byte;
    butEmergencyLine2: Byte;
    but1220AD: Byte;
    but1230AD: Byte;
    but1290: Byte;
    but1220AM: Byte;
    but1230AM: Byte;
    but1210A: Byte;
    but1270: Byte;
    but1220AD_2: Byte;
    but1230AD_2: Byte;
    but1290_2: Byte;
    but1220AM_2: Byte;
    but1230AM_2: Byte;
    but1210A_2: Byte;
    but1270_2: Byte;
    swReductorCurrent: Byte;
    butExternalUplotnenieA: Byte;
    butExternalUplotnenieB: Byte;
    butSpeaker: Byte;
  end;

  type pChannel = packed record
    stChannelState: Byte;
  end;

  type pCross = packed record
    AbonentPRD: pChannel;
    AbonentPRM: pChannel;
    ChannelM: pChannel;
    ChannelD: pChannel;
    UdPRD: pChannel;
    UdPRM: pChannel;
    Ud2PRD: pChannel;
    Ud2PRM: pChannel;
  end;

  type pChannelsEx = packed record
    State: Byte;
  end;

  type pChannels = packed record
    A: array [1..21] of pChannelsEx;
    B: array [1..21] of pChannelsEx;
  end;

  type pRemoteController = packed record

    SwPVU: Byte;
    butCall1: Byte;
    butCall2: Byte;
    butCall3: Byte;
    butCall4: Byte;
    butForceMachine: Byte;
    stGeneratorCableConnectedAtPortA: Byte;
    stInputYYCableConnectedAtPortA: Byte;
    stGeneratorCableConnectedAtPortB: Byte;
    stInputYYCableConnectedAtPortB: Byte;
    stGeneratorCableAType: Byte;
    stGeneratorCableBType: Byte;
    stInputYYCableAType: Byte;
    stInputYYCableBType: Byte;
    indCallLineVisible: array [1..9] of Boolean;

    CrossA: array [1..21] of pCross;
    CrossB: array [1..21] of pCross;
    Channels: pChannels;
  end;

  type pOscillograph = packed record

    swRazvertka: Byte;
    swRazvertkaShortTune: Byte;
    butDirectOrAlternative: Byte;
    swSyncType: Byte;
    butLevelPosition: Byte;
    cblCabelSyncState: Byte;
    cblCabelSyncConnectedTo: Byte;
    swCalibrator: Byte;
    but1Khz: Byte;
    swHz: Byte;
    swVvsDel: Byte;
    swPowerType: Byte;
    cblCableUsilitelState: Byte;
    cblCableUsilitelConnectedTo: Byte;
  end;

  type pPowerSupply = packed record
    butPower: Byte;
  end;

  type pRack1400 = packed record
    butPower: Byte;
    swKukushka: Byte;
    butSpeaker: Byte;
  end;

  type pRack1500_back = packed record
    but1622_1: Byte;
    but1622_2: Byte;
    butMdOsn_1: Byte;
    butMdOsn_2: Byte;
    butMdOsn_3: Byte;
  end;

  type pPowerPanel = packed record
    swPhase: Byte;
    swNet: Byte;
    butRetranslator: Byte;
    sw1700Power: Byte;
    butRetranslator2: Byte;
    sw1900Power: Byte;
    swHeat5A: Byte;
    sw1900Power_2: Byte;
    sw1200Power: Byte;
    sw1400: Byte;
    sw1200Power_2: Byte;
    butVent1: Byte;
    butUnitBK: Byte;
    butVipriamit4V: Byte;
    butVent1_2: Byte;
    butVent3: Byte;
  end;

  type pRack1600_back = packed record
    but1622Main: Byte;
    but1622Reserve: Byte;
    swUGS: Byte;
    swUGS2: Byte;
    butUPT: Byte;
    butUPT2: Byte;
    swKukushka: Byte;
    but1621Main: Byte;
    but1621Reserve: Byte;
  end;

  type pP321Cables = packed record
    stConnectedToPlaceId: Integer;
    offsetLeft: Integer;
    offsetTop: Integer;
  end;

  type pUdlinitelKonez = packed record
    stKonez: Integer;
    offsetLeft: Integer;
    offsetTop: Integer;
    stState: Integer;
  end;

  type pUdlinitelCable = packed record
    stKonez1: pUdlinitelKonez;
    stKonez2: pUdlinitelKonez;
  end;

  /// <summary>
  ///   Полукомплект станции Р414
  /// </summary>
  type THalfSet = class
    public
      Generator: pGenerator;
      LittleNoisyAmplifier: pLittleNoisyAmplifier; // Малошумящее устройство
      Duplexer: pDuplexer;
      Rack1500: pRack1500;
      Rack1500B: pRack1500_back;
      Rack1920: pRack1920;
      Rack1600: pRack1600;
      Rack1600B: pRack1600_back;
      Rack1200Left: pRack1200_PRM;
      Rack1200Right: pRack1200_PRD;
      P321: pP321;


      function IsTunedFor2ChannelMode: Boolean;
      function IsTunedFor4ChannelMode: Boolean;
      function IsTunedOK: Boolean;


      function IsTuned(RequiredWaveTransmit,
        RequiredWaveReceive: Integer): Boolean;

      procedure CheckPower(RequiredWaveReceive: Integer;
        OtherHalfSetTransmited: Boolean);
  end;


  type pDeviation = packed record
    Rack1200A_PRD: Byte;
    Rack1200A_PRM: Byte;
    Rack1200B_PRD: Byte;
    Rack1200B_PRM: Byte;
  end;

  /// <summary>
  ///   Станция Р414 (блоки и настроенные состояния)
  /// </summary>
  type TStation = class
    private
      FHalfSetA: THalfSet;
      FHalfSetB: THalfSet;


      procedure Initialise; inline;
    public
      // Общие приборы и стойки
      Rack1710: pRack1710;
      Rack1400: pRack1400;
      Deviation: pDeviation;
      RemoteController: pRemoteController;
      P321C: pP321;
      Oscillograph: pOscillograph;
      PowerSupply: pPowerSupply;
      WaveMeter: pWaveMeter;
      PowerPanel: pPowerPanel;

      cbGenerator, cbInputYY: pP321Cables;

      WaveTransmitA, WaveReceiveA, WaveTransmitB, WaveReceiveB: Byte;
      Soprajenie: Byte;
       CableWhite2: pUdlinitelCable;
      CableBlack1: pUdlinitelCable;
      {***********************}
      WorkMode: Byte;   {TODO: Вырезать их из станции нафиг, они в ClientState}
      WorkType: Byte;
      NetWorkMode: Byte;
      Nick: string;
      {**********************}

      property HalfSetA: THalfSet read FHalfSetA
                                  write FHalfSetA;
      property HalfSetB: THalfSet read FHalfSetB
                                  write FHalfSetB;
      constructor Create; reintroduce;
      destructor Destroy; override;

      function IsOscillographShuntsConnected: Boolean;
      function IsChannelTuned(ChannelId: Byte): Boolean;
      function GetTransmitBlockTune: Byte;
      function Is1500ATransmited: Boolean;
      function Is1500BTransmited: Boolean;
      function IsP321ReadyToMeasure: Boolean;
      function IsChannelBlocksTunedAt4ChannelMode: Boolean;
      function IsChannelBlocksTunedAt2ChannelMode: Boolean;

      function IsPolukomplektATunedOK: Boolean; {TODO: исправить вызов этих функций на вызов HalfSet.IsTunedOK;}
      function IsPolukomplektBTunedOK: Boolean;

      function IsTunedOK: Boolean;
      function IsPowerPanelPoweredOn: Boolean;
      function IsPluggedIn: Boolean;

      function Is1920A1ReadyToTurnHighON: Boolean;
      function Is1920A2ReadyToTurnHighON: Boolean;
      function Is1920B1ReadyToTurnHighON: Boolean;
      function Is1920B2ReadyToTurnHighON: Boolean;

      function Is1920A1PluggedIn: Boolean;
      function Is1920A2PluggedIn: Boolean;
      function Is1920B1PluggedIn: Boolean;
      function Is1920B2PluggedIn: Boolean;

      function IsPolukomplektATuned: Boolean;
      function IsPolukomplektBTuned: Boolean;

      procedure CheckMoshnostA;
      procedure CheckMoshnostB;

      function IsP321ShuntsConnectedAt2ChannelMode: Boolean;
      function IsP321ShuntsConnectedAt4ChannelMode: Boolean;
  end;

//var
  //Station: TStation;
  {TODO: Убрать переменную Station отсюда. Ссылка на Station должна передаваться в конструкторе класса) }

implementation

uses
 uDefinitionsDM,
 uConstantsDM,
 uRandomMethods;

/// <summary>
///   Проверяет, настроен ли полукомплект для 2-х проводного режима
/// </summary>
function THalfSet.IsTunedFor2ChannelMode: Boolean;
begin
  Result := (Rack1200Left.st1240G_ports = stPluggedIn)
    and (Rack1200Left.st1240V1_4PDC_1_ports = stPluggedIn)
    and (Rack1200Left.st1240V1_4PDC_2_ports = stPluggedIn)
    and (Rack1200Left.st1240V2_4PDC_1_ports = stPluggedIn)
    and (Rack1200Left.st1240V2_4PDC_2_ports = stPluggedIn)
    and (Rack1200Left.Sw1240V = 1)
    and (Rack1200Left.Sw1240V2 = 1)
    and (Rack1200Left.but1240V = butPositionLeft)
    and (Rack1200Left.but1240V2 = butPositionLeft)
    and (Rack1200Right.Sw1240V = 1)
    and (Rack1200Right.Sw1240V2 = 1)
    and (Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedIn)
    and (Rack1200Right.st1240V_Zaglushka_KDC = stPluggedIn)
    and (Rack1200Right.But1240V = butPositionLeft)
    and (Rack1200Right.But1240V2 = butPositionLeft)
    and (Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedIn)
    and (Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedIn)
    and (Rack1200Right.But1240V3 = butPositionLeft)
    and (Rack1200Right.Sw1240V3 = 1)
    and (Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedIn)
    and (Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedIn)
end;

/// <summary>
///   Проверяет, настроен ли полукомплект для 4-х проводного режима
/// </summary>
function THalfSet.IsTunedFor4ChannelMode: Boolean;
begin
  Result :=
    (Rack1200Left.st1240G_ports = stPluggedInCross)
    and (Rack1200Left.st1240V1_4PDC_1_ports = stPluggedInCross)
    and (Rack1200Left.st1240V1_4PDC_2_ports = stPluggedInCross)
    and (Rack1200Left.st1240V2_4PDC_1_ports = stPluggedInCross)
    and (Rack1200Left.st1240V2_4PDC_2_ports = stPluggedInCross)
    and (Rack1200Left.Sw1240V = 4)
    and (Rack1200Left.Sw1240V2 = 4)
    and (Rack1200Left.but1240V = butPositionLeft)
    and (Rack1200Left.but1240V2 = butPositionLeft)
    and (Rack1200Right.Sw1240V = 4)
    and (Rack1200Right.But1240V = butPositionLeft)
    and (Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedInCross)
    and (Rack1200Right.st1240V_Zaglushka_KDC = stPluggedInCross)
    and (Rack1200Right.But1240V2 = butPositionLeft)
    and (Rack1200Right.Sw1240V2 = 4)
    and (Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedInCross)
    and (Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedInCross)
    and (Rack1200Right.But1240V3 = butPositionLeft)
    and (Rack1200Right.Sw1240V3 = 4)
    and (Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedInCross)
    and (Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedInCross);
end;

function THalfSet.IsTunedOK: Boolean;
begin
  Result := (Rack1500.swPhaseMover = 10)
    and (Rack1500.btnAutomatic = butPositionRight)
    and (Rack1500.swWave1610_0 = Duplexer.WaveTransmit)
    and (Rack1500.swWave1500 = Duplexer.WaveTransmit)
    and (Rack1500.swWave161_R = Duplexer.WaveTransmit)
    and (((Rack1500.SelectedMd = smdMain)
        and (Rack1500.SelectedRetr = sRetrMain))
      or ((Rack1500.SelectedMd = smdRetr)
        and (Rack1500.SelectedRetr = sRetrReserv)))
    and (Rack1500.DropError = True)
    and (Rack1500.GeterodinTunedMain = True)
    and (Rack1500.GeterodinTunedReserve = True)
    and (Rack1500.stCableLoad = csConnectedAtRack1500NoName)
    and (Rack1500.stCableSh1 = csConnectedAtRack1500Sh1)
    and (Rack1920.butPower = butPositionUp)
    and (Rack1920.butPower2 = butPositionUp)
    and (Rack1920.but1910 = butPositionUp)
    and (Rack1920.but1910A = butPositionUp)
    and (Rack1920.but1930 = butPositionUp)
    and (Rack1920.but1960_1 = butPositionUp)
    and (Rack1920.butHighOn = butPositionDown)
    and (Rack1920.butHighOn2 = butPositionDown)
    and (Rack1920.butHighOff = butPositionUp)
    and (Rack1920.butHighOff2 = butPositionUp)
    and (Rack1920.butCurrent5MA = butPositionDown)
    and (Rack1920.butCurrent5MA2 = butPositionDown)
    and (Rack1920.stZamedleniePodano_LVB1 = True)
    and (Rack1920.stZamedleniePodano_LVB2 = True)
    and (Rack1920.stLBV1_TurnedOn = True)
    and (Rack1920.stLBV2_TurnedOn = True)
    and (Rack1600.GeterodinTunedMain = True)
    and (Rack1600.GeterodinTunedReserve = True)
    and (Rack1600.butAutomatic = butPositionLeft)
    and (((Rack1600.SelectedMd = smdMain)
        and (Rack1600.SelectedUpch = sUpchMain)
        and (Rack1600.SelectedDmch = sDmchMain))
      or ((Rack1600.SelectedMd = smdRetr)
        and (Rack1600.SelectedUpch = sUpchReserve)
        and (Rack1600.SelectedDmch = sDmchReserve)))
    and (Rack1600.butDmch = butPositionUp)                   // Эти 2 пр-ки были
    and (Rack1600.butChannelControl = butPositionUp)         // только у полук-та А
    and (Rack1600.wave1610_0 = Duplexer.WaveReceive)
    and (Rack1600.wave1610_R = Duplexer.WaveReceive)
    and (Rack1600.wave1600 = Duplexer.WaveReceive)
    and (Rack1600.DropError = True)
    and (Rack1600.stMoshnost = True)
    and (LittleNoisyAmplifier.swWave = Duplexer.WaveReceive)
    and ((LittleNoisyAmplifier.butNet = butPositionUp)
    and (LittleNoisyAmplifier.butNet2 = butPositionUp))
    and (((Duplexer.cbSh2 = csConnectedAtDuplexeLeft)
        and (Duplexer.cb1840 = csConnectedAtDuplexeRight))
      or ((Duplexer.cbSh2 = csConnectedAtDuplexeRight)
        and (Duplexer.cb1840 = csConnectedAtDuplexeLeft)));
end;

/// <summary>
///   Проверяет, настроен ли полукомплект в соответствии с указанными волнами
/// </summary>
function THalfSet.IsTuned(RequiredWaveTransmit,
  RequiredWaveReceive: Integer): Boolean;
begin
  Result := (Rack1500.swPhaseMover = 10)
    and (Rack1500.btnAutomatic = butPositionRight)
    and (Rack1500.swWave1610_0 = RequiredWaveTransmit)
    and (Rack1500.swWave1500 = RequiredWaveTransmit)
    and (Rack1500.swWave161_R = RequiredWaveTransmit)
    and (((Rack1500.SelectedMd = smdMain)
        and (Rack1500.SelectedRetr = sRetrMain))
      or ((Rack1500.SelectedMd = smdRetr)
        and (Rack1500.SelectedRetr = sRetrReserv)))
    and (Rack1500.DropError = True)
    and (Rack1500.GeterodinTunedMain = True)
    and (Rack1500.GeterodinTunedReserve = True)
    and (Rack1500.stCableLoad = csConnectedAtRack1500Sh1)
    and (Rack1500.stCableSh1 = csConnectedAtRack1500NoName)
    and (Rack1920.butPower = butPositionUp)
    and (Rack1920.butPower2 = butPositionUp)
    and (Rack1920.but1910 = butPositionUp)
    and (Rack1920.but1910A = butPositionUp)
    and (Rack1920.but1930 = butPositionUp)
    and (Rack1920.but1960_1 = butPositionUp)
    and (Rack1920.butHighOn = butPositionDown)
    and (Rack1920.butHighOn2 = butPositionDown)
    and (Rack1920.butHighOff = butPositionUp)
    and (Rack1920.butHighOff2 = butPositionUp)
    and (Rack1920.butCurrent5MA = butPositionDown)
    and (Rack1920.butCurrent5MA2 = butPositionDown)
    and (Rack1920.stZamedleniePodano_LVB1 = True)
    and (Rack1920.stZamedleniePodano_LVB2 = True)
    and (Rack1920.stLBV1_TurnedOn = True)
    and (Rack1920.stLBV2_TurnedOn = True)
    and (Rack1600.GeterodinTunedMain = True)
    and (Rack1600.GeterodinTunedReserve = True)
    and (Rack1600.butAutomatic = butPositionLeft)
    and (((Rack1600.SelectedMd = smdMain)
        and (Rack1600.SelectedUpch = sUpchMain)
        and (Rack1600.SelectedDmch = sDmchMain))
      or ((Rack1600.SelectedMd = smdRetr)
        and (Rack1600.SelectedUpch = sUpchReserve)
        and (Rack1600.SelectedDmch = sDmchReserve)))
    and (Rack1600.wave1610_0 = RequiredWaveReceive)
    and (Rack1600.wave1610_R = RequiredWaveReceive)
    and (Rack1600.wave1600 = RequiredWaveReceive)
    and (Rack1600.DropError = True)
    and (Rack1600.stMoshnost = True)
    and (LittleNoisyAmplifier.swWave = RequiredWaveReceive)
    and ((LittleNoisyAmplifier.butNet = butPositionUp)
    and (LittleNoisyAmplifier.butNet2 = butPositionUp))
    and (((Duplexer.cbSh1 = csConnectedAtDuplexeLeft)
        and (Duplexer.cbSh2 = csConnectedAtDuplexeRight))
      or ((Duplexer.cbSh1 = csConnectedAtDuplexeRight)
        and (Duplexer.cbSh2 = csConnectedAtDuplexeLeft)));
end;



/// <summary>
///   Проверяет мощность (не известно, что за мощость)) )
/// <param name='RequiredWaveReceive'>Значение волны приёма, данное в задании</param>
/// <param name='OtherHalfSetTransmited'>Показывает, осуществляется ли
///   передача другим полукомплектом</param>
/// </summary>
procedure THalfSet.CheckPower(RequiredWaveReceive: Integer;
  OtherHalfSetTransmited: Boolean);
begin
  if ((Rack1600.SelectedMd = smdMain)
    and (Rack1600.SelectedUpch = sUpchMain)
    and (Rack1600.SelectedDmch = sDmchMain)) then
  begin
    if Rack1600.GeterodinTunedMain and
      (Rack1600.wave1610_0 = RequiredWaveReceive) and
      (Rack1600.wave1610_R = RequiredWaveReceive) and
      (Rack1600.wave1600 = RequiredWaveReceive) and
      OtherHalfSetTransmited and
      (LittleNoisyAmplifier.butNet2 = butPositionUp) or
      (LittleNoisyAmplifier.butMshu = butPositionRight) and
      (LittleNoisyAmplifier.swWave = RequiredWaveReceive) and
      (((Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and
      (Duplexer.cbSh2 = csConnectedAtDuplexeRight)) or
      ((Duplexer.cbSh1 = csConnectedAtDuplexeRight) and
      (Duplexer.cbSh2 = csConnectedAtDuplexeLeft))) then
    begin
      Rack1600.stMoshnost := True;
    end
    else
    begin
      Rack1600.stMoshnost := False;
    end;
    Exit;
  end
  else
  if (Rack1600.SelectedMd = smdRetr)
    and (Rack1600.SelectedUpch = sUpchReserve)
    and (Rack1600.SelectedDmch = sDmchReserve) then
  begin
    if (Rack1600.GeterodinTunedReserve and OtherHalfSetTransmited) then
    begin
      Rack1600.stMoshnost := True;
    end
    else
    begin
      Rack1600.stMoshnost := False;
    end;
    Exit;
  end;
end;

constructor TStation.Create;
begin
  inherited;
  Self.FHalfSetA := THalfSet.Create;
  Self.FHalfSetB := THalfSet.Create;
  Initialise;
end;

destructor TStation.Destroy;
begin
  Self.FHalfSetA.Free;
  Self.FHalfSetb.Free;
  inherited;
end;

procedure TStation.Initialise;
begin                    // Сей код перенесён сюда из StationR414 (главный файл)
  Self.PowerPanel.sw1200Power := swOff;
  Self.PowerPanel.swNet := swOff;
  Self.PowerPanel.swPhase := GetRandomSwitcherState;
  Self.PowerPanel.butRetranslator := butPositionUp;
  Self.PowerPanel.sw1700Power := swOff;
  Self.PowerPanel.butRetranslator2 := butPositionUp;
  Self.PowerPanel.sw1900Power := swOff;
  Self.PowerPanel.swHeat5A := swOff;
  Self.PowerPanel.sw1900Power_2 := swOff;
  Self.PowerPanel.sw1400 := swOff;
  Self.PowerPanel.sw1200Power_2 := swOff;
  Self.PowerPanel.butVent1 := butPositionUp;
  Self.PowerPanel.butUnitBK := butPositionUp;
  Self.PowerPanel.butVipriamit4V := butPositionUp;
  Self.PowerPanel.butVent1_2 := butPositionUp;
  Self.PowerPanel.butVent3 := butPositionUp;

  Self.NetWorkMode := DefaultNetWorkMode;
  Self.WorkType := NotSelected;
  Self.WorkMode := NotSelected;
end;

{**************************************************************************}
{TODO: Переносим сюда функции из uDef, которые связаны с состоянием станции. Потом надо засунуть их в класс TStation}
{**************************************************************************}
function TStation.IsOscillographShuntsConnected: Boolean;
begin
  Result := (Oscillograph.cblCabelSyncConnectedTo <> csDisconected)
    and (Oscillograph.cblCableUsilitelConnectedTo <> csDisconected);
end;

{TODO: Переписать эту страшную функцию}
/// <summary>
///   Проверяет, настроен ли канал
/// <param name='ChannelID'>ID проверяемого канала</param>
/// </summary>
function TStation.IsChannelTuned(ChannelId: Byte): Boolean;
const
  OffsetTuneValue = 6;
begin
  Result := False;
  case ChannelId of
    1:
      begin
        if (HalfSetA.Rack1200Left.sw1240VTunedValue
          = HalfSetA.Rack1200Left.sw1240VTune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240VTunedValue
          = HalfSetB.Rack1200Left.sw1240VTune - OffsetTuneValue) then
          Result := True;
      end;
    2:
      begin
        if (HalfSetA.Rack1200Left.sw1240V2TunedValue
          = HalfSetA.Rack1200Left.sw1240V2Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240V2TunedValue
          = HalfSetB.Rack1200Left.sw1240V2Tune - OffsetTuneValue) then
          Result := True;
      end;
    3:
      begin
        if (HalfSetA.Rack1200Right.sw1240V1TunedValue
          = HalfSetA.Rack1200Right.sw1240V1Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240V1TunedValue
          = HalfSetB.Rack1200Right.sw1240V1Tune - OffsetTuneValue) then
          Result := True;
      end;
    4:
      begin
        if (HalfSetA.Rack1200Right.sw1240V2TunedValue
          = HalfSetA.Rack1200Right.sw1240V2Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240V2TunedValue
          = HalfSetB.Rack1200Right.sw1240V2Tune - OffsetTuneValue) then
          Result := True;
      end;
    5:
      begin
        if (HalfSetA.Rack1200Right.sw1240V3TunedValue
          = HalfSetA.Rack1200Right.sw1240V3Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240V3TunedValue
          = HalfSetB.Rack1200Right.sw1240V3Tune - OffsetTuneValue) then
          Result := True;
      end;
    6:
      begin
        if (HalfSetA.Rack1200Right.sw1240GTunedValue
          = HalfSetA.Rack1200Right.sw1240GTune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240GTunedValue
          = HalfSetB.Rack1200Right.sw1240GTune - OffsetTuneValue) then
          Result := True;
      end;
    7:
      begin
        if (HalfSetA.Rack1200Left.sw1240G1TunedValue
          = HalfSetA.Rack1200Left.sw1240G1Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G1TunedValue
          = HalfSetB.Rack1200Left.sw1240G1Tune - OffsetTuneValue) then
          Result := True;
      end;
    8:
      begin
        if (HalfSetA.Rack1200Left.sw1240G2TunedValue
          = HalfSetA.Rack1200Left.sw1240G2Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G2TunedValue
          = HalfSetB.Rack1200Left.sw1240G2Tune - OffsetTuneValue) then
          Result := True;
      end;
    9:
      begin
        if (HalfSetA.Rack1200Left.sw1240G3TunedValue
          = HalfSetA.Rack1200Left.sw1240G3Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G3TunedValue
          = HalfSetB.Rack1200Left.sw1240G3Tune - OffsetTuneValue) then
          Result := True;
      end;
    10:
      begin
        if (HalfSetA.Rack1200Left.sw1240G4TunedValue
          = HalfSetA.Rack1200Left.sw1240G4Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G4TunedValue
          = HalfSetB.Rack1200Left.sw1240G4Tune - OffsetTuneValue)then
          Result := True;
      end;
    11:
      begin
        if (HalfSetA.Rack1200Right.sw1240G1TunedValue
          = HalfSetA.Rack1200Right.sw1240G5Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240G1TunedValue
          = HalfSetB.Rack1200Right.sw1240G5Tune - OffsetTuneValue) then
          Result := True;
      end;
    12:
      begin
        if (HalfSetA.Rack1200Right.sw1240G2TunedValue
          = HalfSetA.Rack1200Right.sw1240G6Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240G2TunedValue
          = HalfSetB.Rack1200Right.sw1240G6Tune - OffsetTuneValue) then
          Result := True;
      end;
    13:
      begin
        if (HalfSetA.Rack1200Right.sw1240G3TunedValue
          = HalfSetA.Rack1200Right.sw1240G7Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240G3TunedValue
          = HalfSetB.Rack1200Right.sw1240G7Tune - OffsetTuneValue) then
          Result := True;
      end;
    14:
      begin
        if (HalfSetA.Rack1200Right.sw1240G4TunedValue
          = HalfSetA.Rack1200Right.sw1240G8Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240G4TunedValue
          = HalfSetB.Rack1200Right.sw1240G8Tune - OffsetTuneValue) then
          Result := True;
      end;
    15:
      begin
        if (HalfSetA.Rack1200Left.sw1240G5TunedValue
          = HalfSetA.Rack1200Left.sw1240G5Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G5TunedValue
          = HalfSetB.Rack1200Left.sw1240G5Tune - OffsetTuneValue) then
          Result := True;
      end;
    16:
      begin
        if (HalfSetA.Rack1200Left.sw1240G6TunedValue
          = HalfSetA.Rack1200Left.sw1240G6Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G6TunedValue
          = HalfSetB.Rack1200Left.sw1240G6Tune - OffsetTuneValue) then
          Result := True;
      end;
    17:
      begin
        if (HalfSetA.Rack1200Left.sw1240G7TunedValue
          = HalfSetA.Rack1200Left.sw1240G7Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G7TunedValue
          = HalfSetB.Rack1200Left.sw1240G7Tune - OffsetTuneValue) then
          Result := True;
      end;
    18:
      begin
        if (HalfSetA.Rack1200Left.sw1240G8TunedValue
          = HalfSetA.Rack1200Left.sw1240G8Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Left.sw1240G8TunedValue
          = HalfSetB.Rack1200Left.sw1240G8Tune - OffsetTuneValue) then
          Result := True;
      end;
    19:
      begin
        if (HalfSetA.Rack1200Right.sw1240G5TunedValue
          = HalfSetA.Rack1200Right.sw1240G5Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240G5TunedValue
          = HalfSetB.Rack1200Right.sw1240G5Tune - OffsetTuneValue) then
          Result := True;
      end;
    20:
      begin
        if (HalfSetA.Rack1200Right.sw1240G6TunedValue
          = HalfSetA.Rack1200Right.sw1240G6Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240G6TunedValue
          = HalfSetB.Rack1200Right.sw1240G6Tune - OffsetTuneValue) then
          Result := True;
      end;
    21:
      begin
        if (HalfSetA.Rack1200Right.sw1240G7TunedValue
          = HalfSetA.Rack1200Right.sw1240G7Tune - OffsetTuneValue)
          and (HalfSetB.Rack1200Right.sw1240G7TunedValue
          = HalfSetB.Rack1200Right.sw1240G7Tune - OffsetTuneValue) then
          Result := True;
      end;
  end;
end;

/// <summary>
///   Возвращает текущее значение подстройки канала
/// </summary>
function TStation.GetTransmitBlockTune: Byte;
var
  ChannelBlockId: Byte;
begin
  Result := 0;
  ChannelBlockId := 1;
  if cbInputYY.stConnectedToPlaceId <> csDisconected then
  begin
    case cbInputYY.stConnectedToPlaceId of
      0..168:
        begin
          //A
          case cbInputYY.stConnectedToPlaceId  of
            15, 16:
              begin
                Result := HalfSetA.Rack1200Left.sw1240VTune;
              end;
            17, 18:
              begin
                Result := HalfSetA.Rack1200Left.sw1240V2Tune;
              end;
            19, 20:
              begin
                Result := HalfSetA.Rack1200Right.sw1240V1Tune;
              end;
            21, 22:
              begin
                Result := HalfSetA.Rack1200Right.sw1240V2Tune;
              end;
            23, 24:
              begin
                Result := HalfSetA.Rack1200Right.sw1240V3Tune;
              end;
            25, 26:
              begin
                Result := HalfSetA.Rack1200Right.sw1240GTune;
              end;
            27, 28:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G1Tune;
              end;
            71, 72:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G2Tune;
              end;
            73, 74:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G3Tune;
              end;
            75, 76:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G4Tune;
              end;
            77, 78:
              begin
                Result := HalfSetA.Rack1200Right.sw1240G1Tune;
              end;
            79, 80:
              begin
                Result := HalfSetA.Rack1200Right.sw1240G2Tune;
              end;
            81, 82:
              begin
                Result := HalfSetA.Rack1200Right.sw1240G3Tune;
              end;
            83, 84:
              begin
                Result := HalfSetA.Rack1200Right.sw1240G4Tune;
              end;
            127, 128:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G5Tune;
              end;
            129, 130:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G6Tune;
              end;
            131, 132:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G7Tune;
              end;
            133, 134:
              begin
                Result := HalfSetA.Rack1200Left.sw1240G8Tune;
              end;
            135, 136:
              begin
                Result := HalfSetA.Rack1200Right.sw1240G5Tune;
              end;
            137, 138:
              begin
                Result := HalfSetA.Rack1200Right.sw1240G6Tune;
              end;
            139, 140:
              begin
                Result := HalfSetA.Rack1200Right.sw1240G7Tune;
              end;
          end;
        end;
      169..336:
        begin
          //B
          case cbInputYY.stConnectedToPlaceId of
            183, 184:
              begin
                Result := HalfSetB.Rack1200Left.sw1240VTune;
              end;
            185, 186:
              begin
                Result := HalfSetB.Rack1200Left.sw1240V2Tune;
              end;
            187, 188:
              begin
                Result := HalfSetB.Rack1200Right.sw1240V1Tune;
              end;
            189, 190:
              begin
                Result := HalfSetB.Rack1200Right.sw1240V2Tune;
              end;
            191, 192:
              begin
                Result := HalfSetB.Rack1200Right.sw1240V3Tune;
              end;
            193, 194:
              begin
                Result := HalfSetB.Rack1200Right.sw1240GTune;
              end;
            195, 196:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G1Tune;
              end;
            239, 240:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G2Tune;
              end;
            241, 242:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G3Tune;
              end;
            243, 244:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G4Tune;
              end;
            245, 246:
              begin
                Result := HalfSetB.Rack1200Right.sw1240G1Tune;
              end;
            247, 248:
              begin
                Result := HalfSetB.Rack1200Right.sw1240G2Tune;
              end;
            249, 250:
              begin
                Result := HalfSetB.Rack1200Right.sw1240G3Tune;
              end;
            251, 252:
              begin
                Result := HalfSetB.Rack1200Right.sw1240G4Tune;
              end;
            295, 296:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G5Tune;
              end;
            297, 298:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G6Tune;
              end;
            299, 300:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G7Tune;
              end;
            301, 302:
              begin
                Result := HalfSetB.Rack1200Left.sw1240G8Tune;
              end;
            303, 304:
              begin
                Result := HalfSetB.Rack1200Right.sw1240G5Tune;
              end;
            305, 306:
              begin
                Result := HalfSetB.Rack1200Right.sw1240G6Tune;
              end;
            307, 308:
              begin
                Result := HalfSetB.Rack1200Right.sw1240G7Tune;
              end;
          end;
        end;
    end;
  end;
end;

function TStation.Is1500ATransmited: Boolean;
begin
  Result := (HalfSetA.Rack1500.GeterodinTunedMain
      and (HalfSetA.Rack1920.stLBV1_TurnedOn or HalfSetA.Rack1920.stLBV2_TurnedOn)
      and (HalfSetA.Rack1500.SelectedMd = smdMain)
      and (HalfSetA.Rack1500.SelectedRetr = sRetrMain))

      or (HalfSetA.Rack1500.GeterodinTunedReserve
      and (HalfSetA.Rack1920.stLBV1_TurnedOn or HalfSetA.Rack1920.stLBV2_TurnedOn)
      and (HalfSetA.Rack1500.SelectedMd = smdRetr)
      and (HalfSetA.Rack1500.SelectedRetr = sRetrReserv));
end;

function TStation.Is1500BTransmited: Boolean;
begin

  Result := (HalfSetB.Rack1500.GeterodinTunedMain
      and (HalfSetB.Rack1920.stLBV1_TurnedOn or HalfSetB.Rack1920.stLBV2_TurnedOn)
      and (HalfSetB.Rack1500.SelectedMd = smdMain)
      and (HalfSetB.Rack1500.SelectedRetr = sRetrMain))

      or (HalfSetB.Rack1500.GeterodinTunedReserve
      and (HalfSetB.Rack1920.stLBV1_TurnedOn or HalfSetB.Rack1920.stLBV2_TurnedOn)
      and (HalfSetB.Rack1500.SelectedMd = smdRetr)
      and (HalfSetB.Rack1500.SelectedRetr = sRetrReserv));
end;


/// <summary>
///   Проверяет, настроен ли прибор П321 для того, чтоб начать измерения
/// </summary>
function TStation.IsP321ReadyToMeasure: Boolean;
begin
  Result := (P321C.swNepGen = 5)
    and (P321C.swGradPit = 31)
    and (P321C.swGradGen = 31)
    and (P321C.swGradYY = 31)
    and (P321C.swFrequency = 4)
    and (P321C.cblVihGen <> csDisconected)
    and (P321C.cblVhYY <> csDisconected)
    and (cbGenerator.stConnectedToPlaceId <> csDisconected)
    and (cbInputYY.stConnectedToPlaceId <> csDisconected);
end;

/// <summary>
///   Проверяет, настроены ли блоки на 4-х проводный режим
/// </summary>
function TStation.IsChannelBlocksTunedAt4ChannelMode: Boolean;
begin
  Result := HalfSetA.IsTunedFor4ChannelMode
    and HalfSetB.IsTunedFor4ChannelMode;
end;

/// <summary>
///   Проверяет, настроены ли блоки на 2-х проводный режим
/// </summary>
function TStation.IsChannelBlocksTunedAt2ChannelMode: Boolean;
begin
  Result := HalfSetA.IsTunedFor2ChannelMode
    and HalfSetB.IsTunedFor2ChannelMode;
end;

/// <summary>
///   Проверяет, настроена ли станция в оконечном режиме
/// </summary>
function TStation.IsTunedOK: Boolean;
begin
  Result := IsPolukomplektATunedOK and IsPolukomplektBTunedOK;
end;

/// <summary>
/// Проверяет, настроен ли полукомплект А на оконечный режим работы
/// </summary>
function TStation.IsPolukomplektATunedOK: Boolean;
begin
  Result := HalfSetA.IsTunedOK and IsPowerPanelPoweredOn;
end;

/// <summary>
/// Проверяет, настроен ли полукомплект Б на оконечный режим работы
/// </summary>
function TStation.IsPolukomplektBTunedOK: Boolean;
begin
  Result := HalfSetB.IsTunedOK and IsPowerPanelPoweredOn;
end;

procedure TStation.CheckMoshnostB;
begin
  if IsPluggedIn then
  begin
    HalfSetB.CheckPower(Self.WaveReceiveB, Is1500ATransmited);
//    with Station.HalfSetB.Rack1600 do
//    begin
//      if (SelectedMd = smdMain)
//        and (SelectedUpch = sUpchMain)
//        and (SelectedDmch = sDmchMain) then
//      begin
//        if ((GeterodinTunedMain = True) and
//          (Station.HalfSetB.Rack1600.wave1610_0 = Station.WaveReceiveB) and
//          (Station.HalfSetB.Rack1600.wave1610_R = Station.WaveReceiveB) and
//          (Station.HalfSetB.Rack1600.wave1600 = Station.WaveReceiveB) and
//          (Is1500ATransmited = True) and
//          (Station.HalfSetB.LittleNoisyAmplifier.butNet2 = butPositionUp) or
//          (Station.HalfSetB.LittleNoisyAmplifier.butMshu = butPositionRight) and
//          (Station.HalfSetB.LittleNoisyAmplifier.swWave = Station.WaveReceiveB) and
//          (((Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and
//          (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeRight)) or
//          ((Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and
//          (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)))) then
//        begin
//          Station.HalfSetB.Rack1600.stMoshnost := True;
//        end
//        else
//        begin
//          Station.HalfSetB.Rack1600.stMoshnost := False;
//        end;
//        Exit;
//      end
//      else
//        if (SelectedMd = smdRetr)
//          and (SelectedUpch = sUpchReserve)
//          and (SelectedDmch = sDmchReserve) then
//        begin
//          if (GeterodinTunedReserve and Is1500ATransmited) then
//          begin
//            Station.HalfSetB.Rack1600.stMoshnost := True;
//          end
//          else
//          begin
//            Station.HalfSetB.Rack1600.stMoshnost := False;
//          end;
//          Exit;
//        end;
//    end;
  end;
end;

procedure TStation.CheckMoshnostA;
begin
  if IsPluggedIn then
  begin
    HalfSetA.CheckPower(Self.WaveReceiveA, Is1500BTransmited);
//    with Station.HalfSetA.Rack1600 do
//    begin
//      if ((SelectedMd = smdMain)
//        and (SelectedUpch = sUpchMain)
//        and (SelectedDmch = sDmchMain)) then
//      begin
//        if ((GeterodinTunedMain = True) and
//          (Station.HalfSetA.Rack1600.wave1610_0 = Station.WaveReceiveA) and
//          (Station.HalfSetA.Rack1600.wave1610_R = Station.WaveReceiveA) and
//          (Station.HalfSetA.Rack1600.wave1600 = Station.WaveReceiveA) and
//          (Is1500BTransmited = True) and
//          (Station.HalfSetA.LittleNoisyAmplifier.butNet2 = butPositionUp) or
//          (Station.HalfSetA.LittleNoisyAmplifier.butMshu = butPositionRight) and
//          (Station.HalfSetA.LittleNoisyAmplifier.swWave = Station.WaveReceiveA) and
//          (((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and
//          (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight)) or
//          ((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and
//          (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)))) then
//        begin
//          Station.HalfSetA.Rack1600.stMoshnost := True;
//        end
//        else
//        begin
//          Station.HalfSetA.Rack1600.stMoshnost := False;
//        end;
//        Exit;
//      end
//      else
//      if (SelectedMd = smdRetr)
//        and (SelectedUpch = sUpchReserve)
//        and (SelectedDmch = sDmchReserve) then
//      begin
//        if (GeterodinTunedReserve and Is1500BTransmited) then
//        begin
//          Station.HalfSetA.Rack1600.stMoshnost := True;
//        end
//        else
//        begin
//          Station.HalfSetA.Rack1600.stMoshnost := False;
//        end;
//        Exit;
//      end;
//    end;
  end;
end;

function TStation.Is1920A1ReadyToTurnHighON: Boolean;
begin
  Result := (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power = 1)
    and (HalfSetA.Rack1920.butPower = butPositionUp)
    and (HalfSetA.Rack1920.but1910 = butPositionUp)
    and (HalfSetA.Rack1920.but1910A = butPositionUp)
    and (HalfSetA.Rack1920.but1930 = butPositionUp)
    and (HalfSetA.Rack1920.but1960_1 = butPositionUp);
end;

function TStation.Is1920A2ReadyToTurnHighON: Boolean;
begin
  Result := (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power = 1)
    and (HalfSetA.Rack1920.butPower2 = butPositionUp)
    and (HalfSetA.Rack1920.but1910 = butPositionUp)
    and (HalfSetA.Rack1920.but1910A = butPositionUp)
    and (HalfSetA.Rack1920.but1930 = butPositionUp)
    and (HalfSetA.Rack1920.but1960_1 = butPositionUp);
end;

function TStation.Is1920B1ReadyToTurnHighON: Boolean;
begin
  Result := (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power_2 = 1)
    and (HalfSetB.Rack1920.butPower2 = butPositionUp)
    and (HalfSetB.Rack1920.but1910 = butPositionUp)
    and (HalfSetB.Rack1920.but1910A = butPositionUp)
    and (HalfSetB.Rack1920.but1930 = butPositionUp)
    and (HalfSetB.Rack1920.but1960_1 = butPositionUp);
end;

function TStation.Is1920B2ReadyToTurnHighON: Boolean;
begin
  Result := (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power = 1)
    and (HalfSetB.Rack1920.butPower2 = butPositionUp)
    and (HalfSetB.Rack1920.but1910 = butPositionUp)
    and (HalfSetB.Rack1920.but1910A = butPositionUp)
    and (HalfSetB.Rack1920.but1930 = butPositionUp)
    and (HalfSetB.Rack1920.but1960_1 = butPositionUp);
end;

//LBV 1
function TStation.Is1920A1PluggedIn: Boolean;
begin
  Result := (HalfSetA.Rack1920.but1930 = butPositionUp)
    and (HalfSetA.Rack1920.but1910 = butPositionUp)
    and (HalfSetA.Rack1920.but1910A = butPositionUp)
    and (HalfSetA.Rack1920.butPower = butPositionUp)
    and (HalfSetA.Rack1920.but1960_1 = butPositionUp)
    and (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power = 1);
end;

function TStation.Is1920A2PluggedIn: Boolean;
begin
  Result := (HalfSetA.Rack1920.but1930 = butPositionDown)
    and (HalfSetA.Rack1920.but1910 = butPositionDown)
    and (HalfSetA.Rack1920.but1910A = butPositionDown)
    and (HalfSetA.Rack1920.butPower2 = butPositionDown)
    and (HalfSetA.Rack1920.but1960_1 = butPositionDown)
    and (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power = 1);
end;

function TStation.Is1920B1PluggedIn: Boolean;
begin
  Result := (HalfSetB.Rack1920.but1930 = butPositionDown)
    and (HalfSetB.Rack1920.but1910 = butPositionDown)
    and (HalfSetB.Rack1920.but1910A = butPositionDown)
    and (HalfSetB.Rack1920.butPower = butPositionDown)
    and (HalfSetB.Rack1920.but1960_1 = butPositionDown)
    and (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power_2 = 1);
end;

function TStation.Is1920B2PluggedIn: Boolean;
begin
  Result := (HalfSetB.Rack1920.but1930 = butPositionDown)
    and (HalfSetB.Rack1920.but1910 = butPositionDown)
    and (HalfSetB.Rack1920.but1910A = butPositionDown)
    and (HalfSetB.Rack1920.butPower2 = butPositionDown)
    and (HalfSetB.Rack1920.but1960_1 = butPositionDown)
    and (PowerPanel.swNet = 1)
    and (PowerPanel.sw1900Power_2 = 1);
end;

/// <summary>
///   Возвращает значение, включено ли питание станции
/// </summary>
function TStation.IsPluggedIn: Boolean;
begin
  Result := (PowerPanel.swNet = 1);
end;

/// <summary>
///   Определяет, включено ли питание на распределительном щите
/// </summary>
function TStation.IsPowerPanelPoweredOn: Boolean;
begin
  Result :=
    (PowerPanel.swNet = 1)
    and (PowerPanel.sw1700Power = 1)
    and (PowerPanel.sw1900Power = 1)
    and (PowerPanel.sw1400 = 1)
    and (PowerPanel.sw1900Power_2 = 1)
    and (PowerPanel.sw1200Power = 1)
    and (PowerPanel.sw1200Power_2 = 1);
end;

/// <summary>
///   Проверяет, настроен ли полукомплект А (при замыкании станции на себя?)
/// </summary>
function TStation.IsPolukomplektATuned: Boolean;
begin
  Result := HalfSetA.IsTuned(Self.WaveTransmitA, Self.WaveReceiveA)
    and IsPowerPanelPoweredOn;
end;

/// <summary>
///   Проверяет, настроен ли полукомплект Б (при замыкании станции на себя?)
/// </summary>
function TStation.IsPolukomplektBTuned: Boolean;
begin
  Result := HalfSetB.IsTuned(Self.WaveTransmitB, Self.WaveReceiveB)
    and IsPowerPanelPoweredOn;
end;


function TStation.IsP321ShuntsConnectedAt2ChannelMode: Boolean;
begin
  Result := (cbInputYY.stConnectedToPlaceId mod 2 = 0)
    and (cbGenerator.stConnectedToPlaceId mod 2 = 0)
    and ((cbGenerator.stConnectedToPlaceId < 337)
    and (1 < cbGenerator.stConnectedToPlaceId))
    and ((cbInputYY.stConnectedToPlaceId < 337)
    and (1 < cbInputYY.stConnectedToPlaceId))
    and (Abs(cbGenerator.stConnectedToPlaceId
      - cbInputYY.stConnectedToPlaceId) = 168);
end;

function TStation.IsP321ShuntsConnectedAt4ChannelMode: Boolean;
begin
  Result := ((IsNeedToTuneChannelBlocksA = True)
            and ((cbGenerator.stConnectedToPlaceId < 337)
            and (1 < cbGenerator.stConnectedToPlaceId))
            and ((cbInputYY.stConnectedToPlaceId < 337)
            and (1 < cbInputYY.stConnectedToPlaceId))
            and (Abs(cbGenerator.stConnectedToPlaceId
                      - cbInputYY.stConnectedToPlaceId) = 167))
          or
            ((IsNeedToTuneChannelBlocksB = True)
            and ((cbGenerator.stConnectedToPlaceId < 337)
            and (1 < cbGenerator.stConnectedToPlaceId))
            and ((cbInputYY.stConnectedToPlaceId < 337)
            and (1 < cbInputYY.stConnectedToPlaceId))
            and (Abs(cbGenerator.stConnectedToPlaceId
                      - cbInputYY.stConnectedToPlaceId) = 169));
end;

end.
