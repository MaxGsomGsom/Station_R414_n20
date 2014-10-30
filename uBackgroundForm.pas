unit uBackgroundForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAdditionalFormMethods;

type
  TBackgroundForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;



implementation

{$R *.dfm}

procedure TBackgroundForm.FormCreate(Sender: TObject);
begin
  //���������� ������� �����:
  Self.Height := Screen.Height - GetTaskBarHeight();
  Self.Width  := Screen.Width;
  //������ ������
  Self.BorderStyle := bsNone;
  //�������� ��� ������ ��������� ����
  Self.SendToBack;
end;

procedure TBackgroundForm.FormShow(Sender: TObject);
begin
    SetWindowPos(Self.Handle, HWND_BOTTOM, 0, 0,
      Screen.Width, Screen.Height - GetTaskBarHeight(), SWP_NOZORDER);
      //����� ����� ������ ���� ����� z-order
end;

end.
