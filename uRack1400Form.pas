unit uRack1400Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, uAdditionalFormMethods,
  uTaskControllerDM,
  uStationStateDM,
  uButtonBackForm;

type
  TRack1400Form = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    imgPrA: TImage;
    imgPrB: TImage;
    Image7: TImage;
    Label7: TLabel;
    imgSwKukushka1: TImage;
    imgSwKukushka2: TImage;
    imgSwKukushka3: TImage;
    imgSwKukushka4: TImage;
    imgTrubka: TImage;
    imgSpeakerOn: TImage;
    imgSpeakerOff: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Reload;
    procedure imgSwKukushka1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgTrubkaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure imgSpeakerOnClick(Sender: TObject);
    procedure imgSpeakerOffClick(Sender: TObject);
  private
    { Private declarations }
    procedure imgsKukushkaChange(Button: TMouseButton);
  public
    { Public declarations }
    Bst:boolean;
    constructor Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController); reintroduce;


var
  Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
  //Rack1400Form: TRack1400Form;

  end;
implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uEducationForm,
  uHandsetForm,
  uBlockOscillographForm,
  uConstantsDM;

{$R *.dfm}

constructor TRack1400Form.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);

  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure TRack1400Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;

//  HandsetForm.Close;
//  BlockOscillographForm_obr.Close;
//  HandsetForm.Timer1.Enabled:=false;
//  Image5.Visible:=false;
//  Image6.Visible:=false;
//  BlockOscillographForm_obr.Image3.Visible:=false;
//  BlockOscillographForm_obr.Image4.Visible:=false;
end;

procedure TRack1400Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TaskController.CheckFormBeforeClosing(CanClose);
end;

procedure TRack1400Form.FormCreate(Sender: TObject);
begin
  Bst:=false;
  MoveFormInScreenCenter(Self);
end;

procedure TRack1400Form.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TRack1400Form.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + ScroolValue;
end;

procedure TRack1400Form.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - ScroolValue;
end;

procedure TRack1400Form.Reload;
var
  imgsSwKukushka: array [1..4] of ^TImage;
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
  imgsSwKukushka[Station.Rack1400.swKukushka].Visible := True;
  imgsSwKukushka[Station.Rack1400.swKukushka].Invalidate;

  imgPrA.Visible := False;
  imgPrB.Visible := False;
  if Station.IsPluggedIn then
  begin
    if Station.PowerPanel.sw1400 = 1 then
    begin
      imgPrA.Visible := Boolean(Station.Rack1400.butPower = butPositionRight);
      imgPrB.Visible := Boolean(Station.Rack1400.butPower = butPositionRight);
    end;
  end;
  imgPrA.Invalidate;
  imgPrB.Invalidate;

  Image3.Visible := Boolean(Station.Rack1400.butPower = butPositionRight);
  Image2.Visible := Boolean(Station.Rack1400.butPower = butPositionLeft);
  imgSpeakerOn.Visible := Boolean(Station.Rack1400.butSpeaker = butPositionRight);
  imgSpeakerOff.Visible := Boolean(Station.Rack1400.butSpeaker = butPositionLeft);
end;

procedure TRack1400Form.FormShow(Sender: TObject);
begin
//  if EducationForm.Zanatie5=true then begin
//  Image7.Visible:=true;
//  label7.Visible:=true;
//  end else begin
//  Image7.Visible:=false;
//  label7.Visible:=false;
//  end;

  Reload;
end;

procedure TRack1400Form.Image2Click(Sender: TObject);
begin
  TaskController.ChangeEvent;
  if Station.Rack1400.butPower = butPositionLeft then
    Station.Rack1400.butPower := butPositionRight
  else
    Station.Rack1400.butPower := butPositionLeft;

  Reload;
end;

procedure TRack1400Form.Image3Click(Sender: TObject);
begin
  TaskController.ChangeEvent;
  if Station.Rack1400.butPower = butPositionLeft then
    Station.Rack1400.butPower := butPositionRight
  else
    Station.Rack1400.butPower := butPositionLeft;

  Reload;
end;

procedure TRack1400Form.Image4Click(Sender: TObject);
begin
  TaskController.ChangeEvent;
end;

procedure TRack1400Form.imgsKukushkaChange(Button: TMouseButton);
begin
  if (Button = mbLeft) and (Station.Rack1400.swKukushka < 4)  then
    Inc(Station.Rack1400.swKukushka, 1);
  if (Button = mbRight) and (Station.Rack1400.swKukushka > 1)  then
    Dec(Station.Rack1400.swKukushka, 1);

  Reload;
end;

procedure TRack1400Form.imgSpeakerOffClick(Sender: TObject);
begin
     TaskController.ChangeEvent;
  if Station.Rack1400.butSpeaker = butPositionLeft then
    Station.Rack1400.butSpeaker := butPositionRight
  else
    Station.Rack1400.butSpeaker := butPositionLeft;

  Reload;
end;

procedure TRack1400Form.imgSpeakerOnClick(Sender: TObject);
begin
TaskController.ChangeEvent;
  if Station.Rack1400.butSpeaker = butPositionLeft then
    Station.Rack1400.butSpeaker := butPositionRight
  else
    Station.Rack1400.butSpeaker := butPositionLeft;

  Reload;
end;

procedure TRack1400Form.imgSwKukushka1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgsKukushkaChange(Button);
end;

procedure TRack1400Form.imgTrubkaClick(Sender: TObject);
begin
  if not(HandsetForm.Showing) then
    HandsetForm.Show;
end;

end.
