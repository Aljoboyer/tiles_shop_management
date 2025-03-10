import 'package:flutter/material.dart';
import 'package:tiles_shop_management/screens/maintanence/home.dart';
import 'package:tiles_shop_management/screens/maintanence/product_add_screen.dart';
import 'package:tiles_shop_management/screens/maintanence/sell_product.dart';

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    ProductAddScreen(),
    SellProductScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: ""),
        ],
      ),
    );
  }
}
