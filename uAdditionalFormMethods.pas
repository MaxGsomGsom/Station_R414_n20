unit uAdditionalFormMethods;

interface

uses
  Forms, Controls;

type
  TRacksEnum = ( Generator_A, Mshu_A, Duplexer_A, Rack_1500_A, Rack_1920_A,
                 Rack_1600_A, Rack_1200_reciever_A, Rack_1200_broadcaster_A,
                 Wavemeter_A, P321_A, Generator_B, Mshu_B, Duplexer_B,
                 Rack_1500_B, Rack_1920_B, Rack_1600_B, Rack_1200_reciever_B,
                 Rack_1200_broadcaster_B, Wavemeter_B, P321_B, Rack_1710,
                 Rack_1400, Oscillograph_rack, P321_C, Console_A, Console_B,
                 Power_panel, power_supply, Rack_1500_back_A, Rack_1500_back_B,
                 Rack_1600_back_A, Rack_1600_back_B, none);
                 //Power_panel  - щит электропитания (справа)
                 //Power_supply - источник энергии (под пультом)

type TForms_executer = class(TObject)
        public
          procedure CloseForm(Rack : TRacksEnum; withParent: Boolean = True);
          procedure CloseAllRacks();
          procedure CloseAllMiniRacks();
          procedure CloseAllInformationForms();
          procedure HideAllRacks();
end;

const R414miniFormWidth  =  524;
      R414miniFormHeight =  140;
      frequencyTCurrentTaskFormWidth = 228;

function GetTaskBarHeight() : Integer;
procedure MoveFormInScreenCenter(form : TForm);
function GetCountOpenedWindows(): Integer;

implementation

uses
  Windows,
  uBlockGeneratorForm,
  uBlockLittleNoisyAmplifierForm,
  uBlockDuplexerForm,
  uRack1500Form,
  uRack1920Form,
  uRack1600Form,
  uRack1200LeftForm,
  uRack1200RightForm,
  uBlockWaveMeterForm,
  uRackP321Form,
  uRack1710Form,
  uRack1400Form,
  uBlockOscillographForm,
  uBlockRemoteControllerForm,
  uBlockPowerPanelForm,
  uBlockPowerSupplyForm,
  uRack1500bForm,
  uRack1600BForm,
  uHandsetForm,
  uBlockOscillographMinForm,
  uP321DisplayForm,
  uFilterForm,
  uCurrentTaskForm,
  uStationR414Form,
  uWaveMeterPanelForm,
  uRackP321MinForm,
  uButtonBackForm,
  uBackgroundForm;

/// <summary>
/// Закрывает указанную форму
/// </summary>
/// <param name="Rack">Форма, которую требуется закрыть</param>
/// <param name="withParent">Закрыть форму вместе с родительской</param>
procedure TForms_executer.CloseForm(Rack : TRacksEnum;
 withParent : Boolean = True);

  function ChoseFormByRack(rack : TRacksEnum; var parentFrm : TForm): TForm;
  begin
    parentFrm := nil;
    Result := nil;
