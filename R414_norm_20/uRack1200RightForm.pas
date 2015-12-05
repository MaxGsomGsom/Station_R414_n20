unit uRack1200RightForm;

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
  ExtCtrls,
  jpeg,
  ImgList,
  pngimage,
  StdCtrls,
  uAdditionalFormMethods,
  uConstantsDM,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm,
  uRackP321MinForm;

type
  TRack1200RightForm = class(TForm)
    Panel1: TPanel;
    imgBG1: TImage;
    Panel2: TPanel;
    img1270MainButPosition: TImage;
    imgBut1270Main: TImage;
    img1220AMMainButPositionUp: TImage;
    imgBut1220AMMain: TImage;
    img1230AMainButPositionUp: TImage;
    imgBut1230AMain: TImage;
    img1210AMainButPositionUp: TImage;
    imgBut1210AMain: TImage;
    img1210ARetrMainButPositionUp: TImage;
    imgbut1210ARetrMain: TImage;
    imgInd1270Main: TImage;
    imgInd1220AMMain: TImage;
    imgInd1210AMain: TImage;
    imgInd1230AMain: TImage;
    Panel3: TPanel;
    img1270ReserveButPositionUp: TImage;
    imgBut1270Reserve: TImage;
    img1220AMReserveButPositionUp: TImage;
    imgBut1220AMReserve: TImage;
    img1230AReserveButPositionUp: TImage;
    imgBut1230AReserve: TImage;
    img1210AReserveButPositionUp: TImage;
    imgBut1210AReserve: TImage;
    img1210ARetrReserveButPositionUp: TImage;
    imgbut1210ARetrReserve: TImage;
    imgInd1270Reserve: TImage;
    Image133: TImage;
    imgInd1230AReserve: TImage;
    imgInd1210AReserve: TImage;
    imgInd1220AMReserve: TImage;
    Panel4: TPanel;
    imgBut1240VButPositionLeft: TImage;
    imgBut1240V: TImage;
    imgBut1240V2ButPositionLeft: TImage;
    imgBut1240V2: TImage;
    imgBut1240V3ButPositionLeft: TImage;
    imgBut1240V3: TImage;
    imgBut1240GButPositionUp: TImage;
    imgBut1240G: TImage;
    Panel5: TPanel;
    imgBG4: TImage;
    imgBut1240G1PositionUp: TImage;
    imgBut1240G1: TImage;
    imgBut1240G2PositionUp: TImage;
    imgBut1240G2: TImage;
    imgBut1240G3PositionUp: TImage;
    imgBut1240G3: TImage;
    imgBut1240G4PositionUp: TImage;
    imgBut1240G4: TImage;
    Panel6: TPanel;
    imgBG5: TImage;
    imgBut1240G5PositionUp: TImage;
    imgBut1240G5: TImage;
    imgBut1240G6PositionUp: TImage;
    imgBut1240G6: TImage;
    imgBut1240G7PositionUp: TImage;
    imgBut1240G7: TImage;
    imgBut1240G8PositionUp: TImage;
    imgBut1240G8: TImage;
    Panel7: TPanel;
    imgBG6: TImage;
    imgInd1290Power: TImage;
    imgBut1290PowerPositionUp: TImage;
    imgBut1290Power: TImage;
    img1290SwPower: TImage;
    imgBG2: TImage;
    imgSw1240V: TImage;
    imgSw1240V2: TImage;
    imgSw1240V3: TImage;
    img1240V_Zaglushka_4P: TImage;
    img1240V_Zaglushka_DC: TImage;
    img1240V_Zaglushka_Combine: TImage;
    img1240V_Zaglushka_K: TImage;
    Image29: TImage;
    img1240V_Zaglushka_Combine2: TImage;
    img1240V_Zaglushka_DC2: TImage;
    img1240V2_Zaglushka_4P: TImage;
    img1240V2_Zaglushka_Combine: TImage;
    img1240V2_Zaglushka_DC: TImage;
    Image36: TImage;
    img1240V2_Zaglushka_K: TImage;
    img1240V2_Zaglushka_Combine2: TImage;
    img1240V2_Zaglushka_DC2: TImage;
    img1240V3_Zaglushka_4P: TImage;
    img1240V3_Zaglushka_Combine: TImage;
    img1240V3_Zaglushka_DC: TImage;
    img1240V3_Zaglushka_K: TImage;
    img1240V3_Zaglushka_Combine2: TImage;
    img1240V3_Zaglushka_DC2: TImage;
    imgInd1240GControl: TImage;
    imgInd1240G4: TImage;
    imgInd1240G3: TImage;
    imgInd1240G2: TImage;
    imgInd1240G1: TImage;
    imgInd1240G8: TImage;
    imgInd1240G7: TImage;
    imgInd1240G6: TImage;
    imgInd1240G5: TImage;
    img1220AMMainPhasirovka: TImage;
    img1210AMainPhasirovka: TImage;
    img1220AMReservePhasirovka: TImage;
    img1210AReservePhasirovka: TImage;
    imgInd1240VControl: TImage;
    imgInd1240VControl2: TImage;
    imgInd1240VControl3: TImage;
    imgCableOscillographSync: TImage;
    imgCableUzlovoiInput: TImage;
    Image68: TImage;
    Label7: TLabel;
    imgInd1240VLevel: TImage;
    imgInd1240VLevel2: TImage;
    imgInd1240VLevel3: TImage;
    imgBG3: TImage;
    ilSw1240V: TImageList;
    il1290SwPower: TImageList;
    img1240GTune: TImage;
    img1240V3Tune: TImage;
    img1240V2Tune: TImage;
    img1240VTune: TImage;
    img1240G1Tune: TImage;
    img1240G2Tune: TImage;
    img1240G3Tune: TImage;
    img1240G4Tune: TImage;
    img1240G5Tune: TImage;
    img1240G6Tune: TImage;
    img1240G7Tune: TImage;
    img1240G8Tune: TImage;
    ilTune: TImageList;
    imgSpawnPRD: TImage;
    imgSpawnSync: TImage;
    imgSpawnPRM: TImage;
    imgInd1240V1_Line: TImage;
    imgInd1240V2_Line: TImage;
    imgInd1240V3_Line: TImage;
    Image1: TImage;
    img1270Reserve: TImage;
    imgJmpToLeft: TImage;
    imgJmpToLeft2: TImage;
    imgJmpToLeft3: TImage;
    imgJmpToLeft4: TImage;
    imgJmpToLeft5: TImage;
    imgJmpToLeft6: TImage;
    imgJmpToRight6: TImage;
    imgJmpToRight5: TImage;
    imgJmpToRight4: TImage;
    imgJmpToRight3: TImage;
    imgJmpToRight2: TImage;
    imgJmpToRight: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Reload;
    procedure ShowOscill;
    procedure imgBut1270MainClick(Sender: TObject);
    procedure imgBut1220AMMainClick(Sender: TObject);
    procedure imgBut1230AMainClick(Sender: TObject);
    procedure imgBut1210AMainClick(Sender: TObject);
    procedure imgbut1210ARetrMainClick(Sender: TObject);
    procedure imgBut1220AMReserveClick(Sender: TObject);
    procedure imgBut1230AReserveClick(Sender: TObject);
    procedure imgBut1210AReserveClick(Sender: TObject);
    procedure imgbut1210ARetrReserveClick(Sender: TObject);
    procedure imgBut1240VClick(Sender: TObject);
    procedure imgBut1240V2Click(Sender: TObject);
    procedure imgBut1240V3Click(Sender: TObject);
    procedure imgBut1240GClick(Sender: TObject);
    procedure imgSw1240VMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSw1240V2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSw1240V3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgBut1240G1Click(Sender: TObject);
    procedure imgBut1240G2Click(Sender: TObject);
    procedure imgBut1240G3Click(Sender: TObject);
    procedure imgBut1240G4Click(Sender: TObject);
    procedure imgBut1240G5Click(Sender: TObject);
    procedure imgBut1240G6Click(Sender: TObject);
    procedure imgBut1240G7Click(Sender: TObject);
    procedure imgBut1240G8Click(Sender: TObject);
    procedure imgBut1290PowerClick(Sender: TObject);
    procedure img1290SwPowerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240V_Zaglushka_4PMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V2_Zaglushka_4PMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V3_Zaglushka_4PMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V_Zaglushka_CombineMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V2_Zaglushka_CombineMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V3_Zaglushka_CombineMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V_Zaglushka_KMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V2_Zaglushka_KMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V3_Zaglushka_KMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V_Zaglushka_Combine2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V2_Zaglushka_Combine2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240V3_Zaglushka_Combine2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure img1240VTuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240V2TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240V3TuneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1240GTuneMouseDown(Sender: TObject; Button: TMouseButton;
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
    procedure imgCableOscillographSyncClick(Sender: TObject);
    procedure imgCableUzlovoiInputClick(Sender: TObject);
    procedure imgSpawnPRDClick(Sender: TObject);
    procedure imgSpawnSyncClick(Sender: TObject);
    procedure imgSpawnPRMClick(Sender: TObject);
    procedure img1270ReserveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgJmpToLeft6Click(Sender: TObject);
    procedure imgJmpToRightClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure img1240VTuneClick(Sender: TObject);
    procedure img1240V2TuneClick(Sender: TObject);


  private
    { Private declarations }
    procedure SetCableUzlovoiInputState(btStateCode: Byte);
    procedure SetCableOscillographSyncState(btStateCode: Byte);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Half: Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;


const
  scCableSync = 1;
  scCableUzlovoi = 2;

var
  //Rack1200RightForm: TRack1200RightForm;
  SelectedCable: Byte;
  CurFormId: Integer;
    ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;
  P321Mini: TRackP321MinForm;

  const
  idRack1200A2=1;
  idRack1200B2=2;


  end;

implementation

uses
  uStationR414Form,
  uBlockOscillographMinForm,
  uEducationForm,
  uBlockOscillographForm,
  uRack1200LeftForm,
  uBlockRemoteControllerForm,
  uRackP321Form,
  uP321DisplayForm;

{$R *.dfm}

constructor TRack1200RightForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  //idRack1200A2:=1;
  //idRack1200B2:=2;
  CurFormId:=Half;
  SelectedCable:= NotSelected;
      if (Half=1) then begin Self.Caption:='1200 ПРД А'; end
  else Self.Caption:='1200 ПРД Б';
      Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;


    if (TaskController.NetWorker.ClientState.TaskID = ttTransferToTerminalMode) then
  begin
       P321Mini:= TRackP321MinForm.Create(Self, Station, TaskController);
       P321Mini.Show;
  end;


end;

procedure TRack1200RightForm.Reload;

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
    imgInd1240V3_Line.Visible := False;
  end;



  procedure InvalidateAll;
  begin
    img1270ReserveButPositionUp.Invalidate;
    img1270MainButPosition.Invalidate;
    img1270ReserveButPositionUp.Invalidate;
    img1220AMMainButPositionUp.Invalidate;
    img1220AMReserveButPositionUp.Invalidate;
    img1230AMainButPositionUp.Invalidate;
    img1230AReserveButPositionUp.Invalidate;
    img1210AMainButPositionUp.Invalidate;
    img1210AReserveButPositionUp.Invalidate;
    imgBut1240VButPositionLeft.Invalidate;
    imgBut1240V2ButPositionLeft.Invalidate;
    imgBut1240V3ButPositionLeft.Invalidate;
    img1240V_Zaglushka_4P.Invalidate;
    img1240V_Zaglushka_DC.Invalidate;
    img1240V_Zaglushka_Combine.Invalidate;
    img1240V_Zaglushka_K.Invalidate;
    img1240V_Zaglushka_DC2.Invalidate;
    img1240V_Zaglushka_Combine2.Invalidate;
    img1240V2_Zaglushka_4P.Invalidate;
    img1240V2_Zaglushka_DC.Invalidate;
    img1240V2_Zaglushka_Combine.Invalidate;
    img1240V2_Zaglushka_K.Invalidate;
    img1240V2_Zaglushka_DC2.Invalidate;
    img1240V2_Zaglushka_Combine2.Invalidate;
    img1240V3_Zaglushka_4P.Invalidate;
    img1240V3_Zaglushka_DC.Invalidate;
    img1240V3_Zaglushka_Combine.Invalidate;
    img1240V3_Zaglushka_K.Invalidate;
    img1240V3_Zaglushka_DC2.Invalidate;
    img1240V3_Zaglushka_Combine2.Invalidate;
    imgBut1240GButPositionUp.Invalidate;
    imgBut1240G1PositionUp.Invalidate;
    imgBut1240G2PositionUp.Invalidate;
    imgBut1240G3PositionUp.Invalidate;
    imgBut1240G4PositionUp.Invalidate;
    imgBut1240G5PositionUp.Invalidate;
    imgBut1240G6PositionUp.Invalidate;
    imgBut1240G7PositionUp.Invalidate;
    imgBut1240G8PositionUp.Invalidate;
    imgBut1290PowerPositionUp.Invalidate;
    img1210ARetrMainButPositionUp.Invalidate;
    img1210ARetrReserveButPositionUp.Invalidate;

    img1240VTune.Invalidate;
    img1240V2Tune.Invalidate;
    img1240V3Tune.Invalidate;
    img1240GTune.Invalidate;
    img1240G1Tune.Invalidate;
    img1240G2Tune.Invalidate;
    img1240G3Tune.Invalidate;
    img1240G4Tune.Invalidate;
    img1240G5Tune.Invalidate;
    img1240G6Tune.Invalidate;
    img1240G7Tune.Invalidate;
    img1240G8Tune.Invalidate;

    img1290SwPower.Invalidate;
    imgSw1240V.Invalidate;
    imgSw1240V2.Invalidate;
    imgSw1240V3.Invalidate;

    //--------Индикаторы----------
    imgInd1220AMMain.Invalidate;
    imgInd1220AMReserve.Invalidate;
    imgInd1230AMain.Invalidate;
    imgInd1230AReserve.Invalidate;
    imgInd1210AMain.Invalidate;
    imgInd1210AReserve.Invalidate;
    imgInd1270Main.Invalidate;
    imgInd1270Reserve.Invalidate;
    imgInd1290Power.Invalidate;

    imgInd1240VControl.Invalidate;
    imgInd1240VControl2.Invalidate;
    imgInd1240VControl3.Invalidate;
    imgInd1240GControl.Invalidate;
    imgInd1240G1.Invalidate;
    imgInd1240G2.Invalidate;
    imgInd1240G3.Invalidate;
    imgInd1240G4.Invalidate;
    imgInd1240G5.Invalidate;
    imgInd1240G6.Invalidate;
    imgInd1240G7.Invalidate;
    imgInd1240G8.Invalidate;
  end;

begin

  if  (P321Mini <> nil) then P321Mini.UpdP321;

  case CurFormId of
    idRack1200A2:
      begin
        if (Station.Oscillograph.cblCabelSyncConnectedTo =
          csConnectedTo1200A2PRM)
          or (Station.Oscillograph.cblCabelSyncConnectedTo
            = csConnectedTo1200A2Sync) then
        begin
          imgCableOscillographSync.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCabelSyncConnectedTo = csDisconected then
            imgCableOscillographSync.Visible := True
          else
            imgCableOscillographSync.Visible := False;
        end;

        if (Station.Oscillograph.cblCableUsilitelConnectedTo =
          csConnectedTo1200A2PRM)
          or (Station.Oscillograph.cblCableUsilitelConnectedTo
            = csConnectedTo1200A2Sync)
          or (Station.Oscillograph.cblCableUsilitelConnectedTo
            = csConnectedTo1200A2PRD) then
        begin
          imgCableUzlovoiInput.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCableUsilitelConnectedTo =
            csDisconected then
            imgCableUzlovoiInput.Visible := True
          else
            imgCableUzlovoiInput.Visible := False;
        end;

        SetCableUzlovoiInputState(Station.HalfSetA.Rack1200Right.CableUzlovoiInput);
        SetCableOscillographSyncState(Station.HalfSetA.Rack1200Right.CableOscillographLineInput);

        img1270MainButPosition.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1270Main = butPositionUp);
        img1270ReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1270Reserve = butPositionUp);
        img1220AMMainButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1220AMMain = butPositionUp);
        img1220AMReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1220AMReserve = butPositionUp);
        img1230AMainButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1230AMain = butPositionUp);
        img1230AReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1230AReserve = butPositionUp);
        img1210AMainButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1210AMain = butPositionUp);
        img1210AReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1210AReserve = butPositionUp);
        imgBut1240VButPositionLeft.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240V = butPositionLeft);
        imgBut1240V2ButPositionLeft.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240V2 = butPositionLeft);
        imgBut1240V3ButPositionLeft.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240V3 = butPositionLeft);
        img1240V_Zaglushka_4P.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedIn);
        img1240V_Zaglushka_DC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedIn);
        img1240V_Zaglushka_Combine.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedInCross);
        img1240V_Zaglushka_K.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedIn);
        img1240V_Zaglushka_DC2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedIn);
        img1240V_Zaglushka_Combine2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedInCross);
        img1240V2_Zaglushka_4P.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedIn);
        img1240V2_Zaglushka_DC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedIn);
        img1240V2_Zaglushka_Combine.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedInCross);
        img1240V2_Zaglushka_K.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedIn);
        img1240V2_Zaglushka_DC2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedIn);
        img1240V2_Zaglushka_Combine2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedInCross);
        img1240V3_Zaglushka_4P.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedIn);
        img1240V3_Zaglushka_DC.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedIn);
        img1240V3_Zaglushka_Combine.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedInCross);
        img1240V3_Zaglushka_K.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedIn);
        img1240V3_Zaglushka_DC2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedIn);
        img1240V3_Zaglushka_Combine2.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedInCross);
        imgBut1240GButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G = butPositionUp);
        imgBut1240G1PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G1 = butPositionUp);
        imgBut1240G2PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G2 = butPositionUp);
        imgBut1240G3PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G3 = butPositionUp);
        imgBut1240G4PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G4 = butPositionUp);
        imgBut1240G5PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G5 = butPositionUp);
        imgBut1240G6PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G6 = butPositionUp);
        imgBut1240G7PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G7 = butPositionUp);
        imgBut1240G8PositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1240G8 = butPositionUp);
        imgBut1290PowerPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.But1290Power = butPositionUp);
        img1210ARetrMainButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.but1210ARetrMain = butPositionUp);
        img1210ARetrReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetA.Rack1200Right.but1210ARetrReserve = butPositionUp);

        ilSw1240V.GetBitmap(Station.HalfSetA.Rack1200Right.Sw1240V - 1,
          imgSw1240V.Picture.Bitmap);
        ilSw1240V.GetBitmap(Station.HalfSetA.Rack1200Right.Sw1240V2 - 1,
          imgSw1240V2.Picture.Bitmap);
        ilSw1240V.GetBitmap(Station.HalfSetA.Rack1200Right.Sw1240V3 - 1,
          imgSw1240V3.Picture.Bitmap);
        il1290SwPower.GetBitmap(Station.HalfSetA.Rack1200Right.sw1290Power - 1,
          img1290SwPower.Picture.Bitmap);

        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240V1Tune),
          img1240VTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.Sw1240V2Tune),
          img1240V2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.Sw1240V3Tune),
          img1240V3Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240GTune),
          img1240GTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G1Tune),
          img1240G1Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G2Tune),
          img1240G2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G3Tune),
          img1240G3Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G4Tune),
          img1240G4Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G5Tune),
          img1240G5Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G6Tune),
          img1240G6Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G7Tune),
          img1240G7Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetA.Rack1200Right.sw1240G8Tune),
          img1240G8Tune.Picture.Bitmap);

        if (Station.IsPluggedIn) and (Station.PowerPanel.sw1200Power  = 1) then
        begin
          //----------------Световые индикаторы---------------
          imgInd1220AMMain.Visible :=
            Boolean(Station.Rack1710.but1220AM = butPositionLeft);
          imgInd1220AMReserve.Visible :=
            Boolean(Station.Rack1710.but1220AM = butPositionRight);
          imgInd1230AMain.Visible :=
            Boolean(Station.Rack1710.but1230AM = butPositionLeft);
          imgInd1230AReserve.Visible :=
            Boolean(Station.Rack1710.but1230AM = butPositionRight);
          imgInd1210AMain.Visible :=
            Boolean(Station.Rack1710.but1210A = butPositionLeft);
          imgInd1210AReserve.Visible :=
            Boolean(Station.Rack1710.but1210A = butPositionRight);
          imgInd1270Main.Visible :=
            Boolean(Station.Rack1710.but1270 = butPositionLeft);
          imgInd1270Reserve.Visible :=
            Boolean(Station.Rack1710.but1270 = butPositionRight);
          imgInd1290Power.Visible :=
            Boolean(Station.HalfSetA.Rack1200Right.But1290Power = butPositionUp);
          img1220AMMainPhasirovka.Visible :=
            Boolean((Station.Rack1710.but1220AM = butPositionLeft)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetB.Rack1920.stLBV2_TurnedOn));
          img1210AMainPhasirovka.Visible :=
            Boolean((Station.Rack1710.but1210A = butPositionLeft)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetB.Rack1920.stLBV2_TurnedOn));
          img1220AMReservePhasirovka.Visible :=
            Boolean((Station.Rack1710.but1220AM = butPositionRight)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetB.Rack1920.stLBV2_TurnedOn));
          img1210AReservePhasirovka.Visible :=
            Boolean((Station.Rack1710.but1210A = butPositionRight)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetB.Rack1920.stLBV2_TurnedOn));

          imgInd1240VControl.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240VControl2.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240VControl3.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240GControl.Visible :=
            Boolean(Station.HalfSetB.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G1.Visible :=
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
        end
        else
        begin
          imgInd1240VControl.Visible := False;
          imgInd1240VControl2.Visible := False;
          imgInd1240VControl3.Visible := False;
          imgInd1240GControl.Visible := False;
          imgInd1240G1.Visible := False;
          imgInd1240G2.Visible := False;
          imgInd1240G3.Visible := False;
          imgInd1240G4.Visible := False;
          imgInd1240G5.Visible := False;
          imgInd1240G6.Visible := False;
          imgInd1240G7.Visible := False;
          imgInd1240G8.Visible := False;

          //----------------Световые индикаторы---------------
          imgInd1220AMMain.Visible := False;
          imgInd1220AMReserve.Visible := False;
          imgInd1230AMain.Visible := False;
          imgInd1230AReserve.Visible := False;
          imgInd1210AMain.Visible := False;
          imgInd1210AReserve.Visible := False;
          imgInd1270Main.Visible := False;
          imgInd1270Reserve.Visible := False;
          imgInd1290Power.Visible := False;
          img1220AMMainPhasirovka.Visible := False;
          img1210AMainPhasirovka.Visible := False;
          img1220AMReservePhasirovka.Visible := False;
          img1210AReservePhasirovka.Visible := False;
        end;

        if Station.IsPolukomplektATuned then
        begin
          if (Station.IsChannelBlocksTunedAt4ChannelMode()
              and Station.IsP321ShuntsConnectedAt4ChannelMode()
              and Station.IsP321ReadyToMeasure )  then
          begin
            imgInd1240V1_Line.Visible :=
              Boolean(
              ((Station.CableBlack1.stKonez1.stKonez = 19) or (Station.CableBlack1.stKonez2.stKonez = 19))
              and ((Station.CableWhite2.stKonez1.stKonez = 188) or (Station.CableWhite2.stKonez2.stKonez = 188))
              or ((Station.CableBlack1.stKonez1.stKonez = 187) or (Station.CableBlack1.stKonez2.stKonez = 187))
              and ((Station.CableWhite2.stKonez1.stKonez = 20) or (Station.CableWhite2.stKonez2.stKonez = 20)));
            imgInd1240V2_Line.Visible := Boolean(
              ((Station.CableBlack1.stKonez1.stKonez = 21) or (Station.CableBlack1.stKonez2.stKonez = 21))
              and ((Station.CableWhite2.stKonez1.stKonez = 190) or (Station.CableWhite2.stKonez2.stKonez = 190))
              or ((Station.CableBlack1.stKonez1.stKonez = 189) or (Station.CableBlack1.stKonez2.stKonez = 189))
              and ((Station.CableWhite2.stKonez1.stKonez = 22) or (Station.CableWhite2.stKonez2.stKonez = 22)));
            imgInd1240V3_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 23) or (Station.CableBlack1.stKonez2.stKonez = 23))
              and ((Station.CableWhite2.stKonez1.stKonez = 192) or (Station.CableWhite2.stKonez2.stKonez = 192))
              or ((Station.CableBlack1.stKonez1.stKonez = 191) or (Station.CableBlack1.stKonez2.stKonez = 191))
              and ((Station.CableWhite2.stKonez1.stKonez = 24) or (Station.CableWhite2.stKonez2.stKonez = 24)));
            InvalidateAll;
            Exit;
          end
          else
            HideLevel;
          if (Station.IsChannelBlocksTunedAt2ChannelMode
            and Station.IsP321ShuntsConnectedAt2ChannelMode
            and Station.IsP321ReadyToMeasure) then
          begin
            imgInd1240V1_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 20) or (Station.CableBlack1.stKonez2.stKonez = 20))
              and ((Station.CableWhite2.stKonez1.stKonez = 188) or (Station.CableWhite2.stKonez2.stKonez = 188))
              or ((Station.CableBlack1.stKonez1.stKonez = 188) or (Station.CableBlack1.stKonez2.stKonez = 188))
              and ((Station.CableWhite2.stKonez1.stKonez = 20) or (Station.CableWhite2.stKonez2.stKonez = 20)));
            imgInd1240V2_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 21) or (Station.CableBlack1.stKonez2.stKonez = 21))
              and ((Station.CableWhite2.stKonez1.stKonez = 190) or (Station.CableWhite2.stKonez2.stKonez = 190))
              or ((Station.CableBlack1.stKonez1.stKonez = 190) or (Station.CableBlack1.stKonez2.stKonez = 190))
              and ((Station.CableWhite2.stKonez1.stKonez = 22) or (Station.CableWhite2.stKonez2.stKonez = 22)));
            imgInd1240V3_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 23) or (Station.CableBlack1.stKonez2.stKonez = 23))
              and ((Station.CableWhite2.stKonez1.stKonez = 192) or (Station.CableWhite2.stKonez2.stKonez = 192))
              or ((Station.CableBlack1.stKonez1.stKonez = 192) or (Station.CableBlack1.stKonez2.stKonez = 192))
              and ((Station.CableWhite2.stKonez1.stKonez = 24) or (Station.CableWhite2.stKonez2.stKonez = 24)));
            InvalidateAll;
            Exit;
          end
          else
            HideLevel;            
        end
        else
          HideLevel;
      end;

    idRack1200B2:
      begin
        if (Station.Oscillograph.cblCabelSyncConnectedTo
            = csConnectedTo1200B2PRM)
          or (Station.Oscillograph.cblCabelSyncConnectedTo
            = csConnectedTo1200B2Sync) then
        begin
          imgCableOscillographSync.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCabelSyncConnectedTo = csDisconected then
            imgCableOscillographSync.Visible := True
          else
            imgCableOscillographSync.Visible := False;
        end;

        if (Station.Oscillograph.cblCableUsilitelConnectedTo
            = csConnectedTo1200B2PRM)
          or (Station.Oscillograph.cblCableUsilitelConnectedTo
            = csConnectedTo1200B2Sync)
          or (Station.Oscillograph.cblCableUsilitelConnectedTo
            = csConnectedTo1200B2PRD) then
        begin
          imgCableUzlovoiInput.Visible := True;
        end
        else
        begin
          if Station.Oscillograph.cblCableUsilitelConnectedTo
            = csDisconected then
            imgCableUzlovoiInput.Visible := True
          else
            imgCableUzlovoiInput.Visible := False;
        end;

        SetCableUzlovoiInputState(Station.HalfSetB.Rack1200Right.CableUzlovoiInput);
        SetCableOscillographSyncState(Station.HalfSetB.Rack1200Right.CableOscillographLineInput);

        img1270MainButPosition.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1270Main = butPositionUp);
        img1270ReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1270Reserve = butPositionUp);
        img1220AMMainButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1220AMMain = butPositionUp);
        img1220AMReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1220AMReserve = butPositionUp);
        img1230AMainButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1230AMain = butPositionUp);
        img1230AReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1230AReserve = butPositionUp);
        img1210AMainButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1210AMain = butPositionUp);
        img1210AReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1210AReserve = butPositionUp);
        imgBut1240VButPositionLeft.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240V = butPositionLeft);
        imgBut1240V2ButPositionLeft.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240V2 = butPositionLeft);
        imgBut1240V3ButPositionLeft.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240V3 = butPositionLeft);
        img1240V_Zaglushka_4P.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedIn);
        img1240V_Zaglushka_DC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedIn);
        img1240V_Zaglushka_Combine.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC = stPluggedInCross);
        img1240V_Zaglushka_K.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedIn);
        img1240V_Zaglushka_DC2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedIn);
        img1240V_Zaglushka_Combine2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC = stPluggedInCross);
        img1240V2_Zaglushka_4P.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedIn);
        img1240V2_Zaglushka_DC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedIn);
        img1240V2_Zaglushka_Combine.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC = stPluggedInCross);
        img1240V2_Zaglushka_K.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedIn);
        img1240V2_Zaglushka_DC2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedIn);
        img1240V2_Zaglushka_Combine2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC = stPluggedInCross);
        img1240V3_Zaglushka_4P.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedIn);
        img1240V3_Zaglushka_DC.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedIn);
        img1240V3_Zaglushka_Combine.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC = stPluggedInCross);
        img1240V3_Zaglushka_K.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedIn);
        img1240V3_Zaglushka_DC2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedIn);
        img1240V3_Zaglushka_Combine2.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC = stPluggedInCross);
        imgBut1240GButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G = butPositionUp);
        imgBut1240G1PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G1 = butPositionUp);
        imgBut1240G2PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G2 = butPositionUp);
        imgBut1240G3PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G3 = butPositionUp);
        imgBut1240G4PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G4 = butPositionUp);
        imgBut1240G5PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G5 = butPositionUp);
        imgBut1240G6PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G6 = butPositionUp);
        imgBut1240G7PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G7 = butPositionUp);
        imgBut1240G8PositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1240G8 = butPositionUp);
        imgBut1290PowerPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.But1290Power = butPositionUp);
        img1210ARetrMainButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.but1210ARetrMain = butPositionUp);
        img1210ARetrReserveButPositionUp.Visible :=
          Boolean(Station.HalfSetB.Rack1200Right.but1210ARetrReserve = butPositionUp);

        ilSw1240V.GetBitmap(Station.HalfSetB.Rack1200Right.Sw1240V - 1,
          imgSw1240V.Picture.Bitmap);
        ilSw1240V.GetBitmap(Station.HalfSetB.Rack1200Right.Sw1240V2 - 1,
          imgSw1240V2.Picture.Bitmap);
        ilSw1240V.GetBitmap(Station.HalfSetB.Rack1200Right.Sw1240V3 - 1,
          imgSw1240V3.Picture.Bitmap);
        il1290SwPower.GetBitmap(Station.HalfSetB.Rack1200Right.sw1290Power - 1,
          img1290SwPower.Picture.Bitmap);

        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240V1Tune),
          img1240VTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240V2Tune),
          img1240V2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240V3Tune),
          img1240V3Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240GTune),
          img1240GTune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G1Tune),
          img1240G1Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G2Tune),
          img1240G2Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G3Tune),
          img1240G3Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G4Tune),
          img1240G4Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G5Tune),
          img1240G5Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G6Tune),
          img1240G6Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G7Tune),
          img1240G7Tune.Picture.Bitmap);
        ilTune.GetBitmap(OutTune(Station.HalfSetB.Rack1200Right.sw1240G8Tune),
          img1240G8Tune.Picture.Bitmap);

        if (Station.IsPluggedIn) and (Station.PowerPanel.sw1200Power_2  = 1) then
        begin
          //----------------Световые индикаторы---------------
          imgInd1220AMMain.Visible :=
            Boolean(Station.Rack1710.but1220AM_2 = butPositionLeft);
          imgInd1220AMReserve.Visible :=
            Boolean(Station.Rack1710.but1220AM_2 = butPositionRight);
          imgInd1230AMain.Visible :=
            Boolean(Station.Rack1710.but1230AM_2 = butPositionLeft);
          imgInd1230AReserve.Visible :=
            Boolean(Station.Rack1710.but1230AM_2 = butPositionRight);
          imgInd1210AMain.Visible :=
            Boolean(Station.Rack1710.but1210A_2 = butPositionLeft);
          imgInd1210AReserve.Visible :=
            Boolean(Station.Rack1710.but1210A_2 = butPositionRight);
          imgInd1270Main.Visible :=
            Boolean(Station.Rack1710.but1270_2 = butPositionLeft);
          imgInd1270Reserve.Visible :=
            Boolean(Station.Rack1710.but1270_2 = butPositionRight);
          imgInd1290Power.Visible :=
            Boolean(Station.HalfSetB.Rack1200Right.But1290Power = butPositionUp);
          img1220AMMainPhasirovka.Visible :=
            Boolean((Station.Rack1710.but1220AM_2 = butPositionLeft)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetA.Rack1920.stLBV2_TurnedOn));
          img1210AMainPhasirovka.Visible :=
            Boolean((Station.Rack1710.but1210A_2 = butPositionLeft)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetA.Rack1920.stLBV2_TurnedOn));
          img1220AMReservePhasirovka.Visible :=
            Boolean((Station.Rack1710.but1220AM_2 = butPositionRight)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetA.Rack1920.stLBV2_TurnedOn));
          img1210AReservePhasirovka.Visible :=
            Boolean((Station.Rack1710.but1210A_2 = butPositionRight)
            and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn
              or Station.HalfSetA.Rack1920.stLBV2_TurnedOn));

          imgInd1240VControl.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240VControl2.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240VControl3.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240GControl.Visible :=
            Boolean(Station.HalfSetA.Rack1200Left.butChannelControl = butPositionUp);
          imgInd1240G1.Visible :=
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
        end
        else
        begin
          imgInd1240VControl.Visible := False;
          imgInd1240VControl2.Visible := False;
          imgInd1240VControl3.Visible := False;
          imgInd1240GControl.Visible := False;
          imgInd1240G1.Visible := False;
          imgInd1240G2.Visible := False;
          imgInd1240G3.Visible := False;
          imgInd1240G4.Visible := False;
          imgInd1240G5.Visible := False;
          imgInd1240G6.Visible := False;
          imgInd1240G7.Visible := False;
          imgInd1240G8.Visible := False;

          //----------------Световые индикаторы---------------
          imgInd1220AMMain.Visible := False;
          imgInd1220AMReserve.Visible := False;
          imgInd1230AMain.Visible := False;
          imgInd1230AReserve.Visible := False;
          imgInd1210AMain.Visible := False;
          imgInd1210AReserve.Visible := False;
          imgInd1270Main.Visible := False;
          imgInd1270Reserve.Visible := False;
          imgInd1290Power.Visible := False;
          img1220AMMainPhasirovka.Visible := False;
          img1210AMainPhasirovka.Visible := False;
          img1220AMReservePhasirovka.Visible := False;
          img1210AReservePhasirovka.Visible := False;
          
        end;
        
        if Station.IsPolukomplektBTuned then
        begin
          if (Station.IsChannelBlocksTunedAt4ChannelMode()
              and Station.IsP321ShuntsConnectedAt4ChannelMode()
              and Station.IsP321ReadyToMeasure )  then
          begin
            imgInd1240V1_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 19) or (Station.CableBlack1.stKonez2.stKonez = 19))
              and ((Station.CableWhite2.stKonez1.stKonez = 188) or (Station.CableWhite2.stKonez2.stKonez = 188))
              or ((Station.CableBlack1.stKonez1.stKonez = 187) or (Station.CableBlack1.stKonez2.stKonez = 187))
              and ((Station.CableWhite2.stKonez1.stKonez = 20) or (Station.CableWhite2.stKonez2.stKonez = 20)));

            imgInd1240V2_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 21) or (Station.CableBlack1.stKonez2.stKonez = 21))
              and ((Station.CableWhite2.stKonez1.stKonez = 190) or (Station.CableWhite2.stKonez2.stKonez = 190))
              or ((Station.CableBlack1.stKonez1.stKonez = 189) or (Station.CableBlack1.stKonez2.stKonez = 189))
              and ((Station.CableWhite2.stKonez1.stKonez = 22) or (Station.CableWhite2.stKonez2.stKonez = 22)));


            imgInd1240V3_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 23) or (Station.CableBlack1.stKonez2.stKonez = 23))
              and ((Station.CableWhite2.stKonez1.stKonez = 192) or (Station.CableWhite2.stKonez2.stKonez = 192))
              or ((Station.CableBlack1.stKonez1.stKonez = 191) or (Station.CableBlack1.stKonez2.stKonez = 191))
              and ((Station.CableWhite2.stKonez1.stKonez = 24) or (Station.CableWhite2.stKonez2.stKonez = 24)));

            InvalidateAll;
            Exit;
          end
          else
            HideLevel;
          if (Station.IsChannelBlocksTunedAt2ChannelMode
              and Station.IsP321ShuntsConnectedAt2ChannelMode
              and Station.IsP321ReadyToMeasure)  then
          begin
            imgInd1240V1_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 20) or (Station.CableBlack1.stKonez2.stKonez = 20))
              and ((Station.CableWhite2.stKonez1.stKonez = 188) or (Station.CableWhite2.stKonez2.stKonez = 188))
              or ((Station.CableBlack1.stKonez1.stKonez = 188) or (Station.CableBlack1.stKonez2.stKonez = 188))
              and ((Station.CableWhite2.stKonez1.stKonez = 20) or (Station.CableWhite2.stKonez2.stKonez = 20)));

            imgInd1240V2_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 22) or (Station.CableBlack1.stKonez2.stKonez = 22))
              and ((Station.CableWhite2.stKonez1.stKonez = 190) or (Station.CableWhite2.stKonez2.stKonez = 190))
              or ((Station.CableBlack1.stKonez1.stKonez = 190) or (Station.CableBlack1.stKonez2.stKonez = 190))
              and ((Station.CableWhite2.stKonez1.stKonez = 22) or (Station.CableWhite2.stKonez2.stKonez = 22)));

            imgInd1240V3_Line.Visible :=
            Boolean(((Station.CableBlack1.stKonez1.stKonez = 24) or (Station.CableBlack1.stKonez2.stKonez = 24))
              and ((Station.CableWhite2.stKonez1.stKonez = 192) or (Station.CableWhite2.stKonez2.stKonez = 192))
              or ((Station.CableBlack1.stKonez1.stKonez = 192) or (Station.CableBlack1.stKonez2.stKonez = 192))
              and ((Station.CableWhite2.stKonez1.stKonez = 24) or (Station.CableWhite2.stKonez2.stKonez = 24)));
