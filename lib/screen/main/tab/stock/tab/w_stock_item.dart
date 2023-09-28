import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../common/widget/w_height_and_width.dart';
import '../vo/vo_stock.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Image.asset(stock.stockImagePath, width: 50.0),
          width20,
          (stock.name).text.size(18.0).bold.make(),
          emptyExpanded,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              stock.todayPercantageString.text
                  .color(stock.getPriceColor(context))
                  .make(),
              "${stock.currentPrice.toComma()}원"
                  .text
                  .color(context.appColors.lessImportant)
                  .make(),
            ],
          ),
        ],
      ).pSymmetric(h: 20.0),
    );
  }
}
