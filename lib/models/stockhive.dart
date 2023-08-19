import 'package:hive/hive.dart';
 part 'stockhive.g.dart';
@HiveType(typeId:1)
class StockData {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String symbol;

  StockData(this.name, this.symbol);
}