;
            InvalidateAll;
            Exit;
          end
          else
            HideLevel;            
        end
        else
          HideLevel;
      end;
  end;

  InvalidateAll;
end;



procedure TRack1200RightForm.ShowOscill;
  var
  Oscill: TBlockOscillographForm;
  begin


    case CurFormId of
    idRack1200A2:
      begin
        if (Station.HalfSetA.Rack1200Right.CableOscillographLineInput <> csDisconected) and
         (Station.HalfSetA.Rack1200Right.CableUzlovoiInput <> csDisconected) and (Oscill.Showing=False) then
         begin
               Oscill := TBlockOscillographForm.Create(Self, Station, TaskController);
               Oscill.Left := Screen.Width - self.Width;
               Oscill.Show;
         end;
      end;

    idRack1200B2:
      begin
        if (Station.HalfSetB.Rack1200Right.CableOscillographLineInput <> csDisconected) and
         (Station.HalfSetB.Rack1200Right.CableUzlovoiInput <> csDisconected) and (Oscill.Showing=False) then
         begin
               Oscill := TBlockOscillographForm.Create(Self, Station, TaskController);
               Oscill.Left := Screen.Width - self.Width;
               Oscill.Show;
         end;
      end;
  end;
  end;


procedure TRack1200RightForm.img1240G1TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G1Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G1Tune, 1);
        if (Button = mbRight)
          and (Station.HalfSetA.Rack1200Right.sw1240G1Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G1Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G1Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G1Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G1Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G1Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240G2TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G2Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G2Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240G2Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G2Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G2Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G2Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G2Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G2Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240G3TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G3Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G3Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240G3Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G3Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G3Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G3Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G3Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G3Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240G4TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G4Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G4Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240G4Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G4Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G4Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G4Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G4Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G4Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240G5TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G5Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G5Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240G5Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G5Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G5Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G5Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G5Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G5Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240G6TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G6Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G6Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240G6Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G6Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G6Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G6Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G6Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G6Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240G7TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G7Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G7Tune, 1);
        if (Button = mbRight)
          and (Station.HalfSetA.Rack1200Right.sw1240G7Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G7Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G7Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G7Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G7Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G7Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240G8TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240G8Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240G8Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240G8Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240G8Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240G8Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240G8Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240G8Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240G8Tune, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.img1240GTuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240GTune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240GTune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240GTune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240GTune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240GTune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240GTune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240GTune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240GTune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V2TuneClick(Sender: TObject);
begin
  Reload;
end;

procedure TRack1200RightForm.img1240V2TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240V2Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240V2Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240V2Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240V2Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240V2Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240V2Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240V2Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240V2Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V2_Zaglushka_4PMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedInCross;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V2_Zaglushka_Combine2MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V2_Zaglushka_CombineMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_4PDC := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V2_Zaglushka_KMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedInCross;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V2_Zaglushka_KDC := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V3TuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240V3Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240V3Tune, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1240V3Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240V3Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240V3Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240V3Tune, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1240V3Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240V3Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V3_Zaglushka_4PMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedInCross;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V3_Zaglushka_Combine2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V3_Zaglushka_CombineMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_4PDC := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V3_Zaglushka_KMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedInCross;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V3_Zaglushka_KDC := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240VTuneClick(Sender: TObject);
begin
 Reload;
end;

procedure TRack1200RightForm.img1240VTuneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetA.Rack1200Right.sw1240V1Tune < MaxTuneValue) then
          Inc(Station.HalfSetA.Rack1200Right.sw1240V1Tune, 1);
        if (Button = mbRight)
          and (Station.HalfSetA.Rack1200Right.sw1240V1Tune > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1240V1Tune, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft)
          and (Station.HalfSetB.Rack1200Right.sw1240V1Tune < MaxTuneValue) then
          Inc(Station.HalfSetB.Rack1200Right.sw1240V1Tune, 1);
        if (Button = mbRight)
          and (Station.HalfSetB.Rack1200Right.sw1240V1Tune > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1240V1Tune, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V_Zaglushka_4PMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedInCross;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V_Zaglushka_Combine2MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V_Zaglushka_CombineMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_4PDC := stPluggedIn;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1240V_Zaglushka_KMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        Station.HalfSetA.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedInCross;
      end;

    idRack1200B2:
      begin
        Station.HalfSetB.Rack1200Right.st1240V_Zaglushka_KDC := stPluggedInCross;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.img1270ReserveMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1270Reserve = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1270Reserve := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1270Reserve := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1270Reserve = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1270Reserve := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1270Reserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.img1290SwPowerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Right.sw1290Power < 10) then
          Inc(Station.HalfSetA.Rack1200Right.sw1290Power, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.sw1290Power > 1) then
          Dec(Station.HalfSetA.Rack1200Right.sw1290Power, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Right.sw1290Power < 10) then
          Inc(Station.HalfSetB.Rack1200Right.sw1290Power, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.sw1290Power > 1) then
          Dec(Station.HalfSetB.Rack1200Right.sw1290Power, 1);
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1210AMainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1210AMain = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1210AMain := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1210AMain := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1210AMain = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1210AMain := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1210AMain := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1210AReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1210AReserve = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1210AReserve := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1210AReserve := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1210AReserve = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1210AReserve := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1210AReserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgbut1210ARetrMainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.but1210ARetrMain = butPositionUp then
          Station.HalfSetA.Rack1200Right.but1210ARetrMain := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.but1210ARetrMain := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.but1210ARetrMain = butPositionUp then
          Station.HalfSetB.Rack1200Right.but1210ARetrMain := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.but1210ARetrMain := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgbut1210ARetrReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.but1210ARetrReserve = butPositionUp then
          Station.HalfSetA.Rack1200Right.but1210ARetrReserve := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.but1210ARetrReserve := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.but1210ARetrReserve = butPositionUp then
          Station.HalfSetB.Rack1200Right.but1210ARetrReserve := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.but1210ARetrReserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1220AMMainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1220AMMain = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1220AMMain := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1220AMMain := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1220AMMain = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1220AMMain := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1220AMMain := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1220AMReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1220AMReserve = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1220AMReserve := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1220AMReserve := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1220AMReserve = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1220AMReserve := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1220AMReserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1230AMainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1230AMain = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1230AMain := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1230AMain := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1230AMain = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1230AMain := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1230AMain := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1230AReserveClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1230AReserve = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1230AReserve := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1230AReserve := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1230AReserve = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1230AReserve := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1230AReserve := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G1Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G1 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G1 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G1 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G1 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G1 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G1 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G2 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G2 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G2 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G2 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G2 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G2 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G3Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G3 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G3 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G3 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G3 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G3 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G3 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G4Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G4 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G4 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G4 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G4 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G4 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G4 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G5Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G5 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G5 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G5 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G5 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G5 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G5 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G6Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G6 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G6 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G6 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G6 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G6 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G6 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G7Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G7 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G7 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G7 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G7 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G7 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G7 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240G8Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G8 = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G8 := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G8 := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G8 = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G8 := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G8 := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240GClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240G = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1240G := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1240G := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240G = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1240G := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1240G := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1240V2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240V2 = butPositionLeft then
          Station.HalfSetA.Rack1200Right.But1240V2 := butPositionRight
        else
          Station.HalfSetA.Rack1200Right.But1240V2 := butPositionLeft;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240V2 = butPositionLeft then
          Station.HalfSetB.Rack1200Right.But1240V2 := butPositionRight
        else
          Station.HalfSetB.Rack1200Right.But1240V2 := butPositionLeft;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.imgBut1240V3Click(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240V3 = butPositionLeft then
          Station.HalfSetA.Rack1200Right.But1240V3 := butPositionRight
        else
          Station.HalfSetA.Rack1200Right.But1240V3 := butPositionLeft;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240V3 = butPositionLeft then
          Station.HalfSetB.Rack1200Right.But1240V3 := butPositionRight
        else
          Station.HalfSetB.Rack1200Right.But1240V3 := butPositionLeft;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.imgBut1240VClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1240V = butPositionLeft then
          Station.HalfSetA.Rack1200Right.But1240V := butPositionRight
        else
          Station.HalfSetA.Rack1200Right.But1240V := butPositionLeft;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1240V = butPositionLeft then
          Station.HalfSetB.Rack1200Right.But1240V := butPositionRight
        else
          Station.HalfSetB.Rack1200Right.But1240V := butPositionLeft;
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.imgBut1270MainClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1270Main = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1270Main := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1270Main := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1270Main = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1270Main := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1270Main := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgBut1290PowerClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.But1290Power = butPositionUp then
          Station.HalfSetA.Rack1200Right.But1290Power := butPositionDown
        else
          Station.HalfSetA.Rack1200Right.But1290Power := butPositionUp;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.But1290Power = butPositionUp then
          Station.HalfSetB.Rack1200Right.But1290Power := butPositionDown
        else
          Station.HalfSetB.Rack1200Right.But1290Power := butPositionUp;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgCableOscillographSyncClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.CableOscillographLineInput = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Right.CableUzlovoiInput = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Right.CableUzlovoiInput = csConnectedAtPRM));
          imgSpawnPRD.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Right.CableUzlovoiInput = csConnectedAtPRD));
          SelectedCable := scCableSync;
        end
        else
        begin
          //Отключаем
          Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csDisconected;
          Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
        end;
      end;

    idRack1200b2:
      begin
        if Station.HalfSetB.Rack1200Right.CableOscillographLineInput = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Right.CableUzlovoiInput = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Right.CableUzlovoiInput = csConnectedAtPRM));
          imgSpawnPRD.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Right.CableUzlovoiInput = csConnectedAtPRD));
          SelectedCable := scCableSync;
        end
        else
        begin
          //Отключаем
          Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csDisconected;
          Station.Oscillograph.cblCabelSyncConnectedTo := csDisconected;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.SetCableOscillographSyncState(btStateCode: Byte);
