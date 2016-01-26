unit uLoaderForm;

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
  ExtCtrls,
  pngimage,
  ComCtrls,
  Sockets;

type
  TLoaderForm = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  ssActive = 1;
  ssNotActive = 2;

var
  LoaderForm: TLoaderForm;

implementation

{$R *.dfm}

uses
  uRack1600BForm,
  uDefinitionsDM,
  uBlockPowerPanelForm,
  uRack1500Form,
  uRackP321Form,
  uRack1400Form,
  uBlockOscillographForm,
  uBlockRemoteControllerForm,
  uBlockP323ISHForm,
  uRack1710Form,
  uRack1200RightForm,
  uRack1200LeftForm,
  uRack1600Form,
  uBlockWaveMeterForm,
  uRack1920Form,
  uBlockDuplexerForm,
  uBlockGeneratorForm,
  uBlockLittleNoisyAmplifierForm,
  uRack1500bForm;

end.
