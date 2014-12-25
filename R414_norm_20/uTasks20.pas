unit uTasks20;

interface

uses
  forms,
  Controls,
  Classes,
  StdCtrls,
  ExtCtrls,
   ComCtrls,
  SysUtils,
  Windows,
  uStationStateDM,
  uClientStateDM;


 type TSubTask = class
   public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; virtual; abstract;
   constructor Create; virtual;
   var
   EventFormName: String;
   Text: String;
   Name: String;
   Time: String;
   IsComplete: Boolean;

 end;



type TTask = class
      public
      TimeStart: TDateTime;
      TimeEnd: TDateTime;
       Name: String;
  constructor Create; virtual;
  var
    CurrentSubTask: TSubTask;
    SubTasks: array of TSubTask;
    CurrentSubTaskNum: Integer;

end;


 {$REGION 'Пустое задание'}
   //================
  type TTaskNone = class (TTask)
    public
   constructor Create;  override;
  end;


  type TTaskNoneSubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;
  //=============
 {$ENDREGION}
  {$REGION 'Включение питания, заголовки'}

    type TTaskPowerOn = class (TTask)
    public
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask2 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask3 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;


   type TTaskPowerOnSubTask4 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask5 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask6 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask7 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask8 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask9 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask10 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;


     type TTaskPowerOnSubTask11 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

       type TTaskPowerOnSubTask12 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskPowerOnSubTask13 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

  //================
  {$ENDREGION}

 {$REGION 'Автономный контроль, заголовки'}

   type TTaskSingleCheck = class (TTask)
    public
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask2 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask3 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask4 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask5 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask6 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask7 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask8 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask9 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask10 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask11 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask12 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask13 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask14 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask15 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask16 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

          type TTaskSingleCheckSubTask17 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask18 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask19 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask20 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask21 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask22 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

 {$ENDREGION}



implementation

uses

uBlockPowerPanelForm,
uConstantsDM;

 //создание задания
  constructor TTask.Create;
  begin
       CurrentSubTaskNum:= 0;
        TimeStart:= Time;
  end;

    constructor TSubTask.Create;
  begin

  end;



{$REGION 'Пустое задание'}

  constructor TTaskNone.Create;
  begin
  inherited Create;

  Name:='Свободный осмотр станции';

  SetLength(SubTasks, 1);

  SubTasks[0]:= TTaskNoneSubTask1.Create;



  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   function TTaskNoneSubTask1.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
      var CurForm: TForm;
   begin
   CurForm:= (Sender as TComponent).Owner as TForm;
        result:=true;
   end;

   constructor TTaskNoneSubTask1.Create;
   begin
   inherited Create;

        Name:='Свободный осмотр станции';
        Text:='';
        EventFormName:='nil';
        Time:= '';
   end;
{$ENDREGION}



