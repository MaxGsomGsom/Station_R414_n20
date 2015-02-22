unit uClientStateDM;

interface

uses
  uConstantsDM,
  uErrorKeeper;

type TClientState = class

  private
    FConnected: Boolean;
    FLinkedR414Connected: Boolean;
    FR415Connected: Boolean;
    FCrossConnected: Boolean;

    FUserName : string;
    FLinkedR414UserName: string;

    FMainStation: Boolean;

    FWorkMode: TWorkMode;
    FTaskID: TTaskType;

    FTransmitterWaveA: Integer;
    FTransmitterWaveB: Integer;
    FReceiverWaveA: Integer;
    FReceiverWaveB: Integer;

    procedure SetTaskID(const Value: TTaskType);

    procedure SetTransmitterWaveA(const Value: Integer);
    procedure SetTransmitterWaveB(const Value: Integer);
    procedure SetReceiverWaveA(const Value: Integer);
    procedure SetReceiverWaveB(const Value: Integer);

    function CheckWaves(const transmitterWave: Integer;
      const receiverWave: Integer): string;

  public
    ErrorKepeer: TErrorKeeper;

    constructor Create(); reintroduce;

    function TrySetWaves(const WaveTA, WaveTB, WaveRA, WaveRB: Integer): string;
    function IsWavesTuned(): Boolean;
    function IsMainStation(): Boolean;
    function IsTaskSelected(): Boolean;

    function IsReadyToWork(): Boolean;
    function IsAllClientsConnected: Boolean;

    property MainStation: Boolean write FMainStation;

    property Connected: Boolean read FConnected write FConnected;
    property LinkedR414Connected: Boolean read FLinkedR414Connected
                                          write FLinkedR414Connected;
    property R415Connected: Boolean read FR415Connected
                                    write FR415Connected;
    property CrossConnected: Boolean  read FCrossConnected
                                      write FCrossConnected;
    property UserName: string read FUserName
                              write FUserName;
    property LinkedR414UserName: string read FLinkedR414UserName
                                        write FLinkedR414UserName;
    property WorkMode: TWorkMode read FWorkMode
                                 write FWorkMode;
    property TaskID: TTaskType read FTaskID
                             write SetTaskID;
    property TransmitterWaveA: Integer read FTransmitterWaveA
                                       write SetTransmitterWaveA;
    property TransmitterWaveB: Integer read FTransmitterWaveB
                                       write SetTransmitterWaveB;
    property ReceiverWaveA: Integer read FReceiverWaveA
                                    write SetReceiverWaveA;
    property ReceiverWaveB: Integer read FReceiverWaveB
                                    write SetReceiverWaveB;
end;


implementation

uses
  SysUtils,
  uTasksDM;

  constructor TClientState.Create;
  begin
    //TaskID := ttPowerOn;
    ErrorKepeer:= TErrorKeeper.Create;
  end;

  procedure TClientState.SetTaskID(const Value: TTaskType);
  begin
    if (Value > ttNone) and (Value <= COUNT_TASKS) then
      FTaskID := Value;
  end;

  procedure TClientState.SetTransmitterWaveA(const Value: Integer);
  begin
    FTransmitterWaveA := Value;
  end;
  procedure TClientState.SetTransmitterWaveB(const Value: Integer);
  begin
    FTransmitterWaveB := Value;
  end;
  procedure TClientState.SetReceiverWaveA(const Value: Integer);
  begin
    FReceiverWaveA := Value;
  end;
  procedure TClientState.SetReceiverWaveB(const Value: Integer);
  begin
    FReceiverWaveB := Value;
  end;

  function TClientState.IsMainStation(): Boolean;
  begin
    Result := FMainStation;
  end;

  /// <summary>
  ///   ������� ���������� ��������� �������� ���� � � ������ �������
  ///   ���������� ����� ������
  /// </summary>
  function TClientState.TrySetWaves(const WaveTA: Integer;
    const WaveTB: Integer; const WaveRA: Integer; const WaveRB: Integer): String;
  var strError: String;
  begin
    Result := '';
    strError := CheckWaves(WaveTA, WaveRA);     // �������� ������������
    if strError <> '' then                      // ��������� �������� ����
    begin
      Result:= strError;
      Exit;
    end;
    strError := CheckWaves(WaveTB, WaveRB);
    if strError <> '' then
    begin
      Result:= strError;
      Exit;
    end;

    SetTransmitterWaveA(WaveTA);               // ���� �� ��, �������������
    SetTransmitterWaveB(WaveTB);               // �������� ����
    SetReceiverWaveA(WaveRA);
    SetReceiverWaveB(WaveRB);
  end;

  /// <summary>
  ///   ��������� ����� ��� � ��� �� ����������� � ���������� ����� ������
  /// <param name = 'transmitterWave'> �������� ����� �������� </param>
  /// <param name = 'receiverWave'> �������� ����� ����� </param>
  /// </summary>
  function TClientState.CheckWaves(const transmitterWave: Integer;
    const receiverWave: Integer): String;
  begin
    Result := '';
    if (transmitterWave < MIN_WAVE_VALUE) or (transmitterWave > MAX_WAVE_VALUE)
      or (receiverWave < MIN_WAVE_VALUE) or (receiverWave > MAX_WAVE_VALUE) then
    begin
      Result := '�������� ����� ������ ���������� � ��������� ['
        + IntToStr(MIN_WAVE_VALUE) + '..' + IntToStr(MAX_WAVE_VALUE) + ']!';
      Exit;
    end;
    if Abs(transmitterWave - receiverWave) < MIN_WAVE_DIFFERENCE then
    begin
      Result := '������� �������� ���� ��� � ��� ������ ���� �� ������ '
        + IntToStr(MIN_WAVE_DIFFERENCE) + '!';
      Exit;
    end;
  end;

  /// <summary>
  ///   ���������� ��������, ��������� �� ��������� �����
  /// </summary>
  function TClientState.IsWavesTuned: Boolean;
  begin
    Result := (CheckWaves(TransmitterWaveA, ReceiverWaveA) = '')
      and (CheckWaves(TransmitterWaveB, ReceiverWaveB) = '');
  end;

  function TClientState.IsTaskSelected: Boolean;
  begin
    if TaskID<>ttNull then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end

  end;

   /// <summary>
  ///   ���������, ��������� �� ��� ��������� � ���������� �� ��� ������ �������,
  ///   ��� ����, ���� ������ ������
  /// </summary>
  function TClientState.IsReadyToWork;
  begin
    { TODO: ������� ��������, ��������� ��� �� ���������! }
    Result := IsWavesTuned and Connected and LinkedR414Connected
      and R415Connected and CrossConnected and IsTaskSelected;
  end;

  /// <summary>
  ///   ���������, ��� �� ����������� ������� ����������
  /// </summary>
  function TClientState.IsAllClientsConnected: Boolean;
  begin
    Result := Connected and LinkedR414Connected and R415Connected
      and CrossConnected;
  end;
end.

