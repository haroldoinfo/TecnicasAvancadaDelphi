unit myComponent;

interface

uses
  System.Classes;


procedure register;

type

  TMyComponent = class(TComponent)
  private
    FOtherName: string;
    FStatus: TNotifyEvent;
    procedure SetOtherName(const Value: string);
    procedure SetStatus(const Value: TNotifyEvent);
    procedure OnStatus;
  public
    function LengthString(const AValue: string): Integer;
  published
    property OtherName: string read FOtherName write SetOtherName;
    property Status: TNotifyEvent read FStatus write SetStatus;
  end;

implementation

procedure register;
begin
  RegisterComponents('Treinamento', [TMyComponent]);
end;

{ TMyComponent }

function TMyComponent.LengthString(const AValue: string): Integer;
begin
  Result := Length(AValue);
  OnStatus;
end;

procedure TMyComponent.OnStatus;
begin
  if Assigned(FStatus) then
    FStatus(Self);
end;

procedure TMyComponent.SetOtherName(const Value: string);
begin
  FOtherName := Value;
end;

procedure TMyComponent.SetStatus(const Value: TNotifyEvent);
begin
  FStatus := Value;
end;

end.
