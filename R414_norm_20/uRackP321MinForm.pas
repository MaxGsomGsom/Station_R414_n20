unit uRackP321MinForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls;

type
  TRackP321MinForm = class(TForm)
    imgBG: TImage;
    btnShow: TButton;
    btnHide: TButton;
    imgDisplay: TImage;
    procedure btnShowClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

 end;
var
  RackP321MinForm: TRackP321MinForm;


implementation


uses
  uDefinitionsDM,
  uRackP321Form;

{$R *.dfm}

procedure TRackP321MinForm.btnHideClick(Sender: TObject);
var
  RackP321Form:TRackP321Form;
begin
  if RackP321Form.Showing then
  begin
    RackP321Form.Close;
    RackP321Form.FreeCallDeInit;
  end;
end;

procedure TRackP321MinForm.btnShowClick(Sender: TObject);
var
  RackP321Form:TRackP321Form;
begin
  if not(RackP321Form.Showing) then
  begin
    RackP321Form.FreeCallInit;
    RackP321Form.Show;
  end;
end;

procedure TRackP321MinForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  RackP321Form:TRackP321Form;
begin
  if RackP321Form.Showing then
  begin
    RackP321Form.FreeCallDeInit;
  end;
end;

end.
