unit uRack1200LeftForm;

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
  jpeg,
  ExtCtrls,
  ImgList,
  pngimage,
  StdCtrls,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  TRack1200LeftForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    imgSwNumberOfUchastok: TImage;
    ilSwNumberOf: TImageList;
    ImageList2: TImageList;
    imgSwNumberOfStantion: TImage;
    ilbut1220ADMain: TImageList;
    imgbut1220ADMain: TImage;
    ImageList4: TImageList;
    ilChannelControl: TImageList;
    imgbutChannelControl: TImage;
    ImageList6: TImageList;
    imgbut1240K: TImage;
    ilSw1240K: TImageList;
    imgSw1240K: TImage;
    Image9: TImage;
    Panel3: TPanel;
    il: TImageList;
    imgbut1220ADReserve: TImage;
    imgbut1230AReserve: TImage;
    ImageList9: TImageList;
    il1240G: TImageList;
    imgBut1240GMain: TImage;
    imgBut1240GMain2: TImage;
    ilBut1240GMain: TImageList;
    Panel4: TPanel;
    Image14: TImage;
    imgbut1240GPrmPrd: TImage;
    ilbut1240GPrmPrd: TImageList;
    imgbut1240GOneTwo: TImage;
    ilbut1240GOneTwo: TImageList;
    imgbut1240G: TImage;
    ImageList14: TImageList;
    imgbut1240V: TImage;
    ilbut1240V: TImageList;
    imgbut1240V2: TImage;
    ImageList16: TImageList;
    imgSw1240V: TImage;
    imgSw1240V2: TImage;
    ImageList17: TImageList;
    il1240V: TImageList;
    Panel5: TPanel;
    Image17ab: TImage;
    img1240G1ButPositionUp: TImage;
    imgbut1240G1: TImage;
    img1240G2ButPositionUp: TImage;
    imgbut1240G2: TImage;
    img1240G3ButPositionUp: TImage;
    imgbut1240G3: TImage;
    img1240G4ButPositionUp: TImage;
    imgbut1240G4: TImage;
    Panel6: TPanel;
    Image22: TImage;
    img1240G5ButPositionUp: TImage;
    imgbut1240G5: TImage;
    img1240G6ButPositionUp: TImage;
    imgbut1240G6: TImage;
    img1240G7ButPositionUp: TImage;
    imgbut1240G7: TImage;
    img1240G8ButPositionUp: TImage;
    imgbut1240G8: TImage;
    Panel7: TPanel;
    Image1q: TImage;
    imgind1290Power: TImage;
    img1290ButPositionUp: TImage;
    imgBut1920Power: TImage;
    imgSw1290: TImage;
    ilSw1290: TImageList;
    Image23: TImage;
    Image25: TImage;
    Image27: TImage;
    img1240GR2_PRD: TImage;
    img1240GR2_PRM: TImage;
    img1240GR1_PRD: TImage;
    img1240GR1_PRM: TImage;
    img1240G_PRD: TImage;
    img1240G_PRM: TImage;
    img1240V_4P: TImage;
    img1240V_DC: TImage;
    img1240G_K: TImage;
    img1240V_DC2: TImage;
    img1240V2_4P: TImage;
    img1240V2_K: TImage;
    img1240V2_DC: TImage;
    img1240V2_DC2: TImage;
    Image41: TImage;
    img1240G4_PRD: TImage;
    img1240G4_PRM: TImage;
    img1240G3_PRD: TImage;
    img1240G3_PRM: TImage;
    img1240G2_PRD: TImage;
    img1240G2_PRM: TImage;
    img1240G1_PRD: TImage;
    img1240G1_PRM: TImage;
    img1240G8_PRD: TImage;
    img1240G8_PRM: TImage;
    img1240G7_PRD: TImage;
    img1240G7_PRM: TImage;
    img1240G6_PRD: TImage;
    img1240G6_PRM: TImage;
    img1240G5_PRD: TImage;
    img1240G5_PRM: TImage;
    Image58: TImage;
    img1240G_PRDM: TImage;
    Image60: TImage;
    img1240V_4PDC: TImage;
    Image62: TImage;
    img1240_VKDC: TImage;
    Image64: TImage;
    img1240V2_4PDC: TImage;
    img1240V2_4PDC_2: TImage;
    imgind1220ADMain: TImage;
    imgInd1230AMain: TImage;
    Image69: TImage;
    Image70: TImage;
    img1220ADPhasirovkaReserve: TImage;
    imgind1220ADphasirovkaMain: TImage;
    imgbut1230AMain: TImage;
    imgind1220ADReserve: TImage;
    imgind1230AReserv: TImage;
    Image75: TImage;
    imgInd1240GReserve: TImage;
    img1240GReserve: TImage;
    imgInd1240V: TImage;
    imgInd1240V2: TImage;
    imgInd1240G: TImage;
    imgInd1240G2: TImage;
    imgInd1240G3: TImage;
    imgInd1240G4: TImage;
    imgInd1240G5: TImage;
    imgInd1240G6: TImage;
    imgInd1240G7: TImage;
    imgInd1240G8: TImage;
    imgCableVhodPrm: TImage;
    imgCableSinusOscill: TImage;
    Image91: TImage;
    Label7: TLabel;
    imgind1240Level: TImage;
    imgind1240Level2: TImage;
    imgInd1240G1: TImage;
    ilTune: TImageList;
    img1240GMainTune: TImage;
    img1240GMain2Tune: TImage;
    img1240GPrmPrdTune: TImage;
    img1240GTune: TImage;
    img1240VTune: TImage;
    img1240V2Tune: TImage;
    img1240G1Tune: TImage;
    img1240G2Tune: TImage;
    img1240G3Tune: TImage;
    img1240G4Tune: TImage;
    img1240G5Tune: TImage;
    img1240G6Tune: TImage;
    img1240G7Tune: TImage;
    img1240G8Tune: TImage;
    imgSpawnPRM: TImage;
    imgSpawnSync: TImage;
    imgInd1240V1_Line: TImage;
    imgInd1240V2_Line: TImage;
    imgJmpToLeft: TImage;
    imgJmpToLeft2: TImage;
    imgJmpToLeft3: TImage;
    imgJmpToLeft4: TImage;
    imgJmpToLeft5: TImage;
    imgJmpToLeft6: TImage;
    imgJmpToRight: TImage;
    imgJmpToRight2: TImage;
    imgJmpToRight3: TImage;
    imgJmpToRight4: TImage;
    imgJmpToRight5: TImage;
    imgJmpToRight6: TImage;
    imgBut1240KPositionDown: TImage;
    imgBut1240KPositionUp: TImage;
    img1240KPowerOn: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure imgSw1290MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgBut1920PowerClick(Sender: TObject);
    procedure imgbut1240G8Click(Sender: TObject);
    procedure img1240G4ButPositionUpClick(Sender: TObject);
    procedure imgbut1240G3Click(Sender: TObject);
    procedure imgbut1240G2Click(Sender: TObject);
    procedure imgbut1240G1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Reload;
    procedure imgbutChannelControlClick(Sender: TObject);
    procedure imgbut1240G4Click(Sender: TObject);
    procedure imgbut1240G5Click(Sender: TObject);
    procedure imgbut1240G6Click(Sender: TObject);
    procedure imgbut1240G7Click(Sender: TObject);
    procedure imgbut1240GPrmPrdClick(Sender: TObject);
    procedure imgBut1240GMainClick(Sender: TObject);
    procedure imgBut1240GMain2Click(Sender: TObject);
    procedure imgbut1240GClick(Sender: TObject);
    procedure imgbut1240VClick(Sender: TObject);
    procedure imgbut1240V2Click(Sender: TObject);
    procedure imgSw1240VMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSw1240V2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgbut1220ADMainClick(Sender: TObject);
    procedure imgbut1230AMainClick(Sender: TObject);
    procedure imgSw1240KMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwNumberOfUchastokMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgSwNumberOfStantionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgbut1240GOneTwoClick(Sender: TObject);
    procedure imgbut1220ADReserveClick(Sender: TObject);
    procedure imgbut1230AReserveClick(Sender: TObject);
    procedure img1240G_PRDClick(Sender: TObject);
    procedure img1240G_PRMClick(Sender: TObject);
    procedure img1240G_PRDMClick(Sender: TObject);
    procedure img1240V_4PClick(Sender: TObject);
    procedure img1240V_4PDCClick(Sender: TObject);
    procedure img1240G_KClick(Sender: TObject);
    procedure img1240V_DC2Click(Sender: TObject);
    procedure img1240_VKDCClick(Sender: TObject);
    procedure img1240V2_4PClick(Sender: TObject);
    procedure img1240V2_DCClick(Sender: TObject);
    procedure img1240V2_4PDCClick(Sender: TObject);
    procedure img1240V2_KClick(Sender: TObject);
    procedure img1240V2_DC2Click(Sender: TObject);
    procedure img1240V2_4PDC_2Click(Sender: TObject);
    procedure img1240GMainTuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240GMain2TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240GPrmPrdTuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240GTuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240VTuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240V2TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G1TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G2TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G3TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G4TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G5TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G6TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G7TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240G8TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCableSinusOscillClick(Sender: TObject);
    procedure imgCableVhodPrmClick(Sender: TObject);
    procedure imgSpawnPRMClick(Sender: TObject);
    procedure imgSpawnSyncClick(Sender: TObject);
    procedure imgJmpToLeft6Click(Sender: TObject);
    procedure imgJmpToRight6Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure imgbut1240KClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetCableOscillographSyncState(btStateCode: Byte);
    procedure SetCableVhodPrmState(btStateCode: Byte);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Half: Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;
  end;

