import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import 'vo/vo_benefit.dart';

class BenefitItem extends StatelessWidget {
  final Benefit benefit;

  const BenefitItem({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          benefit.imagePath,
          width: 50.0,
          height: 50.0,
        ),
        width10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            benefit.subTitle.text.size(13.0).make(),
            height5,
            benefit.title.text
                .size(12.0)
                .color(context.appColors.blueText)
                .make(),
          ],
        )
      ],
    ).pSymmetric(v: 20.0);
  }
}
