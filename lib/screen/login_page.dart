import 'package:flutter/material.dart';
import 'package:praktikum_mobile/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoginSucces = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 254, 254, 255),
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_usernameField(), _passwordField(), _loginButton(context)],
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        enabled: true,
        controller: usernameController,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: "Masukkan Username",
          hintStyle: TextStyle(color: Colors.blueGrey),
          fillColor: const Color.fromARGB(255, 252, 252, 252),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        obscureText: true,
        enabled: true,
        controller: passwordController,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: "Masukkan Password",
          hintStyle: TextStyle(color: Colors.blueGrey),
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          print("Login");
          _login();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _login() {
    String text = "", username, password;

    username = usernameController.text.trim();
    password = passwordController.text.trim();
    print("Username : $username");
    print("Password : $password");

    if (username == "ayu" && password == "ayu123") {
      setState(() {
        text = "LOGIN BERHASIL";
        isLoginSucces = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(username: username);
          },
        ),
      );
    } else {
      setState(() {
        text = "LOGIN GAGAL";
      });
    }
    SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
