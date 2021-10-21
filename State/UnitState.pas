unit UnitState;

interface

type
    // ����״̬�ࣺ���Է�װ���������е��ض�״̬����Ӧ����Ϊ��������һ��������Ϊ
    TWeatherState = class
    public
         //��ȡ����״̬����Ϣ
        function GetWeatherMessage(): string; virtual; abstract;
    end;


    // ʵ�ֳ���״̬����Ӧ����Ϊ����������Ҫ������½���״̬�л���
    //����״̬������
    TRain = class(TWeatherState)
    public
        function GetWeatherMessage(): string; override;
    end;

     //����״̬������
    TSunshine = class(TWeatherState)
    public
        function GetWeatherMessage(): string; override;
    end;

    TContext = class
    //������:�����˿ͻ�����Ҫ�Ľӿڣ��ڲ�ά��һ����ǰ״̬�����������״̬���л���
    private
        FWeather: TWeatherState;
    public
        //�л�״̬
        property CurrentWeather: TWeatherState read FWeather write FWeather;

        //��ȡ������Ϣ
        function GetWeather(): string;
        //��д����
        constructor Create(); overload;
    end;

implementation

{ TRain }

function TRain.GetWeatherMessage: string;
begin
    Result := '����';
end;

{ TSunshine }

function TSunshine.GetWeatherMessage: string;
begin

    Result := '����';
end;

{ TContext }

constructor TContext.Create;
begin
    //Ĭ��ά����״̬
    Self.CurrentWeather := TRain.Create();
end;

function TContext.GetWeather: string;
begin
    Result := CurrentWeather.GetWeatherMessage();

end;

end.