var
  //Rack1200LeftForm: TRack1200LeftForm;
  CurFormId: Integer;
  ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;

  const
  idRack1200A1=1;
  idRack1200B1=2;


implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uEducationForm,
  uRack1200RightForm,
  uBlockOscillographForm,
  uBlockRemoteControllerForm,
  uBlockOscillographMinForm,
  uRackP321Form,
  uP321DisplayForm,
  uConstantsDM;

{$R *.dfm}

constructor TRack1200LeftForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  //idRack1200A1:=1;
  //idRack1200B1:=2;
  CurFormId:=Half;

  if (Half=1) then begin Self.Caption:='1200 ПРМ А'; end
  else Self.Caption:='1200 ПРМ Б';

    Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure TRack1200LeftForm.SetCableOscillographSyncState(btStateCode: Byte);
begin
  case btStateCode of
    csConnectedAtPRM:
      begin
        imgCableSinusOscill.Left := 546;
        imgCableSinusOscill.Top := 0;
      end;
    csDisconected:
      begin
        imgCableSinusOscill.Left := 592;
        imgCableSinusOscill.Top := -63;
      end;
    csConnectedAtSync:
      begin
        imgCableSinusOscill.Left := 592;
        imgCableSinusOscill.Top := 0;
      end;
  end;

  imgCableSinusOscill.Invalidate;
end;

procedure TRack1200LeftForm.SetCableVhodPrmState(btStateCode: Byte);
begin
  case btStateCode of
    csConnectedAtPRM:
      begin
        imgCableVhodPrm.Left := 516;
        imgCableVhodPrm.Top := 0;
      end;
    csDisconected:
      begin
        imgCableVhodPrm.Left := 522;
        imgCableVhodPrm.Top := -63;
      end;
    csConnectedAtSync:
      begin
        imgCableVhodPrm.Left := 564;
        imgCableVhodPrm.Top := 0;
      end;
  end;

  imgCableVhodPrm.Invalidate;
end;

