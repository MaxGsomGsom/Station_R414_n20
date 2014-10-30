unit uAboutProgramForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
    TAboutProgramForm = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  AboutProgramForm: TAboutProgramForm;

implementation

{$R *.dfm}

uses
  uMainMenuForm,
  uDefinitionsDM;

procedure TAboutProgramForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    if (Owner <> nil) then
      (Owner as TForm).Show;
  finally

  end;
  Action := caFree;
end;

//������������� ����������� ����� ��� � ��������
procedure TAboutProgramForm.FormCreate(Sender: TObject);
begin
  ProductName.Caption := PName;
  Version.Caption := Pversion;
  Copyright.Caption :=  '(c) 2010 - 2014 ������� ������� ����.';
  Comments.Caption := '���������� ��������� ������ ������������� ������� �414.';
end;

//�������� ��� ������� �� ������ "��"
procedure TAboutProgramForm.OKButtonClick(Sender: TObject);
begin
  Close;
end;

end.