begin
  case btStateCode of
    csConnectedAtPRD:
      begin
        imgCableOscillographSync.Left := 352;
        imgCableOscillographSync.Top := 0;
      end;
    csConnectedAtPRM:
      begin
        imgCableOscillographSync.Left := 508;
        imgCableOscillographSync.Top := 0;
      end;
    csDisconected:
      begin
        imgCableOscillographSync.Left := 616;
        imgCableOscillographSync.Top := 0;
      end;
    csConnectedAtSync:
      begin
        imgCableOscillographSync.Left := 420;
        imgCableOscillographSync.Top := 0;
      end;
  end;

  imgCableOscillographSync.Invalidate;
end;

procedure TRack1200RightForm.SetCableUzlovoiInputState(btStateCode: Byte);
begin
  case btStateCode of
    csConnectedAtPRD:
      begin
        imgCableUzlovoiInput.Left := 384;
        imgCableUzlovoiInput.Top := 0;
      end;
    csConnectedAtPRM:
      begin
        imgCableUzlovoiInput.Left := 539;
        imgCableUzlovoiInput.Top := 0;
      end;
    csDisconected:
      begin
        imgCableUzlovoiInput.Left := 684;
        imgCableUzlovoiInput.Top := 0;
      end;
    csConnectedAtSync:
      begin
        imgCableUzlovoiInput.Left := 448;
        imgCableUzlovoiInput.Top := 0;
      end;
  end;

  imgCableUzlovoiInput.Invalidate;
