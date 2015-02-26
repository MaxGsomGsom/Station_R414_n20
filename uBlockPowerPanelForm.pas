unit uBlockPowerPanelForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, ImgList, StdCtrls, uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  TBlockPowerPanelForm = class(TForm)
    Image1: TImage;
    ilSwPhase: TImageList;
    imgSwPhase: TImage;
    imgSwNet: TImage;
    ilSwNet: TImageList;
    k1_1: TImage;
    k1_2: TImage;
    k1_3: TImage;
    k2_3: TImage;
    k2_1: TImage;
    k2_2: TImage;
    k3_1: TImage;
    k3_3: TImage;
    k3_2: TImage;
    k4_1: TImage;
    k4_3: TImage;
    k4_2: TImage;
    k5_2: TImage;
    k5_3: TImage;
    k5_1: TImage;
    k6_2: TImage;
    k6_3: TImage;
    k6_1: TImage;
    k7_2: TImage;
    k7_3: TImage;
    k7_1: TImage;
    t1_1: TImage;
    t1_2: TImage;
    t2_1: TImage;
    t2_2: TImage;
    t3_1: TImage;
    t3_2: TImage;
    t4_1: TImage;
    t4_2: TImage;
    t5_1: TImage;
    t5_2: TImage;
    t6_1: TImage;
    t6_2: TImage;
    t7_1: TImage;
    t7_2: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    Image6: TImage;
    Label2: TLabel;
    Image7: TImage;
    Label3: TLabel;
    Image8: TImage;
    Label4: TLabel;
    Image9: TImage;
    Label5: TLabel;
    Image10: TImage;
    Label6: TLabel;
    Image11: TImage;
    Label7: TLabel;
    imgIndSwNet: TImage;
    img1700: TImage;
    img1900: TImage;
    img1900_2: TImage;
    img1200_2: TImage;
    img1200: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure imgSwPhaseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSwNetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k1_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k1_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k1_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k2_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k2_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k2_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k3_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k3_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k3_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k4_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k4_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k4_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k5_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k5_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k5_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k6_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k6_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k6_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k7_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k7_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k7_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t1_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t1_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t2_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t2_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t3_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t3_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t4_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t4_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t5_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t5_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t6_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t6_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t7_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure t7_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure k1_1Click(Sender: TObject);
    procedure k4_1Click(Sender: TObject);
    procedure k7_1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Reload;
    constructor Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController); reintroduce;



var
 // BlockPowerPanelForm: TBlockPowerPanelForm;
 ButtonBackForm: TButtonBackForm;
  Station: TStation;
  TaskController: TTaskController;

  end;

implementation

uses
  uStationR414Form,
  uEducationForm,
  uDefinitionsDM,
  uConstantsDM;

{$R *.dfm}

constructor TBlockPowerPanelForm.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure TBlockPowerPanelForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TBlockPowerPanelForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TBlockPowerPanelForm.FormCreate(Sender: TObject);
begin
   MoveFormInScreenCenter(Self);
end;

procedure TBlockPowerPanelForm.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TBlockPowerPanelForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TBlockPowerPanelForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TBlockPowerPanelForm.FormShow(Sender: TObject);
begin
  Reload;
end;


procedure TBlockPowerPanelForm.imgSwPhaseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbLeft) and (Station.PowerPanel.swPhase < 4) then
  begin
    Inc(Station.PowerPanel.swPhase, 1);
  end;
  if (Button = mbRight) and (Station.PowerPanel.swPhase > 0) then
  begin
    Dec(Station.PowerPanel.swPhase, 1);
  end;
  Reload;
end;

procedure TBlockPowerPanelForm.imgSwNetMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbLeft) and (Station.PowerPanel.swNet < 2) then
  begin
    Station.PowerPanel.swNet := Station.PowerPanel.swNet + 1;
  end;
  if (Button = mbRight) and (Station.PowerPanel.swNet > 0) then
  begin
    Dec(Station.PowerPanel.swNet, 1);
  end;

  Reload;
end;

procedure TBlockPowerPanelForm.k1_1Click(Sender: TObject);
begin
{if (EducationForm.Zanatie3=true)and(StationR414Form.XT3=0) then  BEGIN
image7.Visible:=false;label3.Visible:=false;
END;
}
end;

procedure TBlockPowerPanelForm.k1_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1700Power := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.k1_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbRight) then
  begin
    Station.PowerPanel.sw1700Power := 2;
  end;
  if (Button = mbLeft) then
  begin
    Station.PowerPanel.sw1700Power := 0;
  end;
  Reload;
end;

procedure TBlockPowerPanelForm.k1_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1700Power := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.k2_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.swHeat5A := 1;

  Reload;
