unit uRack1710Form;

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
  uImageRotator,
  pngimage,
  StdCtrls,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type

  TRack1710Form = class(TForm)
    PanelBlock1: TPanel;
    ImageBlock1: TImage;
    ilSwWorkMode: TImageList;
    imgButAutomat: TImage;
    imgbutEmergencyLine1: TImage;
    imgbutEmergencyLine2: TImage;
    ImageListDiodGray: TImageList;
    ImageDiodGray1: TImage;
    ImageDiodGray2: TImage;
    ImageDiodGray3: TImage;
    ImageDiodGray4: TImage;
    ImageDiodGray5: TImage;
    ImageDiodGray6: TImage;
    PanelBlock2: TPanel;
    ImageBlock2: TImage;
    imgbut1220AD: TImage;
    imgbut1230AD: TImage;
    imgbut1290: TImage;
    imgbut1220AM: TImage;
    imgbut1230AM: TImage;
    imgbut1210A: TImage;
    imgbut1270: TImage;
    imgbut1220AD_2: TImage;
    imgbut1230AD_2: TImage;
    imgbut1290_2: TImage;
    imgbut1210A_2: TImage;
    imgbut1230AM_2: TImage;
    imgbut1220AM_2: TImage;
    imgbut1270_2: TImage;
    PanelBlock3: TPanel;
    ImageBlock3: TImage;
    PanelBlock4: TPanel;
    ImageBlock4: TImage;
    ImageTumblerHor1Block4: TImage;
    imgbutExternalUplotnenieA: TImage;
    imgbut470Power: TImage;
    imgbutSpeaker: TImage;
    imgbutExternalUplotnenieB: TImage;
    ImageListDiodRed: TImageList;
    ImageBlock1DiodRed1: TImage;
    ImageBlock1DiodRed2: TImage;
    ImageBlock1DiodRed3: TImage;
    ImageBlock1DiodRed4: TImage;
    ImageBlock1DiodRed5: TImage;
    ImageBlock1DiodRed6: TImage;
    ImageBlock1DiodRed7: TImage;
    ImageBlock1DiodRed8: TImage;
    ImageBlock1DiodRed10: TImage;
    ImageListDiod6SidesRed: TImageList;
    ImageBlock1Diod6SidesRed1: TImage;
    ImageBlock1Diod6SidesRed2: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Label7: TLabel;
    imgSwKukushka1: TImage;
    imgSwKukushka4: TImage;
    imgSwKukushka3: TImage;
    imgSwKukushka2: TImage;
    imgSwReductorCurrent1: TImage;
    imgSwReductorCurrent2: TImage;
    imgSwReductorCurrent3: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    imgSwWorkMode1: TImage;
    imgSwWorkMode2: TImage;
    imgSwWorkMode3: TImage;
    imgSwWorkMode4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image16: TImage;
    imgInd1220ADMain: TImage;
    imgInd1230ADMain: TImage;
    imgInd1290Main: TImage;
    imgInd1220AM_B_Reserve: TImage;
    img1230AM_B_Reserve: TImage;
    imgInd1210A_B_Reserve: TImage;
    imgInd1210AReserve: TImage;
    imgInd1230AMReserve: TImage;
    imgInd1220AMReserve: TImage;
    imgInd1290_B_Main: TImage;
    imgInd1230AD_B_Main: TImage;
    imgInd1220AD_B_Main: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    imgInd1210A_B_Main: TImage;
    img1230AM_B_Main: TImage;
    imgInd1220AM_B_Main: TImage;
    imgInd1290_B_Reserve: TImage;
    imgInd1230AD_B_Reserve: TImage;
    imgInd1220AD_B_Reserve: TImage;
    imgInd1290Reserve: TImage;
    imgInd1230ADReserve: TImage;
    imgInd1220ADReserve: TImage;
    imgInd1210AMaIN: TImage;
    imgInd1230AMMain: TImage;
    imgInd1220AMMain: TImage;
    imgInd1270Main: TImage;
    imgInd1270Reserve: TImage;
    imgInd1270_B_Main: TImage;
    imgInd1270_B_Reserve: TImage;
    imgbutExternalUplotnenieBPositionLeft: TImage;
    imgbutExternalUplotnenieBbutPositionRight: TImage;
    imgbut470PowerPositionRight: TImage;
    imgbut470PowerPositionLeft: TImage;
    imgbutExternalUplotnenieAPositionLeft: TImage;
    imgbutExternalUplotnenieAPositionRight: TImage;
    imgbutSpeakerPositionLeft: TImage;
    imgbutSpeakerPositionRight: TImage;
    imgbut1220ADPositionLeft: TImage;
    imgbut1220ADPositionRight: TImage;
    imgbut1230ADPositionLeft: TImage;
    imgbut1230ADPositionRight: TImage;
    imgbut1290PositionRight: TImage;
    imgbut1290PositionLeft: TImage;
    imgbut1210APositionLeft: TImage;
    imgbut1210APositionRight: TImage;
    imgbut1220AMPositionLeft: TImage;
    imgbut1220AMPositionRight: TImage;
    imgbut1230AMPositionLeft: TImage;
    imgbut1230AMPositionRight: TImage;
    imgbut1270PositionLeft: TImage;
    imgbut1270PositionRight: TImage;
    imgbut1220AD_2PositionLeft: TImage;
    imgbut1220AD_2PositionRight: TImage;
    imgbut1230AD_2PositionLeft: TImage;
    imgbut1230AD_2PositionRight: TImage;
    imgbut1290_2PositionLeft: TImage;
    imgbut1290_2Right: TImage;
    imgbut1220AM_2PositionLeft: TImage;
    imgbut1220AM_2PositionRight: TImage;
    imgbut1230AM_2PositionLeft: TImage;
    imgbut1230AM_2PositionRight: TImage;
    imgbut1210A_2PositionLeft: TImage;
    imgbut1210A_2PositionRight: TImage;
    imgbut1270_2PositionLeft: TImage;
    imgbut1270_2PositionRight: TImage;
    imgButAutomatPositionUp: TImage;
    imgButAutomatPositionDown: TImage;
    imgbutEmergencyLine1PositionDown: TImage;
    imgbutEmergencyLine1PositionUp: TImage;
    Image17: TImage;
    Image18: TImage;
    imgbutEmergencyLine2PositionDown: TImage;
    imgbutEmergencyLine2PositionUp: TImage;
    procedure imgbut470PowerClick(Sender: TObject);
    procedure imgButAutomatClick(Sender: TObject);
    procedure ImageSwitcherBlock1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure imgSwKukushkaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgSwWorkModeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwReductorCurrentMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgbutEmergencyLine1Click(Sender: TObject);
    procedure imgbutEmergencyLine2Click(Sender: TObject);
    procedure imgbut1220ADClick(Sender: TObject);
    procedure imgbut1230ADClick(Sender: TObject);
    procedure imgbut1290Click(Sender: TObject);
    procedure imgbut1220AMClick(Sender: TObject);
    procedure imgbut1230AMClick(Sender: TObject);
    procedure imgbut1210AClick(Sender: TObject);
    procedure imgbut1270Click(Sender: TObject);
    procedure imgbut1270_2Click(Sender: TObject);
    procedure imgbut1210A_2Click(Sender: TObject);
    procedure imgbut1230AM_2Click(Sender: TObject);
    procedure imgbut1220AM_2Click(Sender: TObject);
    procedure imgbut1290_2Click(Sender: TObject);
    procedure imgbut1230AD_2Click(Sender: TObject);
    procedure imgbut1220AD_2Click(Sender: TObject);
    procedure imgbutExternalUplotnenieAClick(Sender: TObject);
    procedure imgbutExternalUplotnenieBClick(Sender: TObject);
    procedure imgbutSpeakerClick(Sender: TObject);
    procedure imgSwWorkMode4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwWorkMode3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwWorkMode2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwWorkMode1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwKukushka4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwKukushka1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwReductorCurrent1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    SwitcherBlock1, SwitcherBlock3, SwitcherBlock4: TImageRotator;
    DiodsGrayBlock1: Array[1..6] of TImageRotator;
    DiodsGrayAddressesBlock1: Array[1..6] of PImage;
    DiodsGrayRegimesBlock1: Array[1..6] of Byte;

    TumblersVerticalBlock1: Array[1..3] of TImageRotator;
    TumblersHorisontalBlock2: Array[1..14] of TImageRotator;
    TumblersHorisontalBlock3: Array[1..1] of TImageRotator;
    TumblersHorisontalBlock4: Array[1..5] of TImageRotator;

    procedure Reload;
    procedure OnWorkModeImagesClick(Button: TMouseButton);
    procedure OnSwReductorCurrentClick(Button: TMouseButton);
    procedure OnSwKukushkaClick(Button: TMouseButton);

    public
    PervoeV:boolean;
    skrol:integer;
    P1,P2,P3:integer;
    i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,
      i11,i12,i13,i14,i15,i16,i17,i18,i19,i20:integer;
    Bst2:boolean;
    constructor Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController); reintroduce;

