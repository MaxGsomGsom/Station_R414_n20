unit uNetworkSenderDM;

interface

uses
  uNetWorkerDM,
  uConstantsDM;

type TNetworkSender = class
  private
    NetWorker: IClientNetWorker;
  public
    constructor Create(NetWorker: IClientNetWorker); reintroduce;

    procedure SendInitialStationParams(TWaveA:Integer; TWaveB:Integer;
      RWaveA:Integer; RWaveB:Integer; TaskID: TTaskType; WorkMode: TWorkMode);
//    procedure SendMessage(strMessage);
end;


implementation

uses
  SysUtils,
  uRequestDM;

  constructor TNetworkSender.Create(NetWorker: IClientNetWorker);
  begin
    Self.NetWorker := NetWorker;
  end;

  procedure TNetworkSender.SendInitialStationParams(TWaveA:Integer; TWaveB:Integer;
      RWaveA:Integer; RWaveB:Integer; TaskID: TTaskType; WorkMode: TWorkMode);
  begin
    NetWorker.SendParams(KEY_TRANSMITTER_WAVE_A, IntToStr(Ord(RWaveA)));   //волны поменяны местами
    NetWorker.SendParams(KEY_TRANSMITTER_WAVE_B, IntToStr(Ord(RWaveB)));
    NetWorker.SendParams(KEY_RECEIVER_WAVE_A, IntToStr(Ord(TWaveA)));
    NetWorker.SendParams(KEY_RECEIVER_WAVE_B, IntToStr(Ord(TWaveB)));
    NetWorker.SendParams(KEY_TASK_ID, IntToStr(Ord(TaskID)));
    NetWorker.SendParams(KEY_WORK_MODE, IntToStr(Ord(WorkMode)));
  end;
end.
