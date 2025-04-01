import 'package:flutter/material.dart';

class CustomlabelText extends StatelessWidget {
  final String ? label;

  const CustomlabelText({
    super.key,
     this.label,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        child:    Align(
            alignment: Alignment.centerLeft,
            child: Text('$label', style: TextStyle(
                  color:Color(0xFF044B91),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),)),
    );
  }
}