procedure TRack1200LeftForm.Reload;

  function OutTune(tmpByte: Byte): Byte;
  begin
    while tmpByte > 8 do
    begin
      tmpByte := tmpByte - 8;
    end;
    Result := tmpByte;
  end;

  procedure HideLevel;
  begin
    imgInd1240V1_Line.Visible := False;
    imgInd1240V2_Line.Visible := False;
  end;

  procedure InvalidateAll;
  begin
    img1240G_PRD.Invalidate;
    img1240G_PRM.Invalidate;
    img1240G_PRDM.Invalidate;

    img1240V_4P.Invalidate;
    img1240V_DC.Invalidate;
    img1240V_4PDC.Invalidate;

    img1240G_K.Invalidate;
    img1240V_DC2.Invalidate;
    img1240_VKDC.Invalidate;


    img1240V2_4P.Invalidate;
    img1240V2_DC.Invalidate;
    img1240V2_4PDC.Invalidate;

    img1240V2_K.Invalidate;
    img1240V2_DC2.Invalidate;
    img1240V2_4PDC_2.Invalidate;

    img1290ButPositionUp.Invalidate;
    imgbutChannelControl.Invalidate;
    img1240G1ButPositionUp.Invalidate;
    img1240G2ButPositionUp.Invalidate;
    img1240G3ButPositionUp.Invalidate;
    img1240G4ButPositionUp.Invalidate;
    img1240G5ButPositionUp.Invalidate;
    img1240G6ButPositionUp.Invalidate;
    img1240G7ButPositionUp.Invalidate;
    img1240G8ButPositionUp.Invalidate;
    imgbut1240GPrmPrd.Invalidate;
    imgbut1220ADMain.Invalidate;
    imgbut1220ADMain.Invalidate;
    imgSw1240K.Invalidate;
    imgSwNumberOfUchastok.Invalidate;
    imgSwNumberOfStantion.Invalidate;
    imgbut1240GOneTwo.Invalidate;
    imgBut1240GMain2.Invalidate;
    imgBut1240GMain.Invalidate;
    imgbut1230AMain.Invalidate;
    imgbut1240G.Invalidate;
    imgbut1240V.Invalidate;
    imgbut1240V2.Invalidate;
    imgbut1230AReserve.Invalidate;
    imgbut1220ADReserve.Invalidate;
    img1240GMainTune.Invalidate;
    img1240GMain2Tune.Invalidate;
    img1240GTune.Invalidate;
    img1240GPrmPrdTune.Invalidate;
    img1240VTune.Invalidate;
    img1240V2Tune.Invalidate;
    img1240G1Tune.Invalidate;
    img1240G2Tune.Invalidate;
    img1240G3Tune.Invalidate;
    img1240G4Tune.Invalidate;
    img1240G5Tune.Invalidate;
    img1240G6Tune.Invalidate;
    img1240G7Tune.Invalidate;
    img1240G8Tune.Invalidate;

    imgSw1240V2.Invalidate;
    imgSw1240V.Invalidate;
    imgSw1290.Invalidate;

    //------------------Индикаторы---------
    imgInd1240GReserve.Invalidate;
    img1240GReserve.Invalidate;

    imgInd1240G1.Invalidate;
    imgInd1240V.Invalidate;
    imgInd1240V2.Invalidate;

    imgind1220ADMain.Invalidate;
    imgind1220ADphasirovkaMain.Invalidate;
    imgInd1230AMain.Invalidate;
    imgind1220ADReserve.Invalidate;
    img1220ADPhasirovkaReserve.Invalidate;
    imgind1230AReserv.Invalidate;
    imgInd1240GReserve.Invalidate;
    img1240GReserve.Invalidate;

    imgind1290Power.Invalidate
  end;

