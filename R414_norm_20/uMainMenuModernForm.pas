unit uMainMenuModernForm;

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
  StdCtrls,
  uEducationForm,
  uAboutStationForm,
  uAboutProgramForm,
  ExtCtrls,
  pngimage,
  uSettingsForm,
  uDefinitionsDM,
  uPassWordForm;

type
  TMainMenuModernForm = class(TForm)
    btnEducation: TButton;
    btnSettings: TButton;
    btnAboutProgram: TButton;
    btnExit: TButton;
    imgLogo: TImage;


    procedure btnExitClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnAboutProgramClick(Sender: TObject);
    procedure btnEducationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    bmpBackground : TBitmap;
  public
    { Public declarations }
  end;
var
  MainMenuModernForm: TMainMenuModernForm;


implementation

uses
  uConnectToServerForm;

{$R *.dfm}

procedure TMainMenuModernForm.FormCreate(Sender: TObject);
begin
  bmpBackground := TBitmap.Create;
  bmpBackground.LoadFromFile('images/mainViewMiniAndISPULogo.bmp');
  imgLogo.Picture.Bitmap := bmpBackground;
end;

procedure TMainMenuModernForm.btnAboutProgramClick(Sender: TObject);
begin
  Hide;
  AboutProgramForm := TAboutProgramForm.Create(Self);
  AboutProgramForm.Show;
end;

procedure TMainMenuModernForm.btnSettingsClick(Sender: TObject);
begin
  Hide;
  SettingsForm := TSettingsForm.Create(Self);
  SettingsForm.Show;
  //PassWordForm.Tag := 1;
  //ControlAdminPassword;
end;

procedure TMainMenuModernForm.btnEducationClick(Sender: TObject);
begin
  Hide;
  //UsersForm.Show;
  ConnectToServerForm := TConnectToServerForm.Create(Self);
  ConnectToServerForm.Show;
end;

procedure TMainMenuModernForm.btnExitClick(Sender: TObject);
begin
  Hide;
  Application.Terminate;
end;

end.
