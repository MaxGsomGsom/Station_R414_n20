unit uSettingsDM;

interface

/// <summary>
///   ��������� �������� ���������� �� ����� ����������
/// </summary>
type TSettings = class
  private
    FHostName: string;
    FHostPort: Integer;
    procedure SetHostName(const strHostName: string);
    procedure SetHostPort(const iHostPort: Integer);
  public
    constructor Create; reintroduce;
    property HostName: string read FHostName
                              write SetHostName;
    property HostPort: Integer read FHostPort
                               write SetHostPort;
end;

var
  Settings: TSettings;                      // ����� ����� ������������ ������
                                            // �������� � ������� ����� �������
implementation

uses
  uDefinitionsDM;

  constructor TSettings.Create;
  begin
    inherited Create;
    FHostName := GetHost;                         // ������ �� ��
    FHostPort := GetPort;
    //��������
    FHostName := 'localhost';
    FHostPort:= 2106;
  end;

  procedure TSettings.SetHostName(const strHostName: string);
  begin
    if strHostName <> HostName then
    begin
      FHostName := strHostName;
      SetHost(strHostName);                         // ����� � ��
    end
  end;

  procedure TSettings.SetHostPort(const iHostPort: Integer);
  begin
    if iHostPort <> HostPort then
    begin
      FHostPort :=  iHostPort;
      SetPort(iHostPort);                           // ����� � ��
    end;
  end;
end.
