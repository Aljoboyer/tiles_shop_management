import 'package:flutter/material.dart';
import 'package:tiles_shop_management/utils/constant/cons_data.dart';
import 'package:tiles_shop_management/widgets/button.dart';
import 'package:tiles_shop_management/widgets/dropdown.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
   late String productName;
    String? selectedSizeValue; 
    String? selectedCatgoryValue; 

    final TextEditingController _productNameController = TextEditingController();
    final TextEditingController _productPieceController = TextEditingController();

  void showSizeDropdown ()async {
    await showDropDown(context, sizeItems, (item) {setState(() {
      selectedSizeValue = item;
      });});
  }

  void showCategoryDropdown ()async {
    await showDropDown(context, categoryItems, (item) {setState(() {
      selectedCatgoryValue = item;
      });});
  }

  void _productAddHandler () {
    final prod_rq = {
      'product_name': _productNameController.text,
      'product_pieces': _productPieceController.text,
      'product_size': selectedSizeValue,
      'product_category': selectedCatgoryValue,
    };
    print(prod_rq);
  }

  @override
  void dispose() {
    _productNameController.dispose(); 
    _productPieceController.dispose(); 
    super.dispose();
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
              CustomInputs(label: 'Tiles Name',fieldType: false,  inputController: _productNameController),
              SizedBox(height: 20),
              
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
                  onPressed: showSizeDropdown,
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
                        selectedSizeValue ?? "Select size",
                        style: TextStyle(color: Colors.black), // Ensure text is visible on white
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black), // Right-aligned icon
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

               CustomInputs(label: 'Tiles Pieces',fieldType: false, inputController: _productPieceController,
                        ),
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
                  onPressed: showCategoryDropdown,
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
                        selectedCatgoryValue ?? "Select Category",
                        style: TextStyle(color: Colors.black), // Ensure text is visible on white
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black), // Right-aligned icon
                    ],
                  ),
                ),
              ),
               SizedBox(height: 20,),
              CustomButton(btn_label: 'Add Tiles', onPressed: _productAddHandler,)
            ],
          ),
        ),
      ),
    );
  }
}