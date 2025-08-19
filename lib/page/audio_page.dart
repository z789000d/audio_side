import 'package:audio_test/controller/first_page_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/audio_page_controller.dart';

class AudioPage extends GetView<AudioPageController> {
  AudioPage({super.key});

  var padding = EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20);

  @override
  Widget build(BuildContext context) {
    Get.put(AudioPageController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              titleText(),
              Divider(height: 2),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.audioData.value.title,
                      style: TextStyle(fontSize: 24),
                    ),
                    Container(padding: EdgeInsets.all(20)),
                    (controller.playerState.value == PlayerState.playing)
                        ? GestureDetector(
                          onTap: () {
                            controller.pauseAudio();
                          },
                          child: Icon(Icons.stop_circle, size: 25),
                        )
                        : GestureDetector(
                          onTap: () {
                            controller.playAudio();
                          },
                          child: Icon(Icons.not_started, size: 25),
                        ),
                    Container(padding: EdgeInsets.all(20)),
                    Slider(
                      value: controller.position.value.inSeconds.toDouble(),
                      min: 0.0,
                      max: controller.duration.value.inSeconds.toDouble(),
                      onChanged: (double value) {
                        controller.position.value = Duration(
                          seconds: value.toInt(),
                        );
                      },
                      onChangeEnd: (double value) {
                        controller.seek(Duration(seconds: value.toInt()));
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.formatDuration(
                              controller.position.value,
                            ),
                          ),
                          Text(
                            controller.formatDuration(
                              controller.duration.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleText() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        Container(
          padding: padding,
          alignment: Alignment.centerLeft,
          child: Text(
            'title',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
