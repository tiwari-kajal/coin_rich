import 'dart:convert';

import 'package:coin_rich/model/data_model.dart';
import 'package:coin_rich/provider/data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    final data = Provider.of<DataNotifier>(context, listen: false);
    data.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataNotifier>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Coin Rich"),
        centerTitle: true,
      ),
      body: data.dataModel.data != null ? Column(
        children: [
          symbolWidget(data.dataModel.data?.aDA?.name, data.dataModel.data?.aDA?.quote?.uSD?.percentChange24h, data.dataModel.data?.aDA?.symbol!, data.dataModel.data?.aDA?.quote?.uSD?.price, data.dataModel.data?.aDA?.cmcRank!),
          symbolWidget(data.dataModel.data?.aTOM?.name, data.dataModel.data?.aTOM?.quote?.uSD?.percentChange24h, data.dataModel.data?.aTOM?.symbol!, data.dataModel.data?.aTOM?.quote?.uSD?.price, data.dataModel.data?.aTOM?.cmcRank!),
          symbolWidget(data.dataModel.data?.bCH?.name, data.dataModel.data?.bCH?.quote?.uSD?.percentChange24h, data.dataModel.data?.bCH?.symbol!, data.dataModel.data?.bCH?.quote?.uSD?.price, data.dataModel.data?.bCH?.cmcRank!),
          symbolWidget(data.dataModel.data?.bNB?.name, data.dataModel.data?.bNB?.quote?.uSD?.percentChange24h, data.dataModel.data?.bNB?.symbol!, data.dataModel.data?.bNB?.quote?.uSD?.price, data.dataModel.data?.bNB?.cmcRank!),
          symbolWidget(data.dataModel.data?.bTC?.name, data.dataModel.data?.bTC?.quote?.uSD?.percentChange24h, data.dataModel.data?.bTC?.symbol!, data.dataModel.data?.bTC?.quote?.uSD?.price, data.dataModel.data?.bTC?.cmcRank!),
        ],
      ): const Center(child: CircularProgressIndicator()),
    );
  }
}

Widget symbolWidget(String? name, num? percent, String? symbol, num? symbolPrice, num? rank){
  return Container(
    height: 80,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(80), blurRadius: 2),
        ]),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name',
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  color: Colors.yellow,
                ),
                maxLines: 1,
              ),
              Row(
                children: [
                  percent! > 0
                      ? const Icon(Icons.arrow_upward, color: Colors.green)
                      : const Icon(Icons.arrow_downward, color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(percent.toStringAsFixed(2),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,)),
                  ),
                ],
              ),
              Container(
                height: 20,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(4.0)),
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(80), blurRadius: 2),
                    ]),
                child: Center(child: Text(symbol!)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Price', style: TextStyle(fontSize: 12.0, color: Colors.white),),
                  const SizedBox(width: 10.0,),
                  Text('\$ ${symbolPrice!.toStringAsFixed(2)}', style: const TextStyle(fontSize: 12.0, color: Colors.white),),
                ],
              ),
              Row(
                children: [
                  const Text('Rank:', style: TextStyle(fontSize: 12.0, color: Colors.white),),
                  const SizedBox(width: 10.0,),
                  Text('$rank', style: const TextStyle(fontSize: 12.0, color: Colors.white),),
                ],
              ),
              Row(
                children: const [
                  SizedBox(width: 10.0,),
                  Icon(Icons.arrow_circle_right, color: Colors.yellow,),
                  SizedBox(width: 10.0,),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future<DataModel> getData(context) async {
  DataModel dataModel = DataModel();

  try {
    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ADA,ATOM,BCH,BNB,BTC'),
        headers: <String, String>{
          'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149'
        });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      dataModel = DataModel.fromJson(data);
    } else {
      print('Something went wrong!');
    }
  } catch (e) {
    print(e.toString());
  }
  return dataModel;
}
