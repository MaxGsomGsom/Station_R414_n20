unit uBlockP323ISHForm;

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
  TBlockP323ISHForm = class(TForm)
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
    imgCableInputP323ISHConnected: TImage;
    imgCableInputP323ISHDisconnected: TImage;
    imgDbMinus2: TImage;
    imgDb0: TImage;
    imgDbPlusMax: TImage;
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
    procedure imgCableInputP323ISHDisconnectedClick(Sender: TObject);
    procedure imgCableInputP323ISHConnectedClick(Sender: TObject);
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

constructor TBlockP323ISHForm.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;





procedure TBlockP323ISHForm.Reload;
begin
  imgPower.Visible:=Boolean( (Station.P323ISH.butPower= butPositionUp) and (Station.PowerPanel.swNet = 1));

  P4_2.Visible:=Boolean( Station.P323ISH.butPower= butPositionUp);
  P4_1.Visible:=Boolean( Station.P323ISH.butPower= butPositionDown);

  P1_1.Visible:=Boolean(Station.P323ISH.swResist = 1);
  P1_2.Visible:=Boolean(Station.P323ISH.swResist = 2);
  P1_3.Visible:=Boolean(Station.P323ISH.swResist = 3);

  P2_1.Visible:=Boolean(Station.P323ISH.swLimits = 1);
  P2_2.Visible:=Boolean(Station.P323ISH.swLimits = 2);
  P2_3.Visible:=Boolean(Station.P323ISH.swLimits = 3);
  P2_4.Visible:=Boolean(Station.P323ISH.swLimits = 4);
  P2_5.Visible:=Boolean(Station.P323ISH.swLimits = 5);
  P2_6.Visible:=Boolean(Station.P323ISH.swLimits = 6);
  P2_7.Visible:=Boolean(Station.P323ISH.swLimits = 7);
  P2_8.Visible:=Boolean(Station.P323ISH.swLimits = 8);
  P2_9.Visible:=Boolean(Station.P323ISH.swLimits = 9);
  P2_10.Visible:=Boolean(Station.P323ISH.swLimits = 10);

  P3_1.Visible:=Boolean(Station.P323ISH.swMode = 1);
  P3_2.Visible:=Boolean(Station.P323ISH.swMode = 2);
  P3_3.Visible:=Boolean(Station.P323ISH.swMode = 3);
  P3_4.Visible:=Boolean(Station.P323ISH.swMode = 4);
  P3_5.Visible:=Boolean(Station.P323ISH.swMode = 5);


  imgCableInputP323ISHDisconnected.Visible:= Boolean((Station.CableWhite2.stKonez1.stState = csDisconected) or (Station.CableWhite2.stKonez2.stState = csDisconected));

  imgCableInputP323ISHConnected.Visible:=  Boolean((Station.CableWhite2.stKonez1.stState = csP323ISH) or (Station.CableWhite2.stKonez2.stState = csP323ISH));

   imgDb0.Visible:=False;
   imgDbPlusMax.Visible:=False;
   imgDbMinus2.Visible:=False;

   if (Station.P323ISH.butPower= butPositionUp) and (Station.PowerPanel.swNet = 1) then
   begin

            if (Station.P323ISH.swResist = 2) and (Station.P323ISH.swMode = 4)

            //если белый кабель подключен к П323, а черный к 600 Ом
            and ((Station.CableWhite2.stKonez1.stState = csP323ISH) or (Station.CableWhite2.stKonez2.stState = csP323ISH))
            and (((Station.CableBlack1.stKonez1.stKonez >=360) and (Station.CableBlack1.stKonez1.stKonez <=367)) or ((Station.CableBlack1.stKonez2.stKonez >=360) and (Station.CableBlack1.stKonez2.stKonez <=367)))
            //если полукомплекты настроены
            and (Station.IsPolukomplektATuned) and (Station.IsPolukomplektBTuned)
            //если каналы настроены и кабели к ним подключены
            and ((Station.IsChannelTuned(Station.CurrentChannel(Station.CableWhite2.stKonez1.stKonez))) or (Station.IsChannelTuned(Station.CurrentChannel(Station.CableWhite2.stKonez2.stKonez))) )
            and ((Station.IsChannelTuned(Station.CurrentChannel(Station.CableBlack1.stKonez1.stKonez))) or (Station.IsChannelTuned(Station.CurrentChannel(Station.CableBlack1.stKonez2.stKonez))))
            //если кабели подключены к нужным раземам М и Д
             and ((Station.CurrentPort(Station.CableWhite2.stKonez1.stKonez) = 4) or  (Station.CurrentPort(Station.CableWhite2.stKonez2.stKonez) = 4))
             and ((Station.CurrentPort(Station.CableBlack1.stKonez1.stKonez) = 3) or  (Station.CurrentPort(Station.CableBlack1.stKonez2.stKonez) = 3))

             and ((Station.CurrentChannel(Station.CableWhite2.stKonez1.stKonez) = Station.CurrentChannel(Station.CableBlack1.stKonez1.stKonez)) or
                  (Station.CurrentChannel(Station.CableWhite2.stKonez2.stKonez) = Station.CurrentChannel(Station.CableBlack1.stKonez1.stKonez)) or
                  (Station.CurrentChannel(Station.CableWhite2.stKonez1.stKonez) = Station.CurrentChannel(Station.CableBlack1.stKonez2.stKonez)) or
                  (Station.CurrentChannel(Station.CableWhite2.stKonez2.stKonez) = Station.CurrentChannel(Station.CableBlack1.stKonez2.stKonez)))
            then
            begin

              if (Station.P323ISH.swLimits = 3) then
              begin
                        if (Station.CableWhite2.stKonez1.stState = csP323ISH) then
                        begin
                           if (Station.CurrentHalf(Station.CableWhite2.stKonez2.stKonez) = 1) then Station.RemoteController.Channels.A[Station.CurrentChannel(Station.CableWhite2.stKonez2.stKonez)].stChannelNoise :=True
                           else Station.RemoteController.Channels.B[Station.CurrentChannel(Station.CableWhite2.stKonez2.stKonez)].stChannelNoise :=True;
                        end
                        else
                        begin
                          if (Station.CurrentHalf(Station.CableWhite2.stKonez1.stKonez) = 1) then Station.RemoteController.Channels.A[Station.CurrentChannel(Station.CableWhite2.stKonez1.stKonez)].stChannelNoise :=True
                           else Station.RemoteController.Channels.B[Station.CurrentChannel(Station.CableWhite2.stKonez1.stKonez)].stChannelNoise :=True;
                        end;

                       imgDbMinus2.Visible:=True;
              end
              else  if (Station.P323ISH.swLimits < 3) then
              begin
                       imgDbPlusMax.Visible:=True;
              end;

            end
            else
            begin
               if (Station.P323ISH.swLimits = 8) then imgDb0.Visible:=True
               else if (Station.P323ISH.swLimits < 8) then imgDbPlusMax.Visible:=True;
            end;
   end;





