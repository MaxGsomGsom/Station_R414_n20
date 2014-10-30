unit uStatisticView;

interface

uses
  Windows, SQLite3, SQLiteTable3, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask;

type
  TForm1 = class(TForm)
    lvStat: TListView;
    btnOK: TButton;
    btnLoadState: TButton;
    medtFrom: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    medtTill: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnLoadStateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  BaseFileName = 'base.db';
  PName = 'Радиорелейная станция P-414';

var
  Form1: TForm1;
  sqldb: TSQLiteDatabase;
  sltb: TSQLiteTable;
  NeedToClose: Boolean = False;
  wndHandle: DWORD;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption := PName;
  //ShowMessage(IntToStr(ParamCount));
  if ParamCount = 1 then
  begin
    wndHandle := StrToInt(ParamStr(1));
    //ShowMessage(IntToStr(wndHandle));
    if wndHandle = 0 then
      Application.Terminate;
    sqldb := TSQLiteDatabase.Create(BaseFileName);
    sqldb.SetTimeout(0) ;
  end
  else
  begin
    NeedToClose :=  True;
  end;
  medtFrom.Text := DateToStr(Date);
  medtTill.Text := DateToStr(Date);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  sqldb.Free;
end;

procedure TForm1.btnLoadStateClick(Sender: TObject);
var
  LI: TListItem;
  intA: Integer;
  strFIO: string;
begin
  lvStat.Clear;//                                 0                 1           2          3          4                5               6            7
  sltb := sqldb.GetTable('SELECT ACHIEVE.OZENKA, ACHIEVE.DATA, USERS.ID, USERS.NAME, USERS.SURNAME, USERS.PATRONOMYC, USERS.VZVOD, USERS.KURS FROM ACHIEVE INNER JOIN USERS WHERE ACHIEVE.USER_ID = (SELECT ID FROM USERS );');
  if sltb.Count <> 0 then
  begin
    for intA := 1 to sltb.Count do
    begin
      LI := lvStat.Items.Add;
      LI.Caption := IntToStr(intA);
      LI.SubItems.Add(IntToStr(sltb.FieldAsInteger(2)));
      strFIO := '';
      if sltb.FieldAsString(4) <> '' then
        strFIO := strFIO + UTF8Decode(sltb.FieldAsString(4));
      if sltb.FieldAsString(3) <> '' then
        strFIO := strFIO + ' ' + UTF8Decode(sltb.FieldAsString(3));
      if sltb.FieldAsString(5) <> '' then
        strFIO := strFIO + ' ' + UTF8Decode(sltb.FieldAsString(5));
      LI.SubItems.Add(strFIO);
      LI.SubItems.Add(FloatToStr(sltb.FieldAsDouble(0)));
      LI.SubItems.Add(IntToStr(sltb.FieldAsInteger(6)));
      LI.SubItems.Add(IntToStr(sltb.FieldAsInteger(7)));
      LI.SubItems.Add(sltb.FieldAsString(1));
      sltb.Next;
    end;
  end
  else
  begin
    ShowMessage('База пуста :(');
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if NeedToClose then
    Application.Terminate;
end;

procedure TForm1.btnOKClick(Sender: TObject);
begin
  //Спаун основной формы
  Application.Terminate;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ShowWindow(wndHandle, SW_SHOW);
end;

end.
