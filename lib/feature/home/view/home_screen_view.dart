import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/common/widget/paginated_list_view.dart';
import 'package:interview_test/feature/home/controller/home_controller.dart';
import 'package:interview_test/feature/home/widget/trending_video_card.dart';



class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    Get.find<HomeController>().getTrendingVideoList(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (trendingController) {
          return trendingController.trendingVideoModel != null ? trendingController.trendingVideoModel!.results != null? trendingController.trendingVideoModel!.results!.isNotEmpty?
            SingleChildScrollView(
              controller: scrollController,
              child: Padding(padding: const EdgeInsets.only(bottom: 70.0),
              child: PaginatedListView(
                scrollController: scrollController,
                totalSize: trendingController.trendingVideoModel?.total,
                offset: (trendingController.trendingVideoModel != null && trendingController.trendingVideoModel!.page != null) ? int.parse(trendingController.trendingVideoModel!.page.toString()) : 1,
                onPaginate: (int? offset) async {

                  await trendingController.getTrendingVideoList(offset!);
                },

                itemView: ListView.builder(
                  itemCount: trendingController.trendingVideoModel?.results?.length,
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return TrendingVideoCard(results : trendingController.trendingVideoModel!.results![index]);
                  },
                ),
              ),
                        ),
            ):const SizedBox(): const SizedBox():const CircularProgressIndicator();
        }
      ),
    );
  }
}
