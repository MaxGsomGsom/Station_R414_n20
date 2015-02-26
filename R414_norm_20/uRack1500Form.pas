unit uRack1500Form;

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
  StdCtrls,
  pngimage,
  uAdditionalFormMethods,
  uConstantsDM,
  uStationStateDM,
  uTaskControllerDM,
  uRack1500bForm;

type
  TRack1500Form = class(TForm)
  {$REGION 'Элементы формы'}
    Panel1: TPanel;
    imgBG: TImage;
    ilSwModeControl: TImageList;
    imgSwModeControl: TImage;
    imgAutomaticRight: TImage;
    imgAutomaticLeft: TImage;
    ilSwWave1610: TImageList;
    imgSwWave1610: TImage;
    ilSwWave1600R: TImageList;
    imgSwWave1600R: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ilSwPhaseSwitcher: TImageList;
    imgSwPhaseSwitcher: TImage;
    Label7: TLabel;
    ilSwWave1500: TImageList;
    imgSwWave1500: TImage;
    imgModeControlBlack: TImage;
    imgModeControlRed: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    imgWarningLight: TImage;
    Image18: TImage;
    Image19: TImage;
    imgVentilator1540_1: TImage;
    imgVentilator1540_2: TImage;
    imgRasfaz: TImage;
    tmrLBV: TTimer;
    Image27: TImage;
    imgRetrReservLight: TImage;
    imgMd0Select: TImage;
    imgMdRSelect: TImage;
    imgRetrMainSelected: TImage;
    imgRetrReserveSelected: TImage;
    imgMd0: TImage;
    imgMdR: TImage;
    imgRetrMain: TImage;
    imgRetrReserve: TImage;
    imgMdRLight: TImage;
    imgRetrMainLight: TImage;
    imgWindow7: TImage;
    imgCableMdReservConnected: TImage;
    imgCableMdMainConnected: TImage;
    Image42: TImage;
    Image43: TImage;
    imgMoshnost: TImage;
    imgLBV2Light: TImage;
    imgLBV1Light: TImage;
    imgWindow1: TImage;
    imgWindow0: TImage;
    imgWindow8: TImage;
    imgMd0Light: TImage;
    imgWindow2: TImage;
    imgWindow5: TImage;
    imgWindow3: TImage;
    imgWindow4: TImage;
    imgWindow9: TImage;
    imgWindow6: TImage;
    imgWindow10: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    imgCableSh37: TImage;
    imgCableNagruzka: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    lblCable1840: TLabel;
    lblCableNagruzka: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    imgSpawnNagruzka: TImage;
    imgSpawnSh37: TImage;
    pnlPhaseMover: TPanel;
    imgPhaseMoverAdditional: TImage;
    imgPhaseMoverBg: TImage;
    Button1: TButton;
    Button2: TButton;
    imgEnterToRackRight: TImage;
    imgEnterToRackLeft: TImage;
    imgEnterToRackLeftSelected: TImage;
    imgEnterToRackRightSelected: TImage;
    imgWaveMeterMain: TImage;
    imgWaveMeterReserv: TImage;
    {$ENDREGION}

  {$REGION 'Обработка событий формы'}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image12Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);



    procedure Image14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgBGMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

 
    procedure imgModeControlRedClick(Sender: TObject);
    procedure imgModeControlBlackClick(Sender: TObject);
    procedure imgAutomaticRightClick(Sender: TObject);
    procedure imgAutomaticLeftClick(Sender: TObject);
    procedure imgSwWave1500MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwPhaseSwitcherMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwWave1600RMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwWave1610MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  
    procedure imgSwModeControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tmrLBVTimer(Sender: TObject);
    procedure imgMd0MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgMd0SelectMouseLeave(Sender: TObject);
    procedure imgMdRMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgMdRSelectMouseLeave(Sender: TObject);
    procedure imgRetrMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgRetrMainSelectedMouseLeave(Sender: TObject);
    procedure imgRetrReserveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgRetrReserveSelectedMouseLeave(Sender: TObject);
    procedure imgMd0SelectClick(Sender: TObject);
    procedure imgRetrReserveSelectedClick(Sender: TObject);
    procedure imgMdRSelectClick(Sender: TObject);
    procedure imgRetrMainSelectedClick(Sender: TObject);
    procedure Image11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgRetrMainLightClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure imgCableNagruzkaClick(Sender: TObject);
    procedure imgCableSh37Click(Sender: TObject);
    procedure imgSpawnNagruzkaClick(Sender: TObject);
    procedure imgSpawnSh37Click(Sender: TObject);
    procedure imgSwPhaseSwitcherMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure imgSwPhaseSwitcherMouseLeave(Sender: TObject);
    procedure imgSwPhaseSwitcherMouseEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormHide(Sender: TObject);
    procedure imgCableMdMainConnectedClick(Sender: TObject);
    procedure imgCableMdReservConnectedClick(Sender: TObject);
    procedure btnWaveMeterMainClick(Sender: TObject);
    procedure btnWaveMeterReservClick(Sender: TObject);
    //procedure FormResize(Sender: TObject);
    {$ENDREGION}

  private
    IsMovedToRight : Boolean;

    procedure ModeControl(ShownImageId: Byte = NotSelected);
    procedure ConnectCable1840ToSh37;
    procedure ConnectCableNagruzkaToFreePlace;
    procedure DisConnectCableNagruzka;
    procedure DisConnectCable1840;
    procedure ConnectCable1840ToFreePlace;
    procedure ConnectCableNagruzkaToSh37;

    procedure MoveToCenter();
  public
    { Public declarations }
    bmp: tbitmap;
    bmp2:tbitmap;
    Vidimost,Glow1:boolean;
    procedure Reload;
    procedure MoveToRight();
    constructor Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;


var
  l3, l4, l6, half: Integer;
  imgsRed: array [1..11] of ^TImage;
  imgsBlack: array [1..11] of ^TImage;
  imgsModeControl: array [1..10] of ^TImage;
  SelectedCable1500: Byte;
  Rack1500back: TRack1500bForm;

  end;


implementation

uses

  uStationR414Form,
  uEducationForm,
  uLoaderForm,
  uWaveMeterPanelForm,
  uBlockPowerPanelForm,
  uBlockWaveMeterForm,
  uButtonBackForm;

{$R *.dfm}
  var
  ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;
    CurFormId: Integer;
  WaveMeterForm: TBlockWaveMeterForm;

const
idRack1500A= 1;
idRack1500B=2;


constructor TRack1500Form.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  SelectedCable1500:= NotSelected  ;
  Station:=Station0;
  CurFormId:=Half;
  if (Half=1) then begin Self.Caption:='1500 А'; end
  else Self.Caption:='1500 Б';
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;


{$REGION 'Процедуры присоединения/отсоединения кабелей'}
procedure TRack1500Form.ConnectCable1840ToSh37;
begin
  lblCable1840.Left := 335;
  lblCable1840.Top := 15;
  imgCableSh37.Top := 58;
  imgCableSh37.Left := 346;
end;

procedure TRack1500Form.ConnectCable1840ToFreePlace;
begin
  lblCable1840.Left := 92;
  lblCable1840.Top := 15;
  imgCableSh37.Top := 51;
  imgCableSh37.Left := 120;
end;

procedure TRack1500Form.ConnectCableNagruzkaToFreePlace;
begin
  lblCableNagruzka.Left := 92;
  lblCableNagruzka.Top := 16;
  imgCableNagruzka.Top := 51;
  imgCableNagruzka.Left := 120;
end;

procedure TRack1500Form.ConnectCableNagruzkaToSh37;
begin
  lblCableNagruzka.Left := 335;
  lblCableNagruzka.Top := 15;
  imgCableNagruzka.Top := 58;
  imgCableNagruzka.Left := 346;
end;

procedure TRack1500Form.DisConnectCableNagruzka;
begin
  lblCableNagruzka.Left := 204;
  lblCableNagruzka.Top := 15;
  imgCableNagruzka.Top := 45;
  imgCableNagruzka.Left := 240;
end;

procedure TRack1500Form.DisConnectCable1840;
begin
  lblCable1840.Left := 436;
  lblCable1840.Top := 15;
  imgCableSh37.Top := 52;
  imgCableSh37.Left := 448;
end;
{$ENDREGION}

procedure TRack1500Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TRack1500Form.FormCreate(Sender: TObject);
begin
  imgsRed[1] := @imgWindow6;
  imgsRed[2] := @imgWindow5;
  imgsRed[3] := @imgWindow8;
  imgsRed[4] := @imgWindow4;
  imgsRed[5] := @imgWindow6;
  imgsRed[6] := @imgWindow5;
  imgsRed[7] := @imgWindow6;
  imgsRed[8] := @imgWindow9;
  imgsRed[9] := @imgWindow6;
  imgsRed[10] := @imgWindow7;
  imgsRed[11] := @imgWindow5;

  imgsBlack[1] := @imgWindow7;
  imgsBlack[2] := @imgWindow6;
  imgsBlack[3] := @imgWindow9;
  imgsBlack[4] := @imgWindow4;
  imgsBlack[5] := @imgWindow6;
  imgsBlack[6] := @imgWindow5;
  imgsBlack[7] := @imgWindow6;
  imgsBlack[8] := @imgWindow3;
  imgsBlack[9] := @imgWindow7;
  imgsBlack[10] := @imgWindow5;
  imgsBlack[11] := @imgWindow6;

  imgsModeControl[1] := @imgWindow1;
  imgsModeControl[2] := @imgWindow2;
  imgsModeControl[3] := @imgWindow3;
  imgsModeControl[4] := @imgWindow4;
  imgsModeControl[5] := @imgWindow5;
  imgsModeControl[6] := @imgWindow6;
  imgsModeControl[7] := @imgWindow7;
  imgsModeControl[8] := @imgWindow8;
  imgsModeControl[9] := @imgWindow9;
  imgsModeControl[10] := @imgWindow10;

  MoveFormInScreenCenter(Self);
  IsMovedToRight := False;
