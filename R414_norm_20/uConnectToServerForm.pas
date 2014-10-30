unit uConnectToServerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  uNetWorkerDM;

type
  TConnectToServerForm = class(TForm)
    btnConnect: TButton;
    btnCancel: TButton;
    grpUserName: TGroupBox;
    edtUserName: TEdit;
    lblUserName: TLabel;
    lblAboutUserName: TLabel;
    lblError: TLabel;
    procedure btnConnectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    NetWorker: IClientNetWorker;
    procedure ShowError(strError: String);
    procedure HideError;
  public
    { Public declarations }
  end;

var
  ConnectToServerForm: TConnectToServerForm;

implementation

uses
  uPreparationToWorkForm;

{$R *.dfm}

procedure TConnectToServerForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TConnectToServerForm.btnConnectClick(Sender: TObject);
var
  strUserName: String;
  iError: Integer;
begin
  strUserName := edtUserName.Text;
  if strUserName = '' then
  begin
    ShowError('������� ��������!');
    Exit;
  end;
                                             // ������� ������������ ���
                                             // ������ strUserName
  iError := NetWorker.TryConnect(strUserName);
  case iError of
  0:                                         // �������� �����������
    begin
      PreparationToWorkForm :=
        TPreparationToWorkForm.CreateForm(Self.Owner, NetWorker);
      PreparationToWorkForm.Show;
      Self.Close;                           // ����� ������ �� �����
      Self.Free;                            // �������� � �����, ����� �����������
    end;
  1:
    begin
      ShowError('������ �� ������!');
    end;
  2:
    begin
      ShowError('������ �� ��������!');
    end;                                    // ����� ��� ��� ���� �� �������
  3:
    begin
      ShowError('����� �������� ��� �����!');
    end
  else                                      // �� ��������������� ������
    begin
      ShowError('����������� ������ �����������!');
    end;
  end;
end;

procedure TConnectToServerForm.edtUserNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = 13 then                      // ���� ����� Enter � edtUserName
    btnConnect.Click;
end;

procedure TConnectToServerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    if (Owner <> nil) and (NetWorker <> nil) // ���������� ������� ����, ����
      and not NetWorker.IsConnect then       // ����������� �� �������
    begin
      (Owner as TForm).Show;
    end;
  finally
    Action := caFree;
  end;
end;

procedure TConnectToServerForm.FormCreate(Sender: TObject);
begin
  NetWorker := TClientNetWorker.Create;
end;

procedure TConnectToServerForm.ShowError(strError: string);
begin
  lblError.Caption := strError;
  lblError.Show;
end;

procedure TConnectToServerForm.HideError;
begin
  HideError;
end;

end.


