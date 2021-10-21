unit BuilderModeCore;

interface

type

    TComputer = class
    private
        // ���� CUP
        FCpu: string;
        // ���� �ڴ�
        FRam: string;
        // ��ѡ    USB����
        FUsbCount: Integer;
        // ��ѡ   ����
        FKeyboard: string;
        // ��ѡ   ��ʾ��
        FDisplay: string;

    public

      type
        TBuilder = class
        private
            // ���� CUP
            FCpu: string;
            // ���� �ڴ�
            FRam: string;
            // ��ѡ    USB����
            FUsbCount: Integer;
            // ��ѡ   ����
            FKeyboard: string;
            // ��ѡ   ��ʾ��
            FDisplay: string;

        public

            constructor Create(Cpu: string; Ram: string); overload;

            function Build(): TComputer;

            function SetUsbCount(UsbCount: Integer): TBuilder;

            function SetKeyboard(Keyboard: string): TBuilder;

            function SetDisplay(Display: string): TBuilder;

            property Cpu: string read FCpu;

            property Ram: string read FRam;

            property UsbCount: Integer read FUsbCount;

            property Keyboard: string read FKeyboard;

            property Display: string read FDisplay;
        end;

    private
        // �ղι���
        constructor Create; overload;
        // �ڹ��췽���ڲ�
        constructor Create(Builder: TBuilder); overload;
    end;

implementation

{ TComputer }

constructor TComputer.Create;
begin
    inherited Create;
end;

{ TComputer.Builder }

function TComputer.TBuilder.Build: TComputer;
begin
    Result := TComputer.Create(self);
end;

constructor TComputer.TBuilder.Create(Cpu, Ram: string);
begin
    self.FCpu := Cpu;
    self.FRam := Ram;
end;

function TComputer.TBuilder.SetDisplay(Display: string): TBuilder;
begin
    self.FDisplay := Display;
    Result := self;
end;

function TComputer.TBuilder.SetKeyboard(Keyboard: string): TBuilder;
begin
    self.FKeyboard := Keyboard;
    Result := self;
end;

function TComputer.TBuilder.SetUsbCount(UsbCount: Integer): TBuilder;
begin
    self.FUsbCount := UsbCount;
    Result := self;
end;

constructor TComputer.Create(Builder: TBuilder);
begin
    self.FCpu := Builder.Cpu;
    self.FRam := Builder.Ram;
    self.FKeyboard := Builder.Keyboard;
    self.FDisplay := Builder.Display;
    self.FUsbCount := Builder.UsbCount;
end;

end.
