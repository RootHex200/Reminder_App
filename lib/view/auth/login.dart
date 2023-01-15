import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:work_manager/controller/auth_controller.dart';
import 'package:work_manager/model/auth_model.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  late TextEditingController emialcontroller;
  late TextEditingController passwordcontroller;
  // ignore: non_constant_identifier_names
  final form_key = GlobalKey<FormState>();
  @override
  void initState() {
    emialcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emialcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Color(0xFF282829),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: form_key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        const Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        // this is TextFormField - enter your name
                        TextFormField(
                          controller: emialcontroller,
                          validator: (value) {
                            if (value == "") {
                              return "Required";
                            } else if (!value!.contains("@gmail.com")) {
                              return "Enter email address @gmail.com require";
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your email",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // this is TextFormField - enter your password

                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Required";
                            } else if (value!.length < 6) {
                              return "Password should be atleast 6 characters";
                            } else if (value.length > 15) {
                              return "Password should not be greater than 15 characters";
                            } else {
                              return null;
                            }
                          },
                          controller: passwordcontroller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter your password",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // this is TextFormField - enter your confirm password
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF282829))),
                  onPressed: () {
                    if (form_key.currentState!.validate()) {
                      var data = AuthModel(
                          id: ObjectId(),
                          email: emialcontroller.text.toString(),
                          password: passwordcontroller.text.toString());
                      ref
                          .read(authProvider.notifier)
                          .loginController(data, context);
                    }
                  },
                  child: const Text("  Sign in  "))
            ],
          ),
        ),
      ),
    );
  }
}
