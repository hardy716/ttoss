import 'package:get/get.dart';
import '../../../../../common/util/local_json.dart';
import '../vo/vo_simple_stock.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    () async {
      stocks.addAll(await LocalJson.getObjectList("json/stock_list.json"));
    }();
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) autoCompleteList.clear();
    autoCompleteList.value =
        stocks.where((e) => e.name.contains(keyword)).toList();
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  // String이 아닌 경우, removeWhere을 사용해서 조건을 추가해줘야 함
  // ex)
  // void removeHistory(SimpleStock stock) {
  //   searchHistoryList.removeWhere((element) => element.id == stockName.id);
  // }
  void removeHistory(String stockName) {
    searchHistoryList.remove(stockName);
  }
}