end;



procedure TBlockP323ISHForm.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Skrol:=30;
  HorzScrollbar.Position:=HorzScrollbar.Position+Skrol;
end;

procedure TBlockP323ISHForm.imgCableInputP323ISHConnectedClick(Sender: TObject);
begin

if (Station.CableWhite2.stKonez1.stState = csP323ISH) then
     Station.CableWhite2.stKonez1.stState := csDisconected
  else if (Station.CableWhite2.stKonez2.stState = csP323ISH) then
     Station.CableWhite2.stKonez2.stState := csDisconected;

     Reload;

end;

procedure TBlockP323ISHForm.imgCableInputP323ISHDisconnectedClick(
  Sender: TObject);
begin

  if (Station.CableWhite2.stKonez1.stState = csDisconected) and (Station.CableWhite2.stKonez2.stState <> csP323ISH) then
     Station.CableWhite2.stKonez1.stState := csP323ISH
  else if (Station.CableWhite2.stKonez2.stState = csDisconected) and (Station.CableWhite2.stKonez1.stState <> csP323ISH) then
     Station.CableWhite2.stKonez2.stState := csP323ISH;

     Reload;

end;

procedure TBlockP323ISHForm.P1_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swResist<3) then
    Station.P323ISH.swResist:= Station.P323ISH.swResist+1
  else if (Button = mbRight) and (Station.P323ISH.swResist>1) then
  Station.P323ISH.swResist:= Station.P323ISH.swResist-1;

  Reload;

