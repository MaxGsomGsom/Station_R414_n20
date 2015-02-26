unit uBlockOscillographForm;

interface

uses
  Windows,
  Messages,
  uDefinitionsDM,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  jpeg,
  ExtCtrls,
  ImgList,
  pngimage,
  StdCtrls,
  Buttons,
  Menus,
  uConstantsDM,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm,
  uAdditionalFormMethods,
  uHandsetForm;

type
  TBlockOscillographForm = class(TForm)
    Image1: TImage;
    imgSwXz: TImage;
    imgbutLevelPositionUp: TImage;
    imgLevelP: TImage;
    imgDirectOrAlternativePositionUp: TImage;
    imgDirectOrAlternative: TImage;
    imgbut1KhzPositionUp: TImage;
    imgbut1Khz: TImage;
    imgSwVvsDel: TImage;
    ilSwVvsDel: TImageList;
    imgRazvertkaShortTune: TImage;
    ilCalibrator: TImageList;
    imgCalibrator: TImage;
    ilPowerType: TImageList;
    imgPowerType: TImage;
    imgRazvertka: TImage;
    ilRazvertka: TImageList;
    ilSwXz: TImageList;
    imgSyncType: TImage;
    ilSyncType: TImageList;
    imgCableGNDConnectedAtPower: TImage;
    imgCableSyncConnectedAtSync: TImage;
    Image13: TImage;
    Label7: TLabel;
    ilRazvertkaShortTune: TImageList;
    imgCableSyncConnectedAtPower: TImage;
    imgCableGNDConnectedAtSync: TImage;
    imgCableSyncDisconnected: TImage;
    imgCableGNDDisconnected: TImage;
    imgSpawnPower: TImage;
    imgSpawnSync: TImage;
    imgOstNoSignal: TImage;
    imgTrubka: TImage;
    Image6: TImage;
    Label1: TLabel;
    Label2: TLabel;
    tmrMain: TTimer;
    imgDeviation: TImage;
    ilDeviationA: TImageList;
    ilDeviationB: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure imgSwVvsDelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPowerTypeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwXzMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCalibratorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgRazvertkaShortTuneMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgRazvertkaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSyncTypeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgDirectOrAlternativeClick(Sender: TObject);
    procedure imgbut1KhzClick(Sender: TObject);
    procedure imgLevelPClick(Sender: TObject);
    procedure imgCableSyncConnectedAtSyncClick(Sender: TObject);
    procedure imgCableGNDConnectedAtSyncClick(Sender: TObject);
    procedure imgCableGNDConnectedAtPowerClick(Sender: TObject);
    procedure imgCableSyncConnectedAtPowerClick(Sender: TObject);
    procedure imgCableSyncDisconnectedClick(Sender: TObject);
    procedure imgCableGNDDisconnectedClick(Sender: TObject);
    procedure imgSpawnPowerClick(Sender: TObject);
    procedure imgSpawnSyncClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    constructor Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController); reintroduce;
    procedure Image6Click(Sender: TObject);



  private
    { Private declarations }

  public
    procedure Reload;
    procedure PaintOscilogram;


var
  //BlockOscillographForm: TBlockOscillographForm;
  CurDeviationID: Byte;
  ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;
  Handset: THandsetForm;
  end;

  var
  //BlockOscillographForm: TBlockOscillographForm;
  SelectedCable: Byte;

  const
  scPower = 1;
  scSync = 2;

implementation

uses
  uStationR414Form,
  uRack1200LeftForm,
  uRack1200RightForm,
  uEducationForm,
  uBlockPowerSupplyForm,
  uBlockRemoteControllerForm,
  uRackP321Form;


{$R *.dfm}

constructor TBlockOscillographForm.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
        SelectedCable:= NotSelected;
  CurDeviationID:= 1;

  Self.Caption:='Осциллограф';
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;

  MoveFormInScreenCenter(self);
end;