end;

procedure TBlockPowerPanelForm.k2_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbRight) then
  begin
    Station.PowerPanel.swHeat5A := 2;
  end;
  if (Button = mbLeft) then
  begin
    Station.PowerPanel.swHeat5A := 0;
  end;

  Reload;
end;

procedure TBlockPowerPanelForm.k2_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.swHeat5A := 1;

  Reload;
end;

procedure TBlockPowerPanelForm.k3_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1900Power := 1;

  Reload;
end;

procedure TBlockPowerPanelForm.k3_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbRight) then
  begin
    Station.PowerPanel.sw1900Power := 2;
  end;
  if (Button = mbLeft) then
  begin
    Station.PowerPanel.sw1900Power := 0;
  end;
  Reload;
end;

procedure TBlockPowerPanelForm.k3_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1900Power := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.k4_1Click(Sender: TObject);
begin
{if (EducationForm.Zanatie3=true)and(StationR414Form.XT3=0) then  BEGIN
image8.Visible:=false;label4.Visible:=false;
END;}
end;

procedure TBlockPowerPanelForm.k4_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1900Power_2 := 1;

  Reload;
end;

procedure TBlockPowerPanelForm.k4_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbRight) then
  begin
    Station.PowerPanel.sw1900Power_2 := 2;
  end;
  if (Button = mbLeft) then
  begin
    Station.PowerPanel.sw1900Power_2 := 0;
  end;

  Reload;
end;

procedure TBlockPowerPanelForm.k4_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1900Power_2 := 1;

  Reload;
end;

procedure TBlockPowerPanelForm.k5_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1200Power_2 := 1;

  Reload;
end;

procedure TBlockPowerPanelForm.k5_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbRight) then
  begin
    Station.PowerPanel.sw1200Power_2 := 2;
  end;
  if (Button = mbLeft) then
  begin
    Station.PowerPanel.sw1200Power_2 := 0;
  end;

  Reload;
end;

