import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiles_shop_management/state/tiles_selling_provider.dart';
import 'package:tiles_shop_management/utils/constant/cons_data.dart';
import 'package:tiles_shop_management/widgets/button.dart';
import 'package:tiles_shop_management/widgets/dropdown.dart';
import 'package:tiles_shop_management/widgets/dropdown_btn.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';
import 'package:tiles_shop_management/widgets/label_text.dart';

class SellProductScreen extends ConsumerStatefulWidget {
  const SellProductScreen({super.key});

  @override
  ConsumerState<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends ConsumerState<SellProductScreen> {
  late String productName;
  String? selectedSizeValue; 
  String? selectedCatgoryValue;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPieceController = TextEditingController();

  String? _sizeError;
  String? _categoryError;
   String? _nameError;
  String? _piecesError;
 
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

  void sellHandler () {
    
    setState(() {
      if (_productNameController.text.isEmpty) {
        _nameError = "Product name is required";
      } else {
        _nameError = null;
      }
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
        duration: Duration(seconds: 1),
      ),
      );
    }
  }
  
  void onNameHandler (a) {
    setState(() {
      _nameError = null;
    });
  }

  void onPiecesHandler (a) {
    setState(() {
      _piecesError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
      final tiles = ref.watch(tileSellingProvider);
      print(tiles);

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
              
              CustomInputs(label: 'Tiles Name',fieldType: false,
              inputController: _productNameController,
              onChanged: onNameHandler,
              error: _nameError,
              ),
              
              SizedBox(height: 20),
              
              CustomlabelText(label: 'Tiles Size',),
              SizedBox(height: 10,),
              DropdownBtn(showDropdown: showSizeDropdown, selectedValue: selectedSizeValue, placeholderTxt:  "Select Size", error: _sizeError,),

              SizedBox(height: 20,),

               CustomInputs(label: 'Tiles Pieces',
               fieldType: false, 
               inputController: _productPieceController,
               onChanged: onPiecesHandler,
                error: _piecesError,
                ),

               SizedBox(height: 20,),
              
              CustomlabelText(label: 'Tiles Category',),
              SizedBox(height: 10,),
              DropdownBtn(showDropdown: showCategoryDropdown, selectedValue: selectedCatgoryValue, placeholderTxt: "Select Category", error: _categoryError,),
               
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
              CustomButton(btn_label: 'Sell Tiles', onPressed: sellHandler,)
            ],
          ),
        ),
      ),
    );
  }
}