import 'package:day35/pages/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                          Image.network('https://firebasestorage.googleapis.com/v0/b/home-services-7d22e.appspot.com/o/logo.jpg?alt=media&token=63f5844b-2985-4a27-89d5-06dc740ca1ef'),
            
                          

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Your password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              MaterialButton(
                color: Colors.black,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Implement registration logic here
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    print('Registering user $username with email $email and password $password');
                  }
                },
                child: Text('Register',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 5,),
               GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
            },
            child: Text('You Dont Have An Acount LogIn Now'))
            
            ],
          ),
        ),
      ),
    );
  }
}