var
  btTune: Byte;
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200A1PRM) or
        (Station.Oscillograph.cblCabelSyncConnectedTo = csConnectedTo1200A1Sync) then
        begin
          imgCableSinusOscill.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCabelSyncConnectedTo = csDisconected then
            imgCableSinusOscill.Visible := True
          else
            imgCableSinusOscill.Visible := False;
        end;

        if (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200A1PRM) or
        (Station.Oscillograph.cblCableUsilitelConnectedTo = csConnectedTo1200A1Sync) then
        begin
          imgCableVhodPrm.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCableUsilitelConnectedTo = csDisconected then
            imgCableVhodPrm.Visible := True
          else
            imgCableVhodPrm.Visible := False;
        end;

        img1240G_PRD.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240G_ports = stPluggedIn);
        img1240G_PRM.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240G_ports = stPluggedIn);
        img1240G_PRDM.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240G_ports = stPluggedInCross);

        img1240V_4P.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedIn);
        img1240V_DC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedIn);
        img1240V_4PDC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedInCross);

        img1240G_K.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedIn);
        img1240V_DC2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedIn);
        img1240_VKDC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedInCross);

        img1240V2_4P.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedIn);
        img1240V2_DC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedIn);
        img1240V2_4PDC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedInCross);

        img1240V2_K.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedIn);
        img1240V2_DC2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedIn);
        img1240V2_4PDC_2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedInCross);

        //Кнопки
        img1290ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1290Power = butPositionUp);
        imgBut1240KPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240K = butPositionUp);
        ilChannelControl.GetBitmap(Station.HalfSetA.Rack1200Left.butChannelControl, imgbutChannelControl.Picture.Bitmap);
        img1240G1ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G1 = butPositionUp);
        img1240G2ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G2 = butPositionUp);
        img1240G3ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G3 = butPositionUp);
        img1240G4ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G4 = butPositionUp);
        img1240G5ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G5 = butPositionUp);
        img1240G6ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G6 = butPositionUp);
        img1240G7ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G7 = butPositionUp);
        img1240G8ButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.but1240G8 = butPositionUp);
        ilbut1240GPrmPrd.GetBitmap(Station.HalfSetA.Rack1200Left.but1240GPrmPrd,
           imgbut1240GPrmPrd.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetA.Rack1200Left.but1220ADMain,
           imgbut1220ADMain.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetA.Rack1200Left.but1230AMain,
           imgbut1230AMain.Picture.Bitmap);
        ilSw1240K.GetBitmap(Station.HalfSetA.Rack1200Left.Sw1240K - 1,
           imgSw1240K.Picture.Bitmap);
        ilSwNumberOf.GetBitmap(Station.HalfSetA.Rack1200Left.SwNumberOfUchastok - 1,
           imgSwNumberOfUchastok.Picture.Bitmap);
        ilSwNumberOf.GetBitmap(Station.HalfSetA.Rack1200Left.SwNumberOfStantion - 1,
           imgSwNumberOfStantion.Picture.Bitmap);
        ilbut1240GOneTwo.GetBitmap(Station.HalfSetA.Rack1200Left.but1240GOneTwo,
           imgbut1240GOneTwo.Picture.Bitmap);
        ilBut1240GMain.GetBitmap(Station.HalfSetA.Rack1200Left.But1240GMain,
           imgBut1240GMain.Picture.Bitmap);
        ilBut1240GMain.GetBitmap(Station.HalfSetA.Rack1200Left.But1240GMain2,
           imgBut1240GMain2.Picture.Bitmap);
        il1240G.GetBitmap(Station.HalfSetA.Rack1200Left.but1240G,
           imgbut1240G.Picture.Bitmap);
        ilbut1240V.GetBitmap(Station.HalfSetA.Rack1200Left.but1240V,
           imgbut1240V.Picture.Bitmap);
        ilbut1240V.GetBitmap(Station.HalfSetA.Rack1200Left.but1240V2,
           imgbut1240V2.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetA.Rack1200Left.but1220ADReserve,
           imgbut1220ADReserve.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetA.Rack1200Left.but1230AReserve,
           imgbut1230AReserve.Picture.Bitmap);

        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240GMainTune),
          img1240GMainTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240GMain2Tune),
          img1240GMain2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240GTune),
          img1240GTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune),
          img1240GPrmPrdTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.Sw1240VTune),
          img1240VTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.Sw1240V2Tune),
          img1240V2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G1Tune),
          img1240G1Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G2Tune),
          img1240G2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G3Tune),
          img1240G3Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G4Tune),
          img1240G4Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G5Tune),
          img1240G5Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G6Tune),
          img1240G6Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G7Tune),
          img1240G7Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Left.sw1240G8Tune),
          img1240G8Tune.Picture.Bitmap);

        SetCableVhodPrmState(Station.HalfSetA.Rack1200Left.CableVhodPrm);
        SetCableOscillographSyncState(Station.HalfSetA.Rack1200Left.CableSinusOscill);

        //Кукушки
        ilSw1290.GetBitmap(Station.HalfSetA.Rack1200Left.Sw1290 - 1,
          imgSw1290.Picture.Bitmap);
        il1240V.GetBitmap(Station.HalfSetA.Rack1200Left.Sw1240V2 - 1,
          imgSw1240V2.Picture.Bitmap);
        il1240V.GetBitmap(Station.HalfSetA.Rack1200Left.Sw1240V - 1,
          imgSw1240V.Picture.Bitmap);

        if (Station.IsPluggedIn) and (Station.PowerPanel.sw1900Power  = 1) then
        begin
          imgind1220ADMain.Visible :=
            Boolean(Station.Rack1710.but1220AD = butPositionLeft);
          img1240KPowerOn.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.but1240K = butPositionUp);
          imgind1220ADReserve.Visible :=
            Boolean(Station.Rack1710.but1220AD = butPositionRight);
          imgind1220ADphasirovkaMain.Visible :=
            Boolean((Station.Rack1710.but1220AD = butPositionLeft)
            and (Station.HalfSetA.Rack1600.stMoshnost));
          img1220ADPhasirovkaReserve.Visible :=
            Boolean((Station.Rack1710.but1220AD = butPositionRight)
            and (Station.HalfSetA.Rack1600.stMoshnost));
          imgInd1230AMain.Visible :=
            Boolean(Station.Rack1710.but1230AD = butPositionLeft);
          imgind1230AReserv.Visible :=
            not(Boolean(Station.Rack1710.but1230AD = butPositionLeft));
          imgind1290Power.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.but1290Power = butPositionUp);

          imgInd1240G.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G2.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G3.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G4.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G5.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G6.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G7.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G8.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);

          imgInd1240V.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240V2.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240GReserve.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          img1240GReserve.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G1.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
        end
        else
        begin
          imgInd1240G1.Visible := False;
          imgInd1240V.Visible := False;
          imgInd1240V2.Visible := False;

          imgind1220ADMain.Visible := False;
          imgind1220ADphasirovkaMain.Visible := False;
          imgInd1230AMain.Visible := False;
          imgind1220ADReserve.Visible := False;
          img1220ADPhasirovkaReserve.Visible := False;
          imgind1230AReserv.Visible := False;

          imgind1290Power.Visible := False;
        end;

        if Station.IsPolukomplektATuned then
        begin
          if (Station.IsChannelBlocksTunedAt4ChannelMode()
              and Station.IsP321ShuntsConnectedAt4ChannelMode()
              and Station.IsP321ReadyToMeasure()) then
          begin
            imgInd1240V1_Line.Visible :=
              Boolean((Station.cbGenerator.stConnectedToPlaceId = 15)
              and (Station.cbInputYY.stConnectedToPlaceId = 184)
              or (Station.cbGenerator.stConnectedToPlaceId = 183)
              and (Station.cbInputYY.stConnectedToPlaceId = 16));

            imgInd1240V2_Line.Visible :=
              Boolean((Station.cbGenerator.stConnectedToPlaceId = 17)
              and (Station.cbInputYY.stConnectedToPlaceId = 186)
              or (Station.cbGenerator.stConnectedToPlaceId = 185)
              and (Station.cbInputYY.stConnectedToPlaceId = 18));
            InvalidateAll;
            Exit;
          end
          else
            HideLevel;
        end
        else
          HideLevel;
        if Station.IsPolukomplektBTuned then
        begin
          if (Station.IsChannelBlocksTunedAt2ChannelMode
              and Station.IsP321ShuntsConnectedAt2ChannelMode
              and Station.IsP321ReadyToMeasure) then
          begin
            imgInd1240V1_Line.Visible :=
              Boolean((Station.cbGenerator.stConnectedToPlaceId = 16)
              and (Station.cbInputYY.stConnectedToPlaceId = 184)
              or (Station.cbGenerator.stConnectedToPlaceId = 184)
              and (Station.cbInputYY.stConnectedToPlaceId = 16));

            imgInd1240V2_Line.Visible :=
              Boolean((Station.cbGenerator.stConnectedToPlaceId = 18)
              and (Station.cbInputYY.stConnectedToPlaceId = 186)
              or (Station.cbGenerator.stConnectedToPlaceId = 186)
              and (Station.cbInputYY.stConnectedToPlaceId = 18));
            InvalidateAll;
            Exit;
          end
          else
            HideLevel;
        end
        else
          HideLevel;
      end;

    idRack1200B1:
      begin
        if (Station.Oscillograph.cblCabelSyncConnectedTo =
            csConnectedTo1200B1PRM)
          or
          (Station.Oscillograph.cblCabelSyncConnectedTo =
            csConnectedTo1200B1Sync) then
        begin
          imgCableSinusOscill.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCabelSyncConnectedTo = csDisconected then
            imgCableSinusOscill.Visible := True
          else
            imgCableSinusOscill.Visible := False;
        end;

        if (Station.Oscillograph.cblCableUsilitelConnectedTo =
            csConnectedTo1200B1PRM) or
          (Station.Oscillograph.cblCableUsilitelConnectedTo =
            csConnectedTo1200B1Sync) then
        begin
          imgCableVhodPrm.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCableUsilitelConnectedTo = csDisconected then
            imgCableVhodPrm.Visible := True
          else
            imgCableVhodPrm.Visible := False;
        end;

        img1240G_PRD.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240G_ports = stPluggedIn);
        img1240G_PRM.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240G_ports = stPluggedIn);
        img1240G_PRDM.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240G_ports = stPluggedInCross);

        img1240V_4P.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedIn);
        img1240V_DC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedIn);
        img1240V_4PDC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports = stPluggedInCross);

        img1240G_K.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedIn);
        img1240V_DC2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedIn);
        img1240_VKDC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports = stPluggedInCross);

        img1240V2_4P.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedIn);
        img1240V2_DC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedIn);
        img1240V2_4PDC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports = stPluggedInCross);

        img1240V2_K.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedIn);
        img1240V2_DC2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedIn);
        img1240V2_4PDC_2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports = stPluggedInCross);

        //Кнопки
        img1290ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1290Power = butPositionUp);
        imgBut1240KPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240K = butPositionUp);
        ilChannelControl.GetBitmap(Station.HalfSetB.Rack1200Left.butChannelControl,
          imgbutChannelControl.Picture.Bitmap);
        img1240G1ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G1 = butPositionUp);
        img1240G2ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G2 = butPositionUp);
        img1240G3ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G3 = butPositionUp);
        img1240G4ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G4 = butPositionUp);
        img1240G5ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G5 = butPositionUp);
        img1240G6ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G6 = butPositionUp);
        img1240G7ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G7 = butPositionUp);
        img1240G8ButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Left.but1240G8 = butPositionUp);
        ilbut1240GPrmPrd.GetBitmap(Station.HalfSetB.Rack1200Left.but1240GPrmPrd,
          imgbut1240GPrmPrd.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetB.Rack1200Left.but1220ADMain,
          imgbut1220ADMain.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetB.Rack1200Left.but1230AMain,
          imgbut1230AMain.Picture.Bitmap);
        ilSw1240K.GetBitmap(Station.HalfSetB.Rack1200Left.Sw1240K - 1,
          imgSw1240K.Picture.Bitmap);
        ilSwNumberOf.GetBitmap(Station.HalfSetB.Rack1200Left.SwNumberOfUchastok - 1,
          imgSwNumberOfUchastok.Picture.Bitmap);
        ilSwNumberOf.GetBitmap(Station.HalfSetB.Rack1200Left.SwNumberOfStantion - 1,
          imgSwNumberOfStantion.Picture.Bitmap);
        ilbut1240GOneTwo.GetBitmap(Station.HalfSetB.Rack1200Left.but1240GOneTwo,
          imgbut1240GOneTwo.Picture.Bitmap);
        ilBut1240GMain.GetBitmap(Station.HalfSetB.Rack1200Left.But1240GMain,
          imgBut1240GMain.Picture.Bitmap);
        ilBut1240GMain.GetBitmap(Station.HalfSetB.Rack1200Left.But1240GMain2,
          imgBut1240GMain2.Picture.Bitmap);
        il1240G.GetBitmap(Station.HalfSetB.Rack1200Left.but1240G,
          imgbut1240G.Picture.Bitmap);
        ilbut1240V.GetBitmap(Station.HalfSetB.Rack1200Left.but1240V,
          imgbut1240V.Picture.Bitmap);
        ilbut1240V.GetBitmap(Station.HalfSetB.Rack1200Left.but1240V2,
          imgbut1240V2.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetB.Rack1200Left.but1220ADReserve,
          imgbut1220ADReserve.Picture.Bitmap);
        ilbut1220ADMain.GetBitmap(Station.HalfSetB.Rack1200Left.but1230AReserve,
          imgbut1230AReserve.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240GMainTune),
          img1240GMainTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240GMain2Tune),
          img1240GMain2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240GTune),
          img1240GTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune),
          img1240GPrmPrdTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.Sw1240VTune),
          img1240VTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.Sw1240V2Tune),
          img1240V2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G1Tune),
          img1240G1Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G2Tune),
          img1240G2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G3Tune),
          img1240G3Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G4Tune),
          img1240G4Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G5Tune),
          img1240G5Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G6Tune),
          img1240G6Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G7Tune),
          img1240G7Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Left.sw1240G8Tune),
          img1240G8Tune.Picture.Bitmap);

        SetCableVhodPrmState(Station.HalfSetB.Rack1200Left.CableVhodPrm);
        SetCableOscillographSyncState(Station.HalfSetB.Rack1200Left.CableSinusOscill);

        //Кукушки
        ilSw1290.GetBitmap(Station.HalfSetB.Rack1200Left.Sw1290 - 1,
          imgSw1290.Picture.Bitmap);
        il1240V.GetBitmap(Station.HalfSetB.Rack1200Left.Sw1240V2 - 1,
          imgSw1240V2.Picture.Bitmap);
        il1240V.GetBitmap(Station.HalfSetB.Rack1200Left.Sw1240V - 1,
          imgSw1240V.Picture.Bitmap);

        if (Station.IsPluggedIn) and (Station.PowerPanel.sw1900Power_2  = 1) then
        begin
          imgind1220ADMain.Visible :=
            Boolean(Station.Rack1710.but1220AD_2 = butPositionLeft);
          img1240KPowerOn.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.but1240K = butPositionUp);
          imgind1220ADReserve.Visible :=
            Boolean(Station.Rack1710.but1220AD_2 = butPositionRight);
          imgind1220ADphasirovkaMain.Visible :=
            Boolean((Station.Rack1710.but1220AD_2 = butPositionLeft) and
          (Station.HalfSetB.Rack1600.stMoshnost));
          img1220ADPhasirovkaReserve.Visible :=
            Boolean((Station.Rack1710.but1220AD = butPositionRight) and
          (Station.HalfSetB.Rack1600.stMoshnost));
          imgInd1230AMain.Visible :=
            Boolean(Station.Rack1710.but1230AD_2 = butPositionLeft);
          imgind1230AReserv.Visible :=
            not(Boolean(Station.Rack1710.but1230AD_2 = butPositionLeft));
          imgind1290Power.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.but1290Power = butPositionUp);

          imgInd1240G.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G2.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G3.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G4.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G5.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G6.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G7.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G8.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);

          imgInd1240V.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240V2.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240GReserve.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          img1240GReserve.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G1.Visible :=
          Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);

          if Station.IsPolukomplektATuned then
          begin
            if (Station.IsChannelBlocksTunedAt4ChannelMode()
                and Station.IsP321ShuntsConnectedAt4ChannelMode()
                and Station.IsP321ReadyToMeasure()) then
            begin
              imgInd1240V1_Line.Visible :=
                Boolean((Station.cbGenerator.stConnectedToPlaceId = 15)
                and (Station.cbInputYY.stConnectedToPlaceId = 184)
                or (Station.cbGenerator.stConnectedToPlaceId = 183)
                and (Station.cbInputYY.stConnectedToPlaceId = 16));
              imgInd1240V2_Line.Visible :=
                Boolean((Station.cbGenerator.stConnectedToPlaceId = 17)
                and (Station.cbInputYY.stConnectedToPlaceId = 186)
                or (Station.cbGenerator.stConnectedToPlaceId = 185)
                and (Station.cbInputYY.stConnectedToPlaceId = 18));
              InvalidateAll;
              Exit;
            end
            else
              HideLevel;
          end
          else
            HideLevel;
          if Station.IsPolukomplektBTuned then
          begin
            if (Station.IsChannelBlocksTunedAt2ChannelMode
              and Station.IsP321ShuntsConnectedAt2ChannelMode
              and Station.IsP321ReadyToMeasure)  then
            begin
              imgInd1240V1_Line.Visible :=
                Boolean((Station.cbGenerator.stConnectedToPlaceId = 16)
                  and (Station.cbInputYY.stConnectedToPlaceId = 184)
                  or (Station.cbGenerator.stConnectedToPlaceId = 184)
                  and (Station.cbInputYY.stConnectedToPlaceId = 16));
              imgInd1240V2_Line.Visible :=
              Boolean((Station.cbGenerator.stConnectedToPlaceId = 18)
              and (Station.cbInputYY.stConnectedToPlaceId = 186)
              or (Station.cbGenerator.stConnectedToPlaceId = 186)
              and (Station.cbInputYY.stConnectedToPlaceId = 18));
              InvalidateAll;
              Exit;
            end
            else
              HideLevel;
          end
          else
            HideLevel;
        end
        else
        begin
          imgInd1240G1.Visible := False;
          imgInd1240V.Visible := False;
          imgInd1240V2.Visible := False;

          imgind1220ADMain.Visible := False;
          imgind1220ADphasirovkaMain.Visible := False;
          imgInd1230AMain.Visible := False;
          imgind1220ADReserve.Visible := False;
          img1220ADPhasirovkaReserve.Visible := False;
          imgind1230AReserv.Visible := False;
          imgInd1240GReserve.Visible := False;
          img1240GReserve.Visible := False;

          imgind1290Power.Visible := False;
        end;
      end;
  end;

  InvalidateAll;
