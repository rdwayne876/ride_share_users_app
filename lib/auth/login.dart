import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:users_app/auth/signup.dart';
import 'package:users_app/global.dart';

import '../methods/common.dart';
import '../pages/home.dart';
import '../widgets/loading_dialog.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  signInUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            LoadingDialog(messageText: "Loading your account..."));

    final User? userFirebase;

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim());

      userFirebase = credential.user;

      Navigator.pop(context);

      if (userFirebase != null) {
        final usersRef = FirebaseDatabase.instance
            .ref()
            .child('users')
            .child(userFirebase.uid);

        usersRef.once().then((snap) {
          if (snap.snapshot.value != null) {
            if ((snap.snapshot.value as Map)['blockedStatus'] == "no") {
              userName = ((snap.snapshot.value as Map)["name"]);
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => const HomePage()));
            } else {
              FirebaseAuth.instance.signOut();
              cMethods.displaySnackBar(
                  "Account blocked, Please contact Admin", context);
            }
          } else {
            FirebaseAuth.instance.signOut();
            cMethods.displaySnackBar("No user account found", context);
          }
        });
      } else {
        if (kDebugMode) {
          print("User creation failed");
        }
      }
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      cMethods.displaySnackBar(error.message!.toString(), context);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  signInFormValidation() {
    if (userNameTextEditingController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Enter a valid username ", context);
    } else if (passwordTextEditingController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Enter Password", context);
    } else {
      signInUser();
    }
  }

  checkNetwork() {
    cMethods.checkConnectivity(context);

    signInFormValidation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              const Text(
                "Sign in to Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
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
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    const SizedBox(height: 42),
                    ElevatedButton(
                        onPressed: () {
                          checkNetwork();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10)),
                        child: const Text("Sign In"))
                  ],
                ),
              ),
              const SizedBox(height: 12),
              //TextButton
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const SignUp()));
                  },
                  child: const Text(
                    "Don't have an Account? Sign Up",
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
