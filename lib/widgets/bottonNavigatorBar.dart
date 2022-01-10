import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        elevation: 0,
        onTap: (int i) {},
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carrito'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist), label: "Pedidos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Pedidos"),
        ]);
  }
}