procedure TBlockOscillographForm.PaintOscilogram;

  procedure Deviation(PolukomplektCode: Byte);
  begin
    PolukomplektCode := Handset.Half;
    if CurDeviationID > 6 then
      Dec(CurDeviationID, 6);
    //=================A==============
    if PolukomplektCode = 1 then
    begin
      ilDeviationA.GetBitmap(CurDeviationID - 1, imgDeviation.Picture.Bitmap);
      //ilDeviationA.GetBitmap(CurDeviationID - 1, BlockOscillographMinForm.imgDeviation.Picture.Bitmap);
    end;
    //=================B==============
    if PolukomplektCode = 2 then
    begin
      ilDeviationB.GetBitmap(CurDeviationID - 1, imgDeviation.Picture.Bitmap);
      //ilDeviationB.GetBitmap(CurDeviationID - 1, BlockOscillographMinForm.imgDeviation.Picture.Bitmap);
    end;
    imgDeviation.Invalidate;
    //BlockOscillographMinForm.imgDeviation.Invalidate;
    Inc(CurDeviationID, 1);
  end;

begin
  //Проверка правильности настройки всех блоков станции
  if (Station.IsPolukomplektATuned) and (Station.IsPolukomplektBTuned) then
  //if (True) then

  begin
    //Проверка правильности настроек осциллографа
    if  (Station.Oscillograph.swPowerType = 2) and
        (Station.Oscillograph.swVvsDel = 7) and
        (Station.Oscillograph.swHz = 2) and
        (Station.Oscillograph.swSyncType = 2) and
        (Station.Oscillograph.swPowerType = 2) and
        (Station.Oscillograph.butLevelPosition = butPositionUp) and
        (Station.Oscillograph.but1Khz = butPositionUp) and
        (Station.Oscillograph.swRazvertkaShortTune = 11) and
        (Station.Oscillograph.swCalibrator = 1)
    then begin
      //Если осциллограф настроен
      if (Station.Oscillograph.cblCabelSyncState = csConnectedAtSync) and
          (Station.Oscillograph.cblCableUsilitelState = csConnectedAtPower)
      then begin
        //Провода на осциллографе верно подключены
        //Далее определяем к какой стойке они подключены
        //===========================1200A2 PRD==================================
        if (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200A2Sync) and
        (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200A2PRD) then
        begin
          Deviation(2);
          Station.Deviation.Rack1200A_PRD := stPassed;
        end;
        if (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200A2Sync) and
        (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200A2PRM) then
        begin
          Deviation(1);
          Station.Deviation.Rack1200A_PRM := stPassed;
        end;
        //===========================1200B2 PRD==================================
        if (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200B2Sync) and
        (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200B2PRD) then
        begin
          Deviation(2);
          Station.Deviation.Rack1200B_PRD := stPassed;
        end;
        if (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200B2Sync) and
        (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200B2PRM) then
        begin
          Deviation(1);
          Station.Deviation.Rack1200B_PRM := stPassed;
        end;
        //===========================1200B1 PRD==================================
        if (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200A1Sync) and
        (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200A1PRM) then
        begin
          Deviation(2);
          Station.Deviation.Rack1200A_PRM := stPassed;
        end;
        //===========================1200B2 PRD==================================
        if (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200B1Sync) and
        (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200B1PRM) then
        begin
          Deviation(1);
          Station.Deviation.Rack1200B_PRM := stPassed;
        end;
      end
      else begin
        TaskController.AddError(idOscillographC, 'Не верно подключены (не подключены) провода осциллографа');
      end;
    end
    else begin
      TaskController.AddError(idOscillographC, 'Не верно настроены параметры осциллографа');
    end;
  end
  else begin
    TaskController.AddError(idOscillographC, AnalyseTune(Station.HalfSetA.Rack1500, Station.HalfSetA.Rack1920, Station.HalfSetA.Rack1600, Station.HalfSetA.LittleNoisyAmplifier, Station.HalfSetA.Duplexer, 'A') +
    AnalyseTune(Station.HalfSetA.Rack1500, Station.HalfSetA.Rack1920, Station.HalfSetA.Rack1600, Station.HalfSetA.LittleNoisyAmplifier, Station.HalfSetA.Duplexer, 'B'));
  end;
