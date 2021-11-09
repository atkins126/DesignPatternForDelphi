unit UnitVisitorPattern;

interface

uses
  System.Generics.Collections;

type
  IVocation = interface;
	{����Ĳ���}

  IMaterial = interface
    ['{B6C63803-01E0-4121-9BEC-B865D04DEDFD}']
    {�����ܷ�����}
    function Accept(Vocation: IVocation): string;
  end;

  {ɣ��}
  TMulberry = class(TInterfacedObject, IMaterial)
  public
    function Accept(Vocation: IVocation): string; overload;
  end;

  {ţ��}
  TOxbone = class(TInterfacedObject, IMaterial)
  public
    function Accept(Vocation: IVocation): string; overload;
  end;

  {����ĳ�������ߣ�ְҵ}
  IVocation = interface
    ['{49803485-37AD-4689-9203-C97E9CB01300}']
    function Make(Mulberry: TMulberry): string; overload;
    function Make(Oxbone: TOxbone): string; overload;
  end;

  {�Ʒ�}
  TSymbol = class(TInterfacedObject, IVocation)
  public
    function Make(Mulberry: TMulberry): string; overload;
    function Make(Oxbone: TOxbone): string; overload;
  end;

  {��ҩ}
  TPharmacy = class(TInterfacedObject, IVocation)
    function Make(Oxbone: TOxbone): string; overload;
    function Make(Mulberry: TMulberry): string; overload;
  end;
  {ԭ�ϼ�}
  TSetMaterial = class
  private
    FList: TList<IMaterial>;
  public
    property MaterialList: TList<IMaterial> read FList write Flist;
    function Accept(Vocation: IVocation): string;
    procedure Add(Material: IMaterial);
    procedure Remove(Material: IMaterial);
    constructor Create(); overload;
  end;

implementation

{ TMulberry }

function TMulberry.Accept(Vocation: IVocation): string;
begin
  Result := Vocation.make(Self);
end;

{ TOxbone }

function TOxbone.Accept(Vocation: IVocation): string;
begin
  Result := Vocation.make(Self);
end;

{ TSymbol }

function TSymbol.Make(Oxbone: TOxbone): string;
begin
  Result := 'ţ��ǿ���';
end;

function TSymbol.Make(Mulberry: TMulberry): string;
begin
  Result := '��ɫīˮ';
end;

{ TPharmacy }

function TPharmacy.Make(Oxbone: TOxbone): string;
begin
  Result := '���������';
end;

function TPharmacy.Make(Mulberry: TMulberry): string;
begin
  Result := '����ˮ';
end;



{ TSetMaterial }

function TSetMaterial.Accept(Vocation: IVocation): string;
begin
  var builder := '';
  for var Material in MaterialList do begin
    if Material is TMulberry then begin

      builder := builder + Vocation.Make(Material as TMulberry);
    end
    else if Material is TOxbone then begin
      Vocation.Make(Material as TOxbone);
      builder := builder + ',' + Vocation.Make(Material as TOxbone);
    end;

  end;

  Result := builder;
end;

procedure TSetMaterial.Add(Material: IMaterial);
begin
  MaterialList.Add(Material);
end;

constructor TSetMaterial.Create();
begin
  inherited;
  FList := TList<IMaterial>.Create();
end;

procedure TSetMaterial.Remove(Material: IMaterial);
begin

  MaterialList.Remove(Material);
end;

end.

