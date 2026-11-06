import 'package:flutter/material.dart';
import 'package:ayesha1087_64b/widget/input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
        backgroundColor: Color.fromARGB(255, 4, 17, 87),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 4, 17, 87),
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Create an account to get started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 20),

              InputField(
                controller: nameController,
                KeyboardType: TextInputType.name,
                labelText: "Name",
                hintText: "Enter Your Name",
                prefixIcon: Icon(Icons.person),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your name";
                  }

                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return "Enter a valid name";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),

              InputField(
                controller: emailController,
                KeyboardType: TextInputType.emailAddress,
                labelText: "Email",
                hintText: "Enter Your Email",
                prefixIcon: Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your email";
                  }

                  if (!RegExp(r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return "Invalid email";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your password";
                  }

                  if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$')
                      .hasMatch(value)) {
                    return "Minimum 8 characters with letters and numbers";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: confirmController,
                keyboardType: TextInputType.text,
                obscureText: !_isConfirmVisible,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Re-enter Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmVisible = !_isConfirmVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm your password";
                  }

                  if (value != passwordController.text) {
                    return "Password does not match";
                  }

                  return null;
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Registration Form Validated!"),
                      ),
                    );
                  }
                },
                child: Text("REGISTER"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}