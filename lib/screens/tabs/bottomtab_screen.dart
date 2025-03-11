import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiles_shop_management/screens/maintanence/home.dart';
import 'package:tiles_shop_management/screens/maintanence/product_add_screen.dart';
import 'package:tiles_shop_management/screens/maintanence/sell_product.dart';

class BottomTabScreen extends StatefulWidget {
  final int initialTab; // Receive the tab index

  const BottomTabScreen({Key? key, this.initialTab = 0}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTab; // Set initial tab from route parameter
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go('/tabs/$index'); // Updates URL when tab changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: "Sell"),
        ],
      ),
    );
  }
}
