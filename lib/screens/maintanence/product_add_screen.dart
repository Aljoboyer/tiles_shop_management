import 'package:flutter/material.dart';
import 'package:tiles_shop_management/widgets/dropdown.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
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
              child: Text('Add New Product', style: TextStyle(
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
              CustomInputs(label: 'Email',fieldType: false, onChanged: (value) {
                          onEmailChange(value);
                        },),
              SizedBox(height: 20,),
              
              SizedBox(
                width: double.infinity,
                height: 50,// Full width button
                child: ElevatedButton(
                  onPressed: showCustomDropdown,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // White background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Rounded corners
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns text left, icon right
                    children: [
                      Text(
                        selectedValue ?? "Select an item",
                        style: TextStyle(color: Colors.black), // Ensure text is visible on white
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black), // Right-aligned icon
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}