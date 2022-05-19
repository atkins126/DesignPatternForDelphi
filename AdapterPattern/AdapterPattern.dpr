program AdapterPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AdapterBasicWithClassUnit in 'AdapterBasicWithClassUnit.pas',
  AdapterBasicWithObjectUnit in 'AdapterBasicWithObjectUnit.pas',
  MediaAdapterUnit in 'MediaAdapterUnit.pas';

procedure TestAdapterClass();
   //�൱�ڿͻ���
begin

  //��ȡ���������൱��Ҫ���ֻ����Ҫ���õ������
  var Target := TAdapter.Create;
  //��������
  Target.Request();
end;

procedure TestAdapterObject();
begin
    //��ȡ���������൱��Ҫ���ֻ����Ҫ���õ������
  var Target := AdapterBasicWithObjectUnit.TAdapter.Create;
  //��������
  Target.Request();
end;

procedure MediaAdapter();
begin
  var AudioPlayer := TAudioPlayer.Create();
  AudioPlayer.play('MP3', 'Ų����ɭ��.mp3');
  AudioPlayer.play('MP4', 'Ų����ɭ��.mp4');
  AudioPlayer.play('vlc', 'Ų����ɭ��.vlc');
  AudioPlayer.play('avi', 'ˮ��.avi');

end;

begin
  try
   // TestAdapterObject();
    MediaAdapter();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.