var
  imgsRack1200Main: array [1..14] of ^TImage;
  imgsRack1200Reserve: array [1..14] of ^TImage;
  Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
  end;

implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uEducationForm,
  uHandsetForm,
  uRack1200LeftForm,
  uRack1200RightForm,
  uBlockOscillographForm,
  uConstantsDM;



{$R *.dfm}

{procedure TFormBlock1710.DrawNextImage(var ImageList: TImageList;
  var Carousel: TCarousel; Image: PImage);
begin
  ImageList.Draw(Carousel.Canvas,0,0,Carousel.GetNext);
  Image.Picture.Bitmap:= Carousel;
end; }


 constructor  TRack1710Form.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);

  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;


procedure ImageStart4(image1,image2,image3,image4:timage;number:integer);
var
  k1,k2,k3,k4:integer;
begin
  image1.SendToBack;
  k1:=1;
  image2.SendToBack;
  k2:=2;
  image3.SendToBack;
  k3:=3;
  image4.SendToBack;
  k4:=4;
  if number=k1 then
    image1.BringToFront;
  if number=k2 then
    image2.BringToFront;
  if number=k3 then
    image3.BringToFront;
  if number=k4 then
    image4.BringToFront;
end;

procedure ImageClick4(image1,image2,image3,image4:timage;
  Button: TMouseButton;var Number:integer);
var
  k1,k2,k3,k4:integer;
