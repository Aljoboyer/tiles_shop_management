import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.30, left: screenWidth * 0.05, right: screenWidth * 0.05),
          child: Column(
            children: [
                Icon(Icons.settings, size: 80,  color: Color(0xFF044B91)),
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.03,),
                      Text('Login Now', style: TextStyle(
                        color:Color(0xFF044B91),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('Please login to continue using our app',  style: TextStyle(
                        color:Color(0xFF044B91),

                      ),)
                    ],
                  ),
                )
            ],
          ),
        ),
      )
    );
  }
}