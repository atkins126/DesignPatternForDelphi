unit UnitOrderingFood;

interface

uses System.Generics.Collections;

type
    // ��Ʒָ��
    TFoodCommand = class abstract
    public
        // ��Ʒ��������������Ϊÿһ�ֶ���ͬ����Ϊ����
        procedure Make(); virtual; abstract;
    end;

    // ����Ľ����ߣ������ִ���ߣ�ˮ��ʦ
    TDumplingsReceiver = class
    public
        procedure Action();
    end;

    // ���ʦ����Ȼ��֪����û������ְҵ��
    TWontonReceiver = class
    public
        procedure Action();
    end;

    // �����Ʒָ��ˮ��
    TDumplingsCommand = class(TFoodCommand)
    private
        FDumplingsReceiver: TDumplingsReceiver;
    public
        procedure Make(); override;
        constructor Create(DumplingsReceiver: TDumplingsReceiver); overload;
    end;

    // �����Ʒָ�����
    TWontonCommand = class(TFoodCommand)
    private
        FWontonReceiver: TWontonReceiver;
    public
        procedure Make(); override;
        constructor Create(WontonReceiver: TWontonReceiver); overload;
    end;

    TFoodInvoker = class
    private
        // ָ����������Ϊ�˵�
        FFoodCommands: TList<TFoodCommand>;
    public
        // ��ӵ�ָ���
        procedure SetFoodCommand(FoodCommand: TFoodCommand);
        // ִ��ָ��е�ָ��
        procedure Execute();
        // ��ʼ��ָ�
        constructor Create(); overload;
    end;

implementation

{ TDumplings }

constructor TDumplingsCommand.Create(DumplingsReceiver: TDumplingsReceiver);
begin
    self.FDumplingsReceiver := DumplingsReceiver;
end;

procedure TDumplingsCommand.Make;
begin
    Writeln('�ֹ�ˮ��');
    self.FDumplingsReceiver.Action();
end;
{ TWonton }

constructor TWontonCommand.Create(WontonReceiver: TWontonReceiver);
begin
    self.FWontonReceiver := WontonReceiver;
end;

procedure TWontonCommand.Make;
begin
    Writeln('Ƥ���ڴ�������');
    self.FWontonReceiver.Action();
end;
{ TDumplingsReceiver }

procedure TDumplingsReceiver.Action;
begin
    Writeln('����');
    Writeln('����');
    Writeln('�Ƴ�');
end;

{ TWontonReceiver }

procedure TWontonReceiver.Action;
begin
    Writeln('����');
    Writeln('����');
    Writeln('ߦƤ');
end;

{ TFoodInvoker }

constructor TFoodInvoker.Create;
begin
    FFoodCommands := TList<TFoodCommand>.Create();
end;

procedure TFoodInvoker.Execute;
begin
    for var FoodCommand in FFoodCommands do begin
        FoodCommand.Make();
    end;
end;

procedure TFoodInvoker.SetFoodCommand(FoodCommand: TFoodCommand);
begin
    FFoodCommands.Add(FoodCommand);
end;

end.
