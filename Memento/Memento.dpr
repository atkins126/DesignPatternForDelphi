program Memento;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

type
    // ����ǰ������
    TRole = class;

    // ����¼��
    TRoleMemento = class
    private
        // ������
        FVitality: Integer;
        // ������
        FAggressivity: Integer;
        // ������
        FDefensivePower: Integer;

    public
        property Vitality: Integer read FVitality write FVitality;

        property Aggressivity: Integer read FAggressivity write FAggressivity;

        property DefensivePower: Integer read FDefensivePower write FDefensivePower;
        // ��д����
        constructor Create(Role: TRole); overload;
    end;

    // ����¼��������
    TRoleStateCaretaker = class
    private
        // ����Ϊ�˽���ѧϰ�ɱ����������˱���¼�е�һ���ڵ㣬�����Ҫ����ʹ����������
        FRoleMemento: TRoleMemento;

    public
        property RoleMemento: TRoleMemento read FRoleMemento write FRoleMemento;
    end;

    // ��Ϸ�Ľ�ɫ�༴Դ������
    TRole = class
    private
        // ������
        FVitality: Integer;
        // ������
        FAggressivity: Integer;
        // ������
        FDefensivePower: Integer;

    public
        property Vitality: Integer read FVitality write FVitality;

        property Aggressivity: Integer read FAggressivity write FAggressivity;

        property DefensivePower: Integer read FDefensivePower write FDefensivePower;

        // �浵

        function RoleMemento(): TRoleMemento;

        // �ָ�
        procedure RoleRecovery(RoleMemento: TRoleMemento);
    end;

    { TRole }

function TRole.RoleMemento: TRoleMemento;
begin
    Result := TRoleMemento.Create(Self);
end;

procedure TRole.RoleRecovery(RoleMemento: TRoleMemento);
begin
    Self.Vitality := RoleMemento.Vitality;
    Self.Aggressivity := RoleMemento.Aggressivity;
    Self.DefensivePower := RoleMemento.DefensivePower;
end;

{ TRoleMemento }

constructor TRoleMemento.Create(Role: TRole);
begin
    Self.Vitality := Role.Vitality;
    Self.Aggressivity := Role.Aggressivity;
    Self.DefensivePower := Role.DefensivePower;
end;

// ���Դ���
begin
    try
        var
        Role := TRole.Create;
        // ��ʼ����ɫ��״̬��Ϣ
        Role.Vitality := 10;
        Role.Aggressivity := 2;
        Role.DefensivePower := 4;
        Writeln('��ɫ��ʼ״̬����������', Role.Vitality, ',��������', Role.Aggressivity, ',��������', Role.DefensivePower);
        // �浵
        var
        RoleStateCaretaker := TRoleStateCaretaker.Create();
        RoleStateCaretaker.RoleMemento := Role.RoleMemento;

        // �����ɫ״̬��Ϣ
        Role.Vitality := 5;
        Role.Aggressivity := 1;
        Role.DefensivePower := 2;
        Writeln('��ɫ���֮��״̬����������', Role.Vitality, ',��������', Role.Aggressivity, ',��������', Role.DefensivePower);

        // ���������ҩ֮��ָ�״̬
        Role.RoleRecovery(RoleStateCaretaker.RoleMemento);
        Writeln('��ɫ�ָ�֮��״̬����������', Role.Vitality, ',��������', Role.Aggressivity, ',��������', Role.DefensivePower);

        Readln;
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;

end.
