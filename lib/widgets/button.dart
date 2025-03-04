import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btn_label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.btn_label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF044B91),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        child: Text(btn_label, style: TextStyle(
                          color: Colors.white
                        ),)
                        ),
                      );
  }
}