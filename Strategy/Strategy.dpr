program Strategy;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    uStrategy in 'uStrategy.pas';

begin
    try
        var
        Operation := TOperation.Create();
        // ����ֻ��Ҫ������ͬ�Ĳ���ʵ�ֶ��󣬼�����ɲ�ͬ�����㣬��TOperation���еĴ��벻��Ҫ���κθ���
        var
        res := Operation.ExecuteStrategy(1, 2, TOperationAdd.Create());
        writeln(res.ToString);
        readln;
    except
        on E: Exception do writeln(E.ClassName, ': ', E.Message);
    end;

end.
