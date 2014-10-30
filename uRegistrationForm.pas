unit uRegistrationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uStationStateDM;

type
  TRegistrationForm = class(TForm)
    edtVzvod: TEdit;
    Label6: TLabel;
    btnOk: TBitBtn;
    edtPassword: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    edtKurs: TEdit;
    Label2: TLabel;
    edtName: TEdit;
    Label1: TLabel;
    chkShowPassword: TCheckBox;
    btnCancel: TBitBtn;
    lblSurname: TLabel;
    edtSurname: TEdit;
    lblPatronomyc: TLabel;
    edtPatronomyc: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure chkShowPasswordClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrationForm: TRegistrationForm;
  Station: TStation;

implementation

uses
  uMd5,
  uDefinitionsDM,
  uUsersForm;

{$R *.dfm}

procedure TRegistrationForm.btnCancelClick(Sender: TObject);
begin
  Close;
  UsersForm.Show;
end;

procedure TRegistrationForm.btnOkClick(Sender: TObject);
var
  strName, strSurname, strPatronomyc, Password, strReplay: string;
  Kurs, Vzvod: Integer;
begin
  strName := edtName.Text;
  strSurname := edtSurname.Text;
  strPatronomyc := edtPatronomyc.Text;
  Kurs := StrToInt(edtKurs.Text);
  Vzvod := StrToInt(edtVzvod.Text);
  Password := edtPassword.Text;

  if (Trim(strName) <> '') and
  (Trim(strSurname) <> '') and
  (Trim(strPatronomyc) <> '') and
  (Trim(edtKurs.Text) <> '') and
  (Trim(edtVzvod.Text) <> '') and
  (Trim(edtPassword.Text) <> '') then
  begin
    if  Station.NetWorkMode = nmStandalone then
    begin                       //Если такого пользователя нет в локальной базе
      if not IsUserExists(strName, strSurname, strPatronomyc,
                      Password, Vzvod, Kurs             ) then
      begin
        if CreateUser(strName, strSurname, strPatronomyc,
                      Vzvod, Kurs, Password               ) then
        begin
          Application.MessageBox('Регистрация прошла успешно!', PChar(PName), MB_OK + MB_ICONINFORMATION);
          UsersForm.edtName.Text := strName;
          UsersForm.edtSurname.Text := strSurname;
          UsersForm.edtPatronomyc.Text := strPatronomyc;
          UsersForm.edtVzvod.Text := IntToStr(Vzvod);
          UsersForm.edtKurs.Text := IntToStr(Kurs);
          UsersForm.edtPassword.Text := '';
        end;
        Close;
        UsersForm.Show;
      end
      else
      begin
        Application.MessageBox('Пользователь с указанными данными уже существует!',
        PChar(PName), MB_OK + MB_ICONINFORMATION);
      end;
    end;
  end
  else
  begin
    Application.MessageBox('Пожалуйста заполните все поля!', PChar(PName),
      MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TRegistrationForm.chkShowPasswordClick(Sender: TObject);
begin
  if chkShowPassword.Checked then
    edtPassword.PasswordChar := #0
  else
    edtPassword.PasswordChar := '*';
end;

end.
