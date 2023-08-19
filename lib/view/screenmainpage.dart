

import 'package:flutter/material.dart';
import 'package:train_brain/view/homepage.dart';
import 'package:train_brain/view/wishlistpage.dart';
import 'package:train_brain/widgets/bottomnavigationbar.dart';

class screenMainpage extends StatelessWidget {
  screenMainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trade brain',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: screenHomepage(),
      bottomNavigationBar: bottomnavigationwidget(),
    );
    
  }
}

