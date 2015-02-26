unit uBlockPowerSupplyForm;

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
  pngimage,
  uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  TBlockPowerSupplyForm = class(TForm)
    Image1: TImage;
    P1_1: TImage;
    P1_2: TImage;
    P1_3: TImage;
    P2_1: TImage;
    P2_2: TImage;
    P2_3: TImage;
    P2_4: TImage;
    P2_5: TImage;
    P2_6: TImage;
    P2_7: TImage;
    P2_8: TImage;
    P2_9: TImage;
    P2_10: TImage;
    P3_1: TImage;
    P3_2: TImage;
    P3_3: TImage;
    P3_4: TImage;
    P3_5: TImage;
    P4_1: TImage;
    P4_2: TImage;
    imgPower: TImage;
    procedure Reload;
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

    procedure P1_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P1_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P1_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_10MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P2_9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P3_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P3_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P3_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P3_4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P3_5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P4_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure P4_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  public
    Skrol:integer;
    constructor Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController); reintroduce;

var
  //BlockPowerSupplyForm: TBlockPowerSupplyForm;
  P1,P2,P3,P4:integer;
  ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;
   end;
implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uConstantsDM;


{$R *.dfm}

constructor TBlockPowerSupplyForm.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure ImageStart(image1:timage;image2:timage;image3:timage;number:integer);
var k1,k2,k3:integer;
begin
  image1.SendToBack;
  k1:=1;
  image2.SendToBack;
  k2:=2;
  image3.SendToBack;
  k3:=3;
  if number=k1 then image1.BringToFront;
  if number=k2 then image2.BringToFront;
  if number=k3 then image3.BringToFront;
end;

procedure ImageStart2(image1:timage;image2:timage;number:integer);
var k1,k2:integer;
begin
  image1.SendToBack;
  k1:=1;
  image2.SendToBack;
  k2:=2;
  if number=k1 then image1.BringToFront;
  if number=k2 then image2.BringToFront;
end;

procedure ImageStart10(image1,image2,image3,image4,image5,image6,image7,
  image8,image9,image10:timage;number:integer);
var k1,k2,k3,k4,k5,k6,k7,k8,k9,k10:integer;
begin
  image1.SendToBack;
  k1:=1;
  image2.SendToBack;
  k2:=2;
  image3.SendToBack;
  k3:=3;
  image4.SendToBack;
  k4:=4;
  image5.SendToBack;
  k5:=5;
  image6.SendToBack;
  k6:=6;
  image7.SendToBack;
  k7:=7;
  image8.SendToBack;
  k8:=8;
  image9.SendToBack;
  k9:=9;
  image10.SendToBack;
  k10:=10;
  if number=k1 then image1.BringToFront;
  if number=k2 then image2.BringToFront;
  if number=k3 then image3.BringToFront;
  if number=k4 then image4.BringToFront;
  if number=k5 then image5.BringToFront;
  if number=k6 then image6.BringToFront;
  if number=k7 then image7.BringToFront;
  if number=k8 then image8.BringToFront;
  if number=k9 then image9.BringToFront;
  if number=k10 then image10.BringToFront;
end;


procedure TBlockPowerSupplyForm.Reload;
begin
  imgPower.Visible:=Boolean( Station.PowerSupply.butPower= butPositionUp);
  P4_2.Visible:=Boolean( Station.PowerSupply.butPower= butPositionUp);
  P4_1.Visible:=Boolean( Station.PowerSupply.butPower= butPositionDown);
end;


procedure ImageStart5(image1,image2,image3,image4,image5:timage;number:integer);
var k1,k2,k3,k4,k5:integer;
begin
  image1.SendToBack;
  k1:=1;
  image2.SendToBack;
  k2:=2;
  image3.SendToBack;
  k3:=3;
  image4.SendToBack;
  k4:=4;
  image5.SendToBack;
  k5:=5;

  if number=k1 then image1.BringToFront;
  if number=k2 then image2.BringToFront;
  if number=k3 then image3.BringToFront;
  if number=k4 then image4.BringToFront;
  if number=k5 then image5.BringToFront;
end;

procedure ImageClick(image1:timage;image2:timage;image3:timage;
  Button: TMouseButton;var Number:integer);
var k1,k2,k3:integer;
begin
  k1:=1;k2:=2;k3:=3;
  if button=mbleft then begin
    if number<3 then begin
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
        image2.SendToBack;image1.SendToBack;
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
    end;  //number>0
  end; //b;   utton=mbright
end;

procedure ImageClick2(image1:timage;image2:timage;Button: TMouseButton;var Number:integer);
var k1,k2:integer;
begin
//  k1:=1;k2:=2;
//  if k1=number then
//  begin
//    //image2.BringToFront;
//    //image1.SendToBack;
//    number:=k2;
//    Station.PowerSupply.butPower:= butPositionUp;
//  end
//  else
//  begin
//    if k2=number then
//    begin
//      //image1.BringToFront;
//      //image2.SendToBack;
//      number:=k1;
//      Station.PowerSupply.butPower:= butPositionDown;
//    end;  //number<4
//  end;
end;

procedure ImageClick10(image1,image2,image3,image4,image5,
  image6,image7,image8,image9,image10:timage;
  Button: TMouseButton;var Number:integer);