end;

procedure TRack1500Form.FormHide(Sender: TObject);
begin
  self.MoveToCenter;
end;

{$REGION 'Смещение формы влево/вправо, чтобы не перекрывать волномер'}
procedure TRack1500Form.MoveToRight();
begin
  if Self.Left < WaveMeterPanelForm.Width then
  begin
    Self.Left := WaveMeterPanelForm.Width;
    IsMovedToRight := True;
  end;
end;

procedure TRack1500Form.MoveToCenter;
begin
  if (IsMovedToRight) then
  begin
    Self.Left := Screen.Width div 2 - Self.width div 2;
    IsMovedToRight := False;
  end;
end;
{$ENDREGION}

procedure TRack1500Form.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TRack1500Form.FormShow(Sender: TObject);
begin

  tmrLBV.Interval := 10;
  tmrLBV.Enabled := True;
//WaveMeterPanelForm.st1 := True;
//WaveMeterPanelForm.st2 := False;
//WaveMeterPanelForm.st3 := False;
//WaveMeterPanelForm.st4 := False;
//
////StationR414Form.XT := 24;
////-------------Pribor
//if ((imgLBV1Light.Visible=true)or(imgLBV2Light.Visible=true))and((imgLBV1Light.Visible=false)or(imgLBV2Light.Visible=false))and(Image10.Visible=true)and(Station.HalfSetA.Rack1500.swModeControl=6) then begin
//Pribor1500_1.BringToFront;
//end else
//
//if (imgLBV1Light.Visible=true)and(imgLBV2Light.Visible=true)and(Image10.Visible=true)and(Station.HalfSetA.Rack1500.swModeControl=6) then begin
//Pribor1500_2.BringToFront;
//end else
//if (imgLBV1Light.Visible=true)and(imgLBV2Light.Visible=true)and(Image10.Visible=false)and(Station.HalfSetA.Rack1500.swModeControl=6) then begin
//Pribor1500_2.SendToBack;
//Pribor1500_1.SendToBack;
//end else
//if ((imgLBV1Light.Visible=true)or(imgLBV2Light.Visible=true))and((imgLBV1Light.Visible=false)or(imgLBV2Light.Visible=false))and(Image10.Visible=false)and(Station.HalfSetA.Rack1500.swModeControl=6) then begin
//Pribor1500_2.BringToFront;
//end else begin
//  Pribor1500_1.SendToBack;
//Pribor1500_2.SendToBack;
//end;
//
//  //-------------Lampi
//  if (Station.PowerPanel.sw1900Power <> 1) then
//  begin
//    Image17.Visible:=false;
//    Image18.Visible:=false;
//    Image19.Visible:=false;
//    Image20.Visible:=false;
//    Image21.Visible:=false;
//    Image22.Visible:=false;
//    Image26.Visible:=false;
//    Image27.Visible:=false;
//
//    Image28.Visible:=false;
//    Image29.Visible:=false;
//    Image38.Visible:=false;
//    Image39.Visible:=false;
//
//    Image23.Visible:=false;
//    Image24.Visible:=false;
//    Image25.Visible:=false;
//    tmrLBV.Enabled:=false;
//  end;
//
//  if (Station.PowerPanel.sw1900Power = 1) and (Station.PowerPanel.swNet = 1) then
//  begin
//    if Image4.Visible=true then
//      Image17.Visible:=true;
//    Image18.Visible:=true;
//    Image19.Visible:=true;
//    Image20.Visible:=true;
//    Image21.Visible:=true;
//    Image22.Visible:=true;
//    Image26.Visible:=true;
//    Image27.Visible:=true;
//    tmrLBV.Enabled:=true;
//  end;
//-------------end

//  if (Station.WorkMode = mdExternalView) and (Task1Passed[24] = stPassed) then
//  begin
//    Image15.Show;
//  end
//  else
//    Image15.Hide;

//  if Station.WorkMode = mdReceiveAndTransmitTracksSetup then
//  BEGIN
//    Image4.Visible:=true;
//    Station.HalfSetA.Rack1500.swModeControl:=6;
//    ImageList1.Draw(bmp.Canvas,0,0,Station.HalfSetA.Rack1500.swModeControl);
//    Image2.Picture.Bitmap:= bmp;
//    Image10.Visible:=true;
//
//    Station.HalfSetA.Rack1500.swWave1610_0 := Station.WaveTransmitA -1;
//    If Station.HalfSetA.Rack1500.swWave1610_0<10 then begin Label1.Caption:='0'+ inttostr(Station.HalfSetA.Rack1500.swWave1610_0)end else begin
//    Label1.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave1610_0) end;
//    If Station.HalfSetA.Rack1500.swWave1610_0<9 then begin Label2.Caption:='0'+inttostr(Station.HalfSetA.Rack1500.swWave1610_0+1)end else begin
//    Label2.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave1610_0+1)end;
//    If Station.HalfSetA.Rack1500.swWave1610_0<8 then begin Label3.Caption:='0'+inttostr(Station.HalfSetA.Rack1500.swWave1610_0+2)end else begin
//    Label3.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave1610_0+2)end;
//    If Station.HalfSetA.Rack1500.swWave1610_0=46 then begin
//     Label1.Caption:='45';
//     Label2.Caption:='46';
//     Label3.Caption:='' ;
//    end;
//
//
//    Station.HalfSetA.Rack1500.swWave161_R:= Station.WaveTransmitA -1;
//    If Station.HalfSetA.Rack1500.swWave161_R<10 then begin Label4.Caption:='0'+ inttostr(Station.HalfSetA.Rack1500.swWave161_R)end else begin
//    Label4.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave161_R) end;
//    If Station.HalfSetA.Rack1500.swWave161_R<9 then begin Label5.Caption:='0'+inttostr(Station.HalfSetA.Rack1500.swWave161_R+1)end else begin
//    Label5.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave161_R+1)end;
//    If Station.HalfSetA.Rack1500.swWave161_R<8 then begin Label6.Caption:='0'+inttostr(Station.HalfSetA.Rack1500.swWave161_R+2)end else begin
//    Label6.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave161_R+2)end;
//    If Station.HalfSetA.Rack1500.swWave161_R=46 then begin
//    Label4.Caption:='45';
//    Label5.Caption:='46';
//    Label6.Caption:='' ;
//    Inc(Station.HalfSetA.Rack1500.swWave161_R, 1);
//    end;
//
//
//    Label7.Caption:= IntToStr(Station.WaveTransmitA);
//    Station.HalfSetA.Rack1500.swWave1500 := Station.WaveTransmitA ;
//    Station.HalfSetA.Rack1500B.butMdOsn_1 := 1;
//      Rack1500bForm.ImageList3.Draw(bmp.Canvas,0,0,0);
//      Rack1500bForm.Image4.Picture.Bitmap:= bmp;
//    Station.HalfSetA.Rack1500B.butMdOsn_2 := 1;
//      Rack1500bForm.ImageList3.Draw(bmp.Canvas,0,0,2);
//      Rack1500bForm.Image5.Picture.Bitmap:= bmp;
//    Station.HalfSetA.Rack1500B.butMdOsn_3 := 1;
//      Rack1500bForm.ImageList3.Draw(bmp.Canvas,0,0,5);
//      Rack1500bForm.Image6.Picture.Bitmap:= bmp;
//    Station.HalfSetA.Rack1500B.but1622_1 :=0;
//      Rack1500bForm.ImageList1.Draw(bmp.Canvas,0,0,0);
//      Rack1500bForm.Image2.Picture.Bitmap:= bmp;
//    Station.HalfSetA.Rack1500B.but1622_2 :=0;
//      Rack1500bForm.ImageList2.Draw(bmp.Canvas,0,0,1);
//      Rack1500bForm.Image3.Picture.Bitmap:= bmp;
//  end;

  Reload;
end;

procedure TRack1500Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrLBV.Enabled := False;
  Station.CheckMoshnostA;
  Station.CheckMoshnostB;
  ReturnFromRack;
end;

procedure TRack1500Form.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
                                   MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1500Form.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
                                     MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

