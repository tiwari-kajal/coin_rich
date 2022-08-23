import 'package:coin_rich/bloc/internet_bloc.dart';
import 'package:coin_rich/provider/data_notifier.dart';
import 'package:coin_rich/search_symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DataNotifier>(create: (_) => DataNotifier())
    ],
    child:const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.black87
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.searchRoute,
        routes: {
          MyRoutes.searchRoute: (context) => const MyHomePage(symbol: "ADA"),
        },
      ),
    );
  }
}

class MyRoutes {
  static String homeRoute = "/home";
  static String searchRoute = "/search";
}
