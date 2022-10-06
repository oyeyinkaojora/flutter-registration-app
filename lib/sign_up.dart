import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:registration/login.dart';
import 'package:registration/small_button.dart';
import 'package:registration/success_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5F2E8),
       body: SingleChildScrollView(
         child:  Column(
           children:  <Widget>[
             const Padding(
               padding: EdgeInsets.only(top: 80,left: 15),
               child: Text(
                 "Welcome back!",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 20,
                 ),
               ),
             ),
             const SizedBox(height: 70,),
             const Padding(
               padding: EdgeInsets.only(right: 190),
               child: Text(
                 "Sign up for the Chunky app",
               ),
             ),
             // const SizedBox(height: 80,),
             // SignUpPage(),
             // LoginForm(),
             SignUpForm(),
           ],
         ),
       )
    );
  }
}


class SignUpForm extends StatefulWidget {

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            controller: _emailTextController ,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your email',
                            )
                        )
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            controller: _userNameTextController ,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your username',
                            )
                        )
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            obscureText: true,
                            controller: _passwordTextController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter your password',
                            )
                        )
                    )
                )
            ),
            const SizedBox(height: 50,),
            SmallButton(text: "Sign Up", onPressed: (){
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text,
              ).then((value) => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SuccessPage(),
                          ),
              ));
            }),
          ],
        ),

      ),
    );
  }
}



