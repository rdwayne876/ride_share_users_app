import 'package:flutter/material.dart';
import 'package:users_app/auth/signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                  "assets/images/logo.png"
              ),
              const Text(
                "Sign in to Account",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                ),
              ),
              // TextFields and SignUp Button
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "UserName",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintText: "user name",
                        hintStyle: TextStyle(
                            fontSize: 12
                        ),
                      ),
                      style: const TextStyle(
                          color:  Colors.grey,
                          fontSize: 15
                      ),

                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 12
                        ),
                      ),
                      style: const TextStyle(
                          color:  Colors.grey,
                          fontSize: 15
                      ),
                    ),
                    const SizedBox(height: 42),
                    ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10)
                        ),
                        child: const Text(
                            "Sign In"
                        )
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              //TextButton
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c) => const SignUp()));
                  },
                  child: const Text(
                    "Don't have an Account? Sign Up",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
