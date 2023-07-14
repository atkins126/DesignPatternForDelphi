unit BridgeUnit;

interface

type
  ISkill = interface
    // ���ܽӿ�
    ['{70A22670-D265-4CE2-9367-881BBA434D3A}']
    // ���ܹ�Ч,������Ϊ���ܵľ���ʵ�ַ�ʽ
    procedure skillEffect(HeroName: string);
  end;

  TFastRun = class(TInterfacedObject, ISkill)
    // ����
  public
    procedure skillEffect(HeroName: string); overload;
  end;

  TLgnition = class(TInterfacedObject, ISkill)
    // ��ȼ
  public
    procedure skillEffect(HeroName: string); overload;
  end;

type
  // �����б�
  TSkill = array [0 .. 1] of ISkill;
  // ����ѡ��

  TSkillEnum = (Lgnition, FastRun);

  THero = class abstract

    // Ӣ����
  private
    FSkillList: TSkill;
  public
    property SkillList: TSkill read FSkillList write FSkillList;
    procedure UseSkill(SkillEnum: TSkillEnum); virtual; abstract;
  end;

  TGoldenHero = class(THero)
    // ���˿
  public
    procedure UseSkill(SkillEnum: TSkillEnum); override;
  end;

  TSindlaHero = class(THero)
    // ������
  public
    procedure UseSkill(SkillEnum: TSkillEnum); override;
  end;

implementation

{ TFastRun }

procedure TFastRun.skillEffect(HeroName: string);
begin
  Writeln('�ٻ�ʦ��' + HeroName + '���������ܣ���������300%');
end;

{ TLgnition }

procedure TLgnition.skillEffect(HeroName: string);
begin
  Writeln('�ٻ�ʦ��' + HeroName + '��������ȼ����Ŀ������10%�ĳ����˺�������ʱ��6��');
end;

{ TGoldenHero }

procedure TGoldenHero.UseSkill(SkillEnum: TSkillEnum);
begin

  case SkillEnum of
    Lgnition:
      begin
        SkillList[0].skillEffect('���˿');
      end;
    FastRun:
      begin
        SkillList[1].skillEffect('���˿');
      end;

  end;

end;

{ TSindlaHero }

procedure TSindlaHero.UseSkill(SkillEnum: TSkillEnum);
begin
  case SkillEnum of
    Lgnition:
      begin
        SkillList[0].skillEffect('������');
      end;
    FastRun:
      begin
        SkillList[1].skillEffect('������');
      end;

  end;
end;

end.
