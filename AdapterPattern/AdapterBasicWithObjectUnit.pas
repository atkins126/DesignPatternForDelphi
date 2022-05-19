unit AdapterBasicWithObjectUnit;

interface

type
  TTarget = class abstract
  {Ŀ�꣬���յ�Ŀ�ģ������ڲ��Ź���}
  public
    procedure Request; virtual; abstract;
  end;

  TAdaptee = class(TObject)
  {�������࣬�����ʵ�֣������ڿ��Բ����ض�������Ƶ�Ĳ��}
  public
    procedure SpecificRequest;
  end;

  TAdapter = class(TTarget)

   {�������࣬��Ŀ��ͱ��������������}

  private
	//�����������д����ͬ�ľ���������
    FAdaptee: TAdaptee;
  public
    constructor Create;
    procedure Request; override;
  end;

implementation

{ TAdaptee }

procedure TAdaptee.SpecificRequest;
begin
  Writeln('�ҿ��Դ������������');
end;

{ TAdapter }

constructor TAdapter.Create;
begin
    //����
  FAdaptee := TAdaptee.Create;
end;

procedure TAdapter.Request;
begin
  //TODO ���Ա�д����Ĺ��ܴ���
  Writeln('����ɹ��������������ķ���');
  FAdaptee.SpecificRequest;
end;

end.

