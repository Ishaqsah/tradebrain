import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:train_brain/models/stockhive.dart';



class Screenwishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: FutureBuilder(
        future: Hive.openBox<StockData>('wishlist'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error opening wishlist'));
            }

            final box = Hive.box<StockData>('wishlist');
            final wishlistItems = box.values.toList();

            return ListView.separated(
              shrinkWrap: true,

              separatorBuilder: (context, index) {
               return SizedBox(height: 5,);
              },
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final stockData = wishlistItems[index];
                return Card(
                  elevation: 0,
                  color: Color(0xffEBF5EE),
                  child: ListTile(
                    leading: Text(index.toString()),
                    title: Row(
                      children: [
                        Flexible(child: Text(stockData.name)),
                        SizedBox(width: 10),
                        Flexible(child: Text(stockData.symbol , style: TextStyle(color: Colors.green , fontSize: 16 ),)),
                      ],
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