end;

procedure TRack1200RightForm.imgCableUzlovoiInputClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if Station.HalfSetA.Rack1200Right.CableUzlovoiInput = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Right.CableOscillographLineInput = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Right.CableOscillographLineInput = csConnectedAtPRM));
          imgSpawnPRD.Visible :=
            not(Boolean(Station.HalfSetA.Rack1200Right.CableOscillographLineInput = csConnectedAtPRD));
          SelectedCable := scCableUzlovoi;
        end
        else
        begin
          //Отключаем
          Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csDisconected;
          Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;
        end;
      end;

    idRack1200B2:
      begin
        if Station.HalfSetB.Rack1200Right.CableUzlovoiInput = csDisconected then
        begin
          //Подключаем
          imgSpawnSync.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Right.CableOscillographLineInput
              = csConnectedAtSync));
          imgSpawnPRM.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Right.CableOscillographLineInput
              = csConnectedAtPRM));
          imgSpawnPRD.Visible :=
            not(Boolean(Station.HalfSetB.Rack1200Right.CableOscillographLineInput
              = csConnectedAtPRD));
          SelectedCable := scCableUzlovoi;
        end
        else
        begin
          //Отключаем
          Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csDisconected;
          Station.Oscillograph.cblCableUsilitelConnectedTo := csDisconected;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1200RightForm.imgJmpToLeft6Click(Sender: TObject);