end;

procedure TRack1200LeftForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CheckFormBeforeClosing(CanClose);
end;

procedure TRack1200LeftForm.FormCreate(Sender: TObject);
begin
  MoveFormInScreenCenter(Self);
end;

procedure TRack1200LeftForm.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName,
      StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TRack1200LeftForm.img1240V2_4PDC_2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.imgbut1220ADMainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1220ADMain = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1220ADMain := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1220ADMain := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1220ADMain = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1220ADMain := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1220ADMain := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1220ADReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1220ADReserve = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1220ADReserve := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1220ADReserve := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1220ADReserve = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1220ADReserve := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1220ADReserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1230AMainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1230AMain = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1230AMain := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1230AMain := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1230AMain = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1230AMain := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1230AMain := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1230AReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1230AReserve = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1230AReserve := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1230AReserve := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1230AReserve = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1230AReserve := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1230AReserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240G1Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G1 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G1 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G1 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G1 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G1 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G1 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240G2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G2 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G2 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G2 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G2 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G2 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G2 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240G3Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G3 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G3 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G3 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G3 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G3 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G3 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240G4Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G4 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G4 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G4 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G4 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G4 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G4 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240G5Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G5 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G5 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G5 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G5 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G5 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G5 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240G6Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G6 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G6 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G6 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G6 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G6 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G6 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240G7Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G7 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G7 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G7 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G7 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G7 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G7 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240G1TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240G1Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G1Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240G1Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G1Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240G1Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G1Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G1Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G1Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G2TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240G2Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G2Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240G2Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G2Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240G2Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G2Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G2Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G2Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G3TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240G3Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G3Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240G3Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G3Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240G3Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G3Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G3Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G3Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G4ButPositionUpClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G4 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G4 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G4 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G4 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G4 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G4 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240G4TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240G4Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G4Tune, 1);
        if (Button = mbRight)
          and (Station.HalfSetA.Rack1200Left.sw1240G4Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G4Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240G4Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G4Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G4Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G4Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G5TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240G5Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G5Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240G5Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G5Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240G5Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G5Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G5Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G5Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G6TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240G6Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G6Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240G6Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G6Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240G6Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G6Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G6Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G6Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G7TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240G7Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G7Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240G7Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G7Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240G7Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G7Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G7Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G7Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G8TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.sw1240G8Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240G8Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240G8Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240G8Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.sw1240G8Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240G8Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240G8Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240G8Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240GMain2TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.sw1240GMain2Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240GMainTune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240GMain2Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240GMainTune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.sw1240GMain2Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240GMainTune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240GMain2Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240GMainTune, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240GMainTuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.sw1240GMainTune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240GMainTune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240GMainTune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240GMainTune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.sw1240GMainTune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240GMainTune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240GMainTune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240GMainTune, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240GPrmPrdTuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune, 1);
        if (Button = mbRight)
          and (Station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240GPrmPrdTune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune, 1);
        if (Button = mbRight)
          and (Station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240GPrmPrdTune, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240GTuneMouseDown(Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240GTune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240GTune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240GTune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240GTune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240GTune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240GTune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240GTune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240GTune, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240G_KClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G_PRDClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240G_ports:= stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240G_ports:= stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G_PRDMClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedIn;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240G_PRMClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240G_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240G_ports := stPluggedInCross;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240V2TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240V2Tune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240V2Tune, 1);
        if (Button = mbRight)
          and (Station.HalfSetA.Rack1200Left.sw1240V2Tune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240V2Tune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240V2Tune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240V2Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240V2Tune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240V2Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240V2_4PClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240V2_4PDCClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240V2_DC2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240V2_DCClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V2_4PDC_1_ports := stPluggedInCross;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240V2_KClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V2_4PDC_2_ports := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240VTuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.sw1240VTune < MaxTuneValue) then
          Inc(station.HalfSetA.Rack1200Left.sw1240VTune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.sw1240VTune > 1) then
          Dec(station.HalfSetA.Rack1200Left.sw1240VTune, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.sw1240VTune < MaxTuneValue) then
          Inc(station.HalfSetB.Rack1200Left.sw1240VTune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.sw1240VTune > 1) then
          Dec(station.HalfSetB.Rack1200Left.sw1240VTune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240V_4PClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.imgbut1240G8Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G8 = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G8 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G8 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G8 = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G8 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G8 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240GClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240G = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240G := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240G := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240G = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240G := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240G := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgBut1240GMain2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.But1240GMain2 = butPositionUp then
          Station.HalfSetA.Rack1200Left.But1240GMain2 := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.But1240GMain2 := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.But1240GMain2 = butPositionUp then
          Station.HalfSetB.Rack1200Left.But1240GMain2 := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.But1240GMain2 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgBut1240GMainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.But1240GMain = butPositionUp then
          Station.HalfSetA.Rack1200Left.But1240GMain := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.But1240GMain := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.But1240GMain = butPositionUp then
          Station.HalfSetB.Rack1200Left.But1240GMain := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.But1240GMain := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240GOneTwoClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240GOneTwo = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240GOneTwo := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240GOneTwo := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240GOneTwo = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240GOneTwo := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240GOneTwo := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240GPrmPrdClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240GPrmPrd = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240GPrmPrd := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240GPrmPrd := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240GPrmPrd = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240GPrmPrd := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240GPrmPrd := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbut1240KClick(Sender: TObject);
begin
case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240K = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1240K := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1240K := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240K = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1240K := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1240K := butPositionUp;
      end;
  end;

  Reload;
end;



procedure TRack1200LeftForm.imgbut1240V2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240V2 = butPositionLeft then
          Station.HalfSetA.Rack1200Left.but1240V2 := butPositionRight
        else
          Station.HalfSetA.Rack1200Left.but1240V2 := butPositionLeft;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240V2 = butPositionLeft then
          Station.HalfSetB.Rack1200Left.but1240V2 := butPositionRight
        else
          Station.HalfSetB.Rack1200Left.but1240V2 := butPositionLeft;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.imgbut1240VClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1240V = butPositionLeft then
          Station.HalfSetA.Rack1200Left.but1240V := butPositionRight
        else
          Station.HalfSetA.Rack1200Left.but1240V := butPositionLeft;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1240V = butPositionLeft then
          Station.HalfSetB.Rack1200Left.but1240V := butPositionRight
        else
          Station.HalfSetB.Rack1200Left.but1240V := butPositionLeft;
      end;

  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.imgBut1920PowerClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.but1290Power = butPositionUp then
          Station.HalfSetA.Rack1200Left.but1290Power := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.but1290Power := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.but1290Power = butPositionUp then
          Station.HalfSetB.Rack1200Left.but1290Power := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.but1290Power := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgbutChannelControlClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp then
          Station.HalfSetA.Rack1200Left.butChannelControl := butPositionDown
        else
          Station.HalfSetA.Rack1200Left.butChannelControl := butPositionUp;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp then
          Station.HalfSetB.Rack1200Left.butChannelControl := butPositionDown
        else
          Station.HalfSetB.Rack1200Left.butChannelControl := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgCableSinusOscillClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.CableSinusOscill = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Left.CableVhodPrm = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Left.CableVhodPrm = csConnectedAtPRM));
          SelectedCable := scSync;
        end
        else
        begin
          Station.HalfSetA.Rack1200Left.CableSinusOscill := csDisconected;
          Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
        end;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.CableSinusOscill = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Left.CableVhodPrm = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Left.CableVhodPrm = csConnectedAtPRM));
          SelectedCable := scSync;
        end
        else
        begin
          Station.HalfSetB.Rack1200Left.CableSinusOscill := csDisconected;
          Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
        end;
      end;
  end;

  imgSpawnSync.Invalidate;
  imgSpawnPRM.Invalidate;

  Reload;
