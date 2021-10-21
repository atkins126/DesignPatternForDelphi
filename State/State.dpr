program State;

{$APPTYPE CONSOLE}

{$R *.res}

uses
    System.SysUtils,
    UnitState in 'UnitState.pas';

begin



    try
        var Context := TContext.Create();
        //��ȡĬ��״̬
        Writeln(Context.GetWeather());
        //�л�״̬
        Context.CurrentWeather := TSunshine.Create();
        //��ȡ�л����״̬
        Writeln(Context.GetWeather());

    except
        on E: Exception do
            Writeln(E.ClassName, ': ', E.Message);
    end;
    Readln;
end.

