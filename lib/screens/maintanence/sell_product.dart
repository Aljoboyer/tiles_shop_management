import 'package:flutter/material.dart';
import 'package:tiles_shop_management/utils/constant/cons_data.dart';
import 'package:tiles_shop_management/widgets/button.dart';
import 'package:tiles_shop_management/widgets/dropdown.dart';
import 'package:tiles_shop_management/widgets/dropdown_btn.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';
import 'package:tiles_shop_management/widgets/label_text.dart';

class SellProductScreen extends StatefulWidget {
  const SellProductScreen({super.key});

  @override
  State<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
   late String productName;
  String? selectedSizeValue; 
  String? selectedCatgoryValue; 

  String? _sizeError;
  String? _categoryError;

   onEmailChange (value) {
    setState(() {
      productName: value;
    });
  }
 
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
              
           CustomlabelText(label: 'Tiles Size',),
            SizedBox(height: 10,),
            DropdownBtn(showDropdown: showSizeDropdown, selectedValue: selectedSizeValue, placeholderTxt: "Select Size",),
            SizedBox(height: 20,),

            CustomInputs(label: 'Tiles Pieces',fieldType: false, ),
            SizedBox(height: 20,),
              
            CustomlabelText(label: 'Tiles Category',),
            SizedBox(height: 10,),
            DropdownBtn(showDropdown: showCategoryDropdown, selectedValue: selectedCatgoryValue, placeholderTxt: "Select Category",),
               
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