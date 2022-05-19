unit MediaAdapterUnit;

interface

type
  IAdvancedMediaPlayer = interface
    {�߼�ý�岥����}
    ['{E2916008-25A7-4E34-8B80-0851A4A429C9}']
    procedure PlayVlc(FileName: string);
    procedure PlayMp4(FileName: string);
  end;

  TVlcPlayer = class(TInterfacedObject, IAdvancedMediaPlayer)
  {�߼��������ľ���ʵ��}
  public
    procedure PlayVlc(FileName: string); overload;
    procedure PlayMp4(FileName: string); overload;
  end;

  TMp4Player = class(TInterfacedObject, IAdvancedMediaPlayer)
   {�߼��������ľ���ʵ��}
  public
    procedure PlayVlc(FileName: string); overload;
    procedure PlayMp4(FileName: string); overload;
  end;

  IMediaPlayer = interface
    {ý�岥����,����Ĳ��Žӿ�}
    ['{6053CA47-F7AF-418D-8814-3DC6810303E0}']
    procedure Play(AudioType, FileName: string);
  end;

  TMediaAdapter = class(TInterfacedObject, IMediaPlayer)
  {MediaPlayer �ӿڵ���������}
  private
    {ͨ���������ʽ�����߼�������}
    FAdvancedMediaPlayer: IAdvancedMediaPlayer;
  public
    procedure Play(AudioType, FileName: string); overload;
    constructor Create(AudioType: string); overload;
  end;

  TAudioPlayer = class(TInterfacedObject, IMediaPlayer)
      {��Ƶ������,Ĭ��ֻ�ܲ���MP3}
  private
    {����������֮�󣬾߱��߼��������Ĺ���}
    FMediaAdapter: TMediaAdapter;
  public
    procedure Play(AudioType, FileName: string); overload;
  end;

implementation

{ TAudioPlayer }

procedure TAudioPlayer.Play(AudioType, FileName: string);
begin

  if 'MP3' = AudioType then
    Writeln('Ĭ��֧�ֵ�����:MP3')
  else if ('MP4' = AudioType) or ('vlc' = AudioType) then begin

    FMediaAdapter := TMediaAdapter.Create(AudioType);
    FMediaAdapter.Play(AudioType, FileName);
  end
  else
    Writeln('�������ݲ�֧��')

end;

{ TMediaAdapter }

constructor TMediaAdapter.Create(AudioType: string);
begin
  if (AudioType = 'MP4') then
    FAdvancedMediaPlayer := TMp4Player.Create()
  else if (AudioType = 'vlc') then
    FAdvancedMediaPlayer := TVlcPlayer.Create()

end;

procedure TMediaAdapter.Play(AudioType, FileName: string);
begin

  if ('MP4' = AudioType) then
    FAdvancedMediaPlayer.PlayMp4(FileName)
  else if ('vlc' = AudioType) then
    FAdvancedMediaPlayer.PlayVlc(FileName)

end;

{ TVlcPlayer }

procedure TVlcPlayer.PlayMp4(FileName: string);
begin
//��֧�ִ˸�ʽ���ÿ�ʵ��
  Writeln('��֧�ִ˸�ʽ���ÿ�ʵ��' + FileName);

end;

procedure TVlcPlayer.PlayVlc(FileName: string);
begin
  Writeln('Vlc.PlayVlc���������ţ�' + FileName + #13);
end;

{ TMp4Player }

procedure TMp4Player.PlayMp4(FileName: string);
begin
  Writeln('TMp4Player.PlayVlc���������ţ�' + FileName + #13);
end;

procedure TMp4Player.PlayVlc(FileName: string);
begin
    //��֧�ִ˸�ʽ���ÿ�ʵ��
  Writeln('��֧�ִ˸�ʽ���ÿ�ʵ�֣�' + FileName);
end;

end.