end;

procedure TBlockP323ISHForm.P1_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.P323ISH.swResist<3) then
    Station.P323ISH.swResist:= Station.P323ISH.swResist+1
  else if (Button = mbRight) and (Station.P323ISH.swResist>1) then
  Station.P323ISH.swResist:= Station.P323ISH.swResist-1;

  Reload;
end;

procedure TBlockP323ISHForm.P1_3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swResist<3) then
    Station.P323ISH.swResist:= Station.P323ISH.swResist+1
  else if (Button = mbRight) and (Station.P323ISH.swResist>1) then
  Station.P323ISH.swResist:= Station.P323ISH.swResist-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_10MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_7MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_8MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P2_9MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swLimits<10) then
    Station.P323ISH.swLimits:= Station.P323ISH.swLimits+1
  else if (Button = mbRight) and (Station.P323ISH.swLimits>1) then
  Station.P323ISH.swLimits:= Station.P323ISH.swLimits-1;

  Reload;
end;

procedure TBlockP323ISHForm.P3_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swMode<5) then
    Station.P323ISH.swMode:= Station.P323ISH.swMode+1
  else if (Button = mbRight) and (Station.P323ISH.swMode>1) then
  Station.P323ISH.swMode:= Station.P323ISH.swMode-1;

  Reload;
end;

procedure TBlockP323ISHForm.P3_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swMode<5) then
    Station.P323ISH.swMode:= Station.P323ISH.swMode+1
  else if (Button = mbRight) and (Station.P323ISH.swMode>1) then
  Station.P323ISH.swMode:= Station.P323ISH.swMode-1;

  Reload;
end;

procedure TBlockP323ISHForm.P3_3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swMode<5) then
    Station.P323ISH.swMode:= Station.P323ISH.swMode+1
  else if (Button = mbRight) and (Station.P323ISH.swMode>1) then
  Station.P323ISH.swMode:= Station.P323ISH.swMode-1;

  Reload;
end;

procedure TBlockP323ISHForm.P3_4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swMode<5) then
    Station.P323ISH.swMode:= Station.P323ISH.swMode+1
  else if (Button = mbRight) and (Station.P323ISH.swMode>1) then
  Station.P323ISH.swMode:= Station.P323ISH.swMode-1;

  Reload;
end;

procedure TBlockP323ISHForm.P3_5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  if (Button = mbLeft) and (Station.P323ISH.swMode<5) then
    Station.P323ISH.swMode:= Station.P323ISH.swMode+1
  else if (Button = mbRight) and (Station.P323ISH.swMode>1) then
  Station.P323ISH.swMode:= Station.P323ISH.swMode-1;

  Reload;
end;

procedure TBlockP323ISHForm.P4_1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Station.P323ISH.butPower= butPositionUp) then
  begin
    Station.P323ISH.butPower:= butPositionDown;
  end
  else
  begin
    Station.P323ISH.butPower:= butPositionUp;
  end;
   Reload;
end;


procedure TBlockP323ISHForm.P4_2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
      if (Station.P323ISH.butPower= butPositionUp) then
  begin
    Station.P323ISH.butPower:= butPositionDown;
  end
  else
  begin
    Station.P323ISH.butPower:= butPositionUp;
  end;
  Reload;
end;

procedure TBlockP323ISHForm.FormCreate(Sender: TObject);
begin
  Horzscrollbar.Create;
  Horzscrollbar.Visible:=true;
  Horzscrollbar.Position:=10;

  MoveFormInScreenCenter(Self);

  Reload;
end;

procedure TBlockP323ISHForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TBlockP323ISHForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TBlockP323ISHForm.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Skrol:=30;
  HorzScrollbar.Position:=HorzScrollbar.Position-Skrol;
end;
end.