//
//    case Rack of
//      Generator_A:            Result := BlockGeneratorForm;
//      Mshu_A:                 Result := BlockLittleNoisyAmplifierForm;
//      Duplexer_A:             Result := BlockDuplexerForm;
//      Rack_1500_A:            Result := Rack1500Form;
//      Rack_1500_back_A:
//      begin
//                              Result := Rack1500bForm;
//        if (withParent) then  parentFrm := Rack1500Form;
//      end;
//      Rack_1920_A:            Result := Rack1920Form;
//      Rack_1600_A:            Result := Rack1600Form;
//      Rack_1600_back_A:
//      begin
//                              Result := Rack1600BForm;
//        if (withParent) then  parentFrm := Rack1600Form;
//      end;
//      Rack_1200_reciever_A:   Result := Rack1200LeftForm;
//      Rack_1200_broadcaster_A: Result := Rack1200RightForm;
//      Wavemeter_A:            Result := BlockWaveMeterForm;
//      P321_A:                 Result := RackP321Form;
//      Generator_B:            Result := BlockGeneratorForm;
//      Mshu_B:                 Result := BlockLittleNoisyAmplifierForm;
//      Duplexer_B:             Result := BlockDuplexerForm;
//      Rack_1500_B:            Result := Rack1500Form;
//      Rack_1500_back_B:
//      begin
//                              Result := Rack1500bForm;
//        if (withParent) then  parentFrm := Rack1500Form;
//      end;
//      Rack_1920_B:            Result := Rack1920Form;
//      Rack_1600_B:            Result := Rack1600Form;
//      Rack_1600_back_B:
//      begin
//                              Result := Rack1600BForm;
//        if (withParent) then  parentFrm := Rack1600Form;
//      end;
//      Rack_1200_reciever_B:   Result := Rack1200LeftForm;
//      Rack_1200_broadcaster_B: Result := Rack1200RightForm;
//      Wavemeter_B:            Result := BlockWaveMeterForm;
//      P321_B:                 Result := RackP321Form;
//      Rack_1710:              Result := Rack1710Form;
//      Rack_1400:              Result := Rack1400Form;
//      Oscillograph_rack:      Result := BlockOscillographForm;
//      P321_C:                 Result := RackP321Form;
//      Console_A:              Result := _Pult;
//      Console_B:              Result := _Pult;
//      Power_panel:            Result := BlockPowerPanelForm;
//      power_supply:           Result := BlockPowerSupplyForm;
//    end;
  end;
var
  chosenFrm : TForm;
  parentFrm : TForm;
begin






  chosenFrm := ChoseFormByRack(Rack, parentFrm);
  if chosenFrm <> nil then
    chosenFrm.Close;
  if parentFrm <> nil then
    parentFrm.Close;
end;

 /// <summary>
 /// Закрывает все стойки
 /// </summary>
 procedure TForms_executer.CloseAllRacks;
 begin
//    if BlockGeneratorForm.Showing then BlockGeneratorForm.Close;
//    if BlockLittleNoisyAmplifierForm.Showing then BlockLittleNoisyAmplifierForm.Close;
//    if BlockDuplexerForm.Showing then BlockDuplexerForm.Close;
//    if Rack1500Form.Showing then Rack1500Form.Close;
//    if Rack1920Form.Showing then Rack1920Form.Close;
//    if Rack1600Form.Showing then Rack1600Form.Close;
//    if Rack1200LeftForm.Showing then Rack1200LeftForm.Close;
//    if Rack1200RightForm.Showing then Rack1200RightForm.Close;
//    if BlockWaveMeterForm.Showing then BlockWaveMeterForm.Close;
//    if RackP321Form.Showing then RackP321Form.Close;
//    if BlockGeneratorForm.Showing then BlockGeneratorForm.Close;
//    if Rack1710Form.Showing then Rack1710Form.Close;
//    if Rack1400Form.Showing then Rack1400Form.Close;
//    if BlockOscillographForm.Showing then BlockOscillographForm.Close;
//    if _Pult.Showing then _Pult.Close;
//    if BlockPowerPanelForm.Showing then BlockPowerPanelForm.Close;
//    if BlockPowerSupplyForm.Showing then BlockPowerSupplyForm.Close;
//    if Rack1500bForm.Showing then Rack1500bForm.Close;
//    if Rack1600BForm.Showing then Rack1600BForm.Close;
 end;

 /// <summary>
 /// Сворачивает все формы стоек
 /// </summary>
 procedure TForms_executer.HideAllRacks;
 begin
