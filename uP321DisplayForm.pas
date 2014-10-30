unit uP321DisplayForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TP321DisplayForm = class(TForm)
    imgDisplay: TImage;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  P321DisplayForm: TP321DisplayForm;

implementation

uses uRackP321Form;

{$R *.dfm}

procedure TP321DisplayForm.FormShow(Sender: TObject);
begin
  //RackP321Form.PaintDisplay;
end;

end.
