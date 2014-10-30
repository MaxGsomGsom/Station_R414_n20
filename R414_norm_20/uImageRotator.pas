unit uImageRotator;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  PImage = ^TImage;

  TImageRotator = class(TBitmap) // сложный счетчик
  public
    Count: Integer; // всего значений
    Index: Integer; // текущее
    RotateCW: Boolean; // поворот по (CW) или против (CCW) часовой стрелки
      // true - значения возрастают
      // false - значения убывают
    Circle: Boolean;
      // true - значения идут "по кругу"
      // false - значения идут "туда и обратно"

  function GetNext: Integer;
  procedure DrawNextImage(const ImageList: TImageList; const Image: PImage);
  end;

implementation

function TImageRotator.GetNext: Integer;
begin
  if Circle then
  begin
    if RotateCW then
    begin
      if (Index = Count-1) then
      begin
        Index:= 0;
      end
      else
        Inc(Index);
    end
    else
    begin
      if (Index = 0) then
      begin
        Index:= Count-1;
      end
      else
        Dec(Index);
    end;
  end
  else
  begin
    if RotateCW then
    begin
      if (Index = Count-1) then
      begin
        RotateCW:= False;
        Dec(Index);
      end
      else
        Inc(Index);
    end
    else
    begin
      if (Index = 0) then
      begin
        RotateCW:= True;
        Inc(Index);
      end
      else
        Dec(Index);
    end;
  end;
  Result:= Index;
end;

procedure TImageRotator.DrawNextImage(const ImageList: TImageList; const Image: PImage);
begin
  ImageList.Draw(Canvas,0,0,GetNext);
  Image.Picture.Bitmap:= self;
end;

end.
