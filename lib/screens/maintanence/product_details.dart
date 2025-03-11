import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiles_shop_management/screens/tabs/bottomtab_screen.dart';
import 'package:tiles_shop_management/widgets/button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           elevation: 1,
        shadowColor: Colors.grey,
    leading: IconButton(
      icon: Icon(Icons.arrow_back), // Back arrow icon
      onPressed: () {
        context.go('/tabs'); // Go back to the previous screen
      },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Hello'),
            CustomButton(btn_label: 'Sell Now', onPressed: () {
              context.go('/tabs/2'); 

            },)
          ],
        ),
      ),
    );
  }
}