procedure TBlockPowerPanelForm.Reload;
begin
  t1_2.Visible := Boolean(Station.PowerPanel.butRetranslator = butPositionUp);
  t1_1.Visible := Boolean(Station.PowerPanel.butRetranslator = butPositionDown);

  t2_2.Visible := Boolean(Station.PowerPanel.butRetranslator2 = butPositionUp);
  t2_1.Visible := Boolean(Station.PowerPanel.butRetranslator2 = butPositionDown);

  t6_2.Visible := Boolean(Station.PowerPanel.butVent1 = butPositionUp);
  t6_1.Visible := Boolean(Station.PowerPanel.butVent1 = butPositionDown);

  t7_2.Visible := Boolean(Station.PowerPanel.butVent1_2 = butPositionUp);
  t7_1.Visible := Boolean(Station.PowerPanel.butVent1_2 = butPositionDown);

  t3_2.Visible := Boolean(Station.PowerPanel.butUnitBK = butPositionUp);
  t3_1.Visible := Boolean(Station.PowerPanel.butUnitBK = butPositionDown);

  t4_2.Visible := Boolean(Station.PowerPanel.butVipriamit4V = butPositionUp);
  t4_1.Visible := Boolean(Station.PowerPanel.butVipriamit4V = butPositionDown);

  t5_2.Visible := Boolean(Station.PowerPanel.butVent3 = butPositionUp);
  t5_1.Visible := Boolean(Station.PowerPanel.butVent3 = butPositionDown);

  t1_2.Invalidate;
  t1_1.Invalidate;
  t2_2.Invalidate;
  t2_1.Invalidate;
  t3_2.Invalidate;
  t3_1.Invalidate;
  t4_2.Invalidate;
  t4_1.Invalidate;
  t5_2.Invalidate;
  t5_1.Invalidate;
  t6_2.Invalidate;
  t6_1.Invalidate;
  t7_2.Invalidate;
  t7_1.Invalidate;

  case Station.PowerPanel.swPhase of
    0, 2, 4:
      begin
        image4.Visible := Boolean(Station.PowerPanel.swNet = 1);
      end;
    1, 3:
      begin
        Image4.Visible := False
      end;
  end;
  Image4.Invalidate;
  ilSwPhase.GetBitmap(Station.PowerPanel.swPhase, imgSwPhase.Picture.Bitmap);
  imgSwPhase.Invalidate;

  imgIndSwNet.Visible := Boolean(Station.PowerPanel.swNet = 1);;

  ilSwNet.GetBitmap(Station.PowerPanel.swNet, imgSwNet.Picture.Bitmap);
  imgSwNet.BringToFront;
  imgSwNet.Invalidate;
  ilSwPhase.GetBitmap(Station.PowerPanel.swPhase, imgSwPhase.Picture.Bitmap);
  imgSwPhase.Invalidate;
  case Station.PowerPanel.swPhase of
    0, 2, 4:
      begin
        image4.Visible := Boolean(Station.PowerPanel.swNet = 1);
      end;
    1, 3:
      begin
        Image4.Visible := False
      end;
  end;

  k2_2.Visible := Boolean(Station.PowerPanel.swHeat5A = 1);
  k2_1.Visible := Boolean(Station.PowerPanel.swHeat5A = 2);
  k2_3.Visible := Boolean(Station.PowerPanel.swHeat5A = 0);
  k2_3.Invalidate;
  k2_2.Invalidate;
  k2_1.Invalidate;

  if Station.PowerPanel.swNet = 1 then
  begin
    img1900.Visible := True;
    img1900.Invalidate;
  end;

  if Station.PowerPanel.butRetranslator = butPositionDown then
  begin
    t1_2.Visible := False;
    t1_1.Visible := not(t1_2.Visible);
    t1_1.BringToFront;
  end
  else
  begin
    t1_1.Visible := False;
    t1_2.Visible := not(t1_1.Visible);
    t1_2.BringToFront;
  end;

  case Station.PowerPanel.sw1700Power of
    0:
      begin
        k1_1.Visible := True;
        k1_2.Visible := False;
        k1_3.Visible := False;
        k1_1.BringToFront;
        img1700.Visible := False;
        img1700.Invalidate;
      end;
    1:
      begin
        k1_1.Visible := False;
        k1_2.Visible := True;
        k1_3.Visible := False;
        k1_2.BringToFront;
        img1700.Visible := Boolean(Station.PowerPanel.swNet = 1);
        img1700.Invalidate;
      end;
    2:
      begin
        k1_1.Visible := False;
        k1_2.Visible := False;
        k1_3.Visible := True;
        k1_3.BringToFront;
        img1700.Visible := False;
        img1700.Invalidate;
      end;
  end;
  k1_3.Invalidate;
  k1_2.Invalidate;
  k1_1.Invalidate;

  case Station.PowerPanel.sw1900Power of
    1:
      begin
        k3_1.Visible := False;
        k3_2.Visible := True;
        k3_3.Visible := False;
        k3_2.BringToFront;
        img1900_2.Visible := Boolean(Station.PowerPanel.swNet = 1);
        img1900_2.Invalidate;
      end;
    2:
      begin
        k3_1.Visible := False;
        k3_2.Visible := False;
        k3_3.Visible := True;
        k3_3.BringToFront;
        img1900_2.Visible := False;
        img1900_2.Invalidate;
      end;
    0:
      begin
        k3_1.Visible := True;
        k3_2.Visible := False;
        k3_3.Visible := False;
        k3_1.BringToFront;
        img1900_2.Visible := False;
        img1900_2.Invalidate;
      end;
  end;
  k3_1.Invalidate;
  k3_2.Invalidate;
  k3_3.Invalidate;

  case Station.PowerPanel.sw1900Power_2 of
    1:
      begin
        k4_1.Visible := False;
        k4_2.Visible := True;
        k4_3.Visible := False;
        k4_2.BringToFront;
        img1900.Visible := Boolean(Station.PowerPanel.swNet = 1);
        img1900.Invalidate;
      end;
    2:
      begin
        k4_1.Visible := False;
        k4_2.Visible := False;
        k4_3.Visible := True;
        k4_3.BringToFront;
        img1900.Visible := False;
        img1900.Invalidate;
      end;
    0:
      begin
        k4_1.Visible := True;
        k4_2.Visible := False;
        k4_3.Visible := False;
        k4_1.BringToFront;
        img1900.Visible := False;
        img1900.Invalidate;
      end;
  end;
  k4_3.Invalidate;
  k4_2.Invalidate;
  k4_1.Invalidate;

  case Station.PowerPanel.sw1200Power of
    1:
      begin
        k7_1.Visible := False;
        k7_2.Visible := True;
        k7_3.Visible := False;
        k7_2.BringToFront;
        img1200.Visible := Station.PowerPanel.swNet = 1;
        img1200.Invalidate;
      end;
    2:
      begin
        k7_1.Visible := False;
        k7_2.Visible := False;
        k7_3.Visible := True;
        k7_3.BringToFront;
        img1200.Visible := False;
        img1200.Invalidate;
      end;
    0:
      begin
        k7_1.Visible := True;
        k7_2.Visible := False;
        k7_3.Visible := False;
        k7_1.BringToFront;
        img1200.Visible := False;
        img1200.Invalidate;
      end;
  end;
  k7_1.Invalidate;
  k7_2.Invalidate;
  k7_3.Invalidate;

  case  Station.PowerPanel.sw1400 of
    1:
      begin
        Station.PowerPanel.sw1400 := 1;
        k6_1.Visible := False;
        k6_2.Visible := True;
        k6_3.Visible := False;
        k6_2.BringToFront;
      end;
    2:
      begin
        k6_1.Visible := False;
        k6_2.Visible := False;
        k6_3.Visible := True;
        k6_3.BringToFront;
      end;
    0:
      begin
        k6_1.Visible := True;
        k6_2.Visible := False;
        k6_3.Visible := False;
        k6_1.BringToFront;
      end;
  end;
  k6_1.Invalidate;
  k6_2.Invalidate;
  k6_3.Invalidate;

  case Station.PowerPanel.sw1200Power_2 of
    1:
      begin
          k5_1.Visible := False;
          k5_2.Visible := True;
          k5_3.Visible := False;
          k5_2.BringToFront;
          img1200_2.Visible := Boolean(Station.PowerPanel.swNet = 1);
          img1200_2.Invalidate;
      end;
    2:
      begin
        k5_1.Visible := False;
        k5_2.Visible := False;
        k5_3.Visible := True;
        k5_3.BringToFront;
        img1200_2.Visible := False;
        img1200_2.Invalidate;
      end;
    0:
      begin
        k5_1.Visible := True;
        k5_2.Visible := False;
        k5_3.Visible := False;
        k5_1.BringToFront;
        img1200_2.Visible := False;
        img1200_2.Invalidate;
      end;
  end;

  k5_1.Invalidate;
  k5_2.Invalidate;
  k5_3.Invalidate;
