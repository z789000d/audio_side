import 'package:audio_test/controller/first_page_controller.dart';
import 'package:audio_test/page/audio_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FirstPage extends GetView<FirstPageController> {
  FirstPage({super.key});

  var padding = EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20);

  @override
  Widget build(BuildContext context) {
    Get.put(FirstPageController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleText(),
            Divider(height: 2),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.audioList.length,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime myTime = DateTime(
                      controller.audioList[index].modified.year,
                      controller.audioList[index].modified.month,
                      controller.audioList[index].modified.day,
                      controller.audioList[index].modified.hour,
                      controller.audioList[index].modified.minute,
                      controller.audioList[index].modified.second,
                    );
                    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
                    String formattedTime = formatter.format(myTime);

                    return Padding(
                      padding: padding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(controller.audioList[index].title),
                          ),
                          Container(
                            child: IntrinsicWidth(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      controller.audioList[index].fileIsExist ==
                                              true
                                          ? GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                () => AudioPage(),
                                                arguments:
                                                    controller.audioList[index],
                                              );
                                            },
                                            child: Icon(
                                              Icons.not_started,
                                              size: 25,
                                            ),
                                          )
                                          : GestureDetector(
                                            onTap: () {
                                              controller.downloadAudio(
                                                controller.audioList[index],
                                              );
                                            },
                                            child: Icon(
                                              Icons.download,
                                              size: 25,
                                            ),
                                          ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('播放'),
                                      ),
                                    ],
                                  ),
                                  Container(child: Text(formattedTime)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleText() {
    return Container(
      padding: padding,
      alignment: Alignment.centerLeft,
      child: Text(
        'title',
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