end;

procedure TBlockOscillographForm.Reload;
begin
  ilRazvertka.GetBitmap(Station.Oscillograph.swRazvertka - 1, imgRazvertka.Picture.Bitmap);
  ilRazvertkaShortTune.GetBitmap(Station.Oscillograph.swRazvertkaShortTune - 1, imgRazvertkaShortTune.Picture.Bitmap);
  imgDirectOrAlternativePositionUp.Visible := Boolean(Station.Oscillograph.butDirectOrAlternative = butPositionUp);
  ilSyncType.GetBitmap(Station.Oscillograph.swSyncType - 1, imgSyncType.Picture.Bitmap);
  imgbutLevelPositionUp.Visible := Boolean(Station.Oscillograph.butLevelPosition = butPositionUp);
  ilCalibrator.GetBitmap(Station.Oscillograph.swCalibrator - 1, imgCalibrator.Picture.Bitmap);
  imgbut1KhzPositionUp.Visible := Boolean(Station.Oscillograph.but1Khz = butPositionUp);
  ilSwXz.GetBitmap(Station.Oscillograph.swHz - 1, imgSwXz.Picture.Bitmap);
  ilSwVvsDel.GetBitmap(Station.Oscillograph.swVvsDel - 1, imgSwVvsDel.Picture.Bitmap);
  ilPowerType.GetBitmap(Station.Oscillograph.swPowerType - 1, imgPowerType.Picture.Bitmap);

  imgRazvertka.Invalidate;
  imgRazvertkaShortTune.Invalidate;
  imgDirectOrAlternativePositionUp.Invalidate;
  imgSyncType.Invalidate;
  imgbutLevelPositionUp.Invalidate;
  imgCalibrator.Invalidate;
  imgbut1KhzPositionUp.Invalidate;
  imgSwXz.Invalidate;
  imgSwVvsDel.Invalidate;
  imgPowerType.Invalidate;

  //Кабели
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

procedure TBlockOscillographForm.tmrMainTimer(Sender: TObject);
begin
  tmrMain.Interval := 40;
  PaintOscilogram;
end;

procedure TBlockOscillographForm.Image6Click(Sender: TObject);
begin
  if not (Handset = nil) then
  begin
    Handset.Close;
  end;

  Handset := THandsetForm.Create(Self, 2, Station, TaskController);
  Handset.Show;
end;

procedure TBlockOscillographForm.Image7Click(Sender: TObject);

begin
  if not (Handset = nil) then
  begin
    Handset.Close;
  end;

  Handset := THandsetForm.Create(Self, 1, Station, TaskController);
  Handset.Show;
end;

procedure TBlockOscillographForm.imgbut1KhzClick(Sender: TObject);
begin
  if Station.Oscillograph.but1Khz = butPositionUp then
    Station.Oscillograph.but1Khz := butPositionDown
  else
    Station.Oscillograph.but1Khz := butPositionUp;

  Reload;
end;

procedure TBlockOscillographForm.imgCableGNDConnectedAtPowerClick(Sender: TObject);
begin
  Station.Oscillograph.cblCableUsilitelState := csDisconected;

  Reload;
  //if BlockOscillographMinForm.Showing then
  //  BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgCableGNDConnectedAtSyncClick(Sender: TObject);
begin
  Station.Oscillograph.cblCableUsilitelState := csDisconected;

  Reload;
  //if BlockOscillographMinForm.Showing then
  //  BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgCableGNDDisconnectedClick(Sender: TObject);
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
  //if BlockOscillographMinForm.Showing then
  //  BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgCableSyncConnectedAtPowerClick(Sender: TObject);
begin
  Station.Oscillograph.cblCabelSyncState := csDisconected;

  Reload;
  //if BlockOscillographMinForm.Showing then
  //  BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgCableSyncConnectedAtSyncClick(Sender: TObject);
