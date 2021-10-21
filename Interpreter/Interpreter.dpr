program Interpreter;

{$APPTYPE CONSOLE}
{$R *.res}

// ������ģʽ
uses
    System.Generics.Collections, System.SysUtils;

type
    // �����ǰ��������ΪTContext��������TExpression��TExpression����TContext֮����
    TExpression = class;

    // �����͵������ģ����߳�Ϊ���ݣ�
    TContext = class
    private
        // ����������
        FContent: String;
        FInterpretList: TList<TExpression>;
    public
        property Context: String read FContent write FContent;

        // ���Ǹ���Ĺ���
        constructor Create(); overload;

        // ��ӣ�ָ����������
        procedure AddInterpret(Expression: TExpression);
        // �������б�
        property InterpretList: TList<TExpression> read FInterpretList write FInterpretList;
    end;

    // ����Ϊ�����ࣨ������������������д��������һ����Դ��Ŀ�п�����
    TExpression = class abstract
    protected
        // ��дΪ�鷽�������ڽ�����д
        procedure Interpret(Context: TContext); virtual; abstract;
    end;

    TAdvanceExpression = class(TExpression)
    public
        // ��д���ĵĽ��ͷ���
        procedure Interpret(Context: TContext); override;
    end;

    // ����ͼΪ��׼�Ĵ����д
    TSimpleExpression = class(TExpression)
    public
        // ��д���ĵĽ��ͷ���
        procedure Interpret(Context: TContext); override;
    end;

    { TAdvanceExpression }

procedure TAdvanceExpression.Interpret(Context: TContext);
begin
    Writeln('���Ǹ߼�������');
end;

{ TSimpleExpression }

procedure TSimpleExpression.Interpret(Context: TContext);
begin
    Writeln('������ͨ������');
end;

{ TContext }

procedure TContext.AddInterpret(Expression: TExpression);
begin
    InterpretList.Add(Expression);
end;

constructor TContext.Create;
begin
    inherited Create;
    InterpretList := TList<TExpression>.Create();
end;

begin
    try
        var
        Ctx := TContext.Create();
        // ��װ���������ҵ�������γ���ν�Ľ�������
        Ctx.AddInterpret(TSimpleExpression.Create());
        Ctx.AddInterpret(TAdvanceExpression.Create());

        // ִ�н���
        for var CtxInterpret in Ctx.InterpretList do begin
            CtxInterpret.Interpret(Ctx);
        end;
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;
    Readln;

end.
