import 'package:flutter/material.dart';
import 'package:tiles_shop_management/utils/constant/cons_data.dart';
import 'package:tiles_shop_management/widgets/button.dart';
import 'package:tiles_shop_management/widgets/dropdown.dart';
import 'package:tiles_shop_management/widgets/error_text.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';
import 'package:tiles_shop_management/widgets/label_text.dart';

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
// Error messages for validation
  String? _nameError;
  String? _piecesError;
  String? _sizeError;
  String? _categoryError;

  void showSizeDropdown ()async {
    await showDropDown(context, sizeItems, (item) {setState(() {
      selectedSizeValue = item;
      _sizeError = null;
      });});
  }

  void showCategoryDropdown ()async {
    await showDropDown(context, categoryItems, (item) {setState(() {
      selectedCatgoryValue = item;
      _categoryError = null;
      });});
  }

   void _productAddHandler() {
    print(_piecesError);

    setState(() {
      // Validate product name
      if (_productNameController.text.isEmpty) {
        _nameError = "Product name is required";
      } else {
        _nameError = null;
      }

      // Validate product pieces
      if (_productPieceController.text.isEmpty) {
        _piecesError = "Number of pieces is required";
      } else {
        _piecesError = null;
      }

      // Validate dropdowns
      _sizeError = selectedSizeValue == null ? "Please select a size" : null;
      _categoryError = selectedCatgoryValue == null ? "Please select a category" : null;
    });

    // If all fields are valid, proceed
    if (_nameError == null &&
        _piecesError == null &&
        _sizeError == null &&
        _categoryError == null) {
      final prodRequest = {
        'product_name': _productNameController.text,
        'product_pieces': _productPieceController.text,
        'product_size': selectedSizeValue,
        'product_category': selectedCatgoryValue,
      };

      print(prodRequest);
        ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Product added successfully!"),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 500, left: 20, right: 20), 
        duration: Duration(seconds: 1),
      ),
      );
    }
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
               if (_nameError != null)
                CustomErrorText(errtext: _nameError),
              SizedBox(height: 20),
              
            CustomlabelText(label: 'Tiles Size',),
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
               if (_sizeError != null)
                CustomErrorText(errtext: _sizeError),

              SizedBox(height: 20,),

               CustomInputs(label: 'Tiles Pieces',fieldType: false, inputController: _productPieceController,
                        ),
               if (_piecesError != null)
                CustomErrorText(errtext: _piecesError),

               SizedBox(height: 20,),
              
              CustomlabelText(label: 'Tiles Category',),
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

               if (_categoryError != null)
                CustomErrorText(errtext: _categoryError),
               SizedBox(height: 20,),
              CustomButton(btn_label: 'Add Tiles', onPressed: _productAddHandler,)
            ],
          ),
        ),
      ),
    );
  }
}