unit uSettingsDM;

interface

/// <summary>
///   Хранилище настроек приложения во время выполнения
/// </summary>
type TSettings = class
  private
    FHostName: string;
    FHostPort: Integer;
    f:TextFile;
  public
  procedure SetHostName(const strHostName: string);
    procedure SetHostPort(const iHostPort: Integer);
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
  var
  txt: string;
  begin
    inherited Create;

     FHostName := 'localhost';

    try
      AssignFile(f, 'setting');
      Reset(f);
      ReadLn(f, txt);
      FHostName := txt;
      CloseFile(f);
    finally
    end;

    FHostPort:= 2106;
  end;

  procedure TSettings.SetHostName(const strHostName: string);
  begin
    if strHostName <> HostName then
    begin
      FHostName := strHostName;

    try
      AssignFile(f, 'setting');
      Rewrite(f);
      write(f, strHostName);
      CloseFile(f);;
    finally
    end;


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
