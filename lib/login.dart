import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration/small_button.dart';
import 'package:registration/success_login_screen.dart';
import 'package:registration/success_page.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5F2E8),
       body: SingleChildScrollView(
         child: Column(
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
             const SizedBox(height: 80,),
             const Padding(
               padding: EdgeInsets.only(right: 190),
               child: Text(
                 "Log In to your account",
               ),
             ),
             // const SizedBox(height: 80,),
             LoginForm(),
           ],
         ),
       )
    );
  }
}


class LoginForm extends StatefulWidget {

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
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
                           controller: _emailTextController,
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
                           controller: _passwordTextController,
                           obscureText: true,
                             decoration: const InputDecoration(
                               border: InputBorder.none,
                               labelText: 'Enter your password',
                             )
                         )
                     )
                 )
             ),
             Padding(
               padding: const EdgeInsets.only(left: 20,right: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: const <Widget>[
                   Text(
                       "Remember Me"
                   ),
                   Text(
                       "Forgotten?"
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 80,),
             SmallButton(text: "Log in", onPressed: (){
               FirebaseAuth.instance.signInWithEmailAndPassword(
                   email: _emailTextController.text, 
                   password: _passwordTextController.text,
               ).then((value) => {
                  Navigator.push(context,
                     MaterialPageRoute(
                         builder: (context) => const SuccessLoginPage()
                     )
                  )
               });
             }),
           ],
         ),

       ),
    );
  }
}

