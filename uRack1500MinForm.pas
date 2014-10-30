unit uRack1500MinForm;

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
  pngimage,
  ExtCtrls;

type
  TRack1500MinForm = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rack1500MinForm: TRack1500MinForm;

implementation

uses
  uRack1500Form,
  uDefinitionsDM,
  uWaveMeterPanelForm,
  uRack1600Form,
  uConstantsDM;

{$R *.dfm}

procedure TRack1500MinForm.Image1Click(Sender: TObject);
begin
//  case CurFormId of
//    idRack1500A:
//      begin
//
//      end;
//  end;
end;

end.
