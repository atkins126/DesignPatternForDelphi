program BridgePattern;

{$APPTYPE CONSOLE}

{$R *.res}

 {�Ž�ģʽ}
uses
  System.SysUtils,
  BridgeUnit in 'BridgeUnit.pas';

var
  List: TSkill;

begin
  try

    //����Ӣ��
    var SindlaHero := TSindlaHero.Create();

    //���������б��൱��װ�似��
    List[0] := TFastRun.create();
    List[1] := TLgnition.Create();
    SindlaHero.SkillList := List;

    //������ʹ�ü���-��ȼ
    SindlaHero.UseSkill(Lgnition);

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.

