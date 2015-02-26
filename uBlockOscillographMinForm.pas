unit uBlockOscillographMinForm;

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
  pngimage,
  ExtCtrls,
  uP321DisplayForm,
  uStationStateDM;

type
  TBlockOscillographMinForm = class(TForm)
    Image1: TImage;
    btnShowHideOscillograph: TButton;
    imgCableSyncDisconnected: TImage;
    imgCableGNDDisconnected: TImage;
    imgCableGNDConnectedAtSync: TImage;
    imgCableSyncConnectedAtSync: TImage;
    imgCableGNDConnectedAtPower: TImage;
    imgCableSyncConnectedAtPower: TImage;
    imgSpawnPower: TImage;
    imgSpawnSync: TImage;
    imgTrubka: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    imgDeviation: TImage;
    procedure btnShowHideOscillographClick(Sender: TObject);
    procedure btnLoadOscillographClick(Sender: TObject);
    procedure imgCableSyncDisconnectedClick(Sender: TObject);
    procedure imgCableGNDDisconnectedClick(Sender: TObject);
    procedure imgCableGNDConnectedAtSyncClick(Sender: TObject);
    procedure imgCableSyncConnectedAtSyncClick(Sender: TObject);
    procedure imgCableSyncConnectedAtPowerClick(Sender: TObject);
    procedure imgCableGNDConnectedAtPowerClick(Sender: TObject);
    procedure imgTrubkaClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure imgSpawnSyncClick(Sender: TObject);
    procedure imgSpawnPowerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Reload;
  end;

var
  BlockOscillographMinForm: TBlockOscillographMinForm;
  Station: TStation;
  BlockOscillographForm: TBlockOscillographMinForm;

implementation

{$R *.dfm}

uses
  uDefinitionsDM,
  uBlockOscillographForm,
  uConstantsDM;

procedure TBlockOscillographMinForm.Reload;
begin
  case Station.Oscillograph.cblCabelSyncState of
    csDisconected:
      begin
        imgCableSyncDisconnected.Visible := True;
        imgCableSyncConnectedAtPower.Visible := False;
        imgCableSyncConnectedAtSync.Visible := False;
      end;
    csConnectedAtSync:
      begin
        imgCableSyncDisconnected.Visible := False;
        imgCableSyncConnectedAtPower.Visible := False;
        imgCableSyncConnectedAtSync.Visible := True;
      end;
    csConnectedAtPower:
      begin
        imgCableSyncDisconnected.Visible := False;
        imgCableSyncConnectedAtPower.Visible := True;
        imgCableSyncConnectedAtSync.Visible := False;
      end;
  end;

  case Station.Oscillograph.cblCableUsilitelState of
    csDisconected:
      begin
        imgCableGNDDisconnected.Visible := True;
        imgCableGNDConnectedAtPower.Visible := False;
        imgCableGNDConnectedAtSync.Visible := False;
      end;
    csConnectedAtSync:
      begin
        imgCableGNDDisconnected.Visible := False;
        imgCableGNDConnectedAtPower.Visible := False;
        imgCableGNDConnectedAtSync.Visible := True;
      end;
    csConnectedAtPower:
      begin
        imgCableGNDDisconnected.Visible := False;
        imgCableGNDConnectedAtPower.Visible := True;
        imgCableGNDConnectedAtSync.Visible := False;
      end;
  end;

  imgCableSyncDisconnected.Invalidate;
  imgCableSyncConnectedAtSync.Invalidate;
  imgCableSyncConnectedAtPower.Invalidate;
  imgCableGNDConnectedAtPower.Invalidate;
  imgCableGNDConnectedAtSync.Invalidate;
  imgCableGNDDisconnected.Invalidate;
end;

