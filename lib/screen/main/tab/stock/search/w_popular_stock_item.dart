import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../vo/vo_popular_stock.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;

  const PopularStockItem(
      {super.key, required this.stock, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40.0,
          child: number.text.make(),
        ),
        width30,
        stock.name.text.make(),
        emptyExpanded,
        stock.todayPercantageString.text
            .color(stock.getPriceColor(context))
            .make(),
      ],
    ).pSymmetric(v: 20.0);
  }
}
