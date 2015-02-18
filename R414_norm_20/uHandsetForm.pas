unit uHandsetForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, uStationStateDM, uTaskControllerDM, StdCtrls;

type
  THandsetForm = class(TForm)
    imgTrubka: TImage;
    imgTrubkaPushed: TImage;
    imgSpeechOn: TImage;
    imgSpeech: TImage;
    tmrSpeech: TTimer;
    lbl1whathalf: TLabel;
    procedure imgTrubkaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrSpeechTimer(Sender: TObject);
    procedure imgTrubkaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);


    constructor Create(AOwner: TComponent; Half0: Integer;  Station0: TStation; TaskController0: TTaskController); reintroduce;
  private
    { Private declarations }
  public
    { Public declarations }
    Half: Integer;
  end;

var
  HandsetForm: THandsetForm;
  Station: TStation;
  TaskController: TTaskController;


implementation

uses
  uRack1400Form,
  uRack1200LeftForm,
  uRack1200RightForm,
  uRack1710Form,
  uBlockRemoteControllerForm,
  uEducationForm,
  uStationR414Form,
  uBlockOscillographForm,
  uAdditionalFormMethods;

{$R *.dfm}

constructor THandsetForm.Create(AOwner: TComponent; Half0: Integer; Station0: TStation; TaskController0: TTaskController);
begin
  Inherited Create(AOwner);
  if (Half0 = 1) then
  begin
    lbl1whathalf.Caption:= 'Трубка 1';
  end
  else
  begin
    lbl1whathalf.Caption:= 'Трубка 2';
  end;
  Half:= Half0;
  Station:=Station0;
  TaskController:=TaskController0;
  //TaskController.Subscribe(self);

  MoveFormInScreenCenter(self);

  Self.Left:= 0;
end;


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
  (Self.Owner as TBlockOscillographForm).imgDeviation.Visible := True;
  (Self.Owner as TBlockOscillographForm).tmrMain.Enabled := True;
  imgTrubka.Visible := False;
  tmrSpeech.Enabled := True;
end;

procedure THandsetForm.imgTrubkaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Self.Owner as TBlockOscillographForm).tmrMain.Enabled := False;
  (Self.Owner as TBlockOscillographForm).imgDeviation.Visible := False;
  imgTrubka.Visible := True;
  tmrSpeech.Enabled := False;
end;

procedure THandsetForm.tmrSpeechTimer(Sender: TObject);
begin
  imgSpeechOn.Visible := not(imgSpeechOn.Visible);
  imgSpeech.Visible := not(imgSpeechOn.Visible);
end;

end.
