import 'package:flutter/material.dart';
import 'package:multi_provider_demo/providers/Item.dart';
import 'package:multi_provider_demo/providers/counter.dart';
import 'package:multi_provider_demo/screens/Homepage.dart';
import 'package:multi_provider_demo/screens/ProductPage.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>Counter()),
          ChangeNotifierProvider(create: (_)=>Item()),

        ],
      child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Provider Demo',
      initialRoute: '/',
      routes: {
        '/': (context)=>Homepage(),
        '/productPage':(context)=>ProductPage(),

      },
    );
  }
}
