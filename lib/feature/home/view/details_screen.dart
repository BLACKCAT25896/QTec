import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/common/widget/custom_image.dart';
import 'package:interview_test/feature/home/domain/model/trending_video_model.dart';
import 'package:interview_test/helper/date_converter.dart';
import 'package:interview_test/util/dimensions.dart';
import 'package:interview_test/util/images.dart';
import 'package:interview_test/util/styles.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class TrendingVideoDetailsScreen extends StatefulWidget {
  final Results results;
  const TrendingVideoDetailsScreen({super.key, required this.results});

  @override
  State<TrendingVideoDetailsScreen> createState() => _TrendingVideoDetailsScreenState();
}

class _TrendingVideoDetailsScreenState extends State<TrendingVideoDetailsScreen> {
  @override
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.results.manifest.toString()),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF3898FC);
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SingleChildScrollView(
        child: Stack(children: [

          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Container(padding: const EdgeInsets.only(bottom: 20),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      ClosedCaption(text: _controller.value.caption.text),
                      _ControlsOverlay(controller: _controller),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                    ],
                  ),
                ),
              ),

            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: Text(widget.results.title??'',maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),),


            Padding(padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault, top: 10),
              child: Row(children: [
                Text('${widget.results.viewers??'0'} Views', style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),),
                const SizedBox(width: 20,),
                Text(DateConverter.customTime(DateTime.parse(widget.results.createdAt!)), style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),),
              ],),
            ),
           const SizedBox(height: 20),
             SizedBox(height: 60,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                 child: ListView(scrollDirection: Axis.horizontal,
                   children: const [

                  ActionSection(title: 'MASH ALLAH (12K)', icon: Icons.favorite_border),
                  SizedBox(width: 10,),
                  ActionSection(title: 'LIKE (12K)', icon: Icons.thumb_up_alt_outlined),

                  SizedBox(width: 10,),
                  ActionSection(title: 'SHARE', icon: Icons.share),

                  SizedBox(width: 10,),
                  ActionSection(title: 'REPORT', icon: Icons.flag_outlined),

                  ],
                           ),
               ),
             ),

            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Row(children: [
                  ClipRRect(borderRadius: BorderRadius.circular(120),
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(120)),
                          width: 40,child: CustomImage(image: widget.results.channelImage))),

                Expanded(
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.results.channelName??''),
                        Text('${widget.results.channelSubscriber??''} Subscribers'),
                      ],
                    ),
                  ),
                ),
                Container(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
                    vertical: Dimensions.paddingSizeSeven),
                  decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(7)
                ),
                  child: Row(children: [
                    const Icon(Icons.add, color: Colors.white ,size: 20,),
                    const SizedBox(width: 5,),
                    Text('Subscribe', style: textRegular.copyWith(color: Theme.of(context).cardColor),)
                  ],),)
                ],
              ),
            ),

            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Comments ${NumberFormat.compact().format(7600)}',
                  style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color)),
                SizedBox(height: 30, child: Image.asset(Images.expand))

              ],),
            ),

            const SizedBox(height: 10),
            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: SizedBox(height: 55,
                child: TextField(minLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge,
                      color:Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.8)),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(border: InputBorder.none, hintText: "Add Comment".tr,
                      isDense: false,
                      suffixIcon: Icon(Icons.send, color: Theme.of(context).hintColor),
                      focusedBorder: OutlineInputBorder(borderSide:  BorderSide(width: 0.5,
                          color: Theme.of(context).hintColor.withOpacity(0.5)),

                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(borderSide:  BorderSide(width: 0.5,
                          color: Theme.of(context).hintColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),

                      hintStyle: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.8), fontSize: 16)),
                  onChanged: (String newText) {

                  }),
              ),
            ),



            ],
          ),
          Positioned(left: 30,top: 40,
            child: InkWell(onTap: ()=> Get.back(),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).hintColor.withOpacity(.5)
              ),width: 40,height: 40,
                child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),),
            ),
          )

        ],),
      ),
    );
  }
}
class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}

class ActionSection extends StatelessWidget {
  final String title;
  final IconData icon;
  const ActionSection({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(padding: const EdgeInsets.symmetric(horizontal :Dimensions.paddingSizeSmall, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Theme.of(context).hintColor.withOpacity(.5))),
      child: Column(children: [
         Icon(icon),
        Text(title, style: textMedium.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: Dimensions.fontSizeDefault),)
      ],),);
  }
}
