unit AdapterBasicWithClassUnit;

{������ģʽ-��}

interface

type
  ITarget = interface(IInterface)
    ['{6B9A4DB9-7DCB-4C6F-B1AD-D46E3194D5D3}']
    {Ŀ��}
    procedure Request;
  end;

  TAdaptee = class(TInterfacedObject)
  {��������}
  public
    procedure SpecificRequest;
  end;

  TAdapter = class(TAdaptee, ITarget)
  {������}
  public
    procedure Request;
  end;

implementation

{ TAdapter }

procedure TAdapter.Request;
begin

  Writeln('����ɹ��������������ķ���');
  SpecificRequest;
end;

{ TAdaptee }

procedure TAdaptee.SpecificRequest;
begin

  Writeln('���������Դ�����Ĵ���');
end;

end.

