unit UnitFlyweight;

interface

uses
  System.Generics.Collections;

type
    //����һ��ö������
  TColor = (BLACK, WHITE);

type
    //����һ���������ͨ�õĽӿ�
  IChess = interface
    //��������
    procedure Draw(x, y: Integer);
  end;

type
    //������
  TBlackChess = class(TInterfacedObject, IChess)
  private
   //�ڲ�״̬������
    FColor: TColor;
    const
      SHARP: string = 'Բ��';
  public
    //��д�ӿ��еĺ���
    procedure Draw(x, y: Integer); overload;
    //��д����
    constructor Create(); overload;
  end;

type
    //������
  TWhiteChess = class(TInterfacedObject, IChess)
  private
   //�ڲ�״̬������
    FColor: TColor;
    const
      SHARP: string = 'Բ��';
  public
    //��д�ӿ��еĺ���
    procedure Draw(x, y: Integer); overload;
    //��д����
    constructor Create(); overload;
  end;

type
    //������󹤳�
  TChessFactory = class
  private
    FDictionary: TDictionary<TColor, IChess>;
  public
    constructor Create(); overload;

    function GetChess(Color: TColor): IChess;

  end;

implementation

uses
  System.SysUtils, System.TypInfo;
{ TBlackChess }

constructor TBlackChess.Create();
begin
  inherited;
  //��ɫ��ֵ
  FColor := TColor.BLACK;
end;

procedure TBlackChess.Draw(x, y: Integer);
begin
  var EnumName := GetEnumName(TypeInfo(TColor), 0);

  Writeln(SHARP + EnumName + '�������ڣ�' + inttostr(x) + '��' + inttostr(y) + '����')
end;

{ TWhiteChess }

constructor TWhiteChess.Create;
begin
  inherited;
  //��ɫ��ֵ
  FColor := TColor.WHITE;
end;

procedure TWhiteChess.Draw(x, y: Integer);
begin

  var EnumName := GetEnumName(TypeInfo(TColor), 1);

  Writeln(SHARP + EnumName + '�������ڣ�' + inttostr(x) + '��' + inttostr(y) + '����')

end;

{ TChessFactory }

constructor TChessFactory.Create;
begin
  FDictionary := TDictionary<TColor, IChess>.Create;
end;

function TChessFactory.GetChess(Color: TColor): IChess;
begin
  var Chess: IChess;
  FDictionary.TryGetValue(Color, Chess);
//  writeln(Integer(Chess));
  if Chess = nil then
  begin
    if Color = TColor.WHITE then
      Chess := TWhiteChess.Create
    else
      Chess := TBlackChess.Create;

    FDictionary.Add(Color, Chess);

  end;
  Result := Chess;
end;

end.

