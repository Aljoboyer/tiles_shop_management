import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  final String ? errtext;

  const CustomErrorText({
    super.key,
     this.errtext,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(errtext!,
                      style: TextStyle(color: Colors.red, fontSize: 12)),
                ),
    );
  }
}