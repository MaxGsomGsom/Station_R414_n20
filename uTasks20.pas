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
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; virtual; abstract;
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
       procedure LastCheck(); virtual;
       
  constructor Create(Station: TStation; ClientState: TClientState); virtual;
  var
    CurrentSubTask: TSubTask;
    SubTasks: array of TSubTask;
    CurrentSubTaskNum: Integer;
    Sender: TObject;
    Station: TStation;
    ClientState: TClientState;
    FullCheck: Boolean;



end;


 {$REGION 'Пустое задание'}
   //================
  type TTaskNone = class (TTask)
    public
   constructor Create(Station: TStation; ClientState: TClientState);  override;
   procedure LastCheck(); override;
  end;


  type TTaskNoneSubTask1 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;
  //=============
 {$ENDREGION}
  {$REGION 'Включение питания, заголовки'}

    type TTaskPowerOn = class (TTask)
    public
   constructor Create(Station: TStation; ClientState: TClientState);  override;
   procedure LastCheck(); override;
  end;

    type TTaskPowerOnSubTask1 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask2 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask3 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;


   type TTaskPowerOnSubTask4 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

   type TTaskPowerOnSubTask5 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
   var Conditions: array [0..3] of Boolean;
  end;

   type TTaskPowerOnSubTask6 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
   var Conditions: array [0..3] of Boolean;
  end;

    type TTaskPowerOnSubTask7 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskPowerOnSubTask8 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask9 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskPowerOnSubTask10 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;


     type TTaskPowerOnSubTask11 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

       type TTaskPowerOnSubTask12 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskPowerOnSubTask13 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

  //================
  {$ENDREGION}

 {$REGION 'Автономный контроль, заголовки'}

   type TTaskSingleCheck = class (TTask)
    public
   constructor Create(Station: TStation; ClientState: TClientState);  override;
   procedure LastCheck(); override;
  end;

    type TTaskSingleCheckSubTask1 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask2 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask3 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask4 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

    type TTaskSingleCheckSubTask5 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask6 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask7 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask8 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask9 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask10 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

      type TTaskSingleCheckSubTask11 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask12 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask13 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask14 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask15 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

        type TTaskSingleCheckSubTask16 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

          type TTaskSingleCheckSubTask17 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask18 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask19 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask20 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask21 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

            type TTaskSingleCheckSubTask22 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

             type TTaskSingleCheckSubTask23 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

             type TTaskSingleCheckSubTask24 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;


               type TTaskSingleCheckSubTask25 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;

               type TTaskSingleCheckSubTask26 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;


               type TTaskSingleCheckSubTask27 = class (TSubTask)
  public
   function CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean; override;
   constructor Create;  override;
  end;
 {$ENDREGION}



implementation

uses

uBlockPowerPanelForm,
uConstantsDM;

 //создание задания
  constructor TTask.Create(Station: TStation; ClientState: TClientState);
  begin
  Self.Sender := Sender;
  Self.Station := Station;
  Self.ClientState := ClientState;
       CurrentSubTaskNum:= 0;
        TimeStart:= Time;
  end;
  
       procedure TTask.LastCheck();
       begin
         
       end;
       
    constructor TSubTask.Create;
  begin

  end;



{$REGION 'Пустое задание'}

  constructor TTaskNone.Create(Station: TStation; ClientState: TClientState);
  begin
  inherited Create(Station, ClientState);

  Name:='Свободный осмотр станции';

  SetLength(SubTasks, 1);

  SubTasks[0]:= TTaskNoneSubTask1.Create;



  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

   function TTaskNoneSubTask1.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
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

   procedure TTaskNone.LastCheck();
       begin
         
       end;
{$ENDREGION}



