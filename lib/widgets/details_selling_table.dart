import 'package:flutter/material.dart';

class SellingTable extends StatelessWidget {
  final List<Map<String, dynamic>> tableData = [
    {'date': '22//04/2025', 'amount': 12757500, 'pieces': 3},
    {'date': '23//04/2025', 'amount': 15757500, 'pieces': 5},
    {'date': '24//04/2025', 'amount': 18757500, 'pieces': 7},
      {'date': '22//04/2025', 'amount': 12757500, 'pieces': 3},
    {'date': '23//04/2025', 'amount': 15757500, 'pieces': 5},
    {'date': '24//04/2025', 'amount': 18757500, 'pieces': 7},
      {'date': '22//04/2025', 'amount': 12757500, 'pieces': 3},
    {'date': '23//04/2025', 'amount': 15757500, 'pieces': 5},
    {'date': '24//04/2025', 'amount': 18757500, 'pieces': 7},
      {'date': '22//04/2025', 'amount': 12757500, 'pieces': 3},
    {'date': '23//04/2025', 'amount': 15757500, 'pieces': 5},
    {'date': '24//04/2025', 'amount': 18757500, 'pieces': 7},
  ];

  SellingTable({super.key}); // removed const

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[300]),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Pieces', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            for (var row in tableData)
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(row['date']),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                      Text(row['amount'].toString()),
                      Text('BDT',style: TextStyle(fontSize: 8),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(row['pieces'].toString()),
                ),
              ]),
          ],
        ),
      ),
    );
  }
}
