import 'package:coin_rich/model/data_model.dart';
import 'package:flutter/cupertino.dart';

import '../home_page.dart';

class DataNotifier extends ChangeNotifier {
  DataModel dataModel = DataModel();

  fetchData(context) async {
    dataModel = await getData(context);
    notifyListeners();
  }

  saveSymbol(context, String symbol) async {
    dataModel = await getSymbolData(context, symbol.replaceAll(' ', ''));
    notifyListeners();
  }

}
