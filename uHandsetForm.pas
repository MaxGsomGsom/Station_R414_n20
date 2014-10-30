unit uHandsetForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls;

type
  THandsetForm = class(TForm)
    imgTrubka: TImage;
    imgTrubkaPushed: TImage;
    imgSpeechOn: TImage;
    imgSpeech: TImage;
    tmrSpeech: TTimer;
    procedure imgTrubkaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrSpeechTimer(Sender: TObject);
    procedure imgTrubkaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HandsetForm: THandsetForm;

implementation

uses
  uRack1400Form,
  uRack1200LeftForm,
  uRack1200RightForm,
  uRack1710Form,
  uBlockRemoteControllerForm,
  uEducationForm,
  uStationR414Form,
  uBlockOscillographForm;

{$R *.dfm}

procedure THandsetForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 27 then
  begin
    Self.Close;
  end;
end;

procedure THandsetForm.imgTrubkaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //BlockOscillographForm.imgDeviation.Visible := True;
  //BlockOscillographForm.tmrMain.Enabled := True;
  imgTrubka.Visible := False;
  tmrSpeech.Enabled := True;
end;

procedure THandsetForm.imgTrubkaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //BlockOscillographForm.tmrMain.Enabled := False;
  //BlockOscillographForm.imgDeviation.Visible := False;
  imgTrubka.Visible := True;
  tmrSpeech.Enabled := False;
end;

procedure THandsetForm.tmrSpeechTimer(Sender: TObject);
begin
  imgSpeechOn.Visible := not(imgSpeechOn.Visible);
  imgSpeech.Visible := not(imgSpeechOn.Visible);
end;

end.