//    if BlockGeneratorForm.Showing then BlockGeneratorForm.Hide;
//    if BlockLittleNoisyAmplifierForm.Showing then BlockLittleNoisyAmplifierForm.Hide;
//    if BlockDuplexerForm.Showing then BlockDuplexerForm.Hide;
//    if Rack1500Form.Showing then Rack1500Form.Hide;
//    if Rack1920Form.Showing then Rack1920Form.Hide;
//    if Rack1600Form.Showing then Rack1600Form.Hide;
//    if Rack1200LeftForm.Showing then Rack1200LeftForm.Hide;
//    if Rack1200RightForm.Showing then Rack1200RightForm.Hide;
//    if BlockWaveMeterForm.Showing then BlockWaveMeterForm.Hide;
//    if RackP321Form.Showing then RackP321Form.Hide;
//    if BlockGeneratorForm.Showing then BlockGeneratorForm.Hide;
//    if Rack1710Form.Showing then Rack1710Form.Hide;
//    if Rack1400Form.Showing then Rack1400Form.Hide;
//    if BlockOscillographForm.Showing then BlockOscillographForm.Hide;
//    if _Pult.Showing then _Pult.Hide;
//    if BlockPowerPanelForm.Showing then BlockPowerPanelForm.Hide;
//    if BlockPowerSupplyForm.Showing then BlockPowerSupplyForm.Hide;
//    if Rack1500bForm.Showing then Rack1500bForm.Hide;
//    if Rack1600BForm.Showing then Rack1600BForm.Hide;
 end;

/// <summary>
/// Закрывает все миниизображения стоек
/// </summary>
procedure TForms_executer.CloseAllMiniRacks();
begin
  if HandsetForm.Showing  then HandsetForm.Close;
  if BlockOscillographMinForm.Showing then BlockOscillographMinForm.Close;
  if P321DisplayForm.Showing then P321DisplayForm.Close;
  if WaveMeterPanelForm.Showing then WaveMeterPanelForm.Close;
  if RackP321MinForm.Showing then RackP321MinForm.Close;

end;

/// <summary>
/// Закрывает формы со вспомоательной информацией
/// </summary>
procedure TForms_executer.CloseAllInformationForms;
begin
  //if CurrentTaskForm.Showing then CurrentTaskForm.Close;
  //if FilterForm.Showing then FilterForm.Close;
  //if ButtonBackForm.Showing then ButtonBackForm.Close;
end;

 /// <summary>
 /// Перемещает форму в центр экрана так, чтобы она не перекрывала другие формы
 /// </summary>
 /// <param name="form">Указатель на форму</param>
 procedure MoveFormInScreenCenter(form: TForm);
 begin

      form.AutoScroll := True;
      form.Align := alNone;
//    ButtonBackForm.ShowConsideringOtherForm(
//      form.Left + form.Width,
//      form.VertScrollBar.Visible);
     form.Show;
    form.SetFocus;





    form.AutoSize := False;
    form.BorderStyle := bsNone;
    form.Position := poDefaultPosOnly;
    if (form.ClientWidth > Screen.Width) then
    form.ClientWidth := Screen.Width;

    form.ClientHeight:= Screen.Height - GetTaskBarHeight()
                                          - R414miniFormHeight;
    form.Left := Screen.Width div 2 - form.width div 2;
    form.Top  := 0;
 end;

 /// <summary>
 /// Получает высоту панели задач
 /// </summary>
 /// <returns>Высота панели задач</returns>
 function GetTaskBarHeight() : Integer;
 Var TaskBarHandle : Integer;
       TaskbarRect : TRect;
 begin
    TaskBarHandle :=FindWindow('Shell_TrayWnd','');
    GetWindowRect(TaskBarHandle,TaskbarRect);
    Result := TaskbarRect.Bottom - TaskbarRect.Top;
 end;

 /// <summary>
 /// Возвращает количество видимых окон
 /// </summary>
 /// <returns></returns>
 function GetCountOpenedWindows() : integer;
 var  i: integer;
 begin
   Result := 0;
   for i := 0 to Screen.FormCount - 1 do
    // if (Screen.Forms[i].Showing) and (Screen.Forms[i] <> BackgroundForm) then
       inc(Result);
 end;
end.
