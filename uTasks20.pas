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
  uStationStateDM;


 type TSubTask = class
   public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; virtual; abstract;
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
       Name: String;
  constructor Create; virtual;
  var
    CurrentSubTask: TSubTask;
    SubTasks: array of TSubTask;
    CurrentSubTaskNum: Integer;

end;


   //================
  type TTaskNone = class (TTask)
    public
   constructor Create;  override;
  end;


  type TTaskNoneSubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;
  //=============

    type TTaskPowerOn = class (TTask)
    public
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask1 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask2 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask3 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;


   type TTaskPowerOnSubTask4 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask5 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask6 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask7 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask8 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask9 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask10 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;


     type TTaskPowerOnSubTask11 = class (TSubTask)
  public
   function CheckSubTask(Sender: TObject; Station: TStation): Boolean; override;
   constructor Create;  override;
  end;


  //================





implementation

uses

uBlockPowerPanelForm;

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

   function TTaskNoneSubTask1.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
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

  SetLength(SubTasks, 11);

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


         CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   //===
   function TTaskPowerOnSubTask1.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
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

   function TTaskPowerOnSubTask2.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.PowerPanel.sw1700Power=1) and (Station.PowerPanel.sw1900Power=1) and (Station.PowerPanel.sw1900Power_2=1)
         and  (Station.PowerPanel.sw1200Power_2=1) and (Station.PowerPanel.sw1200Power=1) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskPowerOnSubTask2.Create;
   begin
   inherited Create;

        Name:='На щите питания включить 1900А, 1900Б, 1200А, 1200Б, 1700';
        Text:='На щите питания 1820 выключатели 1900А, 1900Б, 1200А, 1200Б, 1700 установить в положение ВКЛ. При этом загораются сигнальные лампы над выключателями';
        EventFormName:='Щит питания';
        Time:= '';
   end;
         //==

   function TTaskPowerOnSubTask3.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
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

   function TTaskPowerOnSubTask4.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
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

   function TTaskPowerOnSubTask5.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetA.Rack1920.but1910=0) and
         (Station.HalfSetA.Rack1920.but1910A=0) and
         (Station.HalfSetA.Rack1920.butPower=0) and
         (Station.HalfSetA.Rack1920.butPower2=0) and
         (Station.HalfSetA.Rack1920.but1930=0) and
         (Station.HalfSetA.Rack1920.but1960_1=0) then
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

   function TTaskPowerOnSubTask6.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetB.Rack1920.but1910=0) and
         (Station.HalfSetB.Rack1920.but1910A=0) and
         (Station.HalfSetB.Rack1920.butPower=0) and
         (Station.HalfSetB.Rack1920.butPower2=0) and
         (Station.HalfSetB.Rack1920.but1930=0) and
         (Station.HalfSetB.Rack1920.but1960_1=0) then
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

   function TTaskPowerOnSubTask7.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetA.Rack1200Left.but1240K=0) then
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

   function TTaskPowerOnSubTask8.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.HalfSetB.Rack1200Left.but1240K=0) then
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

   function TTaskPowerOnSubTask9.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.Rack1710.butPower=1) and (Station.Rack1710.butSpeaker=1) then
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

   function TTaskPowerOnSubTask10.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.Rack1400.butPower = 1) then
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

   function TTaskPowerOnSubTask11.CheckSubTask(Sender: TObject; Station: TStation): Boolean;
   begin
         if (Station.P321C.butPower=0) and (Station.P321C.butMeasure=0) and (Station.P321C.but600Ohm=0) then
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

{$ENDREGION}



end.

