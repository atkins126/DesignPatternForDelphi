program Single;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    System.Types,
    uCommonUtil in 'uCommonUtil.pas';

var
    P1, P2: Pointer;

begin
    try
        var
        com1 := TSingle.GetInstance();
        P1 := com1;
        P2 := TSingle.GetInstance();
        // ͨ������ĵ�ַ�ɼ���ͬһ������
        writeln(IntToStr(Integer(P2)));
        writeln(IntToStr(Integer(P1)));
    except
        on E: Exception do writeln(E.ClassName, ': ', E.Message);
    end;

end.
