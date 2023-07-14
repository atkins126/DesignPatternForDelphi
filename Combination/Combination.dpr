program Combination;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitCombination in 'UnitCombination.pas';

begin
  try
    var Component := TCompany.Create('���������˾');
    var Department := TCompany.Create('����');

    department.Add(TWorkers.Create('A��'));
    department.Add(TWorkers.Create('B��'));
    component.Add(department);

    var Department01 := TCompany.Create('�з���');
    Department01.Add(TWorkers.Create('A��'));
    Department01.Add(TWorkers.Create('B��'));

    component.Add(Department01);

    Component.Print;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.

