unit uBlockGeneratorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, uAdditionalFormMethods, uTaskControllerDM, uStationStateDM, uButtonBackForm;

type
  TBlockGeneratorForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    imgNet: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Reload;
  public
  constructor Create(AOwner: TComponent; Half: Integer; Station0: TStation; TaskController0: TTaskController); reintroduce;
    { Public declarations }
  end;

var
   Skrol:integer;
   CurFormID: integer;
   Station: TStation;
  ButtonBackForm: TButtonBackForm;
  TaskController: TTaskController;
   const
   idGeneratorA=1;
  idGeneratorB=2;

implementation

uses
  uStationR414Form,
  uDefinitionsDM,
  uEducationForm,
  uConstantsDM;

{$R *.dfm}

constructor TBlockGeneratorForm.Create(AOwner: TComponent; Half:Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
//  idGeneratorA:=1;
//  idGeneratorB:=2;
  CurFormId:=Half;
  Station:=Station0;
  TaskController:=TaskController0;
  TaskController.Subscribe(self);
  ButtonBackForm:= TButtonBackForm.Create(self);
  ButtonBackForm.Show;
end;

procedure TBlockGeneratorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReturnFromRack;
end;

procedure TBlockGeneratorForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CheckFormBeforeClosing(CanClose);
end;

procedure TBlockGeneratorForm.FormCreate(Sender: TObject);
begin
  Horzscrollbar.Create;
  Horzscrollbar.Visible:=true;
  Horzscrollbar.Position:=10;
  MoveFormInScreenCenter(Self);
end;

procedure TBlockGeneratorForm.FormKeyPress(Sender: TObject; var Key: Char);
var StationR414FormminiHWND : HWND;
begin
  if Ord(Key) = 27 then
  begin
    //Инициация события "Закрытие окна стойки"
    StationR414FormminiHWND := FindWindow(StationR414FormminiClassName, StationR414FormminiObjectName);
    PostMessage(StationR414FormminiHWND, MM_RACK_WAS_CLOSED, 0, 0);
  end;
end;

procedure TBlockGeneratorForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  Skrol:=1;
  HorzScrollbar.Position:=HorzScrollbar.Position-Skrol;
end;

procedure TBlockGeneratorForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  Skrol:=1;
  HorzScrollbar.Position:=HorzScrollbar.Position+Skrol;
end;

procedure TBlockGeneratorForm.Reload;
begin
  case CurFormId of
    idGeneratorA, idGeneratorB:
      begin
        imgNet.Visible := Boolean(Station.PowerPanel.swNet = 1);
        imgNet.Invalidate;
      end;
  end;
end;

procedure TBlockGeneratorForm.FormShow(Sender: TObject);
begin
  Reload;
end;

end.
