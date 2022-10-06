import 'package:flutter/material.dart';
import 'package:registration/login.dart';
import 'package:registration/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registration/success_page.dart';
import 'firebase_options.dart';

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MaterialApp(
    home: SuccessPage(),
    // initialRoute: '/',
    // routes:<String, WidgetBuilder> {
    //   '/':(context) =>  const HomePage(),
    //   '/login':(context) => LoginPage(),
    // },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  <Widget>[
          const Image(
              image:AssetImage(
                "lib/assets/images/seller.png",
              ),
              width: 410,
              height: 410,
            ),
          const Text(
              "Buy And Sell Anything Faster With The Chunky App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
          ),

          const Text(
            "Massive discounts and offers when you shop.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 100,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Button(
                text: "Log in",
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30,),
              Button(
                text: "Sign Up",
                onPressed: (){

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },

              ),
            ],
          )
        ],
      ),
    );
  }
}


class Button extends StatelessWidget {
  Button({required this.text,required this.onPressed});
  final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
    fixedSize: Size(300, 50),
    backgroundColor: Color(0xFF2D4990),
  );

  late String text;
  late void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ElevatedButton(
        style: flatButtonStyle,
        onPressed: onPressed,
        child:Text(
          text,
        ) ,
      )
    );
  }
}

