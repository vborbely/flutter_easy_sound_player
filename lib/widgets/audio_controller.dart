import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioController extends StatelessWidget {
  final String file;
  final AssetsAudioPlayer assetsAudioPlayer;

  const AudioController({Key key, this.file, this.assetsAudioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              StreamBuilder(
                stream: assetsAudioPlayer.isPlaying,
                builder: (ctx, snapshot) {
                  final bool isPlaying = snapshot.data ?? false;
                  return isPlaying ? _showStopButton() : _showPlayButton();
                },
              ),
              SizedBox(width: 16),
              Container(
                width: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Title", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Text(
                      "${file}",
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _playAudio() async {
    if (assetsAudioPlayer != null) {
      assetsAudioPlayer.open(
        Audio("assets/audios/${this.file}"),
      );
      assetsAudioPlayer.play();
    }
  }

  void _stopAudio() {
    if (assetsAudioPlayer != null) {
      assetsAudioPlayer.stop();
    }
  }

  Widget _showPlayButton() {
    return GestureDetector(
        onTap: () {
          _playAudio();
        },
        child: Icon(Icons.play_circle_outline, size: 40, color: Colors.green));
  }

  Widget _showStopButton() {
    return GestureDetector(
        onTap: () {
          _stopAudio();
        },
        child: Icon(Icons.stop, size: 40, color: Colors.redAccent));
  }
}
