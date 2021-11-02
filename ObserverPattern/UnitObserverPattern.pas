unit UnitObserverPattern;

interface

uses
  System.Generics.Collections;

type
  //�۲��ߣ���Ҫ��һ�����������۲��ߣ�״̬�ķ���
  IObserver = interface
    ['{6B71C6A8-01FD-43E0-B4F8-EDCFBFFA911D}']
    procedure Update();
  end;

  //�������Ĺ۲���
  TMonster = class(TInterfacedObject, IObserver)
  public
    procedure Update(); overload;
     //�жϽ�ɫ�Ƿ����Լ���Ӱ�췶Χ�ڣ��������ϸ�ڣ�ֱ�ӷ���true
    function IsInRange(): Boolean;
  end;

  TTrap = class(TInterfacedObject, IObserver)
     //���壺����Ĺ۲���
  public
    procedure Update(); overload;
       //�жϽ�ɫ�Ƿ����Լ���Ӱ�췶Χ�ڣ��������ϸ�ڣ�ֱ�ӷ���true
    function IsInRange(): Boolean;
  end;

  TSubject = class abstract
  //���۲��ߣ�������ڹ۲��ߵĲ���
  private
    FObserverList: TLIst<IObserver>;
    constructor Create(); overload;
  public
    property ObserverList: TLIst<IObserver> read FObserverList write FObserverList;
    //��ӹ۲���
    procedure AddObserver(Observer: IObserver);
    //ɾ���۲���
    procedure DeleteObserver(Observer: IObserver);
    //֪ͨ���еĹ۲���
    procedure NotifyObservers();
  end;

  //��ɫ������ı��۲���
  TRole = class(TSubject)
  public
  //��ɫ�ƶ�
    procedure Move();
    constructor Create(); overload;
  end;

implementation

{ TSubject }

procedure TSubject.AddObserver(Observer: IObserver);
begin
  Self.ObserverList.Add(Observer);
end;

constructor TSubject.Create;
begin
  inherited;
  Self.FObserverList := TList<IObserver>.Create;
end;

procedure TSubject.DeleteObserver(Observer: IObserver);
begin
  Self.ObserverList.Delete(Self.ObserverList.IndexOf(Observer));
end;

procedure TSubject.NotifyObservers;
begin

  for var Observer in ObserverList do begin
    Observer.Update;
  end;
end;

{ TMonster }

function TMonster.IsInRange: Boolean;
begin
  Result := True;
end;

procedure TMonster.Update;
begin
  if (Self.IsInRange) then
    Writeln('�������Ĺ�����Χ');
end;

{ TTrap }

function TTrap.IsInRange: Boolean;
begin
  Result := True;
end;

procedure TTrap.Update;
begin
  if (Self.IsInRange) then
    Writeln('��������Ĺ�����Χ');
end;

{ TRole }

constructor TRole.Create;
begin
  inherited Create;
end;

procedure TRole.Move;
begin
  Writeln('��ɫ�ƶ�');
  self.NotifyObservers;
end;

end.