begin
  k1:=1; k2:=2; k3:=3; k4:=4;
  if button=mbleft then
  begin
    if number<4 then
    begin
      inc(number);
      if k1=number then
      begin
        image1.BringToFront;
        image2.SendToBack;image3.SendToBack;
      end;
      if k2=number then
      begin
        image2.BringToFront;
        image1.SendToBack;image3.SendToBack;
      end;
      if k3=number then
      begin
        image3.BringToFront;
        image2.SendToBack;image4.SendToBack;
      end;
      if k4=number then
      begin
        image4.BringToFront;
        image3.SendToBack;
      end;
    end;  //number<4
  end; //button=mbleft

  if button=mbright then begin
    if number>1 then
    begin
      dec(number);
      if k1=number then
      begin
        image1.BringToFront;
        image2.SendToBack;image3.SendToBack;
      end;
      if k2=number then
      begin
        image2.BringToFront;
        image1.SendToBack;image3.SendToBack;
      end;
      if k3=number then
      begin
        image3.BringToFront;
        image2.SendToBack;image1.SendToBack;
      end;
      if k3=number then
      begin
        image3.BringToFront;
        image2.SendToBack;image4.SendToBack;
      end;
      if k4=number then
      begin
        image4.BringToFront;
        image3.SendToBack;
      end;
    end;  //number>0
  end; //button=mbright
end;

procedure ImageStart3(image1,image2,image3:timage;number:integer);
var
  k1,k2,k3:integer;
begin
  image1.SendToBack;
  k1:=1;
  image2.SendToBack;
  k2:=2;
  image3.SendToBack;
  k3:=3;
  if number=k1 then
    image1.BringToFront;
  if number=k2 then
    image2.BringToFront;
  if number=k3 then
    image3.BringToFront;
end;

procedure ImageClick3(image1,image2,image3:timage;
  Button: TMouseButton;var Number:integer);
var
  k1,k2,k3:integer;
begin
  k1:=1;k2:=2; k3:=3;
  if button=mbleft then
  begin
    if number<3 then
    begin
      inc(number);
      if k1=number then
      begin
        image1.BringToFront;
        image2.SendToBack;image3.SendToBack;
      end;
      if k2=number then
      begin
        image2.BringToFront;
        image1.SendToBack;image3.SendToBack;
      end;
      if k3=number then
      begin
        image3.BringToFront;
        image2.SendToBack;
      end;
    end;  //number<3
  end; //button=mbleft

  if button=mbright then
  begin
    if number>1 then begin
      dec(number);
      if k1=number then
      begin
        image1.BringToFront;
        image2.SendToBack;image3.SendToBack;
      end;
      if k2=number then
      begin
        image2.BringToFront;
        image1.SendToBack;image3.SendToBack;
      end;
      if k3=number then
      begin
        image3.BringToFront;
        image2.SendToBack;image1.SendToBack;
      end;
      if k3=number then
      begin
        image3.BringToFront;
        image2.SendToBack;
      end;
    end;  //number>0
  end; //button=mbright
end;

procedure TRack1710Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TRack1710Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TRack1710Form.FormCreate(Sender: TObject);
begin
  imgsRack1200Main[1] := @imgInd1220ADMain;
  imgsRack1200Main[2] := @imgInd1230ADMain;
  imgsRack1200Main[3] := @imgInd1290Main;
  imgsRack1200Main[4] := @imgInd1220AMMain;
  imgsRack1200Main[5] := @imgInd1230AMMain;
  imgsRack1200Main[6] := @imgInd1210AMain;
  imgsRack1200Main[7] := @imgInd1270Main;

  imgsRack1200Main[8] := @imgInd1220AD_B_Main;
  imgsRack1200Main[9] := @imgInd1230AD_B_Main;
  imgsRack1200Main[10] := @imgInd1290_B_Main;
  imgsRack1200Main[11] := @imgInd1220AM_B_Main;
  imgsRack1200Main[12] := @img1230AM_B_Main;
  imgsRack1200Main[13] := @imgInd1210A_B_Main;
  imgsRack1200Main[14] := @imgInd1270_B_Main;

  imgsRack1200Reserve[1] := @imgInd1220ADReserve;
  imgsRack1200Reserve[2] := @imgInd1230ADReserve;
  imgsRack1200Reserve[3] := @imgInd1290Reserve;
  imgsRack1200Reserve[4] := @imgInd1220AMReserve;
  imgsRack1200Reserve[5] := @imgInd1230AMReserve;
  imgsRack1200Reserve[6] := @imgInd1210AReserve;
  imgsRack1200Reserve[7] := @imgInd1270Reserve;

  imgsRack1200Reserve[8] := @imgInd1220AD_B_Reserve;
  imgsRack1200Reserve[9] := @imgInd1230AD_B_Reserve;
  imgsRack1200Reserve[10] := @imgInd1290_B_Reserve;
  imgsRack1200Reserve[11] := @imgInd1220AM_B_Reserve;
  imgsRack1200Reserve[12] := @img1230AM_B_Reserve;
  imgsRack1200Reserve[13] := @imgInd1210A_B_Reserve;
  imgsRack1200Reserve[14] := @imgInd1270_B_Reserve;

  MoveFormInScreenCenter(Self);
end;

