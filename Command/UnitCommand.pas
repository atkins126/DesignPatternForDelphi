unit UnitCommand;

interface

type
    // �����ߣ�����ִ������Ķ���
    TReceiver = class
    public
        procedure Action();
    end;

    // ����ĳ�����,�ýӿڸ���
    TCommand = class abstract

    public
        // ��������
        procedure execute(); virtual; abstract;
    end;

    // ��������
    TConcreteCommand = class(TCommand)
    private
        FReceiver: TReceiver;
    public
        property Receiver: TReceiver read FReceiver write FReceiver;
        // ��д
        procedure execute(); override;
        // ����
        constructor Create(Receiver: TReceiver); overload;
    end;

    // ������/�����ߣ�����ִ����������Ķ���
    TInvoker = class
    private
        FCommand: TCommand;
    public
        constructor Create(Command: TCommand); overload;

        procedure Call();
    end;

implementation

{ TReceiver }

procedure TReceiver.Action;
begin
    Writeln('����ִ����');
end;

{ TConcreteCommand }

constructor TConcreteCommand.Create(Receiver: TReceiver);
begin
    self.FReceiver := Receiver;
end;

procedure TConcreteCommand.execute;
begin
    Receiver.Action();
end;

{ TInvoker }

procedure TInvoker.Call;
begin
    // �����ߵ����������ִ��������Ǹ�execute����
    FCommand.execute();
end;

constructor TInvoker.Create(Command: TCommand);
begin
    self.FCommand := Command;
end;

end.
