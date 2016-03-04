unit uNetWorkerDM;

interface

uses
  Classes,
  uConstantsDM,
  IdTCPClient,
  IdTCPConnection,
  IdIOHandler,
  uClientStateDM,
  uResponseListenerDM;
type
  TClientStateChangedEvent = procedure() of object;

type TEventKeyPair = procedure(Param: string; Value: string) of object;

type IClientNetWorker = class
  private
    FClientState: TClientState;
    FClientStateChangedEvent: TClientStateChangedEvent; // Событие "Состояние
                                                        // клиента изменено"
    FRecievedTaskParamsR414:TEventKeyPair;
  public
    function IsConnect(): Boolean; virtual; abstract;
    function TryConnect(UserName: string): Integer; virtual; abstract;
    function Disconnect(): Integer; virtual; abstract;
    function SendParams(Key: string; Value: string): Integer; virtual; abstract;
    function SendTaskParams(Key: string; Value: string): Integer; virtual; abstract;
    function SendTaskParamsCross(Key: string; Value: string): Integer; virtual; abstract;
    function SendMessage(Value: string; UserNameTo: string): Integer;  virtual; abstract;

    property ClientState: TClientState read FClientState write FClientState;
    property ClientStateChangedEvent: TClientStateChangedEvent
      read FClientStateChangedEvent
      write FClientStateChangedEvent;
    property OnRecievedTaskParamsR414: TEventKeyPair read FRecievedTaskParamsR414 write FRecievedTaskParamsR414;
end;

type TClientNetWorker = class(IClientNetWorker)
  private
    TCPClient: TIDTCPClient;
    //FClientState: TClientState;
    ResponseListener: TResponseListener;
    procedure OnResponse(strResponse: string);
    procedure ProcessMessage(strMessage: string);

  public
    function IsConnect(): Boolean; override;
    function TryConnect(strUserName: string): Integer; override;
    function Disconnect: Integer; override;
    function SendParams(Key: string; Value: string): Integer; override;
    function SendTaskParams(Key: string; Value: string): Integer; override;
    function SendTaskParamsCross(Key: string; Value: string): Integer; override;
    function SendMessage(Value: string; UserNameTo: string): Integer; override;
    constructor Create(); reintroduce;
    destructor Destroy(); override;

    //property ClientState: TClientState read FClientState write FClientState;
end;


implementation

