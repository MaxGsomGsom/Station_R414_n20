unit uCloseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmCloseLabel = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCloseLabel: TfrmCloseLabel;

implementation

{$R *.dfm}

uses
  uDefinitionsDM;

procedure TfrmCloseLabel.Image1Click(Sender: TObject);
begin
  //FormsArr[CurFormId].Close;
  frmCloseLabel.Close;
end;

end.
