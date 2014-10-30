unit uUsersForm;

interface

uses
  Windows,  WinSock, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP,
  uMainMenuForm,
  uLoaderForm;

type
  TUsersForm = class(TForm)
    btnOk: TBitBtn;
    btnCanel: TBitBtn;
    btnRegistration: TBitBtn;
    Label6: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtVzvod: TEdit;
    edtPassword: TEdit;
    edtKurs: TEdit;
    edtName: TEdit;
    chkShowPassword: TCheckBox;
    lblSurname: TLabel;
    edtSurname: TEdit;
    lblPatronomyc: TLabel;
    edtPatronomyc: TEdit;
    IdHTTP1: TIdHTTP;
    cbbNetworkMode: TComboBox;
    lblNetworkMode: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure edtFIOClick(Sender: TObject);
    procedure edtFIOExit(Sender: TObject);
    procedure edtKursClick(Sender: TObject);
    procedure edtKursExit(Sender: TObject);
    procedure Edit3Clic(Sender: TObject);
    procedure edtVzvodExit(Sender: TObject);
    procedure edtPasswordClick(Sender: TObject);
    procedure edtPasswordExit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure btnRegistrationClick(Sender: TObject);
    procedure chkShowPasswordClick(Sender: TObject);
    procedure btnCanelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AdminName,AdminInfo,AdminPass:string;
  end;

var
  UsersForm: TUsersForm;

implementation

uses
  uEducationForm,
  uRegistrationForm,
  uDefinitionsDM,
  uConnectToServerForm,
  uMainMenuModernForm,
  uPreparationToWorkForm,
  uStationStateDM,
  uRandomMethods,
  uConstantsDM;

{$R *.dfm}

procedure TUsersForm.btnOkClick(Sender: TObject);
var
  strName, strSurname, strPatronomyc,strPassword: string;
  val: string;
  Vzvod, Kurs: LongInt;
  WData: WSAData;
  ReciveBytes:Integer;

  {
  procedure AuthSeccesfullyStandAlone;
  begin
    GenerateRandomWaves;
    UsersForm.Hide;
    //Заполним запись текущего пользователя
    CurUser.Surname := strSurname;
    CurUser.Patronomyc := strPatronomyc;
    CurUser.Name := strName;
    CurUser.Vzvod := Vzvod;
    CurUser.Kurs := Kurs;
    CurUser.Id := GetUserId(strName,strSurname,strPatronomyc,vzvod,kurs);
    CurUser.AccessLevelStudy := GetUserAccessLevelStudy(CurUser.ID);
    CurUser.AccessLevelTrening := GetUserAccessLevelTrening(CurUser.ID);

    EducationForm.edtTransmitWaveA.Text := IntToStr(Station.WaveTransmitA);
    EducationForm.edtReceiveWaveA.Text := IntToStr(Station.WaveReceiveA);
    EducationForm.edtTransmitWaveB.Text := IntToStr(Station.WaveTransmitB);
    EducationForm.edtReceiveWaveB.Text := IntToStr(Station.WaveReceiveB);

    EducationForm.Show;
    //------------------------------------
    PutLog(CurUser.ID,'Начало работы с Р-414');
  end;
  }

