import 'package:flutter/material.dart';

Future<void> showFilterModal(
  BuildContext context,
  List<String> items,
  Function(String) onPressed,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows full-screen height usage
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        height: MediaQuery.of(context).size.height * 0.6, // 60% of screen height
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Search By Size and Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                    onTap: () {
                      onPressed(items[index]);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
