program Decorate;

{$APPTYPE CONSOLE}
{$R *.res}

{ װ�����ģʽ }
uses
  System.SysUtils,
  DecorateUnit in 'DecorateUnit.pas';

begin
  try

    //װ�θ�����Ч

    var RetardDecorator := TRetardDecorator.Create(TNormalAttack.Create(120));

    var PoisonDecorator := TPoisonDecorator.Create(RetardDecorator);
    //���칥��
    PoisonDecorator.MakeADAttack;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

