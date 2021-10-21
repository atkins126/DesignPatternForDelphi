program ChainOfResponsibility;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

type
    THandle = class abstract
    private

        FNextHandle: THandle;

    public
        property NextHandle: THandle read FNextHandle write FNextHandle;

        procedure RequestHandle(Request: Integer); virtual; abstract;
    end;

    TLeader = class(THandle)

    public
        procedure RequestHandle(Request: Integer); override;
    end;

    TManager = class(THandle)
        procedure RequestHandle(Request: Integer); override;
    end;

    { TLeader }

procedure TLeader.RequestHandle(Request: Integer);
begin
    if (Request >= 1) and (Request <= 3) then Writeln('�鳤����ͨ��')

    else NextHandle.RequestHandle(Request) // ��ǰ�쵼�޷����������ϼ�
end;

{ TManager }

procedure TManager.RequestHandle(Request: Integer);
begin
    if (Request >= 4) and (Request <= 10) then Writeln('��Ŀ��������ͨ��')

    else NextHandle.RequestHandle(Request)
end;

begin
    try
        // ��װ��
        var
        Manager := TManager.Create();

        var
        Leader := TLeader.Create();

        Leader.NextHandle := Manager;

        // ��������
        Leader.RequestHandle(10);

    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;

    Readln;

end.
