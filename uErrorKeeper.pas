unit uErrorKeeper;

interface

uses
Classes,
Windows;

type TErrorKeeper = class
      public
        ErrorList: TList;
        ErrorMsg : String;
        IsLastCheck: Boolean;
          procedure ShowError();
  procedure ShowHelp();
end;


implementation


      procedure TErrorKeeper.ShowError();
      begin
        MessageBox(HWND_TOP, PWideChar(ErrorMsg), '������', MB_OK);
      end;



     procedure TErrorKeeper.ShowHelp();
     begin
        MessageBox(HWND_TOP, PWideChar('���������� ��������� ��������� ������:' + #10#13 + #10#13 + ErrorMsg), '���������', MB_OK);
      end;





end.
