program ProxyPattern;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  ProxyUnit in 'ProxyUnit.pas';

begin
  try
      //创建道具即被代理对象
    var Prop := TProp.Create;
    Prop.Blood := 100;
    Prop.PropName := '蘑菇';

    //创建英雄类,即代理类对象
    var Hero := THero.Create(Prop);
    //攻击应该是持续的，所以搞个循环
    Hero.HeroName := '提莫';

    while true do begin
      Hero.makeAttack();
      //每攻击一次道具的生命值降低一次
      Hero.Prop.Blood := Hero.Prop.Blood - 50;

      if Hero.Prop.Blood < 50 then
        break;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  readln;

end.