{$REGION 'Процедура TRack1500Form.Reload'}
procedure TRack1500Form.Reload;
begin;
  case CurFormId of
    idRack1500A:
      begin
        if ((not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) and (not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn))) then
        begin
          ModeControl;
        end
        else
          ModeControl(Station.HalfSetA.Rack1500.swModeControl + 1);

        imgAutomaticRight.Visible := Boolean(Station.HalfSetA.Rack1500.btnAutomatic = butPositionRight);
        if imgAutomaticRight.Visible then
          imgAutomaticRight.BringToFront;

        imgAutomaticLeft.Visible := Boolean(Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft);
        if imgAutomaticLeft.Visible then
          imgAutomaticLeft.BringToFront;

        imgModeControlRed.Visible := Boolean(Station.HalfSetA.Rack1500.butMode_R = butPositionRight);
        imgModeControlBlack.Visible := Boolean(Station.HalfSetA.Rack1500.butMode_R = butPositionLeft);

        ilSwModeControl.GetBitmap(Station.HalfSetA.Rack1500.swModeControl, imgSwModeControl.Picture.Bitmap);
        imgSwModeControl.Invalidate;

        ilSwWave1500.GetBitmap(Station.HalfSetA.Rack1500.swWave1500 mod 2, imgSwWave1500.Picture.Bitmap);
        imgSwWave1500.Invalidate;

        ilSwWave1600R.GetBitmap(Station.HalfSetA.Rack1500.swWave161_R mod 2, imgSwWave1600R.Picture.Bitmap);
        imgSwWave1600R.Invalidate;

        ilSwWave1610.GetBitmap(Station.HalfSetA.Rack1500.swWave1610_0 mod 2, imgSwWave1610.Picture.Bitmap);
        imgSwWave1610.Invalidate;

        ilSwPhaseSwitcher.GetBitmap(Station.HalfSetA.Rack1500.swPhaseMover mod 2, imgSwPhaseSwitcher.Picture.Bitmap);
        imgSwPhaseSwitcher.Invalidate;

        if Station.HalfSetA.Rack1500.swWave1610_0 < 10 then
          Label2.Caption := '0' + IntToStr(Station.HalfSetA.Rack1500.swWave1610_0)
        else
          Label2.Caption := IntToStr(Station.HalfSetA.Rack1500.swWave1610_0);
        if (Station.HalfSetA.Rack1500.swWave1610_0 - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetA.Rack1500.swWave1610_0 - 1) < 10 then
            Label3.Caption := '0' + IntToStr(Station.HalfSetA.Rack1500.swWave1610_0 - 1)
          else
            Label3.Caption :=  IntToStr(Station.HalfSetA.Rack1500.swWave1610_0 - 1)
        else
          label3.Caption := '';
        if (Station.HalfSetA.Rack1500.swWave1610_0 + 1) <= MAX_WAVE_VALUE then
          if (Station.HalfSetA.Rack1500.swWave1610_0 + 1) < 10 then
            Label1.Caption := '0' + IntToStr(Station.HalfSetA.Rack1500.swWave1610_0 + 1)
          else
            Label1.Caption := IntToStr(Station.HalfSetA.Rack1500.swWave1610_0 + 1)
        else
          Label1.Caption := '';

        if Station.HalfSetA.Rack1500.swWave161_R < 10 then
          Label5.Caption := '0' + IntToStr(Station.HalfSetA.Rack1500.swWave161_R)
        else
          Label5.Caption := IntToStr(Station.HalfSetA.Rack1500.swWave161_R);
        if (Station.HalfSetA.Rack1500.swWave161_R - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetA.Rack1500.swWave161_R - 1) < 10 then
            Label6.Caption := '0' + IntToStr(Station.HalfSetA.Rack1500.swWave161_R - 1)
          else
            Label6.Caption := IntToStr(Station.HalfSetA.Rack1500.swWave161_R - 1)
        else
          Label6.Caption := '';
        if (Station.HalfSetA.Rack1500.swWave161_R + 1) <= MAX_WAVE_VALUE then
          if (Station.HalfSetA.Rack1500.swWave161_R + 1) < 10 then
            Label4.Caption := '0' + IntToStr(Station.HalfSetA.Rack1500.swWave161_R + 1)
          else
            Label4.Caption := IntToStr(Station.HalfSetA.Rack1500.swWave161_R + 1)
        else
          Label4.Caption := '';

        If Station.HalfSetA.Rack1500.swWave1500 < 10 then
        begin
          Label7.Caption:='0'+ inttostr(Station.HalfSetA.Rack1500.swWave1500)
        end
        else
        begin
          Label7.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave1500)
        end;

        imgCableMdReservConnected.Visible := Boolean(Station.HalfSetA.Rack1500.CableMdReservState = csConnected);
        imgCableMdMainConnected.Visible := Boolean(Station.HalfSetA.Rack1500.CableMdMainState = csConnected);

        if Station.IsPluggedIn then
        begin
          imgWarningLight.Visible := Boolean(Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft);
        end;

        if Station.HalfSetA.Rack1500.stCableLoad = csDisconected then
        begin
          DisConnectCableNagruzka;
        end
        else
          if Station.HalfSetA.Rack1500.stCableLoad = csConnectedAtRack1500NoName then
          begin
            ConnectCableNagruzkaToFreePlace;
          end
          else
            ConnectCableNagruzkaToSh37;
        imgCableNagruzka.Invalidate;

        if Station.HalfSetA.Rack1500.stCableSh1 = csDisconected then
        begin
          DisConnectCable1840;
        end
        else
          if Station.HalfSetA.Rack1500.stCableSh1 = csConnectedAtRack1500NoName then
          begin
            ConnectCable1840ToFreePlace;
          end
          else
            ConnectCable1840ToSh37;
        imgCableSh37.Invalidate;
      end;

    idRack1500B:
      begin
        if ((not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn)) and (not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn))) then
        begin
          ModeControl;
        end
        else
        ModeControl(Station.HalfSetB.Rack1500.swModeControl + 1);

        imgAutomaticRight.Visible := Boolean(Station.HalfSetB.Rack1500.btnAutomatic = butPositionRight);
        if imgAutomaticRight.Visible then
          imgAutomaticRight.BringToFront;

        imgAutomaticLeft.Visible := Boolean(Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft);
        if imgAutomaticLeft.Visible then
          imgAutomaticLeft.BringToFront;

        imgModeControlRed.Visible := Boolean(Station.HalfSetB.Rack1500.butMode_R = butPositionRight);
        imgModeControlBlack.Visible := Boolean(Station.HalfSetB.Rack1500.butMode_R = butPositionLeft);

        ilSwModeControl.GetBitmap(Station.HalfSetB.Rack1500.swModeControl, imgSwModeControl.Picture.Bitmap);
        imgSwModeControl.Invalidate;

        ilSwWave1500.GetBitmap(Station.HalfSetB.Rack1500.swWave1500 mod 2, imgSwWave1500.Picture.Bitmap);
        imgSwWave1500.Invalidate;

        ilSwWave1600R.GetBitmap(Station.HalfSetB.Rack1500.swWave161_R mod 2, imgSwWave1600R.Picture.Bitmap);
        imgSwWave1600R.Invalidate;

        ilSwWave1610.GetBitmap(Station.HalfSetB.Rack1500.swWave1610_0 mod 2, imgSwWave1610.Picture.Bitmap);
        imgSwWave1610.Invalidate;

        ilSwPhaseSwitcher.GetBitmap(Station.HalfSetB.Rack1500.swPhaseMover mod 2, imgSwPhaseSwitcher.Picture.Bitmap);
        imgSwPhaseSwitcher.Invalidate;

        if Station.HalfSetB.Rack1500.swWave1610_0 < 10 then
          Label2.Caption := '0' + IntToStr(Station.HalfSetB.Rack1500.swWave1610_0)
        else
          Label2.Caption := IntToStr(Station.HalfSetB.Rack1500.swWave1610_0);
        if (Station.HalfSetB.Rack1500.swWave1610_0 - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetB.Rack1500.swWave1610_0 - 1) < 10 then
            Label3.Caption := '0' + IntToStr(Station.HalfSetB.Rack1500.swWave1610_0 - 1)
          else
            Label3.Caption :=  IntToStr(Station.HalfSetB.Rack1500.swWave1610_0 - 1)
        else
          label3.Caption := '';
        if (Station.HalfSetB.Rack1500.swWave1610_0 + 1) <= MAX_WAVE_VALUE then
          if (Station.HalfSetB.Rack1500.swWave1610_0 + 1) < 10 then
            Label1.Caption := '0' + IntToStr(Station.HalfSetB.Rack1500.swWave1610_0 + 1)
          else
            Label1.Caption := IntToStr(Station.HalfSetB.Rack1500.swWave1610_0 + 1)
        else
          Label1.Caption := '';

        if Station.HalfSetB.Rack1500.swWave161_R < 10 then
          Label5.Caption := '0' + IntToStr(Station.HalfSetB.Rack1500.swWave161_R)
        else
          Label5.Caption := IntToStr(Station.HalfSetB.Rack1500.swWave161_R);
        if (Station.HalfSetB.Rack1500.swWave161_R - 1) >= MIN_WAVE_VALUE then
          if (Station.HalfSetB.Rack1500.swWave161_R - 1) < 10 then
            Label6.Caption := '0' + IntToStr(Station.HalfSetB.Rack1500.swWave161_R - 1)
          else
            Label6.Caption := IntToStr(Station.HalfSetB.Rack1500.swWave161_R - 1)
        else
          Label6.Caption := '';
        if (Station.HalfSetB.Rack1500.swWave161_R + 1) <= MAX_WAVE_VALUE then
          if (Station.HalfSetB.Rack1500.swWave161_R + 1) < 10 then
            Label4.Caption := '0' + IntToStr(Station.HalfSetB.Rack1500.swWave161_R + 1)
          else
            Label4.Caption := IntToStr(Station.HalfSetB.Rack1500.swWave161_R + 1)
        else
          Label4.Caption := '';

        If Station.HalfSetB.Rack1500.swWave1500 < 10 then
        begin
          Label7.Caption:='0'+ inttostr(Station.HalfSetB.Rack1500.swWave1500)
        end
        else
        begin
          Label7.Caption:=inttostr(Station.HalfSetB.Rack1500.swWave1500)
        end;

        imgCableMdReservConnected.Visible := Boolean(Station.HalfSetB.Rack1500.CableMdReservState = csConnected);
        imgCableMdMainConnected.Visible := Boolean(Station.HalfSetB.Rack1500.CableMdMainState = csConnected);

        if Station.IsPluggedIn then
        begin
          imgWarningLight.Visible := Boolean(Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft);
        end;

        if Station.HalfSetB.Rack1500.stCableLoad = csDisconected then
        begin
          DisConnectCableNagruzka;
        end
        else
          if Station.HalfSetB.Rack1500.stCableLoad = csConnectedAtRack1500NoName then
          begin
            ConnectCableNagruzkaToFreePlace;
          end
          else
            ConnectCableNagruzkaToSh37;

        if Station.HalfSetB.Rack1500.stCableSh1 = csDisconected then
        begin
          DisConnectCable1840;
        end
        else
          if Station.HalfSetB.Rack1500.stCableSh1 = csConnectedAtRack1500NoName then
          begin
            ConnectCable1840ToFreePlace;
          end
          else
            ConnectCable1840ToSh37;
      end;
  end;

  imgWarningLight.Invalidate;
