import 'package:flutter/material.dart';
import 'package:users_app/auth/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
                "Create a User Account",
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
                    const SizedBox(height: 18),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          fontSize: 12
                        ),
                      ),
                      style: const TextStyle(
                        color:  Colors.grey,
                        fontSize: 15
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                            fontSize: 12
                        ),
                      ),
                      style: const TextStyle(
                          color:  Colors.grey,
                          fontSize: 15
                      ),
                    ),
                    const SizedBox(height: 18),
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
                    const SizedBox(height: 22),
                    ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10)
                        ),
                        child: const Text(
                          "Sign up"
                        )
                    )
                  ],
                ),
              ),
              const SizedBox(height: 2),
              //TextButton
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c) => const LogIn()));
                  },
                  child: const Text(
                    "Already have an Account? Log In",
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