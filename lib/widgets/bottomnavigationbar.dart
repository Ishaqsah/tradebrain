import 'package:flutter/material.dart';
import 'package:train_brain/view/wishlistpage.dart';

ValueNotifier<int> botoomnavigationNotifier = ValueNotifier(0);

class bottomnavigationwidget extends StatelessWidget {
  bottomnavigationwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
         if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screenwishlist()),
            );
          }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
      ],
    );
  }
}
