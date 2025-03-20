import 'package:flutter/material.dart';
import 'package:tiles_shop_management/widgets/button.dart';
import 'package:tiles_shop_management/widgets/dropdown.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';

class SellProductScreen extends StatefulWidget {
  const SellProductScreen({super.key});

  @override
  State<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
   late String productName;
     String? selectedValue; // Stores the selected value

  List<String> items = ['Apple', 'Banana', 'Cherry', 'Date', "Aanaras", "Chicken", "Mango", "Papaya"]; // Dropdown items

   onEmailChange (value) {
    setState(() {
      productName: value;
    });
  }
  void showCustomDropdown ()async {
 await showDropDown(context, items, (item) {setState(() {
   selectedValue = item;
 });});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Align(
              alignment: Alignment.center,
              child: Text('Sell  Product', style: TextStyle(
              fontWeight: FontWeight.w700,
               color: Colors.white
              ),),
            ),
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor:  Color(0xFF044B91),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
                Align(
                alignment: Alignment.centerLeft,
                child: Text('Add Product Details', style: TextStyle(
                      color:Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
              ),)),

              SizedBox(height: 20,),

              CustomInputs(label: 'Tiles Name',fieldType: false, ),
              SizedBox(height: 20,),
              
              Align(
            alignment: Alignment.centerLeft,
            child: Text('Tiles Size', style: TextStyle(
                  color:Color(0xFF044B91),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),)),
            SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 40,// Full width button
                child: ElevatedButton(
                  onPressed: showCustomDropdown,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, 
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), 
                      side: BorderSide(color: Colors.grey, width: 1), // Border color and width
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns text left, icon right
                    children: [
                      Text(
                        selectedValue ?? "Select size",
                        style: TextStyle(color: Colors.black), // Ensure text is visible on white
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black), // Right-aligned icon
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

               CustomInputs(label: 'Tiles Pieces',fieldType: false, ),
               SizedBox(height: 20,),
              
              Align(
            alignment: Alignment.centerLeft,
            child: Text('Tiles Category', style: TextStyle(
                  color:Color(0xFF044B91),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),)),
            SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 40,// Full width button
                child: ElevatedButton(
                  onPressed: showCustomDropdown,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, 
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), 
                      side: BorderSide(color: Colors.grey, width: 1), // Border color and width
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns text left, icon right
                    children: [
                      Text(
                        selectedValue ?? "Select size",
                        style: TextStyle(color: Colors.black), // Ensure text is visible on white
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black), // Right-aligned icon
                    ],
                  ),
                ),
              ),
               
               SizedBox(height: 20,),

               Align(
                alignment: Alignment.centerLeft,
                child: Text('Add Customer Details', style: TextStyle(
                      color:Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
              ),)),
               SizedBox(height: 20,),

               CustomInputs(label: 'Customer Name',fieldType: false, ),
               SizedBox(height: 20,),
               CustomInputs(label: 'Shop Name',fieldType: false, ),
               SizedBox(height: 20,),
               CustomInputs(label: 'Customer Phone',keyboardType: TextInputType.number, fieldType: false, ),
               SizedBox(height: 20,),
               CustomInputs(label: 'Location',maxLines: 10, height: 90, fieldType: false, keyboardType: TextInputType.multiline, ),

              SizedBox(height: 20,),

               Align(
                alignment: Alignment.centerLeft,
                child: Text('Payment Details', style: TextStyle(
                      color:Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
              ),)),
               SizedBox(height: 20,),
               CustomInputs(label: 'Total', fieldType: false, keyboardType: TextInputType.multiline, ),
               SizedBox(height: 20,),
               CustomInputs(label: 'Paid Amount', fieldType: false, keyboardType: TextInputType.multiline, ),
              
              SizedBox(height: 20,),
               CustomInputs(label: 'Remain Amount', fieldType: false, keyboardType: TextInputType.multiline, ),

              SizedBox(height: 20,),
               CustomInputs(label: 'Transaction Num. If Payment in Card/Online ', fieldType: false, keyboardType: TextInputType.multiline, ),
              SizedBox(height: 20,),
              CustomButton(btn_label: 'Sell Tiles', onPressed: () {},)
            ],
          ),
        ),
      ),
    );
  }
}