end;
{$ENDREGION}

{$REGION 'Обработка событий, связанных с img'}
procedure TRack1500Form.imgSpawnNagruzkaClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        if SelectedCable1500 = cb1500Nagruzka then
        begin
          Station.HalfSetA.Rack1500.stCableLoad := csConnectedAtRack1500NoName;
        end;
        if SelectedCable1500 = cb1500Sa37 then
        begin
          Station.HalfSetA.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;
        end;
      end;

    idRack1500B:
      begin
        if SelectedCable1500 = cb1500Nagruzka then
        begin
          Station.HalfSetB.Rack1500.stCableLoad := csConnectedAtRack1500NoName;
        end;
        if SelectedCable1500 = cb1500Sa37 then
        begin
          Station.HalfSetB.Rack1500.stCableSh1 := csConnectedAtRack1500NoName;
        end;
      end;
  end;

  imgSpawnSh37.Visible := False;
  imgSpawnNagruzka.Visible := False;

  Reload;
end;

procedure TRack1500Form.imgSpawnSh37Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        if SelectedCable1500 = cb1500Nagruzka then
        begin
          Station.HalfSetA.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
        end;
        if SelectedCable1500 = cb1500Sa37 then
        begin
          Station.HalfSetA.Rack1500.stCableSh1 := csConnectedAtRack1500Sh1;
        end;
      end;

    idRack1500B:
      begin
        if SelectedCable1500 = cb1500Nagruzka then
        begin
          Station.HalfSetB.Rack1500.stCableLoad := csConnectedAtRack1500Sh1;
        end;
        if SelectedCable1500 = cb1500Sa37 then
        begin
          Station.HalfSetB.Rack1500.stCableSh1 := csConnectedAtRack1500Sh1;
        end;
      end;
  end;

  imgSpawnSh37.Visible := False;
  imgSpawnNagruzka.Visible := False;

  Reload;
end;



procedure TRack1500Form.imgSwModeControlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1500A:
      begin
        If (button = mbright) and (Station.HalfSetA.Rack1500.swModeControl > 1) then
        begin
          If Station.HalfSetA.Rack1500.swModeControl <>0 then
          begin
             Dec(Station.HalfSetA.Rack1500.swModeControl, 1);
          end;
        end;
        If(button = mbleft)and(Station.HalfSetA.Rack1500.swModeControl < 10) then
        begin
          If Station.HalfSetA.Rack1500.swModeControl <>10 then
          begin
             Inc(Station.HalfSetA.Rack1500.swModeControl, 1);
          end;
        end;
      end;

    idRack1500B:
      begin
        If (button = mbright) and (Station.HalfSetB.Rack1500.swModeControl > 1) then
        begin
          If Station.HalfSetB.Rack1500.swModeControl <>0 then
          begin
             Dec(Station.HalfSetB.Rack1500.swModeControl, 1);
          end;
        end;
        If(button = mbleft)and(Station.HalfSetB.Rack1500.swModeControl < 10) then
        begin
          If Station.HalfSetB.Rack1500.swModeControl <>10 then
          begin
             Inc(Station.HalfSetB.Rack1500.swModeControl, 1);
          end;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1500Form.imgModeControlRedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        Station.HalfSetA.Rack1500.butMode_R := butPositionLeft;
      end;
    idRack1500B:
      begin
        Station.HalfSetB.Rack1500.butMode_R := butPositionLeft;
      end;
  end;

  Reload;
end;


procedure TRack1500Form.imgSwWave1610MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  case CurFormId of
    idRack1500A:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetA.Rack1500.swWave1610_0 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        If (button=mbleft)and(Station.HalfSetA.Rack1500.swWave1610_0 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetA.Rack1500.swWave1610_0, 1);
        end;

        If (button=mbright)and(Station.HalfSetA.Rack1500.swWave1610_0 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetA.Rack1500.swWave1610_0, 1);
        end;
      end;

    idRack1500B:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetB.Rack1500.swWave1610_0 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        If (button=mbleft)and(Station.HalfSetB.Rack1500.swWave1610_0 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetB.Rack1500.swWave1610_0, 1);
        end;

        If (button=mbright)and(Station.HalfSetB.Rack1500.swWave1610_0 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetB.Rack1500.swWave1610_0, 1);
        end;
      end;
  end;

  Reload;
end;




procedure TRack1500Form.imgSwWave1600RMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  case CurFormId of
    idRack1500A:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetA.Rack1500.swWave161_R := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;
        If (button = mbleft) and (Station.HalfSetA.Rack1500.swWave161_R < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetA.Rack1500.swWave161_R, 1);
        end;
        If (Button = mbRight) and (Station.HalfSetA.Rack1500.swWave161_R > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetA.Rack1500.swWave161_R , 1);
        end;
      end;

    idRack1500B:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetB.Rack1500.swWave161_R := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        If (button = mbleft) and (Station.HalfSetB.Rack1500.swWave161_R < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetB.Rack1500.swWave161_R, 1);
        end;
        If (Button = mbRight) and (Station.HalfSetB.Rack1500.swWave161_R > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetB.Rack1500.swWave161_R , 1);
        end;
      end;
  end;

  Reload;
end;


procedure TRack1500Form.imgSwPhaseSwitcherMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case CurFormId of
    idRack1500A:
      begin
        if (Button = mbLeft) and (Station.HalfSetA.Rack1500.swPhaseMover < 20) then
        begin
          Inc(Station.HalfSetA.Rack1500.swPhaseMover, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetA.Rack1500.swPhaseMover > 1) then
        begin
          Dec(Station.HalfSetA.Rack1500.swPhaseMover, 1);
        end;

        ilSwPhaseSwitcher.GetBitmap(Station.HalfSetA.Rack1500.swPhaseMover mod 2, imgSwPhaseSwitcher.Picture.Bitmap);
        imgSwPhaseSwitcher.Invalidate;

        if Station.HalfSetA.Rack1500.butMode_R = butPositionLeft then
        begin
          //---------------------------------------РАСФАЗИРОВКА----------------------------------
          if ((Station.HalfSetA.Rack1920.stLBV1_TurnedOn) and (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn))) or
          ((Station.HalfSetA.Rack1920.stLBV2_TurnedOn) and (not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn))) then
          begin
            //Включена одна лампа - максимальная расфазировка
            ModeControl(6);
          end
          else
          begin
            //Включены обе лампы - регулируем положение
            case Station.HalfSetA.Rack1500.swPhaseMover of
              0:
                ModeControl(11);
              1:
                ModeControl(10);
              2:
                ModeControl(9);
              3:
                ModeControl(8);
              4:
                ModeControl(7);
              5:
                ModeControl(6);
              6:
                ModeControl(5);
              7:
                ModeControl(4);
              8:
                ModeControl(3);
              9:
                ModeControl(2);
              10:
                ModeControl(1);
              11:
                ModeControl(2);
              12:
                ModeControl(3);
              13:
                ModeControl(4);
              14:
                ModeControl(5);
              15:
                ModeControl(6);
              16:
                ModeControl(7);
              17:
                ModeControl(8);
              18:
                ModeControl(9);
              19:
                ModeControl(10);
              20:
                ModeControl(11);
            end;
          end;
        end
        else
        begin
          ModeControl;
//          if ((Station.HalfSetA.Rack1920.stLBV1_TurnedOn) and (Station.HalfSetA.Rack1920.stLBV2_TurnedOn)) then
//          begin
//
//          end;
//
//          if (((Station.HalfSetA.Rack1920.stLBV1_TurnedOn) and (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn))) or
//          ((not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) and (Station.HalfSetA.Rack1920.stLBV2_TurnedOn))) then
//          begin
//
//          end;
//
//          if ((Station.HalfSetA.Rack1920.stLBV1_TurnedOn = False) and (Station.HalfSetA.Rack1920.stLBV2_TurnedOn = False)) then
//            ModeControl(1);
        end;
      end;

    idRack1500B:
      begin
        if (Button = mbLeft) and (Station.HalfSetB.Rack1500.swPhaseMover < 20) then
        begin
          Inc(Station.HalfSetB.Rack1500.swPhaseMover, 1);
        end;
        if (Button = mbRight) and (Station.HalfSetB.Rack1500.swPhaseMover > 1) then
        begin
          Dec(Station.HalfSetB.Rack1500.swPhaseMover, 1);
        end;

        ilSwPhaseSwitcher.GetBitmap(Station.HalfSetB.Rack1500.swPhaseMover mod 2, imgSwPhaseSwitcher.Picture.Bitmap);
        imgSwPhaseSwitcher.Invalidate;

        if Station.HalfSetB.Rack1500.butMode_R = butPositionLeft then
        begin
          //---------------------------------------РАСФАЗИРОВКА----------------------------------
          if ((Station.HalfSetB.Rack1920.stLBV1_TurnedOn) and (not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn))) or
          ((Station.HalfSetB.Rack1920.stLBV2_TurnedOn) and (not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn))) then
          begin
            //Включена одна лампа - максимальная расфазировка
            ModeControl(6);
          end
          else
          begin
            //Включены обе лампы - регулируем положение
            case Station.HalfSetB.Rack1500.swPhaseMover of
              0:
                ModeControl(11);
              1:
                ModeControl(10);
              2:
                ModeControl(9);
              3:
                ModeControl(8);
              4:
                ModeControl(7);
              5:
                ModeControl(6);
              6:
                ModeControl(5);
              7:
                ModeControl(4);
              8:
                ModeControl(3);
              9:
                ModeControl(2);
              10:
                ModeControl(1);
              11:
                ModeControl(2);
              12:
                ModeControl(3);
              13:
                ModeControl(4);
              14:
                ModeControl(5);
              15:
                ModeControl(6);
              16:
                ModeControl(7);
              17:
                ModeControl(8);
              18:
                ModeControl(9);
              19:
                ModeControl(10);
              20:
                ModeControl(11);
            end;
          end;
        end
        else
        begin

        end;
      end;
  end;
