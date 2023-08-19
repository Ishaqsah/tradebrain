import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:train_brain/models/stockhive.dart';
import 'package:train_brain/view/screenmainpage.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StockDataAdapter().typeId)){

  Hive.registerAdapter(StockDataAdapter());

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' trade brain',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home:  screenMainpage(),
    );
  }
}


void addToHive(StockData stockData) async {
  var box = await Hive.openBox<StockData>('wishlist');
  await box.add(stockData);
}