begin
  //Запрещаем делать переходы в левую стойку в режиме обучения
//  if Station.WorkType = wtLearn then Exit;
//
//  case CurFormId of
//    idRack1200B2:
//      begin
//        JmpFormId := idRack1200B2;
//        Close;
//      end;
//    idRack1200A2:
//      begin
//        JmpFormId := idRack1200A2;
//        Close;
//      end;
//  end;
end;

procedure TRack1200RightForm.imgJmpToRightClick(Sender: TObject);
begin
  //Запрещаем делать переходы в правую стойку в режиме обучения
//  if Station.WorkType = wtLearn then Exit;
//
//  case CurFormId of
//    idRack1200B2:
//      begin
//
//      end;
//    idRack1200A2:
//      begin
//        JmpFormId := idRack1200A2;
//        Close;
//      end;
//  end;
end;

procedure TRack1200RightForm.imgSpawnPRDClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if SelectedCable = scCableSync then
        begin
          Station.HalfSetA.Rack1200Right.CableOscillographLineInput :=
            csConnectedAtPRD;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200A2PRD;
        end;
        if SelectedCable = scCableUzlovoi then
        begin
          Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csConnectedAtPRD;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200A2PRD;
        end;
      end;

    idRack1200B2:
      begin
        if SelectedCable = scCableSync then
        begin
          Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csConnectedAtPRD;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200B2PRD;
        end;
        if SelectedCable = scCableUzlovoi then
        begin
          Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csConnectedAtPRD;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200B2PRD;
        end;
      end;
  end;

  imgSpawnSync.Visible := False;
  imgSpawnPRD.Visible := False;
  imgSpawnPRM.Visible := False;

  ShowOscill;

  Reload;
