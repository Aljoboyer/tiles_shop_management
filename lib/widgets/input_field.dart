import 'package:flutter/material.dart';

class CustomInputs extends StatelessWidget {
  final String label;
  final String? inputError;
  final Function(String) onChanged;
  final bool fieldType;

  const CustomInputs({
    super.key,
    required this.label,
    this.inputError,
    required this.onChanged,
    required this.fieldType,
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
            height: 40,
            child: TextField(
              obscureText: fieldType,
            cursorHeight: 17,
            decoration: InputDecoration(
              
              hintText: 'Enter $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              
              errorText: inputError, // Display validation error
              errorStyle: TextStyle(color: const Color.fromARGB(255, 255, 17, 0), fontWeight: FontWeight.bold)
              
            ),
          // controller: widget.emailController,
            onChanged: (value) {
              onChanged(value);
          },
          ),
           )
        ],
      ),
    );
  }
}