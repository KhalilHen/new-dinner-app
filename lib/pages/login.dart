import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/pages/list_overview.dart';
import 'package:flutter_application_1/pages/sign_up.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D32),
        elevation: 2,
        title: Text(
          'Login',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
              ),
              SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _authService.login(_emailController.text, _passwordController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardPage(),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text('Sign up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