end;

procedure TRack1200RightForm.imgSpawnPRMClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if SelectedCable = scCableSync then
        begin
          Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csConnectedAtPRM;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200A2PRM;
        end;
        if SelectedCable = scCableUzlovoi then
        begin
          Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csConnectedAtPRM;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200A2PRM;
        end;
      end;

    idRack1200B2:
      begin
        if SelectedCable = scCableSync then
        begin
          Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csConnectedAtPRM;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200B2PRM;
        end;
        if SelectedCable = scCableUzlovoi then
        begin
          Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csConnectedAtPRM;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200B2PRM;
        end;
      end;
  end;

  imgSpawnSync.Visible := False;
  imgSpawnPRD.Visible := False;
  imgSpawnPRM.Visible := False;

  ShowOscill;

  Reload;
end;

procedure TRack1200RightForm.imgSpawnSyncClick(Sender: TObject);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if SelectedCable = scCableSync then
        begin
          Station.HalfSetA.Rack1200Right.CableOscillographLineInput := csConnectedAtSync;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200A2Sync;
        end;
        if SelectedCable = scCableUzlovoi then
        begin
          Station.HalfSetA.Rack1200Right.CableUzlovoiInput := csConnectedAtSync;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200A2Sync;
        end;
      end;

    idRack1200B2:
      begin
        if SelectedCable = scCableSync then
        begin
          Station.HalfSetB.Rack1200Right.CableOscillographLineInput := csConnectedAtSync;
          Station.Oscillograph.cblCabelSyncConnectedTo :=
            csConnectedTo1200B2Sync;
        end;
        if SelectedCable = scCableUzlovoi then
        begin
          Station.HalfSetB.Rack1200Right.CableUzlovoiInput := csConnectedAtSync;
          Station.Oscillograph.cblCableUsilitelConnectedTo :=
            csConnectedTo1200B2Sync;
        end;
      end;
  end;

  imgSpawnSync.Visible := False;
  imgSpawnPRD.Visible := False;
  imgSpawnPRM.Visible := False;

  ShowOscill;

  Reload;