uses
  SysUtils,
  IdGlobal,
  uRequestDM,
  uKeyValueDM,
  uSettingsDM;

  constructor TClientNetWorker.Create();
  begin
    Inherited;
    ClientState := TClientState.Create;
    TCPClient := TIdTCPClient.Create(nil);
  end;

  destructor TClientNetWorker.Destroy;
  begin
    if (ClientState <> nil) then
      ClientState.Free;
    if (TCPClient <> nil) then
      TCPClient.Free;
    Inherited;
  end;

  /// <summary>
  ///   Пробует подключить клиент к серверу и залогиниться под именем UserName
  /// <param name = 'strUserName'> Имя пользователя (позывной станции) </param>
  /// </summary>
  function TClientNetWorker.TryConnect(strUserName: string): Integer;
  var
    Request: TRequest;
    strResponse: String;
  begin
    Result := 0;
    try
      //TCPClient.Host := 'localhost';
      TCPClient.Host := Settings.HostName;
      TCPClient.Port := Settings.HostPort;
      TCPClient.Connect;
      TCPClient.IOHandler.DefStringEncoding := TIdTextEncoding.UTF8;
    except
      Exit(1);                            // Не удалось соединиться с сервером
    end;

    Request := TRequest.Create;                       // Создаём новый запрос
    Request.Name := REQ_NAME_REGISTRATION;
    Request.AddKeyValue(KEY_NAME, strUserName); // Включаем в запрос имя
                                                      // пользователя
    Request.AddKeyValue(KEY_TYPE, 'r414');      // и тип клиента

    TCPClient.IOHandler.WriteLn(Request.ConvertToText);
    Request.Free;

    try
      strResponse := TCPClient.IOHandler.ReadLn();
    except
      strResponse := '';                              // Когда долго нет ответа
    end;

    if strResponse = '' then
    begin
      TCPClient.Disconnect;                           // Серв не отвечает
      Exit(2);
    end;

    Request := TRequest.Create;
    Request.ConvertToKeyValueList(strResponse);       // Переводим ответ сервера
                                                      // в объектный вид
    if Request.Name <> REQ_NAME_OK  then
    begin                                             // Если серв не принял имя,
      TCPClient.Disconnect;                           // то считаем, что оно не
      Request.Free;                                   // уникально
      Exit(3);
    end;

    Request.Free;                                     // Не забываем убрать мусор
    ClientState.Connected := True;                    // Всё ок
    ClientState.UserName := strUserName;
    ResponseListener :=                               // Запускаем слушателя
      TResponseListener.Create(TCPClient);
    ResponseListener.ResponseEvent := OnResponse;     // Подписываемся на событие
                                                      // "Ответ сервера"
  end;

  /// <summary>
  ///   Отключает от клиент от сервера
  /// </summary>
  function TClientNetWorker.Disconnect: Integer;
  begin
  try
    TCPClient.Disconnect;
    ResponseListener.Free;                            // Слушатель теперь не нужен
    ClientState.Free;                                 // Обнуляем информацию
    ClientState := TClientState.Create;               // о состоянии клиента
    except

  end;

  //SendParams(KEY_DISCONNECT, 'disconnect');
  end;

  function TClientNetWorker.SendParams(Key: string; Value: string): Integer;
  var
    Request: TRequest;
  begin
    Request := TRequest.Create;                 // Создаём новый запрос
    Request.Name := REQ_NAME_PARAMS;
    Request.AddKeyValue(KEY_TYPE, CLIENT_STATION_R414);      // Тип клиента

    Request.AddKeyValue(Key, Value);            // Наши ключ и значение

    TCPClient.IOHandler.WriteLn(Request.ConvertToText);
    Request.Free;                               // Чистим мусор
  end;

    function TClientNetWorker.SendTaskParams(Key: string; Value: string): Integer;
  var
    Request: TRequest;
  begin
    Request := TRequest.Create;                 // Создаём новый запрос
    Request.Name := REQ_NAME_PARAMS;
    Request.AddKeyValue(KEY_TYPE, CLIENT_STATION_R414_TASK);      // Тип клиента

    Request.AddKeyValue(Key, Value);            // Наши ключ и значение

    TCPClient.IOHandler.WriteLn(Request.ConvertToText);
    Request.Free;                               // Чистим мусор
  end;

      function TClientNetWorker.SendTaskParamsCross(Key: string; Value: string): Integer;
  var
    Request: TRequest;
  begin
    Request := TRequest.Create;                 // Создаём новый запрос
    Request.Name := REQ_NAME_PARAMS;
    Request.AddKeyValue(KEY_TYPE, CLIENT_CROSS_TASK);      // Тип клиента

    Request.AddKeyValue(Key, Value);            // Наши ключ и значение

    TCPClient.IOHandler.WriteLn(Request.ConvertToText);
    Request.Free;                               // Чистим мусор
  end;

  function TClientNetWorker.SendMessage(Value: string; UserNameTo: string): Integer;
  var
    Request: TRequest;
  begin
    Request := TRequest.Create;                 // Создаём новый запрос
    Request.Name := REQ_NAME_MESSAGE;
    //Request.AddKeyValue(KEY_TYPE, Client);      // Тип клиента которому шлем сообщение

    Request.AddKeyValue(KEY_MESSAGE_TEXT, Value);            // Наши ключ и значение
    Request.AddKeyValue(KEY_USERNAME_FROM, ClientState.UserName);
    Request.AddKeyValue(KEY_USERNAME_TO, UserNameTo);
    TCPClient.IOHandler.WriteLn(Request.ConvertToText);
    Request.Free;                               // Чистим мусор
  end;

  function TClientNetWorker.IsConnect: Boolean;
  begin
     Result := (ClientState <> nil) and ClientState.Connected;
  end;

  /// <summary>
  ///   Обрабатывает событие 'Пришёл ответ сервера'
  /// </summary>
  procedure TClientNetWorker.OnResponse(strResponse: string);
  begin
    ProcessMessage(strResponse);
  end;

  /// <summary>
  ///   Обрабатывает сообщение, полученное от сервера
  /// <param name = 'strMessage'> Полученное от сервера сообщение </param>
  /// </summary>
  procedure TClientNetWorker.ProcessMessage(strMessage: string);
  var
    Request: TRequest;
    strValue: string;
    kvRecord: TKeyValue;
    i: Integer;
  begin
    Request := TRequest.Create;
    Request.ConvertToKeyValueList(strMessage);       // Парсим сообщение сервера

    if Request.Name = REQ_NAME_OK then
    begin

    end else
    if Request.Name = REQ_NAME_ERROR then
    begin

    end else
    if Request.Name = REQ_NAME_REGISTRATION then
    begin

    end else
    if Request.Name = REQ_NAME_PARAMS then            {TODO: вынести тело в инлайн функцию }
    begin
      strValue := Request.GetValue(KEY_TYPE);
      if strValue = SERVER then
      begin
        strValue := Request.GetValue(KEY_STATUS); // Станция у данного пользователя
                                                  // главная или подчинённая
        ClientState.MainStation := (strValue = 'main'); // иначе подчинённая
      end else
      if strValue = CLIENT_STATION_R414 then
      begin
        for i := 0 to Request.GetCountKeys - 1 do
        try
          kvRecord := Request.GetKeyValue(i);
          if kvRecord.Key = KEY_NAME then             // Если связанная станция
          begin                                       // прислала своё имя, то
                                                      // она отключилась или подключилась
            strValue := Request.GetValue(KEY_CONNECTED);

            if strToBool(strValue) then               // Если connected = true
            begin
              ClientState.LinkedR414Connected := True;
              ClientState.LinkedR414UserName := kvRecord.Value;
              ClientState.OnConnectedEvent(CLIENT_STATION_R414);
              //ClientStateChangedEvent;
            end
            else                                      // connected = false
            begin
              ClientState.TransmitterWaveA := 0;
              ClientState.TransmitterWaveB := 0;
              ClientState.ReceiverWaveA := 0;
              ClientState.ReceiverWaveB := 0;
              ClientState.TaskID := ttNull;           // Заглушка, х.з., что сейчас ставить
              //ClientState.ConnectedEvent(Self);            // Чтоб форма обновила поля,
                                                  // ибо при отключенном втором клиенте
                                                  // она этого делать не будет
              ClientState.LinkedR414Connected := False;
              ClientState.LinkedR414UserName := '-';
              ClientState.OnDisconnect(CLIENT_STATION_R414);
            end;
            //ClientStateChangedEvent;
            break;
          end else
          if kvRecord.Key = KEY_TRANSMITTER_WAVE_A then
          begin
            ClientState.TransmitterWaveA := StrToInt(kvRecord.Value);
          end else
          if kvRecord.Key = KEY_TRANSMITTER_WAVE_B then
          begin
            ClientState.TransmitterWaveB := StrToInt(kvRecord.Value);
          end else
          if kvRecord.Key = KEY_RECEIVER_WAVE_A then
          begin
            ClientState.ReceiverWaveA := StrToInt(kvRecord.Value);
          end else
          if kvRecord.Key = KEY_RECEIVER_WAVE_B then
          begin
            ClientState.ReceiverWaveB := StrToInt(kvRecord.Value);
          end else
          if kvRecord.Key = KEY_TASK_ID then
          begin
            ClientState.TaskID := TTaskType(StrToInt(kvRecord.Value));
          end else
          if kvRecord.Key = KEY_WORK_MODE then
          begin
             ClientState.WorkMode := TWorkMode(StrToInt(kvRecord.Value));
          end else
          if kvRecord.Key = KEY_STARTNETTASK then
          begin
          ClientState.LastNetCommand:=kvRecord.Value;
            ClientState.OnStartNetTask(Self); //запуск задания с полученными параметрами от станции 1 на станции 2

          end;
          //ClientStateChangedEvent;
        except
          on E: Exception do;                   //Залогать, что серв прислал херню
        end;                                    // (Ошибка конвертации strValue);
      end;



      if strValue = CLIENT_CROSS then
      begin
        for i := 0 to Request.GetCountKeys - 1 do
        try
          kvRecord := Request.GetKeyValue(i);
          if kvRecord.Key = KEY_NAME then             // Если связанная станция
          begin                                       // прислала своё имя, то
                                                      // она отключилась или подключилась
            strValue := Request.GetValue(KEY_CONNECTED);

            if strToBool(strValue) then               // Если connected = true
            begin
              ClientState.LinkedCrossConnected := True;
              ClientState.LinkedCrossUserName := kvRecord.Value;
              ClientState.OnConnectedEvent(CLIENT_CROSS);
            end
            else                                      // connected = false
            begin
              ClientState.LinkedCrossConnected := False;
              ClientState.LinkedCrossUserName := '-';
              ClientState.OnDisconnect(CLIENT_CROSS);
            end;
            break;
          end;
        except
          on E: Exception do;                   //Залогать, что серв прислал херню
        end;                                    // (Ошибка конвертации strValue);
      end;



      if (strValue = CLIENT_STATION_R414_TASK) then
      begin
        for i := 0 to Request.GetCountKeys - 1 do
        try
          kvRecord := Request.GetKeyValue(i);
          if kvRecord.Key <> KEY_TYPE then             // Если связанная станция
          begin                                       // прислала своё имя, то
              OnRecievedTaskParamsR414(kvRecord.Key, kvRecord.Value);
          end;
        except
          on E: Exception do;                   //Залогать, что серв прислал херню
        end;                                    // (Ошибка конвертации strValue);
      end;


    end else
    if Request.Name = REQ_NAME_MESSAGE then
    begin
         ClientState.OnMessageEvent(Self, Request.GetValue(KEY_MESSAGE_TEXT), Request.GetValue(KEY_USERNAME_FROM));
    end;
    Request.Free;                                  // Убираем мусор
  end;
end.