procedure TRack1710Form.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TRack1710Form.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TRack1710Form.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1710Form.FormShow(Sender: TObject);
begin
  TaskController.ChangeEvent;
  Reload;
end;

procedure TRack1710Form.OnSwKukushkaClick(Button: TMouseButton);
begin
  if (Button = mbLeft) and (Station.Rack1710.swKukushka < 4) then
  begin
    Inc(Station.Rack1710.swKukushka, 1);
  end;
  if (Button = mbRight) and (Station.Rack1710.swKukushka >1) then
  begin
    Dec(Station.Rack1710.swKukushka, 1);
  end;

  Reload;
end;

procedure TRack1710Form.imgSwKukushka1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OnSwKukushkaClick(Button);
end;

procedure TRack1710Form.imgSwKukushka4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OnSwKukushkaClick(Button);
end;

procedure TRack1710Form.imgSwKukushkaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Rack1710.swKukushka < 4) then
    Inc(Station.Rack1710.swKukushka, 1);
  if (Button = mbRight) and (Station.Rack1710.swKukushka > 1) then
    Dec(Station.Rack1710.swKukushka, 1);

  Reload;
end;

procedure TRack1710Form.OnSwReductorCurrentClick(Button: TMouseButton);
begin
  if (Button = mbLeft) and (Station.Rack1710.swReductorCurrent < 3) then
  begin
    Inc(Station.Rack1710.swReductorCurrent, 1);
  end;
  if (Button = mbRight) and (Station.Rack1710.swReductorCurrent >1) then
  begin
    Dec(Station.Rack1710.swReductorCurrent, 1);
  end;

  Reload;
end;

procedure TRack1710Form.imgSwReductorCurrent1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OnSwReductorCurrentClick(Button);
end;

procedure TRack1710Form.imgSwReductorCurrentMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Rack1710.swReductorCurrent < 3) then
    Inc(Station.Rack1710.swReductorCurrent, 1);
  if (Button = mbRight) and (Station.Rack1710.swReductorCurrent > 1) then
    Dec(Station.Rack1710.swReductorCurrent, 1);

  Reload;
end;

procedure TRack1710Form.OnWorkModeImagesClick(Button: TMouseButton);
begin
  if (Button = mbLeft) and (Station.Rack1710.swWorkMode < 4) then
  begin
    Inc(Station.Rack1710.swWorkMode, 1);
  end;
  if (Button = mbRight) and (Station.Rack1710.swWorkMode > 1) then
  begin
    Dec(Station.Rack1710.swWorkMode, 1);
  end;

  Reload;
end;

procedure TRack1710Form.imgSwWorkMode1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OnWorkModeImagesClick(Button);
end;

procedure TRack1710Form.imgSwWorkMode2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OnWorkModeImagesClick(Button);
end;

procedure TRack1710Form.imgSwWorkMode3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OnWorkModeImagesClick(Button);
end;

procedure TRack1710Form.imgSwWorkMode4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OnWorkModeImagesClick(Button);
end;

procedure TRack1710Form.imgSwWorkModeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.Rack1710.swWorkMode < 4) then
    Inc(Station.Rack1710.swWorkMode, 1);
  if (Button = mbRight) and (Station.Rack1710.swWorkMode > 1) then
    Dec(Station.Rack1710.swWorkMode, 1);

  Reload;
end;


