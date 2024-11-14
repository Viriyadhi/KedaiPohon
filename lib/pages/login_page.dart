import 'package:flutter/material.dart';
import 'package:kedai_pohon/pages/cashier_page.dart';
import 'package:kedai_pohon/widget/admin/admin_navigation.dart';
import 'package:kedai_pohon/pages/testing_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan Username dan Password')),
      );
    }
    if (username == "admin" && password == "satu"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminNavigation()),
      );
    }
    if (username == "cashier" && password == "dua"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CashierPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/kedai_pohon.png'),
              const SizedBox(height: 20,),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, textStyle: const TextStyle(fontSize: 20), // Text color
                ),
                onPressed: () {_login();},
                child: const Text('Masuk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
