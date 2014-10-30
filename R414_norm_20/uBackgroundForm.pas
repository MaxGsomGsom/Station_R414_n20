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
  //Установить размеры формы:
  Self.Height := Screen.Height - GetTaskBarHeight();
  Self.Width  := Screen.Width;
  //Убрать бордюр
  Self.BorderStyle := bsNone;
  //Рисовать фон позади остальных форм
  Self.SendToBack;
end;

procedure TBackgroundForm.FormShow(Sender: TObject);
begin
    SetWindowPos(Self.Handle, HWND_BOTTOM, 0, 0,
      Screen.Width, Screen.Height - GetTaskBarHeight(), SWP_NOZORDER);
      //Чтобы форма всегда была внизу z-order
end;

end.