procedure TRack1710Form.ImageSwitcherBlock1Click(Sender: TObject);
var i: Integer;
begin
//
////  DrawNextImage(ImageListSwitcher,SwitcherBlock1,@ImageSwitcherBlock1);
//
//  case SwitcherBlock1.Index of
//  0: begin
//       if Station.IsPluggedIn then
//       begin
//         DiodsGrayRegimesBlock1[1]:= 1;
//         DiodsGrayRegimesBlock1[2]:= 0;
//         DiodsGrayRegimesBlock1[3]:= 0;
//         DiodsGrayRegimesBlock1[4]:= 1;
//         DiodsGrayRegimesBlock1[5]:= 0;
//         DiodsGrayRegimesBlock1[6]:= 0;
//       end
//       else
//       begin
//         DiodsGrayRegimesBlock1[1]:= 0;
//         DiodsGrayRegimesBlock1[2]:= 0;
//         DiodsGrayRegimesBlock1[3]:= 0;
//         DiodsGrayRegimesBlock1[4]:= 0;
//         DiodsGrayRegimesBlock1[5]:= 0;
//         DiodsGrayRegimesBlock1[6]:= 0;
//       end;
//       for i:= 1 to Length(DiodsGrayRegimesBlock1) do
//          if DiodsGrayBlock1[i].Index <> DiodsGrayRegimesBlock1[i] then
//             DiodsGrayBlock1[i].DrawNextImage(ImageListDiodGray,DiodsGrayAddressesBlock1[i]);
////           DrawNextImage(ImageListDiodGray,DiodsGrayBlock1[i],DiodsGrayAddressesBlock1[i]);
//     end;
//  1: begin
//       DiodsGrayRegimesBlock1[1]:= 0;
//       DiodsGrayRegimesBlock1[2]:= 1;
//       DiodsGrayRegimesBlock1[3]:= 0;
//       DiodsGrayRegimesBlock1[4]:= 0;
//       DiodsGrayRegimesBlock1[5]:= 1;
//       DiodsGrayRegimesBlock1[6]:= 0;
//
//       for i:= 1 to Length(DiodsGrayRegimesBlock1) do
//         if DiodsGrayBlock1[i].Index <> DiodsGrayRegimesBlock1[i] then
//           DiodsGrayBlock1[i].DrawNextImage(ImageListDiodGray,DiodsGrayAddressesBlock1[i]);
////           DrawNextImage(ImageListDiodGray,DiodsGrayBlock1[i],DiodsGrayAddressesBlock1[i]);
//     end;
//  2: begin
//       DiodsGrayRegimesBlock1[1]:= 0;
//       DiodsGrayRegimesBlock1[2]:= 1;
//       DiodsGrayRegimesBlock1[3]:= 0;
//       DiodsGrayRegimesBlock1[4]:= 0;
//       DiodsGrayRegimesBlock1[5]:= 1;
//       DiodsGrayRegimesBlock1[6]:= 0;
//
//       for i:= 1 to Length(DiodsGrayRegimesBlock1) do
//         if DiodsGrayBlock1[i].Index <> DiodsGrayRegimesBlock1[i] then
//           DiodsGrayBlock1[i].DrawNextImage(ImageListDiodGray,DiodsGrayAddressesBlock1[i]);
////           DrawNextImage(ImageListDiodGray,DiodsGrayBlock1[i],DiodsGrayAddressesBlock1[i]);
//     end;
//  3: begin
//       DiodsGrayRegimesBlock1[1]:= 0;
//       DiodsGrayRegimesBlock1[2]:= 0;
//       DiodsGrayRegimesBlock1[3]:= 1;
//       DiodsGrayRegimesBlock1[4]:= 0;
//       DiodsGrayRegimesBlock1[5]:= 0;
//       DiodsGrayRegimesBlock1[6]:= 1;
//
//       for i:= 1 to Length(DiodsGrayRegimesBlock1) do
//         if DiodsGrayBlock1[i].Index <> DiodsGrayRegimesBlock1[i] then
//           DiodsGrayBlock1[i].DrawNextImage(ImageListDiodGray,DiodsGrayAddressesBlock1[i]);
////           DrawNextImage(ImageListDiodGray,DiodsGrayBlock1[i],DiodsGrayAddressesBlock1[i]);
//     end;
//  end;
end;

procedure TRack1710Form.imgButAutomatClick(Sender: TObject);
begin
  if Station.Rack1710.butAutomat = butPositionUp then
    Station.Rack1710.butAutomat := butPositionDown
  else
    Station.Rack1710.butAutomat := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbutEmergencyLine1Click(Sender: TObject);
begin
  if Station.Rack1710.butEmergencyLine1 = butPositionUp then
    Station.Rack1710.butEmergencyLine1 := butPositionDown
  else
    Station.Rack1710.butEmergencyLine1 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbutEmergencyLine2Click(Sender: TObject);
begin
  if Station.Rack1710.butEmergencyLine2 = butPositionUp then
    Station.Rack1710.butEmergencyLine2 := butPositionDown
  else
    Station.Rack1710.butEmergencyLine2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbutExternalUplotnenieAClick(Sender: TObject);
begin
  if Station.Rack1710.butExternalUplotnenieA = butPositionUp then
    Station.Rack1710.butExternalUplotnenieA := butPositionDown
  else
    Station.Rack1710.butExternalUplotnenieA := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbutExternalUplotnenieBClick(Sender: TObject);
begin
  if Station.Rack1710.butExternalUplotnenieB = butPositionLeft then
    Station.Rack1710.butExternalUplotnenieB := butPositionRight
  else
    Station.Rack1710.butExternalUplotnenieB := butPositionLeft;

  Reload;
end;

procedure TRack1710Form.imgbutSpeakerClick(Sender: TObject);
begin
  if Station.Rack1710.butSpeaker = butPositionLeft then
    Station.Rack1710.butSpeaker := butPositionRight
  else
    Station.Rack1710.butSpeaker := butPositionLeft;

  Reload;
end;

procedure TRack1710Form.Label7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
//if EducationForm.Zanatie5=true then begin
//Image15.Visible:=false;
//label7.Visible:=false;
//end;
end;

procedure TRack1710Form.Reload;
var
  imgsSwKukushka: Array [1..4] of ^Timage;
  btA: Byte;
