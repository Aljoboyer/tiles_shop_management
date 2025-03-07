import 'package:flutter/material.dart';
import 'package:tiles_shop_management/widgets/input_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late String email;

   onEmailChange (value) {
    setState(() {
      email: value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.sailing, color: const Color.fromARGB(255, 255, 4, 201), size: 35,)
        ],
        title: Align(
              alignment: Alignment.center,
              child: Text('AZ Tiles Shop', style: TextStyle(
              fontWeight: FontWeight.w700,
               color: Colors.white
              ),),
            ),
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor:  Color(0xFF044B91),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.80,
                  child: CustomInputs(label: 'Search By Tiles Name',fieldType: true, onChanged: (value) {
                          onEmailChange(value);
                        },),
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Material(
                    elevation: 4, 
                    shape: CircleBorder(), 
                    shadowColor: Colors.black, 
                    child: IconButton(
                      onPressed: () {}, 
                      icon: Icon(Icons.filter_list),
                    ),
                  ),
                )

              ],
            ),
            
          ],
        ),
      ),
    );
  }
}