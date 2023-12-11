import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/common/widget/custom_image.dart';
import 'package:interview_test/feature/home/domain/model/trending_video_model.dart';
import 'package:interview_test/feature/home/view/details_screen.dart';
import 'package:interview_test/helper/date_converter.dart';
import 'package:interview_test/util/dimensions.dart';
import 'package:interview_test/util/styles.dart';

class TrendingVideoCard extends StatelessWidget {
  final Results results;
  const TrendingVideoCard({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()=> Get.to(()=> TrendingVideoDetailsScreen(results: results,)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
        child: Column(children: [

          CustomImage(image: results.thumbnail),
          Padding(padding: const EdgeInsets.fromLTRB(15,15,15,5),
            child: Row(children: [
              ClipRRect(borderRadius: BorderRadius.circular(120),
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(120)),
                  width: 40,child: CustomImage(image: results.channelImage))),

              const SizedBox(width: 10,),
              Expanded(child: Text(results.title??'',maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge))),
              const SizedBox(width: 10,),
              Icon(Icons.more_vert_outlined, color: Theme.of(context).hintColor)
            ],),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 65),
            child: Row(children: [
              Text('${results.viewers??'0'} Views', style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),),
             const SizedBox(width: 20,),
              Text(DateConverter.dateTimeStringToMonthAndYear(results.createdAt!), style: textRegular.copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),),
            ],),
          )
        ],),
      ),
    );
  }
}
