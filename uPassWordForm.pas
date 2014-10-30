unit uPassWordForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPassWordForm = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassWordForm: TPassWordForm;

implementation

{$R *.dfm}

uses
  uDefinitionsDM,
  uMd5,
  uSettingsForm,
  uMainMenuForm;

procedure TPassWordForm.CancelBtnClick(Sender: TObject);
begin
  //ShowMenuForm;
  Password.Text := '*******';
  PassWordForm.Close;
end;

procedure TPassWordForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Hide;
  //ShowMenuForm;
end;

procedure TPassWordForm.FormShow(Sender: TObject);
begin
  Password.SetFocus;
end;

procedure TPassWordForm.OKBtnClick(Sender: TObject);
var
  strPassword: string;
begin
  strPassword := Trim(Password.Text);
  //if strPassword = '' then
  //  strPassword := '5345jio1h4bir';
  //IspuUvc8
  if strPassword = '123' then
    begin
      case PassWordForm.Tag of
        1:
          begin
            Password.Clear;
            SettingsForm.Show;
          end;
      end;
      PassWordForm.Hide;
    end
  else
    begin
      Application.MessageBox('¬веден неверный пароль администратора!',
      PChar(PName + ' version: ' + Pversion), MB_OK + MB_ICONWARNING +
       MB_TOPMOST);
      //MainMenuForm.Show;
    end;

end;

end.

