unit uCommonUtil;

interface

uses
    System.SysUtils;

type
   { TSingle }
    TSingle = class(TObject)
    private
        FNum: string;
    protected
    public
        constructor Create;
        class function GetInstance(): TSingle;
        class function NewInstance: TObject; override;
        procedure FreeInstance; override;
        property Str: string read FNum write FNum;
    published
    end;

implementation

var
    GlobalSingle: TSingle;
   { TSingle }

constructor TSingle.Create;
begin
    Str := '����ģʽ����';
end;

procedure TSingle.FreeInstance;
begin
    inherited;
    GlobalSingle := nil;
end;

class function TSingle.GetInstance: TSingle;
begin
    //�жϵ�ǰȫ�ֱ���GlobalSingle�����򴴽�����,�����ڲ��������´��ڰ�ȫ����
    if GlobalSingle = nil then begin
        GlobalSingle := TSingle.create();
    end;
    Result := GlobalSingle;
end;

class function TSingle.NewInstance: TObject;
begin
    if GlobalSingle = nil then
        //���ط���ͨ������  NewInstance������ȡ����ǿ��ת��Ϊ TSingle����
        GlobalSingle := TSingle(inherited NewInstance);
    Result := GlobalSingle;
end;

end.

