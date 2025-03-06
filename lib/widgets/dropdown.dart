import 'package:flutter/material.dart';

Future<void> showDropDown(
  BuildContext context,
  List<String> items, // Ensure items list is List<String>
  Function(String) onPressed, // Ensure onPressed takes a String
) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        child: ListView(
          children: items.map<Widget>((String item) { // Explicitly specify <Widget>
            return ListTile(
              title: Text(item),
              onTap: () {
                onPressed(item);
                Navigator.pop(context);
              },
            );
          }).toList(), // Convert Iterable to List
        ),
      );
    },
  );
}
