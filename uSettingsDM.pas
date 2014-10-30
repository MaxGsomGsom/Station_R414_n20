unit uSettingsDM;

interface

/// <summary>
///   Хранилище настроек приложения во время выполнения
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
  Settings: TSettings;                      // Нечто вроде статического класса
                                            // Создаётся в главном файле проекта
implementation

uses
  uDefinitionsDM;

  constructor TSettings.Create;
  begin
    inherited Create;
    FHostName := GetHost;                         // Читаем из БД
    FHostPort := GetPort;
    //временно
    FHostName := 'localhost';
    FHostPort:= 2106;
  end;

  procedure TSettings.SetHostName(const strHostName: string);
  begin
    if strHostName <> HostName then
    begin
      FHostName := strHostName;
      SetHost(strHostName);                         // Пишем в БД
    end
  end;

  procedure TSettings.SetHostPort(const iHostPort: Integer);
  begin
    if iHostPort <> HostPort then
    begin
      FHostPort :=  iHostPort;
      SetPort(iHostPort);                           // Пишем в БД
    end;
  end;
end.
