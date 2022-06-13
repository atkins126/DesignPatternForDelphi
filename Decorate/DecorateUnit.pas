unit DecorateUnit;

interface

type
  // �����ӿ�
  INormalAttack = interface
    ['{D8FE89F6-8492-48E4-85BF-72C2940C2259}']
    procedure MakeADAttack();
  end;

  // ��ͨ����
  TNormalAttack = class(TInterfacedObject, INormalAttack)
  private
    FAdAttack: Integer;

  public
    property AdAttack: Integer read FAdAttack write FAdAttack;
    procedure MakeADAttack(); overload;

    //���췽�������ڳ�ʼ������ֵ
    constructor Create(AdAttack: Integer); overload;
  end;

  //����װ����
  TNormalAttackDecorator =  class abstract(TInterfacedObject, INormalAttack)    
  private
    FNormalAttack: INormalAttack;
  private
    FSpecialEfficacy: string;
  public
    property NormalAttack: INormalAttack read FNormalAttack write FNormalAttack;
    //�麯������������ʵ��
    procedure MakeADAttack(); virtual; abstract;   

    constructor Create(NormalAttack: INormalAttack); overload;
  end;

  //����
  TRetardDecorator = class(TNormalAttackDecorator)    
  public
    procedure MakeADAttack(); override;

    constructor Create(NormalAttack: INormalAttack); overload;
  end;
  //�ж�

  TPoisonDecorator = class(TNormalAttackDecorator)
  public
    procedure MakeADAttack(); override;

    constructor Create(NormalAttack: INormalAttack); overload;
  end;


implementation

{ TNormalAttack }
uses
  System.SysUtils;

constructor TNormalAttack.Create(AdAttack: Integer);
begin

  Self.AdAttack := AdAttack;
end;

procedure TNormalAttack.MakeADAttack;
begin
  Writeln('��ʼ����ֵΪ��' + Self.AdAttack.ToString);
end;

{ TNormalAttackDecorator }

constructor TNormalAttackDecorator.Create(NormalAttack: INormalAttack);
begin

  Self.NormalAttack := NormalAttack;
  

end;

{ TRetardDecorator }

constructor TRetardDecorator.Create(NormalAttack: INormalAttack);
begin
  inherited Create(NormalAttack);
  self.FSpecialEfficacy := '����';
end;

procedure TRetardDecorator.MakeADAttack;
begin
  Self.NormalAttack.MakeADAttack();
  Writeln('������' + self.FSpecialEfficacy + 'Buff');

end;

{ TPoisonDecorator }

constructor TPoisonDecorator.Create(NormalAttack: INormalAttack);
begin
  inherited Create(NormalAttack);
  self.FSpecialEfficacy := '�ж�';
end;

procedure TPoisonDecorator.MakeADAttack;
begin

  Self.NormalAttack.MakeADAttack();

  Writeln('������' + self.FSpecialEfficacy + 'Buff');
end;

end.

