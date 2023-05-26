import 'package:day35/pages/home.dart';
import 'package:day35/pages/register.dart';
import 'package:day35/pages/start.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://firebasestorage.googleapis.com/v0/b/home-services-7d22e.appspot.com/o/logo.jpg?alt=media&token=63f5844b-2985-4a27-89d5-06dc740ca1ef'),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            MaterialButton(
              onPressed: () {
                 Navigator.push(context,MaterialPageRoute(
                          builder: (context) => StartPage(),
                        ));

                // Perform login
                String email = emailController.text;
                String password = passwordController.text;
                print("Email: $email\nPassword: $password");
              },
              child: Text("Login",style: TextStyle(color: Colors.white),),
              color: Colors.black,
            
          ),
                        SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
            },
            child: Text('You Dont Have An Acount Register Now'))
          ],
        ),
      ),
    );
  }
}