end;

procedure TRack1200LeftForm.imgCableVhodPrmClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if Station.HalfSetA.Rack1200Left.CableVhodPrm = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Left.CableSinusOscill = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Left.CableSinusOscill = csConnectedAtPRM));
          SelectedCable := scPower;
        end
        else
        begin
          Station.HalfSetA.Rack1200Left.CableVhodPrm := csDisconected;
          Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;
        end;
      end;

    idRack1200B1:
      begin
        if Station.HalfSetB.Rack1200Left.CableVhodPrm = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Left.CableSinusOscill = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Left.CableSinusOscill = csConnectedAtPRM));
          SelectedCable := scPower;
        end
        else
        begin
          Station.HalfSetB.Rack1200Left.CableVhodPrm := csDisconected;
          Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;
        end;
      end;
  end;

  imgSpawnSync.Invalidate;
  imgSpawnPRM.Invalidate;

  Reload;
end;

procedure TRack1200LeftForm.imgJmpToLeft6Click(Sender: TObject);
begin
  //Запрещаем делать переходы в левую стойку в режиме обучения
//  if Station.WorkType = wtLearn then Exit;
//
//  case CurFormId of
//    idRack1200A1:
//      begin
//
//      end;
//    idRack1200B1:
//      begin
//        JmpFormId := idRack1200B1;
//        Close;
//      end;
//  end;
end;

