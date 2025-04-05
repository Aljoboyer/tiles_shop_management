import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tiles_shop_management/widgets/error_text.dart';

class CustomInputs extends StatelessWidget {
  final String label;
  final String? inputError;
  final ValueChanged? onChanged;
  final bool fieldType;
  final double? height;
  final TextInputType ? keyboardType;
  final int ? maxLines;
  final TextEditingController? inputController;
  final String? error;
  const CustomInputs({
    super.key,
    required this.label,
    this.inputError,
    this.onChanged,
    required this.fieldType,
    this.height,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.inputController,
    this.error
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(label, style: TextStyle(
                  color:Color(0xFF044B91),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),)),
            SizedBox(height: 10,),
           SizedBox(
            height: height ?? 40,
            child: TextField(
            obscureText: fieldType,
            cursorHeight: 17,
            keyboardType:  keyboardType,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              
              hintText: 'Enter $label',
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              
              errorText: inputError, // Display validation error
              errorStyle: TextStyle(color: const Color.fromARGB(255, 255, 17, 0), fontWeight: FontWeight.bold)
              
            ),
          controller: inputController,
            onChanged: onChanged,
          ),
           ),
           if (error != null)
              CustomErrorText(errtext: error),
        ],
      ),
    );
  }
}