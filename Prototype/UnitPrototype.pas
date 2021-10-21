unit UnitPrototype;

interface

uses
    System.Classes;

type
    TPrototype = class(TPersistent)
    protected
        //�Լ�ʵ�ֿ�¡�ĺ���
        function Clone: TPrototype; virtual; abstract;
    end;

    TCitation = class(TPrototype)
    private
        FName: string;
    public

        property Name: string read FName write FName;

        //��д����ķ���
        procedure Assign(Source: TPersistent); override;

        function Clone: TPrototype; override;
    end;

implementation

{ TConcreatePrototype1 }

procedure TCitation.Assign(Source: TPersistent);
begin
    //����ת����������Ը�ֵ
    if Source is TCitation then begin

        with Source as TCitation do begin

            self.Name := Name;

        end;

    end
    else begin
        inherited;
    end;

end;



function TCitation.Clone: TPrototype;
begin

    //�˴��� Result �������Ϊ Ŀ��(target)
    Result := TCitation.Create;

    //�� Դ ���Ƶ� Ŀ�겢����
    Result.Assign(self);
end;

end.