begin
  strName := edtName.Text;
  strPatronomyc := edtPatronomyc.Text;
  strSurname := edtSurname.Text;
  strPassword := edtPassword.Text;

  if not(Debug) then
    if (Trim(edtVzvod.Text) = '') or (Trim(edtKurs.Text) = '')
      or (Trim(strSurname) = '') or (Trim(strPatronomyc) = '')
      or (Trim(strName) = '') or (Trim(strPassword) = '') then
    begin
      Application.MessageBox(
        'Пожалуйста заполните все поля!', PChar(PName),
        MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

  if not(Debug) then
  begin
    try
      Vzvod := StrToInt(edtVzvod.Text);
    except
      Application.MessageBox(
        'В качестве значения взвода должно быть указано число!',
        PChar(PName), MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    try
      Kurs := StrToInt(edtKurs.Text);
    except
      Application.MessageBox(
        'В качестве значения курса должно быть указано число!',
        PChar(PName), MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if Debug then
  begin
    edtName.Text := 'Валерий';
    edtSurname.Text := 'Вольнов';
    edtPatronomyc.Text := 'Павлович';
    edtPassword.Text := '12345';
    edtVzvod.Text := '4';
    edtKurs.Text := '2';

    strName := edtName.Text;
    strPatronomyc := edtPatronomyc.Text;
    strSurname := edtSurname.Text;
    strPassword := edtPassword.Text;
    Vzvod := StrToInt(edtVzvod.Text);
    Kurs := StrToInt(edtKurs.Text);
  end;

  if Station.NetWorkMode = nmStandalone then
  begin
    if IsUserExists(strName,strSurname,strPatronomyc,strPassword,vzvod,kurs) then
    begin
      //AuthSeccesfullyStandAlone;
      // Этот код по идее должен быть в uEducationForm
    end
    else
    if not(Debug) then
    begin
      ShowMessage('Данный пользователь не найден!Проверьте правильность заполнения полей.');
      PutLog(CurUser.ID, 'Ошибка проверки подлинности');
    end;
  end;
end;

procedure TUsersForm.btnRegistrationClick(Sender: TObject);
begin
  if Station.NetWorkMode = nmStandAlone then
  begin
     RegistrationForm.Show; //Отображаем форму регистрации
     UsersForm.Close;  //Закрываем форму выбора пользователя
  end;
end;


procedure TUsersForm.chkShowPasswordClick(Sender: TObject);
begin
  if chkShowPassword.Checked Then
    edtPassword.PasswordChar := #0
  else
    edtPassword.PasswordChar := '*';
end;

procedure TUsersForm.btnCanelClick(Sender: TObject);
begin
  UsersForm.Close;
end;

procedure TUsersForm.Edit1Change(Sender: TObject);
begin
{  edtFIO.Text := '';
  edtFIO.Font.Color:=clBlack;
}
end;

procedure TUsersForm.edtFIOClick(Sender: TObject);
begin
//  edtFIO.Clear;
//  edtFIO.Font.Color := clBlack;
end;

procedure TUsersForm.edtFIOExit(Sender: TObject);
begin
{  if Trim(edtFIO.Text) = '' then
  begin
//    edtFIO.Text := 'Фамилия Имя Отчество';
//    edtFIO.Font.Color := clSilver;
  end;
}
end;

procedure TUsersForm.Edit2Change(Sender: TObject);
begin
  edtKurs.Text := '';
  edtKurs.Font.Color := clBlack;
end;

procedure TUsersForm.edtKursClick(Sender: TObject);
begin
//  edtKurs.Text := '';
  edtKurs.Font.Color := clBlack;
end;

procedure TUsersForm.edtKursExit(Sender: TObject);
begin
  if edtKurs.Text='' then
  begin
    edtKurs.Text:='Курс';
    edtKurs.Font.Color:=clSilver;
  end;
end;

procedure TUsersForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  edtKurs.Text:='';
  edtKurs.Font.Color:=clBlack;
end;

procedure TUsersForm.Edit3Change(Sender: TObject);
begin
  edtVzvod.Text:='';
  edtVzvod.Font.Color:=clBlack;
end;

procedure TUsersForm.Edit3Clic(Sender: TObject);
begin
  //edtVzvod.Text:='';
  edtVzvod.Font.Color:=clBlack;
end;

procedure TUsersForm.edtVzvodExit(Sender: TObject);
begin
  if edtVzvod.Text='' then begin
    edtVzvod.Text:='Взвод';
    edtVzvod.Font.Color:=clSilver;
  end;
end;

procedure TUsersForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  edtVzvod.Text:='';
  edtVzvod.Font.Color:=clBlack;
end;

procedure TUsersForm.Edit4Change(Sender: TObject);
begin
  edtPassword.Text:='';
  edtPassword.Font.Color:=clBlack;
end;

procedure TUsersForm.edtPasswordClick(Sender: TObject);
begin
  //  edtPassword.Text:='';
  edtPassword.Font.Color:=clBlack;
end;

procedure TUsersForm.edtPasswordExit(Sender: TObject);
begin
if edtPassword.Text = '' then
begin
  edtPassword.Text := 'Пароль';
  edtPassword.Font.Color := clSilver;
end;
end;

procedure TUsersForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not(RegistrationForm.Visible) then
  begin
    //ShowMenuForm;
  end;
end;

procedure TUsersForm.FormShow(Sender: TObject);
begin
  cbbNetworkMode.ItemIndex := GetNetWorkMode;
  Station.NetWorkMode := cbbNetworkMode.ItemIndex;
end;

end.