{$REGION 'Включение питания'}

  constructor TTaskPowerOn.Create;
  begin
  inherited Create;

  Name:='Включение питания';

  SetLength(SubTasks, 13);

  SubTasks[0]:= TTaskPowerOnSubTask1.Create;
  SubTasks[1]:= TTaskPowerOnSubTask2.Create;
  SubTasks[2]:= TTaskPowerOnSubTask3.Create;
  SubTasks[3]:= TTaskPowerOnSubTask4.Create;
  SubTasks[4]:= TTaskPowerOnSubTask5.Create;
  SubTasks[5]:= TTaskPowerOnSubTask6.Create;
  SubTasks[6]:= TTaskPowerOnSubTask7.Create;
  SubTasks[7]:= TTaskPowerOnSubTask8.Create;
  SubTasks[8]:= TTaskPowerOnSubTask9.Create;
  SubTasks[9]:= TTaskPowerOnSubTask10.Create;
  SubTasks[10]:= TTaskPowerOnSubTask11.Create;
  SubTasks[11]:= TTaskPowerOnSubTask12.Create;
  SubTasks[12]:= TTaskPowerOnSubTask13.Create;

  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   //===
   function TTaskPowerOnSubTask1.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.PowerPanel.swNet=1) and (Station.PowerPanel.swPhase=4) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask1.Create;
   begin
   inherited Create;

        Name:='На щите питания нажать кнопку СЕТЬ';
        Text:='На щите питания 1820 нажать кнопку СЕТЬ. Загорается сигнальная лампа СЕТЬ. Проконтролировать с помощью переключателя КОНТРОЛЬ НАПРЯЖЕНИЙ наличие и величину напряжений на фазах 1-2, 2-3, 3-1';
        EventFormName:='Щит питания';
        Time:= '';
   end;

  //  ===

   function TTaskPowerOnSubTask2.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.PowerPanel.sw1700Power=1) and (Station.PowerPanel.sw1900Power=1) and (Station.PowerPanel.sw1900Power_2=1)
         and  (Station.PowerPanel.sw1200Power_2=1) and (Station.PowerPanel.sw1200Power=1) and (Station.PowerPanel.sw1400=1) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask2.Create;
   begin
   inherited Create;

        Name:='На щите питания включить 1900А, 1900Б, 1200А, 1200Б, 1700';
        Text:='На щите питания 1820 выключатели 1900А, 1900Б, 1200А, 1200Б, 1700, 1400, установить в положение ВКЛ. При этом загораются сигнальные лампы над выключателями';
        EventFormName:='Щит питания';
        Time:= '';
   end;
         //==

   function TTaskPowerOnSubTask3.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetA.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetA.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask3.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на МШУ 1830А';
        Text:='Тумблеры на блоке МШУ 1830А установить в положение ВКЛ. При этом загораются сигнальные лампы над выключателями';
        EventFormName:='МШУ А';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask4.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetB.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetB.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask4.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на МШУ 1830Б';
        Text:='Тумблеры на блоке МШУ 1830Б установить в положение ВКЛ. При этом загораются сигнальные лампы над выключателями';
        EventFormName:='МШУ Б';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask5.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetA.Rack1920.but1910=butPositionUp) and
         (Station.HalfSetA.Rack1920.but1910A=butPositionUp) and
         (Station.HalfSetA.Rack1920.butPower=butPositionUp) and
         (Station.HalfSetA.Rack1920.butPower2=butPositionUp) and
         (Station.HalfSetA.Rack1920.but1930=butPositionUp) and
         (Station.HalfSetA.Rack1920.but1960_1=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask5.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на стойке 1920А';
        Text:='На стойке 1920А: тумблеры на блоках 1920 установить в положение ВКЛ. Тумблеры на блоках 1910 установить в положение ВКЛ. Тумблер на блоке 1930 установить в положение ВКЛ. Тумблер на блоке 1360 установить в положение ВКЛ.';
        EventFormName:='1920 А';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask6.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetB.Rack1920.but1910=butPositionUp) and
         (Station.HalfSetB.Rack1920.but1910A=butPositionUp) and
         (Station.HalfSetB.Rack1920.butPower=butPositionUp) and
         (Station.HalfSetB.Rack1920.butPower2=butPositionUp) and
         (Station.HalfSetB.Rack1920.but1930=butPositionUp) and
         (Station.HalfSetB.Rack1920.but1960_1=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask6.Create;
   begin
   inherited Create;

        Name:='ВКЛ тумблеры на стойке 1920Б';
        Text:='На стойке 1920Б: тумблеры на блоках 1920 установить в положение ВКЛ. Тумблеры на блоках 1910 установить в положение ВКЛ. Тумблер на блоке 1930 установить в положение ВКЛ. Тумблер на блоке 1360 установить в положение ВКЛ.';
        EventFormName:='1920 Б';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask7.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetA.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask7.Create;
   begin
   inherited Create;

        Name:='Включить СЕТЬ на стойке 1200 ПРМ А';
        Text:='На стойке 1200 ПРМ А тумблер СЕТЬ на блоке 1240К установить в положение ВКЛ. Загорается сигнальная лампа над тумблером';
        EventFormName:='1200 ПРМ А';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask8.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetB.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask8.Create;
   begin
   inherited Create;

        Name:='Включить СЕТЬ на стойке 1200 ПРМ Б';
        Text:='На стойке 1200 ПРМ Б тумблер СЕТЬ на блоке 1240К установить в положение ВКЛ. Загорается сигнальная лампа над тумблером';
        EventFormName:='1200 ПРМ Б';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask9.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.Rack1710.butPower=butPositionRight) and (Station.Rack1710.butSpeaker=butPositionRight) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask9.Create;
   begin
   inherited Create;

        Name:='На стойке 1710 ВКЛ ПИТ. на блоке 470';
        Text:='На стойке 1710 на блоке 470 тумблеры ПИТ. и ГРОМКОГОВОРИТЕЛЬ перевести в положение ВКЛ.';
        EventFormName:='1710';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask10.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.Rack1400.butPower = butPositionRight) and (Station.Rack1400.butSpeaker = butPositionRight) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask10.Create;
   begin
   inherited Create;

        Name:='На стойке 1400 ВКЛ ПИТ. на блоке 470';
        Text:='На стойке 1400 на блоке 470 тумблеры ПИТ. и ГРОМКОГОВОРИТЕЛЬ перевести в положение ВКЛ.';
        EventFormName:='1400';
        Time:= '';
   end;

   //==

   function TTaskPowerOnSubTask11.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.P321C.butPower=butPositionUp) and (Station.P321C.butMeasure=butPositionUp) and (Station.P321C.but600Ohm=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask11.Create;
   begin
   inherited Create;

        Name:='Включить питание П-321 С';
        Text:='На приборе П-321 С установить тумблеры на позиции: ПИТАНИЕ ВКЛ., ИЗМЕР., 600 Ом';
        EventFormName:='П-321 С';
        Time:= '';
   end;

     //==

   function TTaskPowerOnSubTask12.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.PowerSupply.butPower=butPositionUp) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask12.Create;
   begin
   inherited Create;

        Name:='Включить питание П-323ИШ';
        Text:='На приборе П-323 ИШ установить тумблер питания на позицию ВКЛ.';
        EventFormName:='П-323 ИШ';
        Time:= '';
   end;


     //==

   function TTaskPowerOnSubTask13.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (true) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask13.Create;
   begin
   inherited Create;

        Name:='Включить питание осциллографа ???';
        Text:='На осциллографе установить тумблер питания на позицию ВКЛ.';
        EventFormName:='Осциллограф';
        Time:= '';
   end;