end;

procedure TRack1500Form.imgSwPhaseSwitcherMouseEnter(Sender: TObject);
var
  btA: Byte;
begin
  //Перерисуем выносной дисплей
  if pnlPhaseMover.Visible then
  begin
    for btA := 1 to 10 do
    begin
      if imgsModeControl[btA].Visible then
        imgPhaseMoverAdditional.Picture :=  imgsModeControl[btA].Picture;
    end;
    imgPhaseMoverAdditional.Invalidate;
  end;
  imgPhaseMoverAdditional.Invalidate;
end;

procedure TRack1500Form.imgSwPhaseSwitcherMouseLeave(Sender: TObject);
begin
  pnlPhaseMover.Visible := False;
end;

procedure TRack1500Form.imgSwPhaseSwitcherMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  pnlPhaseMover.Visible := True;
end;

procedure TRack1500Form.imgSwWave1500MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  strDigit: string;
  btDigit: Byte;
begin
  case CurFormId of
    idRack1500A:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetA.Rack1500.swWave1500 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        if (button = mbLeft) and (Station.HalfSetA.Rack1500.swWave1500 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetA.Rack1500.swWave1500, 1);
          If Station.HalfSetA.Rack1500.swWave1500 <10 then
          begin
            Label7.Caption:='0'+inttostr(Station.HalfSetA.Rack1500.swWave1500);
          end
          else
          begin
            Label7.Caption:= inttostr(Station.HalfSetA.Rack1500.swWave1500);
          end;
        end;

        If (button=mbright) and (Station.HalfSetA.Rack1500.swWave1500 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetA.Rack1500.swWave1500, 1);
          If Station.HalfSetA.Rack1500.swWave1500 < 10 then
          begin
            Label7.Caption:='0'+ inttostr(Station.HalfSetA.Rack1500.swWave1500)
          end
          else
          begin
            Label7.Caption:=inttostr(Station.HalfSetA.Rack1500.swWave1500)
          end;
        end;
      end;

    idRack1500B:
      begin
        if Button = mbMiddle then
        begin
          if not(InputQuery('Введите значение волны', PName, strDigit)) then
            Exit;
          if Trim(strDigit) = '' then
            Exit;
          try
            btDigit := StrToInt(strDigit);
            Station.HalfSetB.Rack1500.swWave1500 := btDigit;
          except
            Application.MessageBox(PChar('Введите число от ' + IntToStr(MIN_WAVE_VALUE) + ' до ' + IntToStr(MAX_WAVE_VALUE) + '!'),
            PChar(PName), MB_OK + MB_ICONSTOP);
            Exit;
          end;
        end;

        if (button = mbLeft) and (Station.HalfSetB.Rack1500.swWave1500 < MAX_WAVE_VALUE) then
        begin
          Inc(Station.HalfSetB.Rack1500.swWave1500, 1);
          If Station.HalfSetB.Rack1500.swWave1500 <10 then
          begin
            Label7.Caption:='0'+inttostr(Station.HalfSetB.Rack1500.swWave1500);
          end
          else
          begin
            Label7.Caption:= inttostr(Station.HalfSetB.Rack1500.swWave1500);
          end;
        end;

        If (button=mbright) and (Station.HalfSetB.Rack1500.swWave1500 > MIN_WAVE_VALUE) then
        begin
          Dec(Station.HalfSetB.Rack1500.swWave1500, 1);
          If Station.HalfSetB.Rack1500.swWave1500 < 10 then
          begin
            Label7.Caption:='0'+ inttostr(Station.HalfSetB.Rack1500.swWave1500)
          end
          else
          begin
            Label7.Caption:=inttostr(Station.HalfSetB.Rack1500.swWave1500)
          end;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1500Form.imgAutomaticLeftClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      Station.HalfSetA.Rack1500.btnAutomatic := butPositionRight;
    idRack1500B:
      Station.HalfSetB.Rack1500.btnAutomatic := butPositionRight;
  end;

  Reload;
end;

procedure TRack1500Form.imgMd0SelectClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        if Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetA.Rack1500.DropError := False;
          Station.HalfSetA.Rack1500.SelectedMd := smdMain;
        end;
      end;
    idRack1500B:
      begin
        if Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetB.Rack1500.SelectedMd := smdMain;
          Station.HalfSetB.Rack1500.DropError := False;
        end;
      end;
  end;
end;

procedure TRack1500Form.imgMd0SelectMouseLeave(Sender: TObject);
begin
  imgMd0Select.Visible := False;
end;

procedure TRack1500Form.imgMdRSelectClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        if Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetA.Rack1500.SelectedMd := smdRetr;
          Station.HalfSetA.Rack1500.DropError := False;
        end;
      end;
    idRack1500B:
      begin
        if Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetB.Rack1500.SelectedMd := smdRetr;
          Station.HalfSetB.Rack1500.DropError := False;
        end;
      end;
  end;
end;

procedure TRack1500Form.imgMdRSelectMouseLeave(Sender: TObject);
begin
  imgMdRSelect.Visible := False;
end;

procedure TRack1500Form.imgRetrMainSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        if Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetA.Rack1500.SelectedRetr := sRetrMain;
          Station.HalfSetA.Rack1500.DropError := False;
        end;
      end;
    idRack1500B:
      begin
        if Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetB.Rack1500.SelectedRetr := sRetrMain;
          Station.HalfSetB.Rack1500.DropError := False;
        end;
      end;
  end;
end;

procedure TRack1500Form.imgRetrMainSelectedMouseLeave(Sender: TObject);
begin
  imgRetrMainSelected.Visible := False;
end;

procedure TRack1500Form.imgRetrReserveSelectedClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        if Station.HalfSetA.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetA.Rack1500.SelectedRetr := sRetrReserv;
          Station.HalfSetA.Rack1500.DropError := False;
        end;
      end;
    idRack1500B:
      begin
        if Station.HalfSetB.Rack1500.btnAutomatic = butPositionLeft then
        begin
          Station.HalfSetB.Rack1500.SelectedRetr := sRetrReserv;
          Station.HalfSetB.Rack1500.DropError := False;
        end;
      end;
  end;
end;

procedure TRack1500Form.imgRetrReserveSelectedMouseLeave(Sender: TObject);
begin
  imgRetrReserveSelected.Visible := False;
end;

procedure TRack1500Form.imgMd0MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgMd0Select.Visible:=true;
  imgMd0Select.BringToFront;
end;

procedure TRack1500Form.imgMdRMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgMdRSelect.Visible:=true;
  imgMdRSelect.BringToFront;
end;

procedure TRack1500Form.imgRetrMainLightClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        if Station.HalfSetA.Rack1500.SelectedMd = smdMain then
          Station.HalfSetA.Rack1500.DropError := False;
      end;
    idRack1500B:
      begin
        if Station.HalfSetB.Rack1500.SelectedMd = smdMain then
          Station.HalfSetB.Rack1500.DropError := False;
      end;
  end;
end;

procedure TRack1500Form.imgRetrMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgRetrMainSelected.Visible:=true;
  imgRetrMainSelected.BringToFront;
end;

procedure TRack1500Form.imgRetrReserveMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgRetrReserveSelected.Visible:=true;
  imgRetrReserveSelected.BringToFront;
end;

procedure TRack1500Form.imgAutomaticRightClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      Station.HalfSetA.Rack1500.btnAutomatic := butPositionLeft;
    idRack1500B:
      Station.HalfSetB.Rack1500.btnAutomatic := butPositionLeft;
  end;

  Reload;
end;

