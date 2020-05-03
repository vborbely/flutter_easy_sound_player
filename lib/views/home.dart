import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttersoundplayer/widgets/audio_controller.dart';

List<Widget> audioFiles = [
  AudioController(file: "Epiano_SlowMotion_77_G.wav", assetsAudioPlayer: AssetsAudioPlayer()),
  AudioController(file: "MelodyMix1_SlowMotion_77_G.wav", assetsAudioPlayer: AssetsAudioPlayer()),
  AudioController(file: "Organ_SlowMotion_77_G.wav", assetsAudioPlayer: AssetsAudioPlayer()),
  AudioController(file: "Piano_SlowMotion_77_G.wav", assetsAudioPlayer: AssetsAudioPlayer()),
  AudioController(file: "Strings_SlowMotion_77_G.wav", assetsAudioPlayer: AssetsAudioPlayer()),
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Easy Sound Player"),
        ),
        backgroundColor: Colors.black87,
        body: _sounds());
  }

  Widget _sounds() {
    return ListView.builder(
      itemBuilder: (ctx, idx) {
        return audioFiles[idx];
      },
      itemCount: audioFiles.length,
    );
  }
}
