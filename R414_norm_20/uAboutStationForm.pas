unit uAboutStationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TAboutStationForm = class(TForm)
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  end;

var
  AboutStationForm: TAboutStationForm;

implementation

uses
  uMainMenuForm;

{$R *.dfm}

procedure TAboutStationForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  MainMenuForm.Show;
end;

end.
