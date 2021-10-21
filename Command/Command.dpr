program Command;

{$APPTYPE CONSOLE}
{$R *.res}

// ����ģʽ
uses
    System.SysUtils,
    UnitCommand in 'UnitCommand.pas',
    UnitOrderingFood in 'UnitOrderingFood.pas';

procedure Demo1();
begin
    // ͨ�������ߣ�invoker�������������command������������е������������ִ���ߣ�Receiver��
    var
    ConcreteCommand := TConcreteCommand.Create(TReceiver.Create());
    var
    Invoker := TInvoker.Create(ConcreteCommand);

    Invoker.Call;
end;

begin
    try
        // ѡ���Ʒ(�������ָ������Ľ�����)
        var
        WontonCommand := TWontonCommand.Create(TWontonReceiver.Create);
        var
        DumplingsCommand := TDumplingsCommand.Create(TDumplingsReceiver.Create);
        // ����Ա���ɲ˵�
        var
        FoodInvoker := TFoodInvoker.Create();
        FoodInvoker.SetFoodCommand(WontonCommand);
        FoodInvoker.SetFoodCommand(DumplingsCommand);
        // ��ʦ����ʼ����
        FoodInvoker.Execute();
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;
    Readln;

end.
