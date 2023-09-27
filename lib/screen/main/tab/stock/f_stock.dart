import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../common/widget/w_image_button.dart';
import 'tab/f_my_stock.dart';
import 'tab/f_todays_discovery.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  // 문제
  // final TabController tabController = TabController(length: 2, vsync: this);
  // this를 인식하지 못함 -> State가 생성되는 과정에서 tabController를 생성하려고 하기 때문

  // 방법 1 : nullable하게 선언 후 initState -> State가 생성된 후에 initState로 초기화
  // TabController? tabController;
  //
  // @override
  // void initState() {
  //   tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  // 방법 2 : late 키워드 사용 -> tabController를 필요로 하는 시점에 초기화
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.appColors.roundedLayoutBackground,
            pinned: true,
            actions: [
              ImageButton(
                onTap: () {
                  context.showSnackbar("검색");
                },
                imagePath: '$basePath/icon/stock_search.png',
              ),
              ImageButton(
                onTap: () {
                  context.showSnackbar("달력");
                },
                imagePath: '$basePath/icon/stock_calendar.png',
              ),
              ImageButton(
                onTap: () {
                  context.showSnackbar("설정");
                },
                imagePath: '$basePath/icon/stock_settings.png',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                title,
                tabBar,
                if (currentIndex == 0)
                  MyStockFragment()
                else
                  TodaysDiscoveryFragment(),
                myAccount,
                height20,
                myStocks,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get title => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            "토스증권".text.size(24.0).bold.make(),
            width20,
            "S&P 500"
                .text
                .size(13.0)
                .bold
                .color(context.appColors.lessImportant)
                .make(),
            width10,
            3919.29
                .toComma()
                .text
                .size(13.0)
                .bold
                .color(context.appColors.plusRedText)
                .make(),
          ],
        ).pOnly(left: 20.0),
      );

  Widget get tabBar => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              labelStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              labelColor: Colors.white,
              labelPadding: const EdgeInsets.symmetric(vertical: 20.0),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              controller: tabController,
              tabs: [
                "내 주식".text.make(),
                "오늘의 발견".text.make(),
              ],
            ),
            const Line(),
          ],
        ),
      );
  Widget get myAccount => Placeholder();
  Widget get myStocks => Placeholder();
}
