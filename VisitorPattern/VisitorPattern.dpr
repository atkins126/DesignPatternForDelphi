program VisitorPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitVisitorPattern in 'UnitVisitorPattern.pas';

begin
  try

    //ɣ��
    var Mulberry := TMulberry.Create();
    //ţ��
    var Oxbone := TOxbone.Create();
    //ԭ�ϼ�
    var SetMaterial := TSetMaterial.Create();
    SetMaterial.Add(Mulberry);
    SetMaterial.Add(Oxbone);
    //������-�Ʒ�
    Writeln('�Ʒ�ҵ��' + SetMaterial.Accept(TSymbol.Create()));
     //������-��ҩ
    Writeln('��ҩҵ��' + SetMaterial.Accept(TPharmacy.Create()));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