{$REGION 'Включение питания'}

  constructor TTaskPowerOn.Create(Station: TStation; ClientState: TClientState);
  begin
  inherited Create(Station, ClientState);
  FullCheck := False;
   
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


  procedure TTaskPowerOn.LastCheck;
  var i: Integer;
  var allRight: Boolean;
  begin
       allRight:= true;
        TaskController.ErrorMsg := 'Общая проверка правильности настройки:' + #10#13;;
    for I := 0 to Length(SubTasks) - 1 do
     begin
          if (SubTasks[i].CheckSubTask(FullCheck, Station, ClientState) = False) then allRight := false;
     end;

    if (allRight = true) then
      begin
        TaskController.IsTaskComplete:=true;
        TimeEnd:=Time;
      end
      else
      begin
        TaskController.ShowError;
      end;
  end;

   //===
   function TTaskPowerOnSubTask1.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.PowerPanel.swNet=1) and (Station.PowerPanel.swPhase=4) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.PowerPanel.swNet<>1) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включено питание станции' + #10#13;
            if (Station.PowerPanel.swPhase<>4) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не проверено напряжение на фазах' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask2.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.PowerPanel.sw1700Power=1) and (Station.PowerPanel.sw1900Power=1) and (Station.PowerPanel.sw1900Power_2=1)
         and  (Station.PowerPanel.sw1200Power_2=1) and (Station.PowerPanel.sw1200Power=1) and (Station.PowerPanel.sw1400=1) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.PowerPanel.sw1700Power<>1) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включено питание блока 1700' + #10#13;
            if (Station.PowerPanel.sw1900Power<>1) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включено питание блока 1900А' + #10#13;
            if (Station.PowerPanel.sw1900Power_2<>1) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включено питание блока 1900Б' + #10#13;
            if (Station.PowerPanel.sw1200Power<>1) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включено питание блока 1200А' + #10#13;
            if (Station.PowerPanel.sw1200Power_2<>1) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включено питание блока 1200Б' + #10#13;
            if (Station.PowerPanel.sw1400<>1) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включено питание блока 1400' + #10#13;
           Result:=false;
         end;

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

   function TTaskPowerOnSubTask3.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetA.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetA.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.HalfSetA.LittleNoisyAmplifier.butNet2<>0) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
            if (Station.HalfSetA.LittleNoisyAmplifier.butNet<>0) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask4.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetB.LittleNoisyAmplifier.butNet2=0)  and
         (Station.HalfSetB.LittleNoisyAmplifier.butNet=0) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.HalfSetB.LittleNoisyAmplifier.butNet2<>0) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
            if (Station.HalfSetB.LittleNoisyAmplifier.butNet<>0) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер СЕТЬ' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask5.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   var I: Integer;
   begin
          if (FullCheck = False) then TaskController.ErrorMsg := '' ;
          Conditions[0]:=False;
          Conditions[1]:=False;
          Conditions[2]:=False;
          Conditions[3]:=False;

          if (Station.HalfSetA.Rack1920.but1930=butPositionUp) then begin Conditions[0]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер на блоке 1930' + #10#13;
          if (Station.HalfSetA.Rack1920.but1910=butPositionUp) and (Station.HalfSetA.Rack1920.but1910A=butPositionUp) then begin Conditions[1]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включены тумблеры на блоках 1910' + #10#13;
          if (Station.HalfSetA.Rack1920.butPower=butPositionUp) and (Station.HalfSetA.Rack1920.butPower2=butPositionUp) then begin Conditions[2]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включены тумблеры на блоках 1920' + #10#13;
          if (Station.HalfSetA.Rack1920.but1960_1=butPositionUp) then begin Conditions[3]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер на блоке 1960' + #10#13;

          Result:= false;

          for I := 0 to Length(Conditions)-2 do
            begin
                if (Conditions[i]=False) and (Conditions[i+1]=True) then
                 begin
                    TaskController.ErrorMsg:= TaskController.ErrorMsg + #10#13 +'Неверная последоваельность включения тумблеров' + #10#13 + 'Правильно: 1930, 1910, 1920, 1960';
                    TaskController.ShowError;
                    Break;
                  end;
            end;

            if (Conditions[0]=True) and (Conditions[1]=True) and (Conditions[2]=True) and (Conditions[3]=True) then Result:=true;


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

   function TTaskPowerOnSubTask6.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   var I: Integer;
   begin
          if (FullCheck = False) then TaskController.ErrorMsg := '' ;
          Conditions[0]:=False;
          Conditions[1]:=False;
          Conditions[2]:=False;
          Conditions[3]:=False;

          if (Station.HalfSetB.Rack1920.but1930=butPositionUp) then begin Conditions[0]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер на блоке 1930' + #10#13;
          if (Station.HalfSetB.Rack1920.but1910=butPositionUp) and (Station.HalfSetB.Rack1920.but1910A=butPositionUp) then begin Conditions[1]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включены тумблеры на блоках 1910' + #10#13;
          if (Station.HalfSetB.Rack1920.butPower=butPositionUp) and (Station.HalfSetB.Rack1920.butPower2=butPositionUp) then begin Conditions[2]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включены тумблеры на блоках 1920' + #10#13;
          if (Station.HalfSetB.Rack1920.but1960_1=butPositionUp) then begin Conditions[3]:=True;  end
          else TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер на блоке 1960' + #10#13;

          Result:= false;

          for I := 0 to Length(Conditions)-2 do
            begin
                if (Conditions[i]=False) and (Conditions[i+1]=True) then
                 begin
                    TaskController.ErrorMsg:= TaskController.ErrorMsg + #10#13 +'Неверная последоваельность включения тумблеров' + #10#13 + 'Правильно: 1930, 1910, 1920, 1960';
                    TaskController.ShowError;
                    Break;
                  end;
            end;

            if (Conditions[0]=True) and (Conditions[1]=True) and (Conditions[2]=True) and (Conditions[3]=True) then Result:=true;


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

   function TTaskPowerOnSubTask7.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetA.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.HalfSetA.Rack1200Left.but1240K<>butPositionUp) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер на блоке 1240к' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask8.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.HalfSetB.Rack1200Left.but1240K=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.HalfSetB.Rack1200Left.but1240K<>butPositionUp) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер на блоке 1240к' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask9.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.Rack1710.butPower=butPositionRight) and (Station.Rack1710.butSpeaker=butPositionRight) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.Rack1710.butPower<>butPositionRight) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер питания на блоке 470' + #10#13;
            if (Station.Rack1710.butSpeaker<>butPositionRight) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер ГРОМКОГОВОРИТЕЛЬ на блоке 470' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask10.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.Rack1400.butPower = butPositionRight) and (Station.Rack1400.butSpeaker = butPositionRight) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.Rack1400.butPower<>butPositionRight) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер питания на блоке 470' + #10#13;
            if (Station.Rack1400.butSpeaker<>butPositionRight) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер ГРОМКОГОВОРИТЕЛЬ на блоке 470' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask11.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.P321C.butPower=butPositionUp) and (Station.P321C.butMeasure=butPositionUp) and (Station.P321C.but600Ohm=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.P321C.butPower<>butPositionUp) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер питания' + #10#13;
            if (Station.P321C.butMeasure<>butPositionUp) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер ИЗМЕРЕНИЕ' + #10#13;
            if (Station.P321C.but600Ohm<>butPositionUp) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер 600ом' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask12.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.PowerSupply.butPower=butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.PowerSupply.butPower<>butPositionUp) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер питания' + #10#13;
           Result:=false;
         end;
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

   function TTaskPowerOnSubTask13.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin
         if (Station.Oscillograph.butLevelPosition = butPositionUp) then
         begin
           Result:=true;
         end
         else
         begin
            if (FullCheck = False) then TaskController.ErrorMsg := '' ;
            if (Station.Oscillograph.butLevelPosition<>butPositionUp) then TaskController.ErrorMsg:= TaskController.ErrorMsg + 'Не включен тумблер питания' + #10#13;
           Result:=false;
         end;
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
  inherited Create(Station, ClientState);

  Name:='Проверка работоспособности станции в режиме "Автономный контроль"';

  SetLength(SubTasks, 27);

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
  SubTasks[22]:= TTaskSingleCheckSubTask23.Create;
  SubTasks[23]:= TTaskSingleCheckSubTask24.Create;
  SubTasks[24]:= TTaskSingleCheckSubTask25.Create;
  SubTasks[25]:= TTaskSingleCheckSubTask26.Create;
  SubTasks[26]:= TTaskSingleCheckSubTask27.Create;


  CurrentSubTask:=SubTasks[CurrentSubTaskNum];
  end;

  procedure TTaskSingleCheck.LastCheck();
       begin
           //заполни для задания!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           //заполни для задания!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           //заполни для задания!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           //заполни для задания!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           //заполни для задания!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           //заполни для задания!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       end;
  
   //===
   function TTaskSingleCheckSubTask1.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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


        function TTaskSingleCheckSubTask2.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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

   
   function TTaskSingleCheckSubTask3.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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
   


   function TTaskSingleCheckSubTask4.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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




    function TTaskSingleCheckSubTask5.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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

      function TTaskSingleCheckSubTask6.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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

      function TTaskSingleCheckSubTask7.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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

      function TTaskSingleCheckSubTask8.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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

    function TTaskSingleCheckSubTask9.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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


   
      function TTaskSingleCheckSubTask10.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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

      function TTaskSingleCheckSubTask11.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
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



    function TTaskSingleCheckSubTask12.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.stCableLoad = csConnectedAtRack1500Sh1) and (Station.HalfSetB.Rack1500.stCableSh1 = csDisconected) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask12.Create;
   begin
   inherited Create;

        Name:='Подключить кабели на стойке 1500 Б';
        Text:='На стойке 1500 Б от разьема ВЫХОД СВЧ. отключить кабель, идущий к дуплексеру и подключить к нему кабель НАГРУЗКА. Проверить подключены ли соотвествующие кабели к разъемам ВЫХОД АК 1500 и ВЫХОД АК 1600.';
        EventFormName:='1500 Б';
        Time:= '';
   end;


        function TTaskSingleCheckSubTask13.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.swWave1610_0 = ClientState.TransmitterWaveB) and (Station.HalfSetB.Rack1500.swWave161_R = ClientState.TransmitterWaveB) and (Station.HalfSetB.Rack1500.swWave1500 = ClientState.TransmitterWaveB) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

    constructor TTaskSingleCheckSubTask13.Create;
   begin
   inherited Create;

        Name:='Установить волны на передатчике 1500 Б';
        Text:='Установить рабочие волны передачи на стойке 1500 Б, используя вращающиеся переключатели';
        EventFormName:='1500 Б';
        Time:= '';
   end;

   
   function TTaskSingleCheckSubTask14.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (((Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeLeft) and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeRight))
         or ((Station.HalfSetB.Duplexer.cbSh1 = csConnectedAtDuplexeRight) and (Station.HalfSetB.Duplexer.cbSh2 = csConnectedAtDuplexeLeft)))
          and (Station.HalfSetB.Duplexer.cb1840 = csDisconected) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

          constructor TTaskSingleCheckSubTask14.Create;
   begin
   inherited Create;

        Name:='Подключить кабели к фильтру Ф-33 Б';
        Text:='На фильтре Ф-33 Б отключить от входа кабель, идущий к дуплексеру; подключить к входу кабель, идущий от разема стойки 1600 ВЫХОД АК 1600 другого полукомплекта (с красным наконечником) и кабель Ф33 Ш2';
        EventFormName:='Дуплексер Б';
        Time:= '';
   end;
   


   function TTaskSingleCheckSubTask15.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Duplexer.waveTransmit = ClientState.TransmitterWaveB) and (Station.HalfSetB.Duplexer.waveReceive = ClientState.ReceiverWaveB) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask15.Create;
   begin
   inherited Create;

        Name:='Установить волны на дуплексере Б';
        Text:='Установить рабочие волны передачи и приема на дуплексере Б, используя вращающиеся переключатели';
        EventFormName:='Дуплексер Б';
        Time:= '';
   end;




    function TTaskSingleCheckSubTask16.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (GeterodinWaves[ClientState.TransmitterWaveB][0] = Station.HalfSetB.Rack1500.GeterodinIntMain)
      and (((GeterodinWaves[ClientState.TransmitterWaveB][1] - 2) <= Station.HalfSetB.Rack1500.GeterodinFloatMain)
            and (Station.HalfSetB.Rack1500.GeterodinFloatMain <= (GeterodinWaves[ClientState.TransmitterWaveB][1] + 2)))
            
            and (GeterodinWaves[ClientState.TransmitterWaveB][0] = Station.HalfSetB.Rack1500.GeterodinIntReserve)
      and (((GeterodinWaves[ClientState.TransmitterWaveB][1] - 2) <= Station.HalfSetB.Rack1500.GeterodinFloatReserve)
            and (Station.HalfSetB.Rack1500.GeterodinFloatReserve <= (GeterodinWaves[ClientState.TransmitterWaveB][1] + 2)))
            and (Station.HalfSetB.Rack1500.SelectedMd = smdMain) and (Station.HalfSetB.Rack1500.SelectedRetr = sRetrMain) then
         begin
         Station.HalfSetB.Rack1500.GeterodinTunedMain := True;
         Station.HalfSetB.Rack1500.GeterodinTunedReserve := True;
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask16.Create;
   begin
   inherited Create;

        Name:='Настроить передатчик 1500 Б по волномеру';
        Text:='Нажать на кнопки-лампы МД-О и 1610-О, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' 
        + ' Нажать на кнопки-лампы МД-Р и 1610-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы МД-О и 1610-О';
        EventFormName:='1500 Б';
        Time:= '';


   end;

      function TTaskSingleCheckSubTask17.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.btnAutomatic = butPositionRight) and (Station.HalfSetB.Rack1500.DropError = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask17.Create;
   begin
   inherited Create;

        Name:='На стойке 1500 Б сбросить аварию';
        Text:='Внутри стойки 1500 Б нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1500 Б';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask18.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1920.stLBV2_TurnedOn = True) and (Station.HalfSetB.Rack1920.stLBV1_TurnedOn = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask18.Create;
   begin
   inherited Create;

        Name:='Включить высокое напряжение на стойке 1920 Б';
        Text:='Включить высокое напряжение одновременным нажатием кнопок ВЫСОКОЕ ВКЛ. и ТОК 5 МА на стойке 1920 Б';
        EventFormName:='1920 Б';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask19.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1500.swModeControl = 6) and (Station.HalfSetB.Rack1500.swPhaseMover = 10) and (Station.HalfSetB.Rack1500.butMode_R = butPositionLeft) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask19.Create;
   begin
   inherited Create;

        Name:='Сфазировать сигналы ЛБВ на стойке 1500 Б';
        Text:='На передней панели стойки 1500 Б переключатель режима установить в положение МОЩН.-РАСФАЗ. Тумблер МД-Р переключить в левое положение. Сфазировать сигналы ЛБВ путем вращения ручки ФАЗОВРАЩАТЕЛЬ.';
        EventFormName:='1500 Б';
        Time:= '';
   end;

    function TTaskSingleCheckSubTask20.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.wave1610_0 = ClientState.ReceiverWaveB) and (Station.HalfSetB.Rack1600.wave1610_R = ClientState.ReceiverWaveB) and (Station.HalfSetB.Rack1600.wave1600 = ClientState.ReceiverWaveB) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask20.Create;
   begin
   inherited Create;

        Name:='Установить волны на приемнике 1600 Б';
        Text:='Установить рабочие волны приема на стойке 1600 Б, используя вращающиеся переключатели';
        EventFormName:='1600 Б';
        Time:= '';
   end;


   
      function TTaskSingleCheckSubTask21.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.SelectedMd = smdMain) and (Station.HalfSetB.Rack1600.SelectedUpch = sUpchMain) and (Station.HalfSetB.Rack1600.SelectedDmch = sDmchMain)
         and (GeterodinWaves[ClientState.ReceiverWaveB][0] = Station.HalfSetB.Rack1600.GeterodinIntMain)
      and (((GeterodinWaves[ClientState.ReceiverWaveB][1] - 2) <= Station.HalfSetB.Rack1600.GeterodinFloatMain)
            and (Station.HalfSetB.Rack1600.GeterodinFloatMain <= (GeterodinWaves[ClientState.ReceiverWaveB][1] + 2)))
            
            and (GeterodinWaves[ClientState.ReceiverWaveB][0] = Station.HalfSetB.Rack1600.GeterodinIntReserve)
      and (((GeterodinWaves[ClientState.ReceiverWaveB][1] - 2) <= Station.HalfSetB.Rack1600.GeterodinFloatReserve)
            and (Station.HalfSetB.Rack1600.GeterodinFloatReserve <= (GeterodinWaves[ClientState.ReceiverWaveB][1] + 2)))
            then
         begin
           Result:=true;
         end
         else Result:=false;
   end;


   constructor TTaskSingleCheckSubTask21.Create;
   begin
   inherited Create;

        Name:='Настроить приемник 1600 Б по волномеру';
        Text:='Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0, подключить волномер к основному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.' 
        + ' Нажать на кнопки-лампы 1601-Р, УПЧ-Р, ДМЧ-Р, подключить волномер к резервному каналу, на волномере установить шкалу в соответствии с номерами волн гетеродина.'
        + 'Нажать на кнопки-лампы 1610-О, УПЧ-0 и ДМЧ-0';
        EventFormName:='1600 Б';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask22.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.butAutomatic = butPositionLeft) and (Station.HalfSetB.Rack1600.DropError = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask22.Create;
   begin
   inherited Create;

        Name:='На стойке 1600 Б сбросить аварию';
        Text:='Внутри стойки 1600 Б нажать на кнопку "СБРОС АВАРИИ", чтобы сбросить аварию, на передней панели тумблер "АВТОМАТИКА" перевести в положение "ВКЛ"';
        EventFormName:='1600 Б';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask23.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1600.stMoshnost = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;

   constructor TTaskSingleCheckSubTask23.Create;
   begin
   inherited Create;

        Name:='Проверить настройку на стойке 1600 А';
        Text:='Убедиться в правильности настройки: безымянная кнопка лампа на стойке 1600 А горит';
        EventFormName:='1600 A';
        Time:= '';
   end;

      function TTaskSingleCheckSubTask24.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1600.stMoshnost = True) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;
   constructor TTaskSingleCheckSubTask24.Create;
   begin
   inherited Create;

        Name:='Проверить настройку на стойке 1600 Б';
        Text:='Убедиться в правильности настройки: безымянная кнопка лампа на стойке 1600 Б горит';
        EventFormName:='1600 Б';
        Time:= '';
   end;





      //======================




          function TTaskSingleCheckSubTask25.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.Oscillograph.cblCableUsilitelState = csConnectedAtPower) and (Station.Oscillograph.cblCabelSyncState = csConnectedAtSync) then
         begin
           Result:=true;
         end
         else Result:=false;
   end;
   constructor TTaskSingleCheckSubTask25.Create;
   begin
   inherited Create;

        Name:='Проверка девиации: подключить провода к осциллографу';
        Text:='На осциллографе подключить серый провод в левое нижнее гнездо Y, подключить чёрный провод в правое верхнее гнездо X';
        EventFormName:='Осциллограф';
        Time:= '';
   end;




       function TTaskSingleCheckSubTask26.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetA.Rack1200Right.CableOscillographLineInput = csDisconected) and
         (Station.HalfSetA.Rack1200Right.CableUzlovoiInput = csDisconected) and


