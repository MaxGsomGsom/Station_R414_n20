unit uRackP321MinForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, uRackP321Form, uStationStateDM, uTaskControllerDM;

type
  TRackP321MinForm = class(TForm)
    imgBG: TImage;
    lbl1: TLabel;
    procedure imgBGClick(Sender: TObject);
    constructor Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdP321();

    var
   Station: TStation;
  TaskController: TTaskController;
    P321Form: TRackP321Form;

 end;



implementation


uses
  uDefinitionsDM;

{$R *.dfm}



procedure TRackP321MinForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if (P321Form <> nil) then P321Form.Close;

end;



procedure TRackP321MinForm.imgBGClick(Sender: TObject);
begin
P321Form:=TRackP321Form.Create(Owner, 3, Station, TaskController);
P321Form.Top:=0;
P321Form.Left := Screen.Width div 2 - P321Form.Width div 2;

P321Form.Show;
end;

constructor TRackP321MinForm.Create(AOwner: TComponent; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);

  Station:=Station0;
  TaskController:=TaskController0;

  Self.Left := Screen.Width - Self.Width;
  Self.Top:= 100;

end;


procedure TRackP321MinForm.UpdP321;
begin
  if (P321Form <> nil) then P321Form.PaintDisplay;

end;

end.
