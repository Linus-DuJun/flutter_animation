import 'package:audioplayers/audioplayers.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';

class MediaUtil {

  factory MediaUtil() => _getInstance();

  static MediaUtil get instance => _getInstance();
  static MediaUtil? _instance;

  MediaUtil._internal() {
    // init work
  }

  static MediaUtil _getInstance() {
    if (_instance == null) {
      _instance = MediaUtil._internal();
    }
    return _instance!;
  }

  AudioPlayer? _audioPlayer;
  AudioPlayer? _luckyBgPlayer;
  AudioCache _audioCache = AudioCache();


  Future<void> startPlayLuckyBgAudio() async {
    if (_luckyBgPlayer == null) {
      _luckyBgPlayer = await _audioCache.loop(AppRes.AUDIO_LUCKY_BG, volume: 0.3);
    }
    if (_luckyBgPlayer!.state != PlayerState.PLAYING) {
      _luckyBgPlayer!.resume();
    }
  }

  Future<void> stopPlayLuckyBg() async {
    if (_luckyBgPlayer != null) {
      int stop = 0;
      try {
        stop = await _luckyBgPlayer!.stop();
      } catch (e) {
        print(e.toString());
      }
      if (stop != 1) stopPlayLuckyBg();
    }
  }

  void playLuckyGameStartAudio() {
    _audioCache.play(AppRes.AUDIO_LUCKY_COINS);
  }

  void playLuckyGameEndAudio() {
    _audioCache.play(AppRes.AUDIO_LUCKY_STOP);
  }
}