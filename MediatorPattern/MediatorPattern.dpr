program MediatorPattern;

{$APPTYPE CONSOLE}
{$R *.res}

{ �н���ģʽ }
uses
    System.SysUtils;

type

    // ���󷿶���������Ϣ
    TColleague = class abstract
    public
        // ��������Ϣչʾ
        procedure Handle(); virtual; abstract;
    end;

    // �������ķ������ͣ�С����
    TSmallHouseColleague = class(TColleague)

    public
        procedure Handle(); override;
    end;

    // ������
    TTwoHouseColleague = class(TColleague)
    public
        procedure Handle(); override;
    end;

    // �����н���,�������������͵��н�
    TMediator = class abstract

    public
        { ���幵ͨ��ʽ }
        procedure Common(HouseType: Integer); virtual; abstract;
    end;

    // �����н��ߵľ���ʵ��
    THouseMediator = class(TMediator)
        // �н��еǼǵķ�����Ϣ
    private
        FSmallHouseColleague: TSmallHouseColleague;
        FTwoHouseColleague: TTwoHouseColleague;
    public
        property SmallHouseColleague: TSmallHouseColleague read FSmallHouseColleague write FSmallHouseColleague;
        property TwoHouseColleague: TTwoHouseColleague read FTwoHouseColleague write FTwoHouseColleague;

        // ��д���෽��
        procedure Common(HouseType: Integer); override;
    end;

    { TSmallHouseColleague }

procedure TSmallHouseColleague.Handle;
begin
    Writeln('С����չʾ');
end;

{ TTwoHouseColleague }

procedure TTwoHouseColleague.Handle;
begin
    Writeln('�����ҷ���չʾ');
end;

{ THouseMediator }

procedure THouseMediator.Common(HouseType: Integer);
begin
    case HouseType of
        1: begin
                SmallHouseColleague.Handle;
            end;
        2: begin
                TwoHouseColleague.Handle;
            end;
    else Writeln('û�з�������ķ���');
    end;
end;

begin
    try
        // �����н����
        var
        HouseMediator := THouseMediator.Create;
        // �ǼǷ�����Ϣ
        HouseMediator.SmallHouseColleague := TSmallHouseColleague.Create;
        HouseMediator.TwoHouseColleague := TTwoHouseColleague.Create;
        // С��Ҫ�ⷿ
        HouseMediator.Common(1);
        readln;
    except
        on E: Exception do Writeln(E.ClassName, ': ', E.Message);
    end;

end.