procedure TRack1500Form.imgModeControlBlackClick(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      Station.HalfSetA.Rack1500.butMode_R := butPositionRight;
    idRack1500B:
      Station.HalfSetB.Rack1500.butMode_R := butPositionRight;
  end;

  Reload;
end;

procedure TRack1500Form.imgBGMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgMd0Select.Visible := False;
  imgMdRSelect.Visible := False;
  imgRetrMainSelected.Visible:=false;
  imgRetrReserveSelected.Visible:=false;

  If Vidimost=false then
  begin
    Image14.BringToFront;                    //Снять выделение с верхних
    Image11.SendToBack;                      //ручек стойки
    Image13.BringToFront;
    Image12.SendToBack;

    Vidimost:=true;
  end;
  if (Station.WorkMode = mdExternalView) then
    Image15.Show;
end;

procedure TRack1500Form.imgCableMdMainConnectedClick(Sender: TObject);
begin
case CurFormId of
    idRack1500A:
      begin
        Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
      end;
    idRack1500B:
      begin
        Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
      end;
  end;
  imgCableMdMainConnected.Hide;
  WaveMeterForm.Close;
     Reload;
end;

procedure TRack1500Form.imgCableMdReservConnectedClick(Sender: TObject);
begin

case CurFormId of
    idRack1500A:
      begin
        Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
      end;
    idRack1500B:
      begin
        Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
      end;
  end;
  imgCableMdReservConnected.Hide;
  WaveMeterForm.Close;
     Reload;
end;

procedure TRack1500Form.imgCableNagruzkaClick(Sender: TObject);
begin
  SelectedCable1500 := cb1500Nagruzka;
  case CurFormId of
    idRack1500A:
      begin
        if Station.HalfSetA.Rack1500.stCableLoad = csDisconected then
        begin
          imgSpawnNagruzka.Visible := Boolean(Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500NoName);
          imgSpawnSh37.Visible := Boolean(Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1);
          imgSpawnNagruzka.Invalidate;
          imgSpawnSh37.Invalidate;
        end
        else
        begin
          Station.HalfSetA.Rack1500.stCableLoad := csDisconected;
        end;
      end;

    idRack1500B:
      begin
        if Station.HalfSetB.Rack1500.stCableLoad = csDisconected then
        begin
          imgSpawnNagruzka.Visible := Boolean(Station.HalfSetB.Rack1500.stCableSh1 <> csConnectedAtRack1500NoName);
          imgSpawnSh37.Visible := Boolean(Station.HalfSetB.Rack1500.stCableSh1 <> csConnectedAtRack1500Sh1);
          imgSpawnNagruzka.Invalidate;
          imgSpawnSh37.Invalidate;
        end
        else
        begin
          Station.HalfSetB.Rack1500.stCableLoad := csDisconected;
        end;
      end;
  end;

  Reload;
end;

procedure TRack1500Form.imgCableSh37Click(Sender: TObject);
begin
  SelectedCable1500 := cb1500Sa37;
  case CurFormId of
    idRack1500A:
      begin
        if Station.HalfSetA.Rack1500.stCableSh1 = csDisconected then
        begin
          imgSpawnNagruzka.Visible := Boolean(Station.HalfSetA.Rack1500.stCableLoad <> csConnectedAtRack1500NoName);
          imgSpawnSh37.Visible := Boolean(Station.HalfSetA.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1);
          imgSpawnNagruzka.Invalidate;
          imgSpawnSh37.Invalidate;
        end
        else
        begin
          Station.HalfSetA.Rack1500.stCableSh1 := csDisconected;
        end;
      end;

    idRack1500B:
      begin
        if Station.HalfSetB.Rack1500.stCableSh1 = csDisconected then
        begin
          imgSpawnNagruzka.Visible := Boolean(Station.HalfSetB.Rack1500.stCableLoad <> csConnectedAtRack1500NoName);
          imgSpawnSh37.Visible := Boolean(Station.HalfSetB.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1);
          imgSpawnNagruzka.Invalidate;
          imgSpawnSh37.Invalidate;
        end
        else
        begin
          Station.HalfSetB.Rack1500.stCableSh1 := csDisconected;
        end;
      end;
  end;

  Reload;
end;

/// <summary>
/// Выделяет верхние ручки для выдвижения стойки
/// </summary>
procedure TRack1500Form.Image13MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Vidimost=true then
  begin
    Image11.BringToFront;
    Image14.SendToBack;
    Image13.SendToBack;
    Image12.BringToFront;
    Vidimost:=false;
    {Image12.Enabled:=true;
    Image12.Visible:=true;
    Image11.Enabled:=true;
    Image11.Visible:=true; }
    //I//mage21.BringToFront;
    //Image25.BringToFront;
  end;
end;

/// <summary>
/// Выделяет верхние ручки для выдвижения стойки
/// </summary>
procedure TRack1500Form.Image14MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If Vidimost=true then
  begin
    Image11.BringToFront;
    Image14.SendToBack;
    Image13.SendToBack;
    Image12.BringToFront;
    Vidimost:=false;
    {Image12.Enabled:=true;
    Image12.Visible:=true;
    Image11.Enabled:=true;
    Image11.Visible:=true; }
  end;
end;

procedure TRack1500Form.Image15MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Image15.Hide;
end;

procedure TRack1500Form.Image11Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        //StationR414Form.SpawnForm(idRack1500Aback);
        Rack1500back := TRack1500bForm.Create(Self, CurFormId, Station, TaskController);
        Image15.BringToFront;
      end;
    idRack1500B:
      begin
        //StationR414Form.SpawnForm(idRack1500Bback);
        Rack1500back := TRack1500bForm.Create(Self, CurFormId, Station, TaskController);
        Image15.BringToFront;
      end;
  end;
end;

procedure TRack1500Form.Image11MouseMove(Sender: TObject; Shift: TShiftState;
                                    X, Y: Integer);
begin
//  if (X > (Sender as TImage).Width - CloseLabelXAxesOffset) and
//      (Y < CloseLabelYAxesOffset)
//  then
//    SetCloseLabelState(True, Y)
//  else
//    SetCloseLabelState(False, Y);
end;

procedure TRack1500Form.Image12Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      begin
        //StationR414Form.SpawnForm(idRack1500Aback);
        Rack1500back := TRack1500bForm.Create(Self, CurFormId, Station, TaskController);
        Image15.BringToFront;
      end;
    idRack1500B:
      begin
        //StationR414Form.SpawnForm(idRack1500Bback);
        Rack1500back := TRack1500bForm.Create(Self, CurFormId, Station, TaskController);
        Image15.BringToFront;
      end;
  end;
end;

procedure TRack1500Form.Image12MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Station.WorkMode = mdExternalView) then
    Image15.Show;
end;

{$ENDREGION}

{$REGION 'Функция tmrLBVTimer'}
procedure TRack1500Form.tmrLBVTimer(Sender: TObject);
begin
  tmrLBV.Interval := 1000;

  case CurFormId of
    idRack1500A:
      if Station.IsPluggedIn then
      begin
        if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) then
        begin
          if Station.HalfSetA.Rack1500.swPhaseMover = 10 then
            imgRasfaz.Visible := True
          else
            imgRasfaz.Visible := not(imgRasfaz.Visible);
        end
        else
          imgRasfaz.Visible := not(imgRasfaz.Visible);
        imgRasfaz.Invalidate;

        if Station.HalfSetA.Rack1920.stLBV1_TurnedOn then
        begin
          imgLBV1Light.Visible := Station.HalfSetA.Rack1920.stLBV1_TurnedOn;
          imgVentilator1540_1.Visible := Station.HalfSetA.Rack1920.stLBV1_TurnedOn;
        end
        else
        begin
          imgLBV1Light.Visible := not(imgLBV1Light.Visible);
          imgVentilator1540_1.Visible := imgLBV1Light.Visible;
        end;

        if Station.HalfSetA.Rack1920.stLBV2_TurnedOn then
        begin
          imgLBV2Light.Visible := Station.HalfSetA.Rack1920.stLBV2_TurnedOn;
          imgVentilator1540_2.Visible := Station.HalfSetA.Rack1920.stLBV2_TurnedOn;
        end
        else
        begin
          imgLBV2Light.Visible := not(imgLBV2Light.Visible);
          imgVentilator1540_2.Visible := imgLBV2Light.Visible;
        end;

        if Station.HalfSetA.Rack1920.stLBV1_TurnedOn or Station.HalfSetA.Rack1920.stLBV2_TurnedOn then
          imgMoshnost.Visible := True
        else
          imgMoshnost.Visible := not(imgMoshnost.Visible);



        if Station.PowerPanel.sw1900Power = 1 then
        begin
          case Station.HalfSetA.Rack1500.SelectedMd of
            NotSelected:
              begin
                imgMd0Light.Visible := not(imgMd0Light.Visible);
                imgMdRLight.Visible := not(imgMdRLight.Visible);
              end;
            smdMain:
              begin
                imgMd0Light.Visible := True;
                if Station.HalfSetA.Rack1500.DropError then
                  imgMdRLight.Visible := False
                else
                  imgMdRLight.Visible := not(imgMdRLight.Visible);
              end;
            smdRetr:
              begin
                imgMdRLight.Visible := True;
                if Station.HalfSetA.Rack1500.DropError then
                  imgMd0Light.Visible := False
                else
                  imgMd0Light.Visible := not(imgMd0Light.Visible);
              end;
          end;

          case Station.HalfSetA.Rack1500.SelectedRetr of
            NotSelected:
              begin
                imgRetrMainLight.Visible := not(imgRetrMainLight.Visible);
                imgRetrReservLight.Visible := not(imgRetrReservLight.Visible);
              end;
            sRetrMain:
              begin
                imgRetrMainLight.Visible := True;
                if Station.HalfSetA.Rack1500.DropError then
                  imgRetrReservLight.Visible := False
                else
                  imgRetrReservLight.Visible := not(imgRetrReservLight.Visible);
              end;
            sRetrReserv:
              begin
                imgRetrReservLight.Visible := True;
                if Station.HalfSetA.Rack1500.DropError then
                  imgRetrMainLight.Visible := False
                else
                  imgRetrMainLight.Visible := not(imgRetrMainLight.Visible);
              end;
          end;
        end;
      end
      else
      begin
        imgLBV2Light.Visible := False;
        imgLBV1Light.Visible := False;
        imgRetrMainLight.Visible := False;
        imgRetrReservLight.Visible := False;
        imgMoshnost.Visible := False;
        imgMd0Light.Visible := False;
        imgVentilator1540_1.Visible := False;
        imgVentilator1540_2.Visible := False;
        imgRasfaz.Visible := False;
      end;

    idRack1500B:
      if Station.IsPluggedIn then
      begin
        if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) then
        begin
          if Station.HalfSetB.Rack1500.swPhaseMover = 10 then
            imgRasfaz.Visible := True
          else
            imgRasfaz.Visible := not(imgRasfaz.Visible);
        end
        else
          imgRasfaz.Visible := not(imgRasfaz.Visible);
        imgRasfaz.Invalidate;

        if Station.HalfSetB.Rack1920.stLBV1_TurnedOn then
        begin
          imgLBV1Light.Visible := Station.HalfSetB.Rack1920.stLBV1_TurnedOn;
          imgVentilator1540_1.Visible := Station.HalfSetB.Rack1920.stLBV1_TurnedOn;
        end
        else
        begin
          imgLBV1Light.Visible := not(imgLBV1Light.Visible);
          imgVentilator1540_1.Visible := imgLBV1Light.Visible;
        end;

        if Station.HalfSetB.Rack1920.stLBV2_TurnedOn then
        begin
          imgLBV2Light.Visible := Station.HalfSetB.Rack1920.stLBV2_TurnedOn;
          imgVentilator1540_2.Visible := Station.HalfSetB.Rack1920.stLBV2_TurnedOn;
        end
        else
        begin
          imgLBV2Light.Visible := not(imgLBV2Light.Visible);
          imgVentilator1540_2.Visible := imgLBV2Light.Visible;
        end;

        if Station.HalfSetB.Rack1920.stLBV1_TurnedOn or Station.HalfSetB.Rack1920.stLBV2_TurnedOn then
          imgMoshnost.Visible := True
        else
          imgMoshnost.Visible := not(imgMoshnost.Visible);



        if Station.PowerPanel.sw1900Power = 1 then
        begin
          case Station.HalfSetB.Rack1500.SelectedMd of
            NotSelected:
              begin
                imgMd0Light.Visible := not(imgMd0Light.Visible);
                imgMdRLight.Visible := not(imgMdRLight.Visible);
              end;
            smdMain:
              begin
                imgMd0Light.Visible := True;
                if Station.HalfSetB.Rack1500.DropError then
                  imgMdRLight.Visible := False
                else
                  imgMdRLight.Visible := not(imgMdRLight.Visible);
              end;
            smdRetr:
              begin
                imgMdRLight.Visible := True;
                if Station.HalfSetB.Rack1500.DropError then
                  imgMd0Light.Visible := False
                else
                  imgMd0Light.Visible := not(imgMd0Light.Visible);
              end;
          end;

          case Station.HalfSetB.Rack1500.SelectedRetr of
            NotSelected:
              begin
                imgRetrMainLight.Visible := not(imgRetrMainLight.Visible);
                imgRetrReservLight.Visible := not(imgRetrReservLight.Visible);
              end;
            sRetrMain:
              begin
                imgRetrMainLight.Visible := True;
                if Station.HalfSetB.Rack1500.DropError then
                  imgRetrReservLight.Visible := False
                else
                  imgRetrReservLight.Visible := not(imgRetrReservLight.Visible);
              end;
            sRetrReserv:
              begin
                imgRetrReservLight.Visible := True;
                if Station.HalfSetB.Rack1500.DropError then
                  imgRetrMainLight.Visible := False
                else
                  imgRetrMainLight.Visible := not(imgRetrMainLight.Visible);
              end;
          end;
        end;
      end
      else
      begin
        imgLBV2Light.Visible := False;
        imgLBV1Light.Visible := False;
        imgRetrMainLight.Visible := False;
        imgRetrReservLight.Visible := False;
        imgMoshnost.Visible := False;
        imgMd0Light.Visible := False;
        imgVentilator1540_1.Visible := False;
        imgVentilator1540_2.Visible := False;
        imgRasfaz.Visible := False;
      end;
  end;