begin
  imgsSwKukushka[1] := @imgSwKukushka1;
  imgsSwKukushka[2] := @imgSwKukushka2;
  imgsSwKukushka[3] := @imgSwKukushka3;
  imgsSwKukushka[4] := @imgSwKukushka4;

  for btA := 1 to 4 do
  begin
    imgsSwKukushka[btA].Visible := False;
    imgsSwKukushka[btA].Invalidate;
  end;


    imgsSwKukushka[Station.Rack1710.swKukushka].Visible := True;
  imgsSwKukushka[Station.Rack1710.swKukushka].Invalidate;


  imgsSwKukushka[1] := @imgSwReductorCurrent1;
  imgsSwKukushka[2] := @imgSwReductorCurrent2;
  imgsSwKukushka[3] := @imgSwReductorCurrent3;
  for btA := 1 to 3 do
  begin
    imgsSwKukushka[btA].Visible := False;
    imgsSwKukushka[btA].Invalidate;
  end;
  imgsSwKukushka[Station.Rack1710.swReductorCurrent].Visible := True;
  imgsSwKukushka[Station.Rack1710.swReductorCurrent].Invalidate;

  imgsSwKukushka[1] := @imgSwWorkMode1;
  imgsSwKukushka[2] := @imgSwWorkMode2;
  imgsSwKukushka[3] := @imgSwWorkMode3;
  imgsSwKukushka[4] := @imgSwWorkMode4;

  for btA := 1 to 4 do
  begin
    imgsSwKukushka[btA].Visible := False;
    imgsSwKukushka[btA].Invalidate;
  end;
  imgsSwKukushka[Station.Rack1710.swWorkMode].Visible := True;
  imgsSwKukushka[Station.Rack1710.swWorkMode].Invalidate;

  imgButAutomat.Invalidate;
  imgbutEmergencyLine1.Invalidate;
  imgbutEmergencyLine2.Invalidate;

  imgButAutomatPositionUp.Visible :=
    Boolean(Station.Rack1710.butAutomat = butPositionUp);
  imgButAutomatPositionDown.Visible :=
    Boolean(Station.Rack1710.butAutomat = butPositionDown);
  imgbutEmergencyLine1PositionUp.Visible :=
    Boolean(Station.Rack1710.butEmergencyLine1 = butPositionUp);
  imgbutEmergencyLine1PositionDown.Visible :=
    Boolean(Station.Rack1710.butEmergencyLine1 = butPositionDown);
  imgbutEmergencyLine2PositionUp.Visible :=
    Boolean(Station.Rack1710.butEmergencyLine2 = butPositionUp);
  imgbutEmergencyLine2PositionDown.Visible :=
    Boolean(Station.Rack1710.butEmergencyLine2 = butPositionDown);

  //Кнопки - переключатели
  imgbutExternalUplotnenieBPositionLeft.Visible :=
    Boolean(Station.Rack1710.butExternalUplotnenieB = butPositionLeft);
  imgbutExternalUplotnenieBbutPositionRight.Visible :=
    Boolean(Station.Rack1710.butExternalUplotnenieB = butPositionRight);
  imgbutExternalUplotnenieAPositionLeft.Visible :=
    Boolean(Station.Rack1710.butExternalUplotnenieA = butPositionLeft);
  imgbutExternalUplotnenieAPositionRight.Visible :=
    Boolean(Station.Rack1710.butExternalUplotnenieA = butPositionRight);
  imgbutSpeakerPositionRight.Visible :=
    Boolean(Station.Rack1710.butSpeaker = butPositionRight);
  imgbutSpeakerPositionLeft.Visible :=
    Boolean(Station.Rack1710.butSpeaker = butPositionLeft);
  imgbut470PowerPositionRight.Visible :=
    Boolean(Station.Rack1710.butPower = butPositionRight);
  imgbut470PowerPositionLeft.Visible :=
    Boolean(Station.Rack1710.butPower = butPositionLeft);

  imgbut1220ADPositionRight.Visible :=
    Boolean(Station.Rack1710.but1220AD = butPositionRight);
  imgbut1220ADPositionLeft.Visible :=
    Boolean(Station.Rack1710.but1220AD = butPositionLeft);
  imgbut1230ADPositionRight.Visible :=
    Boolean(Station.Rack1710.but1230AD = butPositionRight);
  imgbut1230ADPositionLeft.Visible :=
    Boolean(Station.Rack1710.but1230AD = butPositionLeft);
  imgbut1290PositionRight.Visible :=
    Boolean(Station.Rack1710.but1290 = butPositionRight);
  imgbut1290PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1290 = butPositionLeft);
  imgbut1220AMPositionRight.Visible :=
    Boolean(Station.Rack1710.but1220AM = butPositionRight);
  imgbut1220AMPositionLeft.Visible :=
    Boolean(Station.Rack1710.but1220AM = butPositionLeft);
  imgbut1230AMPositionRight.Visible :=
    Boolean(Station.Rack1710.but1230AM = butPositionRight);
  imgbut1230AMPositionLeft.Visible :=
    Boolean(Station.Rack1710.but1230AM = butPositionLeft);
  imgbut1210APositionRight.Visible :=
    Boolean(Station.Rack1710.but1210A = butPositionRight);
  imgbut1210APositionLeft.Visible :=
    Boolean(Station.Rack1710.but1210A = butPositionLeft);
  imgbut1270PositionRight.Visible :=
    Boolean(Station.Rack1710.but1270 = butPositionRight);
  imgbut1270PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1270 = butPositionLeft);
  imgbut1220AD_2PositionRight.Visible :=
    Boolean(Station.Rack1710.but1220AD_2 = butPositionRight);
  imgbut1220AD_2PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1220AD_2 = butPositionLeft);
  imgbut1230AD_2PositionRight.Visible :=
    Boolean(Station.Rack1710.but1230AD_2 = butPositionRight);
  imgbut1230AD_2PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1230AD_2 = butPositionLeft);
  imgbut1290_2Right.Visible :=
    Boolean(Station.Rack1710.but1290_2 = butPositionRight);
  imgbut1290_2PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1290_2 = butPositionLeft);
  imgbut1220AM_2PositionRight.Visible :=
    Boolean(Station.Rack1710.but1220AM_2 = butPositionRight);
  imgbut1220AM_2PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1220AM_2 = butPositionLeft);
  imgbut1230AM_2PositionRight.Visible :=
    Boolean(Station.Rack1710.but1230AM_2 = butPositionRight);
  imgbut1230AM_2PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1230AM_2 = butPositionLeft);
  imgbut1210A_2PositionRight.Visible :=
    Boolean(Station.Rack1710.but1210A_2 = butPositionRight);
  imgbut1210A_2PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1210A_2 = butPositionLeft);
  imgbut1270_2PositionRight.Visible :=
    Boolean(Station.Rack1710.but1270_2 = butPositionRight);
  imgbut1270_2PositionLeft.Visible :=
    Boolean(Station.Rack1710.but1270_2 = butPositionLeft);

  imgbutExternalUplotnenieBPositionLeft.Invalidate;
  imgbutExternalUplotnenieBbutPositionRight.Invalidate;
  imgbutExternalUplotnenieAPositionLeft.Invalidate;
  imgbutExternalUplotnenieAPositionRight.Invalidate;
  imgbutSpeakerPositionLeft.Invalidate;
  imgbutSpeakerPositionRight.Invalidate;
  imgbut470PowerPositionLeft.Invalidate;
  imgbut470PowerPositionLeft.Invalidate;
  imgbut1220ADPositionRight.Invalidate;
  imgbut1230ADPositionRight.Invalidate;
  imgbut1230ADPositionLeft.Invalidate;
  imgbut1290PositionRight.Invalidate;
  imgbut1290PositionLeft.Invalidate;
  imgbut1220AMPositionRight.Invalidate;
  imgbut1220AMPositionLeft.Invalidate;
  imgbut1230AMPositionRight.Invalidate;
  imgbut1230AMPositionLeft.Invalidate;
  imgbut1210APositionRight.Invalidate;
  imgbut1210APositionLeft.Invalidate;
  imgbut1270PositionRight.Invalidate;
  imgbut1270PositionLeft.Invalidate;
  imgbut1220AD_2PositionRight.Invalidate;
  imgbut1220AD_2PositionLeft.Invalidate;
  imgbut1230AD_2PositionRight.Invalidate;
  imgbut1230AD_2PositionLeft.Invalidate;
  imgbut1290_2Right.Invalidate;
  imgbut1290_2PositionLeft.Invalidate;
  imgbut1220AM_2PositionRight.Invalidate;
  imgbut1220AM_2PositionLeft.Invalidate;
  imgbut1230AM_2PositionRight.Invalidate;
  imgbut1230AM_2PositionLeft.Invalidate;
  imgbut1210A_2PositionRight.Invalidate;
  imgbut1210A_2PositionLeft.Invalidate;
  imgbut1270_2PositionRight.Invalidate;
  imgbut1270_2PositionLeft.Invalidate;
  imgButAutomatPositionUp.Invalidate;
  imgButAutomatPositionDown.Invalidate;
  imgbutEmergencyLine1PositionUp.Invalidate;
  imgbutEmergencyLine1PositionDown.Invalidate;
  imgbutEmergencyLine2PositionUp.Invalidate;
  imgbutEmergencyLine2PositionDown.Invalidate;

  //A
  imgbut1220AD.Invalidate;
  imgbut1230AD.Invalidate;
  imgbut1290.Invalidate;
  imgbut1220AM.Invalidate;
  imgbut1230AM.Invalidate;
  imgbut1210A.Invalidate;
  imgbut1270.Invalidate;
  //B
  imgbut1220AD_2.Invalidate;
  imgbut1230AD_2.Invalidate;
  imgbut1290_2.Invalidate;
  imgbut1220AM_2.Invalidate;
  imgbut1230AM_2.Invalidate;
  imgbut1210A_2.Invalidate;
  imgbut1270_2.Invalidate;

  //imgbutExternalUplotnenieB.Invalidate;
  ImageDiodGray1.Visible := Station.IsPluggedIn;
  ImageDiodGray4.Visible := Station.IsPluggedIn;

  for btA := 1 to 14 do
  begin
    imgsRack1200Main[btA].Visible := False;
    imgsRack1200Reserve[btA].Visible := False;
  end;

  if Station.IsPluggedIn then
  begin
    if Station.Rack1710.but1220AD = butPositionLeft then
      imgsRack1200Main[1].Visible := True
    else
      imgsRack1200Reserve[1].Visible := True;
    if Station.Rack1710.but1230AD = butPositionLeft then
      imgsRack1200Main[2].Visible := True
    else
      imgsRack1200Reserve[2].Visible := True;
    if Station.Rack1710.but1290 = butPositionLeft then
      imgsRack1200Main[3].Visible := True
    else
      imgsRack1200Reserve[3].Visible := True;
    if Station.Rack1710.but1220AM = butPositionLeft then
      imgsRack1200Main[4].Visible := True
    else
      imgsRack1200Reserve[4].Visible := True;
    if Station.Rack1710.but1230AM = butPositionLeft then
      imgsRack1200Main[5].Visible := True
    else
      imgsRack1200Reserve[5].Visible := True;
    if Station.Rack1710.but1210A = butPositionLeft then
      imgsRack1200Main[6].Visible := True
    else
      imgsRack1200Reserve[6].Visible := True;
    if Station.Rack1710.but1270 = butPositionLeft then
      imgsRack1200Main[7].Visible := True
    else
      imgsRack1200Reserve[7].Visible := True;
    if Station.Rack1710.but1220AD_2 = butPositionLeft then
      imgsRack1200Main[8].Visible := True
    else
      imgsRack1200Reserve[8].Visible := True;
    if Station.Rack1710.but1230AD_2 = butPositionLeft then
      imgsRack1200Main[9].Visible := True
    else
      imgsRack1200Reserve[9].Visible := True;
    if Station.Rack1710.but1290_2 = butPositionLeft then
      imgsRack1200Main[10].Visible := True
    else
      imgsRack1200Reserve[10].Visible := True;
    if Station.Rack1710.but1220AM_2 = butPositionLeft then
      imgsRack1200Main[11].Visible := True
    else
      imgsRack1200Reserve[11].Visible := True;
    if Station.Rack1710.but1230AM_2 = butPositionLeft then
      imgsRack1200Main[12].Visible := True
    else
      imgsRack1200Reserve[12].Visible := True;
    if Station.Rack1710.but1210A_2 = butPositionLeft then
      imgsRack1200Main[13].Visible := True
    else
      imgsRack1200Reserve[13].Visible := True;
    if Station.Rack1710.but1270_2 = butPositionLeft then
      imgsRack1200Main[14].Visible := True
    else
      imgsRack1200Reserve[14].Visible := True;
  end;
  for btA := 1 to 14 do
  begin
    imgsRack1200Main[btA].Invalidate;
    imgsRack1200Reserve[btA].Invalidate;
  end;

  ImageBlock4.Invalidate;
  ImageBlock3.Invalidate;
  ImageBlock2.Invalidate;
  ImageBlock1.Invalidate;