end;

procedure TRack1200RightForm.imgSw1240V2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Right.Sw1240V2 < 4) then
          Inc(Station.HalfSetA.Rack1200Right.Sw1240V2, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.Sw1240V2 > 1) then
          Dec(Station.HalfSetA.Rack1200Right.Sw1240V2, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Right.Sw1240V2 < 4) then
          Inc(Station.HalfSetB.Rack1200Right.Sw1240V2, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.Sw1240V2 > 1) then
          Dec(Station.HalfSetB.Rack1200Right.Sw1240V2, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.imgSw1240V3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Right.Sw1240V3 < 4) then
          Inc(Station.HalfSetA.Rack1200Right.Sw1240V3, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.Sw1240V3 > 1) then
          Dec(Station.HalfSetA.Rack1200Right.Sw1240V3, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Right.Sw1240V3 < 4) then
          Inc(Station.HalfSetB.Rack1200Right.Sw1240V3, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.Sw1240V3 > 1) then
          Dec(Station.HalfSetB.Rack1200Right.Sw1240V3, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.imgSw1240VMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1200A2:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1200Right.Sw1240V < 4) then
          Inc(Station.HalfSetA.Rack1200Right.Sw1240V, 1);
        if (Button = mbRight) and (Station.HalfSetA.Rack1200Right.Sw1240V > 1) then
          Dec(Station.HalfSetA.Rack1200Right.Sw1240V, 1);
      end;

    idRack1200B2:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1200Right.Sw1240V < 4) then
          Inc(Station.HalfSetB.Rack1200Right.Sw1240V, 1);
        if (Button = mbRight) and (Station.HalfSetB.Rack1200Right.Sw1240V > 1) then
          Dec(Station.HalfSetB.Rack1200Right.Sw1240V, 1);
      end;
  end;

  Reload;
  //RackP321Form.PaintDisplay;
end;

procedure TRack1200RightForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TRack1200RightForm.FormCreate(Sender: TObject);
begin
  MoveFormInScreenCenter(Self);
end;

procedure TRack1200RightForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TRack1200RightForm.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1200RightForm.FormShow(Sender: TObject);
begin
  Reload;
end;

procedure TRack1200RightForm.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TRack1200RightForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

end.