end;
{$ENDREGION}

{$REGION 'Процедура TRack1500Form.ModeControl'}
procedure TRack1500Form.ModeControl(ShownImageId: Byte = NotSelected);
var
  btA: Byte;
begin
  imgWindow0.Visible := True;
  imgWindow0.Invalidate;
  for btA := 1 to 10 do
  begin
    imgsModeControl[btA].Visible := False;
    imgsModeControl[btA].Invalidate;
  end;
  for btA := 1 to 11 do
  begin
    imgsBlack[btA].Visible := False;
    imgsBlack[btA].Invalidate;
    imgsRed[btA].Visible := False;
    imgsRed[btA].Invalidate;
  end;
  //Перерисуем выносной дисплей
  if pnlPhaseMover.Visible then
  begin
    imgPhaseMoverAdditional.Picture.Assign(nil);
  end;

  case CurFormId of
    idRack1500A:
      begin
        if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
        begin
          if Station.HalfSetA.Rack1500.butMode_R = butPositionLeft then
          begin
            //---------------------Расфаз----------------------
            for btA := 1 to 11 do
            begin
              imgsBlack[btA].Visible := False;
              imgsBlack[btA].Invalidate;
            end;

            if Station.HalfSetA.Rack1500.swModeControl = 6 then
            begin
              if (((Station.HalfSetA.Rack1920.stLBV1_TurnedOn) and (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn))) or
              ((Station.HalfSetA.Rack1920.stLBV2_TurnedOn) and (not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)))) or
              ((not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) and (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn)))then
              begin
                //Включена одна лампа - максимальная расфазировка
                imgWindow10.Visible := True;
                imgWindow10.Invalidate;
              end
              else
              begin
                //Включены обе лампы - регулируем положение
                case Station.HalfSetA.Rack1500.swPhaseMover of
                  0, 20:
                    begin
                      imgWindow10.Visible := True;
                      imgWindow10.Invalidate;
                      imgWindow10.BringToFront;
                    end;
                  1, 19:
                    begin
                      imgWindow9.Visible := True;
                      imgWindow9.Invalidate;
                      imgWindow9.BringToFront;
                    end;
                  2, 18:
                    begin
                      imgWindow8.Visible := True;
                      imgWindow8.Invalidate;
                      imgWindow8.BringToFront;
                    end;
                  3, 17:
                    begin
                      imgWindow7.Visible := True;
                      imgWindow7.Invalidate;
                      imgWindow7.BringToFront;
                    end;
                  4, 16:
                    begin
                      imgWindow6.Visible := True;
                      imgWindow6.Invalidate;
                      imgWindow6.BringToFront;
                    end;
                  5, 15:
                    begin
                      imgWindow5.Visible := True;
                      imgWindow5.Invalidate;
                      imgWindow5.BringToFront;
                    end;
                  6, 14:
                    begin
                      imgWindow4.Visible := True;
                      imgWindow4.Invalidate;
                      imgWindow4.BringToFront;
                    end;
                  7, 13:
                    begin
                      imgWindow3.Visible := True;
                      imgWindow3.Invalidate;
                      imgWindow3.BringToFront;
                    end;
                  8, 12:
                    begin
                      imgWindow2.Visible := True;
                      imgWindow2.Invalidate;
                      imgWindow2.BringToFront;
                    end;
                  9, 11:
                    begin
                      imgWindow1.Visible := True;
                      imgWindow1.Invalidate;
                      imgWindow1.BringToFront;
                    end;
                  10:
                    begin
                      imgWindow0.Visible := True;
                      imgWindow0.Invalidate;
                      imgWindow0.BringToFront;
                    end;
                end;
              end;
            end
            else
            begin
              if ShownImageId <> NotSelected then
              begin
                imgsBlack[ShownImageId].Visible := True;
                imgsBlack[ShownImageId].Invalidate;
                imgsBlack[ShownImageId].BringToFront;
              end;
            end;
          end
          else
          begin
            //---------------------Мощность----------------------
            for btA := 1 to 11 do
            begin
              imgsRed[btA].Visible := False;
              imgsRed[btA].Invalidate;
            end;
            if Station.HalfSetA.Rack1500.swModeControl = 6 then
            begin
              if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) and (Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
              begin
                //Включены обе лампы
                if Station.HalfSetA.Rack1500.swPhaseMover = 10 then
                begin
                  imgWindow10.Visible := True;
                  imgWindow10.Invalidate;
                  imgWindow10.BringToFront;
                end
                else
                  if Station.HalfSetA.Rack1500.swPhaseMover < 10 then
                  begin
                    imgsModeControl[11 - Station.HalfSetA.Rack1500.swPhaseMover].Visible := True;
                    imgsModeControl[11 - Station.HalfSetA.Rack1500.swPhaseMover].Invalidate;
                  end
                  else
                  begin
                    imgsModeControl[11 - Station.HalfSetA.Rack1500.swPhaseMover - 10].Visible := True;
                    imgsModeControl[11 - Station.HalfSetA.Rack1500.swPhaseMover - 10].Invalidate;
                  end;
                Exit;
              end
              else
                if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
                begin
                  //Включена одна лампа
                  if Station.HalfSetA.Rack1500.swPhaseMover = 10 then
                  begin
                    imgsModeControl[6].Visible := True;
                    imgsModeControl[6].Invalidate;
                  end
                  else
                    if Station.HalfSetA.Rack1500.swPhaseMover < 10 then
                    begin
                      if Abs(5 - Station.HalfSetA.Rack1500.swPhaseMover) = 0 then

                      else
                      begin
                        imgsModeControl[Abs(5 - Station.HalfSetA.Rack1500.swPhaseMover)].Visible := True;
                        imgsModeControl[Abs(5 - Station.HalfSetA.Rack1500.swPhaseMover)].Invalidate;
                      end;
                    end
                    else
                    begin
                      if Abs(5 - Station.HalfSetA.Rack1500.swPhaseMover + 10) = 0 then

                      else
                      begin
                        imgsModeControl[Abs(5 - Station.HalfSetA.Rack1500.swPhaseMover + 10)].Visible := True;
                        imgsModeControl[Abs(5 - Station.HalfSetA.Rack1500.swPhaseMover + 10)].Invalidate;
                      end;
                    end;
                  Exit;
                end;
            end
            else
            begin
              if ShownImageId <> NotSelected then
              begin
                imgsRed[ShownImageId].Visible := True;
                imgsRed[ShownImageId].Invalidate;
                imgsRed[ShownImageId].BringToFront;
              end;
            end;
          end;
        end
        else
        begin
          for btA := 1 to 11 do
          begin
            imgsBlack[btA].Visible := False;
            imgsBlack[btA].Invalidate;
          end;
          for btA := 1 to 11 do
          begin
            imgsRed[btA].Visible := False;
            imgsRed[btA].Invalidate;
          end;

          if ((not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) and (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn))) then
          begin

          end
          else
          begin
            if (Station.HalfSetA.Rack1920.stLBV1_TurnedOn and Station.HalfSetA.Rack1920.stLBV2_TurnedOn) then
            begin
              if Station.HalfSetA.Rack1500.butMode_R = butPositionLeft then
              begin
                if Station.HalfSetA.Rack1500.swModeControl = 6 then
                begin
                  imgsBlack[6].Visible := True;
                  imgsBlack[6].Invalidate;
                  imgsBlack[6].BringToFront;
                end;
              end;
            end;
          end;
        end;
      end;

    idRack1500B:
      begin
        if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
        begin
          if Station.HalfSetB.Rack1500.butMode_R = butPositionLeft then
          begin
            //---------------------Расфаз----------------------
            for btA := 1 to 11 do
            begin
              imgsBlack[btA].Visible := False;
              imgsBlack[btA].Invalidate;
            end;

            if Station.HalfSetB.Rack1500.swModeControl = 6 then
            begin
              if (((Station.HalfSetB.Rack1920.stLBV1_TurnedOn) and (not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn))) or
              ((Station.HalfSetB.Rack1920.stLBV2_TurnedOn) and (not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn)))) or
              ((not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn)) and (not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn)))then
              begin
                //Включена одна лампа - максимальная расфазировка
                imgWindow10.Visible := True;
                imgWindow10.Invalidate;
              end
              else
              begin
                //Включены обе лампы - регулируем положение
                case Station.HalfSetB.Rack1500.swPhaseMover of
                  0, 20:
                    begin
                      imgWindow10.Visible := True;
                      imgWindow10.Invalidate;
                      imgWindow10.BringToFront;
                    end;
                  1, 19:
                    begin
                      imgWindow9.Visible := True;
                      imgWindow9.Invalidate;
                      imgWindow9.BringToFront;
                    end;
                  2, 18:
                    begin
                      imgWindow8.Visible := True;
                      imgWindow8.Invalidate;
                      imgWindow8.BringToFront;
                    end;
                  3, 17:
                    begin
                      imgWindow7.Visible := True;
                      imgWindow7.Invalidate;
                      imgWindow7.BringToFront;
                    end;
                  4, 16:
                    begin
                      imgWindow6.Visible := True;
                      imgWindow6.Invalidate;
                      imgWindow6.BringToFront;
                    end;
                  5, 15:
                    begin
                      imgWindow5.Visible := True;
                      imgWindow5.Invalidate;
                      imgWindow5.BringToFront;
                    end;
                  6, 14:
                    begin
                      imgWindow4.Visible := True;
                      imgWindow4.Invalidate;
                      imgWindow4.BringToFront;
                    end;
                  7, 13:
                    begin
                      imgWindow3.Visible := True;
                      imgWindow3.Invalidate;
                      imgWindow3.BringToFront;
                    end;
                  8, 12:
                    begin
                      imgWindow2.Visible := True;
                      imgWindow2.Invalidate;
                      imgWindow2.BringToFront;
                    end;
                  9, 11:
                    begin
                      imgWindow1.Visible := True;
                      imgWindow1.Invalidate;
                      imgWindow1.BringToFront;
                    end;
                  10:
                    begin
                      imgWindow0.Visible := True;
                      imgWindow0.Invalidate;
                      imgWindow0.BringToFront;
                    end;
                end;
              end;
            end
            else
            begin
              if ShownImageId <> NotSelected then
              begin
                imgsBlack[ShownImageId].Visible := True;
                imgsBlack[ShownImageId].Invalidate;
                imgsBlack[ShownImageId].BringToFront;
              end;
            end;
          end
          else
          begin
            //---------------------Мощность----------------------
            for btA := 1 to 11 do
            begin
              imgsRed[btA].Visible := False;
              imgsRed[btA].Invalidate;
            end;
            if Station.HalfSetB.Rack1500.swModeControl = 6 then
            begin
              if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) and (Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
              begin
                imgWindow10.Visible := True;
                imgWindow10.Invalidate;
                imgWindow10.BringToFront;
              end
              else
                if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn) or (Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
                begin
                  imgsRed[6].Visible := True;
                  imgsRed[6].Invalidate;
                  imgsRed[6].BringToFront;
                end;
            end
            else
            begin
              if ShownImageId <> NotSelected then
              begin
                imgsRed[ShownImageId].Visible := True;
                imgsRed[ShownImageId].Invalidate;
                imgsRed[ShownImageId].BringToFront;
              end;
            end;
          end;
        end
        else
        begin
          for btA := 1 to 11 do
          begin
            imgsBlack[btA].Visible := False;
            imgsBlack[btA].Invalidate;
          end;
          for btA := 1 to 11 do
          begin
            imgsRed[btA].Visible := False;
            imgsRed[btA].Invalidate;
          end;

          if ((not(Station.HalfSetB.Rack1920.stLBV1_TurnedOn)) and (not(Station.HalfSetB.Rack1920.stLBV2_TurnedOn))) then
          begin

          end
          else
          begin
            if (Station.HalfSetB.Rack1920.stLBV1_TurnedOn and Station.HalfSetB.Rack1920.stLBV2_TurnedOn) then
            begin
              if Station.HalfSetB.Rack1500.butMode_R = butPositionLeft then
              begin
                if Station.HalfSetB.Rack1500.swModeControl = 6 then
                begin
                  imgsBlack[6].Visible := True;
                  imgsBlack[6].Invalidate;
                  imgsBlack[6].BringToFront;
                end;
              end;
            end;
          end;
        end;
      end;
  end;

  //Перерисуем выносной дисплей
  if pnlPhaseMover.Visible then
  begin
    for btA := 1 to 10 do
    begin
      if imgsModeControl[btA].Visible then
        imgPhaseMoverAdditional.Picture :=  imgsModeControl[btA].Picture;
    end;
    imgPhaseMoverAdditional.Invalidate;
  end;
  imgPhaseMoverAdditional.Invalidate;
end;
{$ENDREGION}

{$REGION 'Процедуры ButtonClick'}
procedure TRack1500Form.btnWaveMeterMainClick(Sender: TObject);
begin
case CurFormId of
    idRack1500A:
      begin
              Station.HalfSetA.Rack1500.CableMdMainState := csConnected;
        Station.HalfSetA.Rack1500.CableMdReservState := csDisconected;
        if (Station.HalfSetA.Rack1500.SelectedMd = smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain) then
        begin
              WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 1, Station, TaskController);
              WaveMeterForm.Show;
        end;
      end;
    idRack1500B:
      begin
              Station.HalfSetB.Rack1500.CableMdMainState := csConnected;
        Station.HalfSetB.Rack1500.CableMdReservState := csDisconected;
        if (Station.HalfSetB.Rack1500.SelectedMd = smdMain) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain) then
        begin
             WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 2, Station, TaskController);
             WaveMeterForm.Show;
        end;
      end;
  end;
  imgCableMdMainConnected.Show;
     Reload;