procedure TBlockOscillographMinForm.btnShowHideOscillographClick(Sender: TObject);
begin
  if BlockOscillographForm.Showing then
  begin
     BlockOscillographForm.Close;
     btnShowHideOscillograph.Caption := 'Развернуть';
  end
  else begin
    BlockOscillographForm.Show;
    btnShowHideOscillograph.Caption := 'Свернуть';
  end;
end;

procedure TBlockOscillographMinForm.btnLoadOscillographClick(Sender: TObject);
begin
  if not(BlockOscillographForm.Showing) then
    BlockOscillographForm.Show;
end;

procedure TBlockOscillographMinForm.FormShow(Sender: TObject);
begin
  //Разместить форму слева под изображением панели P321
  Self.Left := 5;
  //Self.Top := P321DisplayForm.Top + P321DisplayForm.Height + 5;
  //Применить соответствующие размеры
  //Self.Width := P321DisplayForm.Width - 10;

  btnShowHideOscillograph.Caption := 'Развернуть';
end;

procedure TBlockOscillographMinForm.imgCableGNDConnectedAtPowerClick(
  Sender: TObject);
begin
  Station.Oscillograph.cblCableUsilitelState := csDisconected;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgCableGNDConnectedAtSyncClick(Sender: TObject);
begin
  Station.Oscillograph.cblCableUsilitelState := csDisconected;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgCableGNDDisconnectedClick(Sender: TObject);
begin
  if imgSpawnPower.Visible or imgSpawnSync.Visible then
  begin
    imgSpawnPower.Visible := False;
    imgSpawnSync.Visible := False;
  end
  else
  begin
    if Station.Oscillograph.cblCabelSyncState <> csConnectedAtSync then
      imgSpawnSync.Visible := True;
    if Station.Oscillograph.cblCabelSyncState <> csConnectedAtPower then
      imgSpawnPower.Visible := True;
    SelectedCable := scPower;
  end;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgCableSyncConnectedAtPowerClick(
  Sender: TObject);
begin
  Station.Oscillograph.cblCabelSyncState := csDisconected;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgCableSyncConnectedAtSyncClick(
  Sender: TObject);
begin
  Station.Oscillograph.cblCabelSyncState := csDisconected;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgCableSyncDisconnectedClick(Sender: TObject);
begin
  if imgSpawnPower.Visible or imgSpawnSync.Visible then
  begin
    imgSpawnPower.Visible := False;
    imgSpawnSync.Visible := False;
  end
  else
  begin
    if Station.Oscillograph.cblCableUsilitelState <> csConnectedAtSync then
      imgSpawnSync.Visible := True;
    if Station.Oscillograph.cblCableUsilitelState <> csConnectedAtPower then
      imgSpawnPower.Visible := True;
    SelectedCable := scSync;
  end;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgSpawnPowerClick(Sender: TObject);
begin
  if SelectedCable = scSync then
  begin
    Station.Oscillograph.cblCabelSyncState := csConnectedAtPower;
  end;
  if SelectedCable = scPower then
  begin
    Station.Oscillograph.cblCableUsilitelState := csConnectedAtPower;
  end;

  imgSpawnPower.Visible := False;
  imgSpawnSync.Visible := False;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgSpawnSyncClick(Sender: TObject);
begin
  if SelectedCable = scSync then
  begin
    Station.Oscillograph.cblCabelSyncState := csConnectedAtSync;
  end;
  if SelectedCable = scPower then
  begin
    Station.Oscillograph.cblCableUsilitelState := csConnectedAtSync;
  end;

  imgSpawnPower.Visible := False;
  imgSpawnSync.Visible := False;

  Reload;
  if BlockOscillographForm.Showing then
    BlockOscillographForm.Reload;
end;

procedure TBlockOscillographMinForm.imgTrubkaClick(Sender: TObject);
begin
  SpawnTrubka((Sender As TImage).Tag);
end;

procedure TBlockOscillographMinForm.Label2Click(Sender: TObject);
begin
  SpawnTrubka((Sender As TLabel).Tag);
end;

end.