{$ENDREGION}

{$REGION 'Автономный контроль'}

  constructor TTaskSingleCheck.Create;
  begin
  inherited Create;

  Name:='Проверка работоспособности станции в режиме "Автономный контроль"';

  SetLength(SubTasks, 22);

  SubTasks[0]:= TTaskSingleCheckSubTask1.Create;
  SubTasks[1]:= TTaskSingleCheckSubTask2.Create;
  SubTasks[2]:= TTaskSingleCheckSubTask3.Create;
  SubTasks[3]:= TTaskSingleCheckSubTask4.Create;
  SubTasks[4]:= TTaskSingleCheckSubTask5.Create;
  SubTasks[5]:= TTaskSingleCheckSubTask6.Create;
  SubTasks[6]:= TTaskSingleCheckSubTask7.Create;
  SubTasks[7]:= TTaskSingleCheckSubTask8.Create;
  SubTasks[8]:= TTaskSingleCheckSubTask9.Create;
  SubTasks[9]:= TTaskSingleCheckSubTask10.Create;
  SubTasks[10]:= TTaskSingleCheckSubTask11.Create;
  SubTasks[11]:= TTaskSingleCheckSubTask12.Create;
  SubTasks[12]:= TTaskSingleCheckSubTask13.Create;
  SubTasks[13]:= TTaskSingleCheckSubTask14.Create;
  SubTasks[14]:= TTaskSingleCheckSubTask15.Create;
  SubTasks[15]:= TTaskSingleCheckSubTask16.Create;
  SubTasks[16]:= TTaskSingleCheckSubTask17.Create;
  SubTasks[17]:= TTaskSingleCheckSubTask18.Create;
  SubTasks[18]:= TTaskSingleCheckSubTask19.Create;
  SubTasks[19]:= TTaskSingleCheckSubTask20.Create;
  SubTasks[20]:= TTaskSingleCheckSubTask21.Create;
  SubTasks[21]:= TTaskSingleCheckSubTask22.Create;



  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   //===
   function TTaskSingleCheckSubTask1.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.stCableLoad = csConnectedAtRack1500Sh1) and (Station.HalfSetA.Rack1500.stCableSh1 = csDisconected) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask1.Create;
   begin
   inherited Create;

        Name:='Подключить кабели на стойке 1500А';
        Text:='На стойке 1500А от разьема ВЫХОД СВЧ. отключить кабель, идущий к дуплексеру и подключить к нему кабель НАГРУЗКА. Проверить подключены ли соотвествующие кабели к разъемам ВЫХОД АК 1500 и ВЫХОД АК 1600.';
        EventFormName:='1500 А';
        Time:= '';
   end;


        function TTaskSingleCheckSubTask2.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.swWave1610_0 = ClientState.TransmitterWaveA) and (Station.HalfSetA.Rack1500.swWave161_R = ClientState.TransmitterWaveA) and (Station.HalfSetA.Rack1500.swWave1500 = ClientState.TransmitterWaveA) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

    constructor TTaskSingleCheckSubTask2.Create;
   begin
   inherited Create;

        Name:='Установить волны на передатчике 1500 А';
        Text:='Установить рабочие волны передачи на стойке 1500 А, используя вращающиеся переключатели';
        EventFormName:='1500 А';
        Time:= '';
   end;

   
   function TTaskSingleCheckSubTask3.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
         or ((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)))
          and (Station.HalfSetA.Duplexer.cb1840 = csDisconected) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

          constructor TTaskSingleCheckSubTask3.Create;
   begin
   inherited Create;

        Name:='Подключить кабели к фильтру Ф-33 А';
        Text:='На фильтре Ф-33 А отключить от входа кабель, идущий к дуплексеру; подключить к входу кабель, идущий от разема стойки 1600 ВЫХОД АК 1600 другого полукомплекта (с красным наконечником) и кабель Ф33 Ш2';
        EventFormName:='Дуплексер А';
        Time:= '';
   end;
   


   function TTaskSingleCheckSubTask4.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Duplexer.waveTransmit = ClientState.TransmitterWaveA) and (Station.HalfSetA.Duplexer.waveReceive = ClientState.ReceiverWaveA) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask4.Create;
   begin
   inherited Create;

        Name:='Установить волны на дуплексере А';
        Text:='Установить рабочие волны передачи и приема на дуплексере А, используя вращающиеся переключатели';
        EventFormName:='Дуплексер А';
        Time:= '';
   end;




    function TTaskSingleCheckSubTask5.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (GeterodinWaves[ClientState.TransmitterWaveA][0] = Station.HalfSetA.Rack1500.GeterodinIntMain)
      and (((GeterodinWaves[ClientState.TransmitterWaveA][1] - 2) <= Station.HalfSetA.Rack1500.GeterodinFloatMain)
            and (Station.HalfSetA.Rack1500.GeterodinFloatMain <= (GeterodinWaves[ClientState.TransmitterWaveA][1] + 2)))
            
            and (GeterodinWaves[ClientState.TransmitterWaveA][0] = Station.HalfSetA.Rack1500.GeterodinIntReserve)
      and (((GeterodinWaves[ClientState.TransmitterWaveA][1] - 2) <= Station.HalfSetA.Rack1500.GeterodinFloatReserve)
            and (Station.HalfSetA.Rack1500.GeterodinFloatReserve <= (GeterodinWaves[ClientState.TransmitterWaveA][1] + 2)))
            and (Station.HalfSetA.Rack1500.SelectedMd = smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain) then
         begin
         Station.HalfSetA.Rack1500.GeterodinTunedMain := True;
         Station.HalfSetA.Rack1500.GeterodinTunedReserve := True;
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask5.Create;
   begin
   inherited Create;

        Name:='Настроить передатчик 1500 А по волномеру';
        Text:='Нажать на кнопки-лампы МД-О и 1610-О, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' 
        + ' Нажать на кнопки-лампы МД-Р и 1610-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы МД-О и 1610-О';
        EventFormName:='1500 А';
        Time:= '';


   end;

      function TTaskSingleCheckSubTask6.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.btnAutomatic = butPositionRight) and (Station.HalfSetA.Rack1500.DropError = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask6.Create;
   begin
   inherited Create;

        Name:='На стойке 1500 А сбросить аварию';
        Text:='Внутри стойки 1500 А нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1500 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask7.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn = True) and (Station.HalfSetA.Rack1920.stLBV1_TurnedOn = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask7.Create;
   begin
   inherited Create;

        Name:='Включить высокое напряжение на стойке 1920 А';
        Text:='Включить высокое напряжение одновременным нажатием кнопок ВЫСОКОЕ ВКЛ. и ТОК 5 МА на стойке 1920 А';
        EventFormName:='1920 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask8.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.swModeControl = 6) and (Station.HalfSetA.Rack1500.swPhaseMover = 10) and (Station.HalfSetA.Rack1500.butMode_R = butPositionLeft) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask8.Create;
   begin
   inherited Create;

        Name:='Сфазировать сигналы ЛБВ на стойке 1500 А';
        Text:='На передней панели стойки 1500 А переключатель режима установить в положение МОЩН.-РАСФАЗ. Тумблер МД-Р переключить в левое положение. Сфазировать сигналы ЛБВ путем вращения ручки ФАЗОВРАЩАТЕЛЬ.';
        EventFormName:='1500 А';
        Time:= '';
   end;

    function TTaskSingleCheckSubTask9.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.wave1610_0 = ClientState.ReceiverWaveA) and (Station.HalfSetA.Rack1600.wave1610_R = ClientState.ReceiverWaveA) and (Station.HalfSetA.Rack1600.wave1600 = ClientState.ReceiverWaveA) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask9.Create;
   begin
   inherited Create;

        Name:='Установить волны на приемнике 1600 А';
        Text:='Установить рабочие волны приема на стойке 1600 А, используя вращающиеся переключатели';
        EventFormName:='1600 А';
        Time:= '';
   end;


   
      function TTaskSingleCheckSubTask10.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)  
         and (GeterodinWaves[ClientState.ReceiverWaveA][0] = Station.HalfSetA.Rack1600.GeterodinIntMain)
      and (((GeterodinWaves[ClientState.ReceiverWaveA][1] - 2) <= Station.HalfSetA.Rack1600.GeterodinFloatMain)
            and (Station.HalfSetA.Rack1600.GeterodinFloatMain <= (GeterodinWaves[ClientState.ReceiverWaveA][1] + 2)))
            
            and (GeterodinWaves[ClientState.ReceiverWaveA][0] = Station.HalfSetA.Rack1600.GeterodinIntReserve)
      and (((GeterodinWaves[ClientState.ReceiverWaveA][1] - 2) <= Station.HalfSetA.Rack1600.GeterodinFloatReserve)
            and (Station.HalfSetA.Rack1600.GeterodinFloatReserve <= (GeterodinWaves[ClientState.ReceiverWaveA][1] + 2)))
            then
         begin
           Result:=true;
         end
         else Result:=false;
   end;


   constructor TTaskSingleCheckSubTask10.Create;
   begin
   inherited Create;

        Name:='Настроить приемник 1600 А по волномеру';
        Text:='Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' 
        + ' Нажать на кнопки-лампы 1601-Р, УПЧ-Р, ДМЧ-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0';
        EventFormName:='1600 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask11.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft) and (Station.HalfSetA.Rack1600.DropError = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask11.Create;
   begin
   inherited Create;

        Name:='На стойке 1600 А сбросить аварию';
        Text:='Внутри стойки 1600 А нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1600 А';
        Time:= '';
   end;

    //==================================================================================



    function TTaskSingleCheckSubTask12.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.stCableLoad = csConnectedAtRack1500Sh1) and (Station.HalfSetA.Rack1500.stCableSh1 = csDisconected) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask12.Create;
   begin
   inherited Create;

        Name:='Подключить кабели на стойке 1500А';
        Text:='На стойке 1500А от разьема ВЫХОД СВЧ. отключить кабель, идущий к дуплексеру и подключить к нему кабель НАГРУЗКА. Проверить подключены ли соотвествующие кабели к разъемам ВЫХОД АК 1500 и ВЫХОД АК 1600.';
        EventFormName:='1500 А';
        Time:= '';
   end;


        function TTaskSingleCheckSubTask13.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.swWave1610_0 = ClientState.TransmitterWaveA) and (Station.HalfSetA.Rack1500.swWave161_R = ClientState.TransmitterWaveA) and (Station.HalfSetA.Rack1500.swWave1500 = ClientState.TransmitterWaveA) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

    constructor TTaskSingleCheckSubTask13.Create;
   begin
   inherited Create;

        Name:='Установить волны на передатчике 1500 А';
        Text:='Установить рабочие волны передачи на стойке 1500 А, используя вращающиеся переключатели';
        EventFormName:='1500 А';
        Time:= '';
   end;

   
   function TTaskSingleCheckSubTask14.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
         or ((Station.HalfSetA.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)))
          and (Station.HalfSetA.Duplexer.cb1840 = csDisconected) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

          constructor TTaskSingleCheckSubTask14.Create;
   begin
   inherited Create;

        Name:='Подключить кабели к фильтру Ф-33 А';
        Text:='На фильтре Ф-33 А отключить от входа кабель, идущий к дуплексеру; подключить к входу кабель, идущий от разема стойки 1600 ВЫХОД АК 1600 другого полукомплекта (с красным наконечником) и кабель Ф33 Ш2';
        EventFormName:='Дуплексер А';
        Time:= '';
   end;
   


   function TTaskSingleCheckSubTask15.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Duplexer.waveTransmit = ClientState.TransmitterWaveA) and (Station.HalfSetA.Duplexer.waveReceive = ClientState.ReceiverWaveA) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask15.Create;
   begin
   inherited Create;

        Name:='Установить волны на дуплексере А';
        Text:='Установить рабочие волны передачи и приема на дуплексере А, используя вращающиеся переключатели';
        EventFormName:='Дуплексер А';
        Time:= '';
   end;




    function TTaskSingleCheckSubTask16.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (GeterodinWaves[ClientState.TransmitterWaveA][0] = Station.HalfSetA.Rack1500.GeterodinIntMain)
      and (((GeterodinWaves[ClientState.TransmitterWaveA][1] - 2) <= Station.HalfSetA.Rack1500.GeterodinFloatMain)
            and (Station.HalfSetA.Rack1500.GeterodinFloatMain <= (GeterodinWaves[ClientState.TransmitterWaveA][1] + 2)))
            
            and (GeterodinWaves[ClientState.TransmitterWaveA][0] = Station.HalfSetA.Rack1500.GeterodinIntReserve)
      and (((GeterodinWaves[ClientState.TransmitterWaveA][1] - 2) <= Station.HalfSetA.Rack1500.GeterodinFloatReserve)
            and (Station.HalfSetA.Rack1500.GeterodinFloatReserve <= (GeterodinWaves[ClientState.TransmitterWaveA][1] + 2)))
            and (Station.HalfSetA.Rack1500.SelectedMd = smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr = sRetrMain) then
         begin
         Station.HalfSetA.Rack1500.GeterodinTunedMain := True;
         Station.HalfSetA.Rack1500.GeterodinTunedReserve := True;
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask16.Create;
   begin
   inherited Create;

        Name:='Настроить передатчик 1500 А по волномеру';
        Text:='Нажать на кнопки-лампы МД-О и 1610-О, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' 
        + ' Нажать на кнопки-лампы МД-Р и 1610-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы МД-О и 1610-О';
        EventFormName:='1500 А';
        Time:= '';


   end;

      function TTaskSingleCheckSubTask17.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.btnAutomatic = butPositionRight) and (Station.HalfSetA.Rack1500.DropError = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask17.Create;
   begin
   inherited Create;

        Name:='На стойке 1500 А сбросить аварию';
        Text:='Внутри стойки 1500 А нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1500 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask18.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1920.stLBV2_TurnedOn = True) and (Station.HalfSetA.Rack1920.stLBV1_TurnedOn = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask18.Create;
   begin
   inherited Create;

        Name:='Включить высокое напряжение на стойке 1920 А';
        Text:='Включить высокое напряжение одновременным нажатием кнопок ВЫСОКОЕ ВКЛ. и ТОК 5 МА на стойке 1920 А';
        EventFormName:='1920 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask19.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1500.swModeControl = 6) and (Station.HalfSetA.Rack1500.swPhaseMover = 10) and (Station.HalfSetA.Rack1500.butMode_R = butPositionLeft) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask19.Create;
   begin
   inherited Create;

        Name:='Сфазировать сигналы ЛБВ на стойке 1500 А';
        Text:='На передней панели стойки 1500 А переключатель режима установить в положение МОЩН.-РАСФАЗ. Тумблер МД-Р переключить в левое положение. Сфазировать сигналы ЛБВ путем вращения ручки ФАЗОВРАЩАТЕЛЬ.';
        EventFormName:='1500 А';
        Time:= '';
   end;

    function TTaskSingleCheckSubTask20.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.wave1610_0 = ClientState.ReceiverWaveA) and (Station.HalfSetA.Rack1600.wave1610_R = ClientState.ReceiverWaveA) and (Station.HalfSetA.Rack1600.wave1600 = ClientState.ReceiverWaveA) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask20.Create;
   begin
   inherited Create;

        Name:='Установить волны на приемнике 1600 А';
        Text:='Установить рабочие волны приема на стойке 1600 А, используя вращающиеся переключатели';
        EventFormName:='1600 А';
        Time:= '';
   end;


   
      function TTaskSingleCheckSubTask21.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.SelectedMd = smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch = sUpchMain) and (Station.HalfSetA.Rack1600.SelectedDmch = sDmchMain)  
         and (GeterodinWaves[ClientState.ReceiverWaveA][0] = Station.HalfSetA.Rack1600.GeterodinIntMain)
      and (((GeterodinWaves[ClientState.ReceiverWaveA][1] - 2) <= Station.HalfSetA.Rack1600.GeterodinFloatMain)
            and (Station.HalfSetA.Rack1600.GeterodinFloatMain <= (GeterodinWaves[ClientState.ReceiverWaveA][1] + 2)))
            
            and (GeterodinWaves[ClientState.ReceiverWaveA][0] = Station.HalfSetA.Rack1600.GeterodinIntReserve)
      and (((GeterodinWaves[ClientState.ReceiverWaveA][1] - 2) <= Station.HalfSetA.Rack1600.GeterodinFloatReserve)
            and (Station.HalfSetA.Rack1600.GeterodinFloatReserve <= (GeterodinWaves[ClientState.ReceiverWaveA][1] + 2)))
            then
         begin
           Result:=true;
         end
         else Result:=false;
   end;


   constructor TTaskSingleCheckSubTask21.Create;
   begin
   inherited Create;

        Name:='Настроить приемник 1600 А по волномеру';
        Text:='Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' 
        + ' Нажать на кнопки-лампы 1601-Р, УПЧ-Р, ДМЧ-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0';
        EventFormName:='1600 А';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask22.CheckSubTask(Sender: TObject; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.butAutomatic = butPositionLeft) and (Station.HalfSetA.Rack1600.DropError = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask22.Create;
   begin
   inherited Create;

        Name:='На стойке 1600 А сбросить аварию';
        Text:='Внутри стойки 1600 А нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1600 А';
        Time:= '';
   end;
{$ENDREGION}


end.

