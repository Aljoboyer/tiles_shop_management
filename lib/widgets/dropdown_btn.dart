import 'package:flutter/material.dart';

class DropdownBtn extends StatelessWidget {
  final String ?selectedValue;
  final VoidCallback showDropdown;
  final String placeholderTxt;

  const DropdownBtn({
    super.key,
    this.selectedValue,
    required this.showDropdown,
    required this.placeholderTxt,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: double.infinity,
                height: 40,// Full width button
                child: ElevatedButton(
                  onPressed: showDropdown,
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
                        selectedValue ?? placeholderTxt,
                        style: TextStyle(color: Colors.black), // Ensure text is visible on white
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black), // Right-aligned icon
                    ],
                  ),
                ),
              );
  }
}