procedure TRack1200LeftForm.imgJmpToRight6Click(Sender: TObject);
begin
  //Запрещаем делать переходы в правую стойку в режиме обучения
//  if Station.WorkType = wtLearn then Exit;
//
//  case CurFormId of
//    idRack1200B1:
//      begin
//        JmpFormId := idRack1200B1;
//        Close;
//      end;
//    idRack1200A1:
//      begin
//        JmpFormId := idRack1200A1;
//        Close;
//      end;
//  end;
end;

procedure TRack1200LeftForm.imgSpawnPRMClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if SelectedCable = scSync then
        begin
          Station.HalfSetA.Rack1200Left.CableSinusOscill := csConnectedAtPRM;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200A1PRM;
        end;
        if SelectedCable = scPower then
        begin
          Station.HalfSetA.Rack1200Left.CableVhodPrm := csConnectedAtPRM;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200A1PRM;
        end;
      end;

    idRack1200B1:
      begin
        if SelectedCable = scSync then
        begin
          Station.HalfSetB.Rack1200Left.CableSinusOscill := csConnectedAtPRM;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200B1PRM;
        end;
        if SelectedCable = scPower then
        begin
          Station.HalfSetB.Rack1200Left.CableVhodPrm := csConnectedAtPRM;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200B1PRM;
        end;
      end;
  end;

  imgSpawnPRM.Visible := False;
  imgSpawnSync.Visible := False;

  Reload;
