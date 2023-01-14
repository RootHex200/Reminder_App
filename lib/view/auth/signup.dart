import 'package:flutter/material.dart';
import 'package:work_manager/view/auth/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController emialcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController phonecontroller;
  late TextEditingController namecontroller;
  late TextEditingController confimcontroller;
  final form_key = GlobalKey<FormState>();
  @override
  void initState() {
    emialcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    phonecontroller = TextEditingController();
    namecontroller = TextEditingController();
    confimcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emialcontroller.dispose();
    passwordcontroller.dispose();
    phonecontroller.dispose();
    namecontroller.dispose();
    confimcontroller.dispose();
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
                        // this is text creat account
                        const Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        // this is TextFormField - enter your name

                        TextFormField(
                          controller: namecontroller,
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
                            hintText: "Enter your name",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // this is TextFormField - enter your phone

                        TextFormField(
                          controller: phonecontroller,
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
                            hintText: "Enter your phone",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // this is TextFormField - enter your email

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
                          controller: passwordcontroller,
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

                        TextFormField(
                          controller: confimcontroller,
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
                            hintText: "Enter your confirm password ",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
                    if(form_key.currentState!.validate()){
                                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                    }
                  },
                  child: const Text("  Sign up  "))
            ],
          ),
        ),
      ),
    );
  }
}
