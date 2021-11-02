program ObserverPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitObserverPattern in 'UnitObserverPattern.pas';

begin
  try

    //�������۲���,����Ϸ��ɫ
    var Role := TRole.Create();
    //��ӹ۲���
    Role.AddObserver(TMonster.Create);
    //��ɫ�ƶ�
    Role.Move;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

