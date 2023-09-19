import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main_screen/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            'PRODUCKTS',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: <Widget>[
              Align( // Align the image to the center
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/app_icon.png', // Your app icon image
                  height: 200, // Adjust the size as needed
                  width: 200, // Adjust the size as needed
                ),
              ),
              SizedBox(height: 1.0),
              Text(
                'WELCOME TO PRODUCKTS',
                style: TextStyle(
                  color:  Colors.orange,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: usernameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'L O G I N',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    final url = 'https://dummyjson.com/auth/login';
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'username': usernameController.text,
      'password': passwordController.text,
    };

    final response =
    await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      setState(() {
        errorMessage = 'Login successful!';
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()), // Replace MainScreen with the actual name of your screen
      );
    } else {
      setState(() {
        errorMessage = 'Login failed. Please check your credentials.';
      });
    }
  }
}