var k1,k2,k3,k4,k5,k6,k7,k8,k9,k10:integer;
begin
  k1:=1;k2:=2;k3:=3;k4:=4;k5:=5;k6:=6;k7:=7;k8:=8;k9:=9;k10:=10;
  if button=mbleft then
  begin
    if number<10 then
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
        image3.SendToBack;image5.SendToBack;
      end;
      if k5=number then
      begin
        image5.BringToFront;
        image4.SendToBack;image6.SendToBack;
      end;
      if k6=number then
      begin
        image6.BringToFront;
        image5.SendToBack;image7.SendToBack;
      end;
      if k7=number then
      begin
        image7.BringToFront;
        image6.SendToBack;image8.SendToBack;
      end;
      if k8=number then
      begin
        image8.BringToFront;
        image7.SendToBack;image9.SendToBack;
      end;
      if k9=number then
      begin
        image9.BringToFront;
        image8.SendToBack;image10.SendToBack;
      end;
      if k10=number then
      begin
        image10.BringToFront;
        image9.SendToBack;image8.SendToBack;
      end;
    end;  //number<4
  end; //button=mbleft

  if button=mbright then
  begin
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
        image3.SendToBack;image5.SendToBack;
      end;
      if k5=number then
      begin
        image5.BringToFront;
        image4.SendToBack;image6.SendToBack;
      end;
      if k6=number then
      begin
        image6.BringToFront;
        image5.SendToBack;image7.SendToBack;
      end;
      if k7=number then
      begin
        image7.BringToFront;
        image6.SendToBack;image8.SendToBack;
      end;
      if k8=number then
      begin
        image8.BringToFront;
        image7.SendToBack;image9.SendToBack;
      end;
      if k9=number then
      begin
        image9.BringToFront;
        image8.SendToBack;image10.SendToBack;
      end;
      if k10=number then
      begin
        image10.BringToFront;
        image9.SendToBack;image8.SendToBack;
      end;
    end;  //number>0
  end; //button=mbright
end;

procedure ImageClick5(image1,image2,image3,image4,image5:timage;
  Button: TMouseButton;var Number:integer);
var k1,k2,k3,k4,k5,k6,k7,k8,k9,k10:integer;
begin
  k1:=1;k2:=2;k3:=3;k4:=4;k5:=5;
  if button=mbleft then
  begin
    if number<5 then
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
        image3.SendToBack;image5.SendToBack;
      end;
      if k5=number then
      begin
        image5.BringToFront;
        image4.SendToBack;
      end;
    end;  //number<4
  end; //button=mbleft

  if button=mbright then
  begin
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
        image3.SendToBack;image5.SendToBack;
      end;
      if k5=number then
      begin
        image5.BringToFront;
        image4.SendToBack;
      end;
    end;  //number>0
  end; //button=mbright
end;

procedure TBlockPowerSupplyForm.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Skrol:=30;
  HorzScrollbar.Position:=HorzScrollbar.Position+Skrol;
end;

procedure TBlockPowerSupplyForm.P1_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick(P1_1,P1_2,P1_3,Button,P1);
end;

procedure TBlockPowerSupplyForm.P1_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick(P1_1,P1_2,P1_3,Button,P1);
end;

procedure TBlockPowerSupplyForm.P1_3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick(P1_1,P1_2,P1_3,Button,P1);
end;

procedure TBlockPowerSupplyForm.P2_10MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_7MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_8MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P2_9MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,Button,P2);
end;

procedure TBlockPowerSupplyForm.P3_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick5(P3_1,P3_2,P3_3,P3_4,P3_5,Button,P3);
end;

procedure TBlockPowerSupplyForm.P3_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick5(P3_1,P3_2,P3_3,P3_4,P3_5,Button,P3);
end;

procedure TBlockPowerSupplyForm.P3_3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick5(P3_1,P3_2,P3_3,P3_4,P3_5,Button,P3);
end;

procedure TBlockPowerSupplyForm.P3_4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick5(P3_1,P3_2,P3_3,P3_4,P3_5,Button,P3);
end;

procedure TBlockPowerSupplyForm.P3_5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageClick5(P3_1,P3_2,P3_3,P3_4,P3_5,Button,P3);
end;

procedure TBlockPowerSupplyForm.P4_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //ImageClick2(P4_1,P4_2,Button,P4);
  if (Station.PowerSupply.butPower= butPositionUp) then
  begin
    Station.PowerSupply.butPower:= butPositionDown;
  end
  else
  begin
    Station.PowerSupply.butPower:= butPositionUp;
  end;
   Reload;
end;


procedure TBlockPowerSupplyForm.P4_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//ImageClick2(P4_1,P4_2,Button,P4);
      if (Station.PowerSupply.butPower= butPositionUp) then
  begin
    Station.PowerSupply.butPower:= butPositionDown;
  end
  else
  begin
    Station.PowerSupply.butPower:= butPositionUp;
  end;
  Reload;
end;

procedure TBlockPowerSupplyForm.FormCreate(Sender: TObject);
begin
  Horzscrollbar.Create;
  Horzscrollbar.Visible:=true;
  Horzscrollbar.Position:=10;

  P1:=1;
  ImageStart(P1_1,P1_2,P1_3,P1);
  P2:=1;
  ImageStart10(P2_1,P2_2,P2_3,P2_4,P2_5,P2_6,P2_7,P2_8,P2_9,P2_10,P2);
  P3:=1;
  ImageStart5(P3_1,P3_2,P3_3,P3_4,P3_5,P3);
  P4:=1;
  //ImageStart2(P4_1,P4_2,P4);
  MoveFormInScreenCenter(Self);

  Reload;
end;

procedure TBlockPowerSupplyForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TBlockPowerSupplyForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TBlockPowerSupplyForm.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Skrol:=30;
  HorzScrollbar.Position:=HorzScrollbar.Position-Skrol;
end;
end.