end;

procedure TRack1500Form.btnWaveMeterReservClick(Sender: TObject);
begin
         case CurFormId of
    idRack1500A:
      begin
      Station.HalfSetA.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetA.Rack1500.CableMdReservState := csConnected;
        if (Station.HalfSetA.Rack1500.SelectedMd = smdRetr) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrReserv) then
        begin
              WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 1, Station, TaskController);
              WaveMeterForm.Show;
        end;

      end;
    idRack1500B:
      begin
      Station.HalfSetB.Rack1500.CableMdMainState := csDisconected;
        Station.HalfSetB.Rack1500.CableMdReservState := csConnected;
        if (Station.HalfSetB.Rack1500.SelectedMd = smdRetr) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrReserv) then
        begin
             WaveMeterForm:=TBlockWaveMeterForm.Create(Self, 2, Station, TaskController);
             WaveMeterForm.Show;
        end;

      end;
  end;
  imgCableMdReservConnected.Show;
     Reload;
end;

procedure TRack1500Form.Button1Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      Station.HalfSetA.Rack1500.GeterodinTunedMain := True;
    idRack1500B:
      Station.HalfSetB.Rack1500.GeterodinTunedMain := True;
  end;
  Reload;
end;

procedure TRack1500Form.Button2Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      Station.HalfSetA.Rack1500.GeterodinTunedReserve := True;
    idRack1500B:
      Station.HalfSetB.Rack1500.GeterodinTunedReserve := True;
  end;
  Reload;
end;

procedure TRack1500Form.Button3Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      Station.HalfSetA.Rack1920.stLBV1_TurnedOn := True;
    idRack1500B:
      Station.HalfSetB.Rack1920.stLBV1_TurnedOn := True;
  end;
  Reload;
end;

procedure TRack1500Form.Button4Click(Sender: TObject);
begin
  case CurFormId of
    idRack1500A:
      Station.HalfSetA.Rack1920.stLBV2_TurnedOn := True;
    idRack1500B:
      Station.HalfSetB.Rack1920.stLBV2_TurnedOn := True;
  end;
  Reload;
end;
{$ENDREGION}

end.
