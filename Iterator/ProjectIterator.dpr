program ProjectIterator;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    uIterator in 'uIterator.pas';

begin
    try
        // �������������
        var
        Repository := TNameRepository.Create();
        // ��ȡ����������
        var
        Iterator := Repository.GetIterator();

        // ͨ����������ȡԪ��
        while Iterator.hasNext do writeln(Iterator.Next);

    except
        on E: Exception do writeln(E.ClassName, ': ', E.Message);
    end;

    Readln;

end.