begin
  Station.Oscillograph.cblCabelSyncState := csDisconected;

  Reload;
  //if BlockOscillographMinForm.Showing then
   // BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgCableSyncDisconnectedClick(Sender: TObject);
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
  //if BlockOscillographMinForm.Showing then
  //  BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgCalibratorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Oscillograph.swCalibrator < 11) then
    Inc(Station.Oscillograph.swCalibrator, 1);
  if (Button = mbRight) and (Station.Oscillograph.swCalibrator > 1) then
    Dec(Station.Oscillograph.swCalibrator, 1);

  Reload;
end;

procedure TBlockOscillographForm.imgDirectOrAlternativeClick(Sender: TObject);
begin
  if Station.Oscillograph.butDirectOrAlternative = butPositionUp then
    Station.Oscillograph.butDirectOrAlternative := butPositionDown
  else
    Station.Oscillograph.butDirectOrAlternative := butPositionUp;

  Reload;
end;

procedure TBlockOscillographForm.imgLevelPClick(Sender: TObject);
begin
  if Station.Oscillograph.butLevelPosition = butPositionUp then
    Station.Oscillograph.butLevelPosition := butPositionDown
  else
    Station.Oscillograph.butLevelPosition := butPositionUp;

  Reload;
end;

procedure TBlockOscillographForm.imgPowerTypeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Oscillograph.swPowerType < 3) then
    Inc(Station.Oscillograph.swPowerType, 1);
  if (Button = mbRight) and (Station.Oscillograph.swPowerType > 1) then
    Dec(Station.Oscillograph.swPowerType, 1);

  Reload;
end;

procedure TBlockOscillographForm.imgRazvertkaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Oscillograph.swRazvertka < 3) then
    Inc(Station.Oscillograph.swRazvertka, 1);
  if (Button = mbRight) and (Station.Oscillograph.swRazvertka > 1) then
    Dec(Station.Oscillograph.swRazvertka, 1);

  Reload;
end;

procedure TBlockOscillographForm.imgRazvertkaShortTuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Oscillograph.swRazvertkaShortTune < 18) then
    Inc(Station.Oscillograph.swRazvertkaShortTune, 1);
  if (Button = mbRight) and (Station.Oscillograph.swRazvertkaShortTune > 1) then
    Dec(Station.Oscillograph.swRazvertkaShortTune, 1);

  Reload;
end;

procedure TBlockOscillographForm.imgSpawnPowerClick(Sender: TObject);
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
  //if BlockOscillographMinForm.Showing then
  //  BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgSpawnSyncClick(Sender: TObject);
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
  //if BlockOscillographMinForm.Showing then
  //  BlockOscillographMinForm.Reload;
end;

procedure TBlockOscillographForm.imgSwVvsDelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Oscillograph.swVvsDel < 11) then
    Inc(Station.Oscillograph.swVvsDel, 1);
  if (Button = mbRight) and (Station.Oscillograph.swVvsDel > 1) then
    Dec(Station.Oscillograph.swVvsDel, 1);

  Reload;
end;

procedure TBlockOscillographForm.imgSwXzMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Oscillograph.swHz < 3) then
    Inc(Station.Oscillograph.swHz, 1);
  if (Button = mbRight) and (Station.Oscillograph.swHz > 1) then
    Dec(Station.Oscillograph.swHz, 1);

  Reload;
end;

procedure TBlockOscillographForm.imgSyncTypeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Oscillograph.swSyncType < 4) then
    Inc(Station.Oscillograph.swSyncType, 1);
  if (Button = mbRight) and (Station.Oscillograph.swSyncType > 1) then
    Dec(Station.Oscillograph.swSyncType, 1);

  Reload;
end;



procedure TBlockOscillographForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not (Handset = nil) then Handset.Close;
  ReturnFromRack;
end;

procedure TBlockOscillographForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TBlockOscillographForm.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TBlockOscillographForm.FormShow(Sender: TObject);
begin
  Height := Image1.Height;
  Width := Image1.Width;

  Self.Left := Screen.Width div 2 - Self.Width div 2;
  Reload;
end;

end.
