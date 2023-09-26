import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_benefit_item.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_point_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../common/widget/w_height_and_width.dart';
import 'benefits_dummy.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BenefitFragmentState();
}

class _BenefitFragmentState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
            bottom: MainScreenState.bottomNavigatorHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height30,
            "혜택".text.white.bold.size(18.0).make(),
            height30,
            const PointButton(point: 569),
            height20,
            "혜택 더 받기".text.white.bold.size(16.0).make(),
            ...benefitList.map((e) => BenefitItem(benefit: e)).toList(),
          ],
        ).pSymmetric(h: 20.0),
      ),
    );
  }
}