end;

procedure TBlockPowerPanelForm.k5_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1200Power_2 := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.k6_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1400 := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.k6_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbRight) then
  begin
    Station.PowerPanel.sw1400 := 2;
  end;
  if (Button = mbLeft) then
  begin
    Station.PowerPanel.sw1400 := 0;
  end;
  Reload;
end;

procedure TBlockPowerPanelForm.k6_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1400 := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.k7_1Click(Sender: TObject);
begin
{if (EducationForm.Zanatie3=true)and(StationR414Form.XT3=0) then  BEGIN
image11.Visible:=false;label7.Visible:=false;
showmessage('Настройка питания сделана.Проверьте правильность включения.');
END;}
end;

procedure TBlockPowerPanelForm.k7_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1200Power := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.k7_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  if (Button = mbRight) then
  begin
    Station.PowerPanel.sw1200Power := 2;
  end;
  if (Button = mbLeft) then
  begin
    Station.PowerPanel.sw1200Power := 0;
    k7_1.Visible := True;
    k7_2.Visible := False;
    k7_3.Visible := False;
    k7_1.BringToFront;
  end;
  Reload;
end;

procedure TBlockPowerPanelForm.k7_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.sw1200Power := 1;
  Reload;
end;

procedure TBlockPowerPanelForm.t1_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butRetranslator := butPositionUp;

  Reload;
end;

procedure TBlockPowerPanelForm.t1_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butRetranslator := butPositionDown;

  Reload;
end;

procedure TBlockPowerPanelForm.t2_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butRetranslator2 := butPositionUp;

  Reload;
end;

procedure TBlockPowerPanelForm.t2_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butRetranslator2 := butPositionDown;

  Reload;
end;

procedure TBlockPowerPanelForm.t3_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butUnitBK := butPositionUp;

  Reload;
end;

procedure TBlockPowerPanelForm.t3_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butUnitBK := butPositionDown;

  Reload;
end;

procedure TBlockPowerPanelForm.t4_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVipriamit4V := butPositionUp;

  Reload;
end;

procedure TBlockPowerPanelForm.t4_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVipriamit4V := butPositionDown;

  Reload;
end;

procedure TBlockPowerPanelForm.t5_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVent3 := butPositionDown;

  Reload;
end;

procedure TBlockPowerPanelForm.t5_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVent3 := butPositionDown;

  Reload;
end;

procedure TBlockPowerPanelForm.t6_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVent1 := butPositionUp;

  Reload;
end;

procedure TBlockPowerPanelForm.t6_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVent1 := butPositionDown;

  Reload;
end;

procedure TBlockPowerPanelForm.t7_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVent1_2 := butPositionUp;

  Reload;
end;

procedure TBlockPowerPanelForm.t7_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TaskController.ChangeEvent;
  Station.PowerPanel.butVent1_2 := butPositionDown;

  Reload;
end;

end.
