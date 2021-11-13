program AdapterPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AdapterBasicWithClassUnit in 'AdapterBasicWithClassUnit.pas';

procedure TestAdapterClass();
   //相当于客户端
begin

  //获取适配器，相当于要给手机充电要先拿到充电器
  var Target := TAdapter.Create;
  //发起请求
  Target.Request();
end;

begin
  try
    TestAdapterClass();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.

