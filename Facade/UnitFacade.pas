unit UnitFacade;

interface

type
  //����
  TFriend = class
  public
    function IsFriend(a: string; b: string): Boolean;
  end;

  //���
  TMarry = class
  public
    procedure MarrySomeBody(a: string; b: string);
  end;

  //���
  TSworn = class
  public
    function IsSworn(a: string; b: string): Boolean;
  end;

  TSociety = class
  private
    FFriend: TFriend;
    FSworn: TSworn;
    FMarry: TMarry;
  public
    procedure Marry(a, b: string);

    constructor Create(); overload;
  end;

implementation

{ TFriend }

function TFriend.IsFriend(a, b: string): Boolean;
begin

  Result := True;
end;

{ TSworn }

function TSworn.IsSworn(a, b: string): Boolean;
begin

  Result := False;
end;

{ TMarry }

procedure TMarry.MarrySomeBody(a, b: string);
begin
  Writeln(a + '��' + b + ' �����')
end;

{ TSociety }

constructor TSociety.Create;
begin
  //ԭ���л�ʹ���˵���ģʽ��������ֱ�Ӵ���������
  Self.FFriend := TFriend.Create;

  Self.FSworn := TSworn.Create;
  Self.FMarry := TMarry.Create;
end;

procedure TSociety.Marry(a, b: string);
begin
  if not Self.FFriend.IsFriend(a, b) then begin
    Writeln(a + '��' + b + ' ���Ǻ��ѹ�ϵ');
    Exit;
  end;

  if Self.FSworn.IsSworn(a, b) then begin
    Writeln(a + '��' + b + ' �ǽ�ݹ�ϵ');
    Exit;
  end;
  Writeln(a + ' �� ' + b + '  �Ǻ��ѹ�ϵ�����ǽ�ݹ�ϵ');
  FMarry.MarrySomeBody(a, b);
end;

end.

