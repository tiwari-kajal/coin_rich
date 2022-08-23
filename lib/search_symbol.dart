import 'package:coin_rich/home_page.dart';
import 'package:coin_rich/provider/data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSymbol extends StatefulWidget {
  const SearchSymbol({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchSymbolState();
  }
}

class SearchSymbolState extends State<SearchSymbol> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String symbol = '';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Coin Rich"),
        centerTitle: true,
      ),
      body: Center(
          child: ChangeNotifierProvider<DataNotifier>(
        create: (context) => DataNotifier(),
        child: Consumer<DataNotifier>(
          builder: (context, provider, child) {
            return Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Enter coin Symbol',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    provider.saveSymbol(context, value);
                  },
                ),
                ElevatedButton(
                  onPressed: (() {
                    symbol = textEditingController.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(symbol: symbol)));
                  }),
                  style: ElevatedButton.styleFrom(primary: Colors.yellow),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'SEARCH',
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
