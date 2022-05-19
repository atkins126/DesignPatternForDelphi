unit ProxyUnit;

interface

type
  INormalAttack = interface
    ['{0D26D561-70A3-4D36-85D0-2E3FF6F1E8EB}']
    // 制造攻击
    procedure makeAttack();
  end;

  // 道具(可以是宠物、分身、炮台等) ,当然可以再建该类的子类具体出攻击方式，为了避免代码复杂这里就不再扩展

  TProp = class(TInterfacedObject, INormalAttack)
  private
    // 生命值
    FBlood: Integer;
    FName: string;
  public
    property Blood: Integer read FBlood write FBlood;
    property PropName: string read FName write FName;

    // 攻击
    procedure makeAttack(); overload;
  end;

  // 英雄(可以是安妮、提莫等等)
  THero = class(TInterfacedObject, INormalAttack)
  private
    FProp: TProp;
     //定义个name否则没办法称呼
    FName: string;
  public
    property HeroName: string read FName write FName;

    property Prop: TProp read FProp write FProp;
   
    // 构造方法，参数为道具
    constructor Create(Prop: TProp); overload;
    // 提伯斯攻击
    procedure makeAttack(); overload;
  end;

implementation

{ TTibbers }

procedure TProp.makeAttack;
begin

  Writeln(Self.PropName + '对目标造成伤害');
end;

{ Annie }

constructor THero.Create(Prop: TProp);
begin

  FProp := Prop;
end;

procedure THero.makeAttack;
begin

  if FProp.Blood > 50 then
  begin
    Writeln(self.HeroName + '的' + FProp.PropName + '在进行攻击');
    FProp.makeAttack();
  end
  else
  begin
    Writeln(FProp.PropName + '生命值太低，停止攻击');
  end;

end;

end.