end;

procedure TRack1200LeftForm.imgSpawnSyncClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if SelectedCable = scSync then
        begin
          Station.HalfSetA.Rack1200Left.CableSinusOscill := csConnectedAtSync;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200A1Sync;
        end;
        if SelectedCable = scPower then
        begin
          Station.HalfSetA.Rack1200Left.CableVhodPrm := csConnectedAtSync;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200A1Sync;
        end;
      end;

    idRack1200B1:
      begin
        if SelectedCable = scSync then
        begin
          Station.HalfSetB.Rack1200Left.CableSinusOscill := csConnectedAtSync;
          Station.Oscillograph.cblCabelSyncConnectedTo := csConnectedTo1200B1Sync;
        end;
        if SelectedCable = scPower then
        begin
          Station.HalfSetB.Rack1200Left.CableVhodPrm := csConnectedAtSync;
          Station.Oscillograph.cblCableUsilitelConnectedTo := csConnectedTo1200B1Sync;
        end;
      end;
  end;

  imgSpawnPRM.Visible := False;
  imgSpawnSync.Visible := False;

  Reload;
end;

procedure TRack1200LeftForm.imgSw1240KMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.Sw1240K < 5) then
          Inc(Station.HalfSetA.Rack1200Left.Sw1240K, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.Sw1240K > 1) then
          Dec(Station.HalfSetA.Rack1200Left.Sw1240K, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.Sw1240K < 5) then
          Inc(Station.HalfSetB.Rack1200Left.Sw1240K, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.Sw1240K > 1) then
          Dec(Station.HalfSetB.Rack1200Left.Sw1240K, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgSw1240V2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.Sw1240V2 < 4) then
          Inc(Station.HalfSetA.Rack1200Left.Sw1240V2, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.Sw1240V2 > 1) then
          Dec(Station.HalfSetA.Rack1200Left.Sw1240V2, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.Sw1240V2 < 4) then
          Inc(Station.HalfSetB.Rack1200Left.Sw1240V2, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.Sw1240V2 > 1) then
          Dec(Station.HalfSetB.Rack1200Left.Sw1240V2, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.imgSw1240VMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.Sw1240V < 4) then
          Inc(Station.HalfSetA.Rack1200Left.Sw1240V, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.Sw1240V > 1) then
          Dec(Station.HalfSetA.Rack1200Left.Sw1240V, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.Sw1240V < 4) then
          Inc(Station.HalfSetB.Rack1200Left.Sw1240V, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.Sw1240V > 1) then
          Dec(Station.HalfSetB.Rack1200Left.Sw1240V, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.imgSw1290MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.Sw1290 < 10) then
          Inc(Station.HalfSetA.Rack1200Left.Sw1290, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.Sw1290 > 1) then
          Dec(Station.HalfSetA.Rack1200Left.Sw1290, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.Sw1290 < 10) then
          Inc(Station.HalfSetB.Rack1200Left.Sw1290, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.Sw1290 > 1) then
          Dec(Station.HalfSetB.Rack1200Left.Sw1290, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgSwNumberOfStantionMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Left.SwNumberOfStantion < 7) then
          Inc(Station.HalfSetA.Rack1200Left.SwNumberOfStantion, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Left.SwNumberOfStantion > 1) then
          Dec(Station.HalfSetA.Rack1200Left.SwNumberOfStantion, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Left.SwNumberOfStantion < 7) then
          Inc(Station.HalfSetB.Rack1200Left.SwNumberOfStantion, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Left.SwNumberOfStantion > 1) then
          Dec(Station.HalfSetB.Rack1200Left.SwNumberOfStantion, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.imgSwNumberOfUchastokMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Left.SwNumberOfUchastok < 7) then
          Inc(Station.HalfSetA.Rack1200Left.SwNumberOfUchastok, 1);
        if (Button = mbRight)
          and (Station.HalfSetA.Rack1200Left.SwNumberOfUchastok > 1) then
          Dec(Station.HalfSetA.Rack1200Left.SwNumberOfUchastok, 1);
      end;

    idRack1200B1:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Left.SwNumberOfUchastok < 7) then
          Inc(Station.HalfSetB.Rack1200Left.SwNumberOfUchastok, 1);
        if (Button = mbRight)
          and (Station.HalfSetB.Rack1200Left.SwNumberOfUchastok > 1) then
          Dec(Station.HalfSetB.Rack1200Left.SwNumberOfUchastok, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1200LeftForm.FormShow(Sender: TObject);
begin
  Reload;
end;


procedure TRack1200LeftForm.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TRack1200LeftForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TRack1200LeftForm.img1240V_DC2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedInCross;
      end;
  end;

  Reload;
end;

procedure TRack1200LeftForm.img1240_VKDCClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V1_4PDC_2_ports := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200LeftForm.img1240V_4PDCClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A1:
      begin
        Station.HalfSetA.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
      end;

    idRack1200B1:
      begin
        Station.HalfSetB.Rack1200Left.st1240V1_4PDC_1_ports := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

end.
