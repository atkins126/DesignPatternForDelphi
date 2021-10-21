program TemplateMethod;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

type
    { ��������� }
    TRefrigerator = class
    Protected

        { �򿪱��� }
        procedure Open(); virtual; abstract;
        { ��Ŷ��� }
        procedure Deposit(); virtual; abstract;
        { �رձ��� }
        procedure Close(); virtual; abstract;
        { ģ�巽����������д�Ŷ��� }
        procedure DepositToRefrigerator();

    end;

    { �����������ຣ������ }
    THaierRefrigerator = class(TRefrigerator)
        procedure Open(); override;

        procedure Deposit(); override;

        procedure Close(); override;
    end;
    { TRefrigerator }

procedure TRefrigerator.DepositToRefrigerator;
begin
    // ��Ŷ�������������
    Open();
    Deposit();
    Close()
end;

{ THaierRefrigerator }

procedure THaierRefrigerator.Close;
begin
    Writeln('Haier����ر�');
end;

procedure THaierRefrigerator.Deposit;
begin
    Writeln('Haier������');
end;

procedure THaierRefrigerator.Open;
begin
    Writeln('Haier�����');
end;

begin

    //�����������
    var
    HaierRefrigerator := THaierRefrigerator.Create();

    //����ģ�巽��
    HaierRefrigerator.DepositToRefrigerator();

    Readln;

end.
