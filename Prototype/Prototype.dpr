program Prototype;

{$APPTYPE CONSOLE}

{$R *.res}

uses
    System.SysUtils,
    UnitPrototype in 'UnitPrototype.pas';

begin
    var Citation := TCitation.Create();
    Citation.Name := 'С��';
    //Writeln(Integer(@Citation).ToHexString);

    Writeln(Citation.Name+'ͬѧ����2020ѧ���һѧ���б������㣬����Ϊ����ѧ�����ط���״��');

    //��¡һ������
    var Citation1 := Citation.Clone();

    //��û�����¸�ֵ֮ǰ����¡�����Ķ��󱣳�ԭ����ֵ
    Writeln(Citation.Name);

    Readln;
end.

