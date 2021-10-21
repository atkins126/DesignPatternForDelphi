program BuilderMode;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    // BuilderModeCore in 'BuilderModeCore.pas',
    BuilderMode2 in 'BuilderMode2.pas';

// var
// MacComputer: TComputer;

begin
    // MacComputer := TComputer.TBuilder.Create('���ض�', '����').SetUsbCount(2)
    // .SetKeyboard('Mac').Build;

    var
    Director := TComputerDirector.Create(); // 1

    var
    builder := TMacComputerBuilder.Create('I5������', '����125'); // 2

    Director.MakeComputer(builder); // 3
    var
    MacComputer := builder.GetComputer(); // 4

    Readln;

end.
