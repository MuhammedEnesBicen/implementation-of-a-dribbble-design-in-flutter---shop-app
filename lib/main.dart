import 'package:flutter/material.dart';
import 'package:shopx_ecommerce_dribble_design/screens/home_screen.dart';
import 'package:shopx_ecommerce_dribble_design/screens/product_detail.dart';

import 'screens/login_screen.dart';

void main() => runApp(ShopX());

class ShopX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
