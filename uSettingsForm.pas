unit uSettingsForm;

interface

uses
  Windows, Messages, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSettingsForm = class(TForm)
    grp1: TGroupBox;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lblHostName: TLabel;
    lblPort: TLabel;
    edtHostName: TEdit;
    edtPort: TEdit;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtHostNameChange(Sender: TObject);
    procedure edtPortChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSettingsWasChanged: Boolean;
    procedure SetSettingsWasChanged(const bWasChanged: Boolean);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    property SettingsWasChanged: Boolean read FSettingsWasChanged
                                         write SetSettingsWasChanged;
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses
  SysUtils,
  uMainMenuForm,
  uSettingsDM;

constructor TSettingsForm.Create(AOwner: TComponent);
var
txt:string;
begin
  Inherited Create(AOwner);
  if Settings <> nil then
  begin
    edtHostName.Text := Settings.HostName;
    edtPort.Text := IntToStr(Settings.HostPort);
  end
  else ;                      // Залогировать, что класс настроек не определён
  SettingsWasChanged := False;


end;

/// <summary>
/// Обрабатывает нажатие на кнопку "Принять"
/// </summary>
/// <param name="Sender"></param>
procedure TSettingsForm.btnApplyClick(Sender: TObject);
begin
  if SettingsWasChanged then
  begin
    Settings.HostName := edtHostName.Text;            // Сохраняем настройки
    Settings.HostPort := StrToInt(edtPort.Text);

    Settings.SetHostName(edtHostName.Text);
  end;
  SettingsWasChanged := False;
end;

/// <summary>
/// Обрабатывает нажатие на кнопку "Отмена"
/// </summary>
/// <param name="Sender"></param>
procedure TSettingsForm.btnCancelClick(Sender: TObject);
begin
  SettingsForm.Close;
end;

/// <summary>
/// Обрабатывает нажатие на кнопку "OK"
/// </summary>
/// <param name="Sender"></param>
procedure TSettingsForm.btnOKClick(Sender: TObject);
begin
  Self.btnApplyClick(Self);
  Self.Close;
end;

procedure TSettingsForm.SetSettingsWasChanged(const bWasChanged: Boolean);
begin
  if bWasChanged <> SettingsWasChanged then
  begin
    FSettingsWasChanged := bWasChanged;
    btnApply.Enabled := bWasChanged;          // Чтобы делать кнопку неактивной,
                                              // когда ничего не менялось
  end;
end;

procedure TSettingsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    if Owner <> nil then       // Показываем главное меню
    begin
      (Owner as TForm).Show;
    end;
  finally
    Action := caFree;
  end;
end;

procedure TSettingsForm.edtHostNameChange(Sender: TObject);
begin
  SettingsWasChanged := True;
end;

procedure TSettingsForm.edtPortChange(Sender: TObject);
begin
  SettingsWasChanged := True;
end;

end.