//         (Station.Oscillograph.swPowerType = 2) and
//        (Station.Oscillograph.swVvsDel = 7) and
//        (Station.Oscillograph.swHz = 2) and
//        (Station.Oscillograph.swSyncType = 2) and
//        (Station.Oscillograph.swPowerType = 2) and
//        (Station.Oscillograph.butLevelPosition = butPositionUp) and
//        (Station.Oscillograph.but1Khz = butPositionUp) and
//        (Station.Oscillograph.swRazvertkaShortTune = 11) and
//        (Station.Oscillograph.swCalibrator = 1) and

        (Station.Oscillograph.cblCabelSyncState = csConnectedAtSync) and
          (Station.Oscillograph.cblCableUsilitelState = csConnectedAtPower) and

          (Station.Deviation.Rack1200A_PRD = stPassed) and (Station.Deviation.Rack1200A_PRM = stPassed)
         then
         begin
           Result:=true;


{$REGION ''}

//  if (Station.HalfSetA.Rack1500.swPhaseMover <> 10) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Расфазировка не устранена ');
//  end;
//  if (Station.HalfSetA.Rack1500.btnAutomatic <> butPositionRight) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Автоматика не включена');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave1610_0 <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Волна блока 1610 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave1500 <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Волна блока 1500 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1500.swWave161_R <> Station.WaveTransmitA) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Волна 1610-Р выставлена не верно');
//  end;
//  if (((Station.HalfSetA.Rack1500.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrMain)) and
//  ((Station.HalfSetA.Rack1500.SelectedMd <> smdRetr) and (Station.HalfSetA.Rack1500.SelectedRetr <> sRetrReserv))) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Не выбран передающий полукомплект оборудования');
//  end;
//  if (Station.HalfSetA.Rack1500.DropError <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Ошибка не сброшена');
//  end;
//  if (Station.HalfSetA.Rack1500.GeterodinTunedMain <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): гетеродин освного полукомплекта не настроен');
//  end;
//  if (Station.HalfSetA.Rack1500.GeterodinTunedReserve <> True) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): гетеродин резервного полукомплекта не настроен');
//  end;
//  if (Station.HalfSetA.Rack1500.stCableLoad <> csConnectedAtRack1500Sh1) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Кабель нагрузки болтается в воздухе');
//  end;
//  if (Station.HalfSetA.Rack1500.stCableSh1 <> csConnectedAtRack1500NoName) then
//  begin
//    AddAnalyseTuneError('1500(' + Litera + '): Кабель Ш1 подключен не верно');
//  end;
//  if (Station.HalfSetA.Rack1920.butPower <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Питание на ЛБВ 1 не поступает');
//  end;
//  if (Station.HalfSetA.Rack1920.butPower2 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Питание на ЛБВ 2 не поступает');
//  end;
//  if (Station.HalfSetA.Rack1920.but1910 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Переключатель питания блока 1910 не включено');
//  end;
//  if (Station.HalfSetA.Rack1920.but1910A <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Перключатель питания резервного блока 1910 не включен');
//  end;
//  if (Station.HalfSetA.Rack1920.but1930 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Перключатель питания блока 1930 не включен');
//  end;
//  if (Station.HalfSetA.Rack1920.but1960_1 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Перключатель питания блока 1960 не включен');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOn <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи питания на ЛБВ1 не нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOn2 <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи питания на ЛБВ2 не нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOff <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка отключения питания ЛБВ 1 нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butHighOff2 <> butPositionUp) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка отключения питания ЛБВ 2 нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butCurrent5MA <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи тока на ЛБВ 1 не нажата');
//  end;
//  if (Station.HalfSetA.Rack1920.butCurrent5MA2 <> butPositionDown) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Кнопка подачи тока на ЛБВ 2 не нажата');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB1)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Замедление на ЛБВ 1 не подано');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stZamedleniePodano_LVB2)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): Замедление на ЛБВ 2 не подано');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stLBV1_TurnedOn)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ЛБВ 1 не включена');
//  end;
//  if (not(Station.HalfSetA.Rack1920.stLBV2_TurnedOn)) then
//  begin
//    AddAnalyseTuneError('1920(' + Litera + '): ЛБВ 2 не включена');
//  end;
//  if (Station.HalfSetA.Rack1600.GeterodinTunedMain <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): основной гетеродин не настроен');
//  end;
//  if (Station.HalfSetA.Rack1600.GeterodinTunedReserve <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): запасной гетеродин не настроен');
//  end;
//  if (Station.HalfSetA.Rack1600.butAutomatic <> butPositionLeft) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Автоматика не включена');
//  end;
//  if (((Station.HalfSetA.Rack1600.SelectedMd <> smdMain) and (Station.HalfSetA.Rack1600.SelectedUpch <> sUpchMain) and (Station.HalfSetA.Rack1600.SelectedDmch <> sDmchMain)) and
//  ((Station.HalfSetA.Rack1600.SelectedMd <> smdRetr) and (Station.HalfSetA.Rack1600.SelectedUpch <> sUpchReserve) and (Station.HalfSetA.Rack1600.SelectedDmch <> sDmchReserve))) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Не выбран ни один из полукомплектов');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1610_0 <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Волна на блоке 1610 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1600 <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Волна на блоке 1600 выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1600.wave1610_R <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Волна на блоке 1610-Р выставлена не верно');
//  end;
//  if (Station.HalfSetA.Rack1600.DropError <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Ошибка не сброшена');
//  end;
//  if (Station.HalfSetA.Rack1600.stMoshnost <> True) then
//  begin
//    AddAnalyseTuneError('1600(' + Litera + '): Нет мощности на входе блока 1600!');
//  end;
//  if (Station.HalfSetA.LittleNoisyAmplifier.swWave <> Station.WaveReceiveA) then
//  begin
//    AddAnalyseTuneError('Волна в МШУ(' + Litera + ') выставлена не верно');
//  end;
//  if ((Station.HalfSetA.LittleNoisyAmplifier.butNet <> butPositionUp) and (Station.HalfSetA.LittleNoisyAmplifier.butNet2 <> butPositionUp)) then
//  begin
//    AddAnalyseTuneError('МШУ (' + Litera + '): Переключатели включения основного или резервного блоков не включен');
//  end;
//  if (((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeLeft) and (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeRight)) and
//    ((Station.HalfSetA.Duplexer.cbSh1 <> csConnectedAtDuplexeRight) and (Station.HalfSetA.Duplexer.cbSh2 <> csConnectedAtDuplexeLeft))) then
//  begin
//    AddAnalyseTuneError('Дуплексер (' + Litera + ') кабели соеденены не верно');
//  end;
//  if not(Station.IsPowerPanelPoweredOn) then
//  begin
//    AddAnalyseTuneError('Питание в щите подано не на все блоки(не верно)');
//  end;
//
//  if strError <> '' then
//    strError := 'Ошибки настройки полукомплекта (' + Litera + '): '+ strError;
{$ENDREGION}

         end
         else Result:=false;
   end;
   constructor TTaskSingleCheckSubTask26.Create;
   begin
   inherited Create;

        Name:='Проверить девиацию на стойке 1200 А ПРД';
        Text:='На стойке 1200 А ПРД подключить чёрный провод к гнезду СИНХ. ОСЦИЛ., cерый провод подключить к гнезду ВХ. ПРМ. С помощью осциллографа на каждой из 2-х трубок проверить прохождение вызовов.'+
        'На стойке 1200 А ПРД подключить серый провод в гнездо "Вых. ПРД". Аналогично проверить проверить прохождение вызовов.' +
        'Отключить провода от стойки 1200.';

        EventFormName:='1200 ПРД А';
        Time:= '';
   end;




          function TTaskSingleCheckSubTask27.CheckSubTask(FullCheck: Boolean; Station: TStation; ClientState: TClientState): Boolean;
   begin

         if (Station.HalfSetB.Rack1200Right.CableOscillographLineInput = csDisconected) and
         (Station.HalfSetB.Rack1200Right.CableUzlovoiInput = csDisconected) and


        (Station.Oscillograph.cblCabelSyncState = csConnectedAtSync) and
          (Station.Oscillograph.cblCableUsilitelState = csConnectedAtPower) and

          (Station.Deviation.Rack1200B_PRD = stPassed) and (Station.Deviation.Rack1200B_PRM = stPassed)
         then
         begin
           Result:=true;


         end
         else Result:=false;
   end;
   constructor TTaskSingleCheckSubTask27.Create;
   begin
   inherited Create;

        Name:='Проверить девиацию на стойке 1200 Б ПРД';
        Text:='На стойке 1200 Б ПРД подключить чёрный провод к гнезду СИНХ. ОСЦИЛ., cерый провод подключить к гнезду ВХ. ПРМ. С помощью осциллографа на каждой из 2-х трубок проверить прохождение вызовов.'+
        'На стойке 1200 Б ПРД подключить серый провод в гнездо "Вых. ПРД". Аналогично проверить проверить прохождение вызовов.' +
        'Отключить провода от стойки 1200.';

        EventFormName:='1200 ПРД Б';
        Time:= '';
   end;










{$ENDREGION}


end.

