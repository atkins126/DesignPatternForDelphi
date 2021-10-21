unit uIterator;

interface

type
    TNames = array [0 .. 1] of String;

    // �������ӿ�
    ITerator = Interface
        ['{BF2BE685-0193-4F92-9C77-1AF0B3D1D4DA}']
        function HasNext(): boolean;

        function Next(): string;
    End;

    // ����������
    TContainer = class abstract
    private
        FNames: TNames;

    public
        property Names: TNames read FNames write FNames;
        function GetIterator(): ITerator; virtual; abstract;
    End;

    // ����ʵ����
    TNameRepository = class(TContainer)

    public
        constructor Create();
        function GetIterator(): ITerator; override;

    end;

    // ������ʵ����
    TNameIterator = class(TInterfacedObject, ITerator)
    private
        FIndex: Integer;
        Container: TContainer;
    public
        function HasNext(): boolean;
        function Next(): string;
        constructor Create(Container: TContainer);
    end;

implementation

{ TNameRepository }

constructor TNameRepository.Create;
begin
    self.FNames[0] := 'С��';
    self.FNames[1] := 'С��';

end;

function TNameRepository.GetIterator: ITerator;
begin
    Result := TNameIterator.Create(self);
end;

{ TNameRepository.TNameIterator }

constructor TNameIterator.Create(Container: TContainer);
begin
    self.FIndex := 0;
    self.Container := Container;
end;

function TNameIterator.HasNext: boolean;
begin

    Result := false;
    if (self.FIndex < length(self.Container.Names)) then begin

        Result := true;
    end;
end;

function TNameIterator.Next: string;
begin
    Result := '';
    if (self.HasNext) then begin

        Result := self.Container.Names[self.FIndex];

        inc(self.FIndex);
    end;
end;

end.
