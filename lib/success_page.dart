import 'package:flutter/material.dart';
import 'package:registration/main.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 250,left: 60),
            child: Image(
                image: AssetImage("lib/assets/images/mark.png"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70,top: 23),
            child: Text(
                "Your Sign up was successful",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),
          const SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder:(context) => const HomePage()
                )
              );
            },
            child:  const Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                  "Continue to home",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xFF2D4990),
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
