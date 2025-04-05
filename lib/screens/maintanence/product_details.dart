import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiles_shop_management/screens/tabs/bottomtab_screen.dart';
import 'package:tiles_shop_management/widgets/button.dart';
import 'package:tiles_shop_management/widgets/details_selling_table.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
        appBar: AppBar(
        title: Text('Details', style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 1, 
        shadowColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            context.go('/tabs/0'); //us screen
          },
            ),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomButton(btn_label: 'Sell Now', onPressed: () {
                context.go('/tabs/2'); 
              }, width: screenWidth * 10,),
        
              SizedBox(height: 20,),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Ceramic Tiles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF044B91)),),
              ),
        
              SizedBox(height: 8,),
        
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Size: 300x300 mm (12x12 inches)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 3, 3, 3)),),
              ),
        
              SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Sold: 345345 Pieces', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 0, 92, 197)),),
                  Text('Available: 545345 Pieces', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 0, 92, 197)),),
                ],
              ),
              
              SizedBox(height: 25,),
        
               Align(
                alignment: Alignment.centerLeft,
                child: Text('Selling Info', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 122, 122, 122)),),
              ),
              SizedBox(height: 10,),
              SellingTable(),
            ],
          ),
        ),
      ),
    );
  }
}