end;

procedure TRack1710Form.imgbut1210AClick(Sender: TObject);
begin
  if Station.Rack1710.but1210A = butPositionUp then
    Station.Rack1710.but1210A := butPositionDown
  else
    Station.Rack1710.but1210A := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1210A_2Click(Sender: TObject);
begin
  if Station.Rack1710.but1210A_2 = butPositionUp then
    Station.Rack1710.but1210A_2 := butPositionDown
  else
    Station.Rack1710.but1210A_2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1220ADClick(Sender: TObject);
begin
  if Station.Rack1710.but1220AD = butPositionUp then
    Station.Rack1710.but1220AD := butPositionDown
  else
    Station.Rack1710.but1220AD := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1220AD_2Click(Sender: TObject);
begin
  if Station.Rack1710.but1220AD_2 = butPositionUp then
    Station.Rack1710.but1220AD_2 := butPositionDown
  else
    Station.Rack1710.but1220AD_2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1220AMClick(Sender: TObject);
begin
  if Station.Rack1710.but1220AM = butPositionUp then
    Station.Rack1710.but1220AM := butPositionDown
  else
    Station.Rack1710.but1220AM := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1220AM_2Click(Sender: TObject);
begin
  if Station.Rack1710.but1220AM_2 = butPositionUp then
    Station.Rack1710.but1220AM_2 := butPositionDown
  else
    Station.Rack1710.but1220AM_2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1230ADClick(Sender: TObject);
