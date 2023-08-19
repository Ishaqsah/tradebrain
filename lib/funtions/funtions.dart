 import 'package:hive_flutter/adapters.dart';

import '../models/stockhive.dart';

void addToHive(StockData stockData) async {
                  var box = await Hive.openBox<StockData>('wishlist');
                        await  box.add(stockData);
                          print(box);
                          
                }
                