begin
  if Station.Rack1710.but1230AD = butPositionUp then
    Station.Rack1710.but1230AD := butPositionDown
  else
    Station.Rack1710.but1230AD := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1230AD_2Click(Sender: TObject);
begin
  if Station.Rack1710.but1230AD_2 = butPositionUp then
    Station.Rack1710.but1230AD_2 := butPositionDown
  else
    Station.Rack1710.but1230AD_2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1230AMClick(Sender: TObject);
begin
  if Station.Rack1710.but1230AM = butPositionUp then
    Station.Rack1710.but1230AM := butPositionDown
  else
    Station.Rack1710.but1230AM := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1230AM_2Click(Sender: TObject);
begin
  if Station.Rack1710.but1230AM_2 = butPositionUp then
    Station.Rack1710.but1230AM_2 := butPositionDown
  else
    Station.Rack1710.but1230AM_2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1270Click(Sender: TObject);
begin
  if Station.Rack1710.but1270 = butPositionUp then
    Station.Rack1710.but1270 := butPositionDown
  else
    Station.Rack1710.but1270 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1270_2Click(Sender: TObject);
begin
  if Station.Rack1710.but1270_2 = butPositionUp then
    Station.Rack1710.but1270_2 := butPositionDown
  else
    Station.Rack1710.but1270_2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1290Click(Sender: TObject);
begin
  if Station.Rack1710.but1290 = butPositionUp then
    Station.Rack1710.but1290 := butPositionDown
  else
    Station.Rack1710.but1290 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut1290_2Click(Sender: TObject);
begin
  if Station.Rack1710.but1290_2 = butPositionUp then
    Station.Rack1710.but1290_2 := butPositionDown
  else
    Station.Rack1710.but1290_2 := butPositionUp;

  Reload;
end;

procedure TRack1710Form.imgbut470PowerClick(Sender: TObject);
begin
  if Station.Rack1710.butPower = butPositionLeft then
    Station.Rack1710.butPower := butPositionRight
  else
    Station.Rack1710.butPower := butPositionLeft;

  Reload;
end;

end.
