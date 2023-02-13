import 'package:exem4/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Sign_In.dart';
import '../controller/AuthController.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 68, right: 114, left: 114),
                child: Image.asset("assets/Griya.png"),
              ),
              24.h.verticalSpace,
              const Center(
                child: Text(
                  "Sign up for free",
                  style: TextStyle(
                      color: Color(0xff09101D),
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 46, top: 32),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        "Email",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C3A4B),
                        ),
                      ),
                    ),
                    const Text(
                      "*",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: email,
                  validator: (s) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(s ?? "");
                    if (s?.isEmpty ?? true) {
                      return "Email kirting";
                    } else if (!emailValid) {
                      return "Email togri kiriting";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide:
                              const BorderSide(color: Color(0xffEBEEF2)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 46, top: 32),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        "Password",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2C3A4B),
                        ),
                      ),
                    ),
                    const Text(
                      "*",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  obscureText: context.watch<AuthController>().isVisibility,
                  controller: password,
                  validator: (s) {
                    final bool passwordValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]")
                            .hasMatch(s ?? "");
                    if (s?.isEmpty ?? true) {
                      return "Password kirting";
                    } else if (!passwordValid) {
                      return "Password togri kiriting";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<AuthController>().onChange();
                      },
                      icon: context.watch<AuthController>().isVisibility
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        color: Color(0xffEBEEF2),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48, top: 32),
                child: Row(
                  children: [
                    Checkbox(
                      focusColor: const Color(0xff2972FE),
                      splashRadius: 30,
                      value: context.watch<AuthController>().isCheck,
                      onChanged: (s) {
                        context.read<AuthController>().changeCheck();
                      },
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff2C3A4B)),
                    )
                  ],
                ),
              ),
              32.h.verticalSpace,
              GestureDetector(
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context
                        .read<AuthController>()
                        .login(email.text, password.text, () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => ProfilePage()),
                          (route) => false);
                    });
                  }
                },
                child: Center(
                  child: Container(
                    height: 55.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33.r),
                      color: const Color(0xff93B8FE),
                    ),
                    child: const Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                    )),
                  ),
                ),
              ),
              32.verticalSpace,
              const Center(
                child: Text(
                  "or continue with",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff09101D),
                  ),
                ),
              ),
              18.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthController>().loginFacebook(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => ProfilePage()),
                            (route) => false);
                      });
                    },
                    child: Container(
                      height: 57,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Facebook.png",
                            width: 25,
                            height: 25,
                          ),
                          7.horizontalSpace,
                          const Text(
                            "Facebook",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  35.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      context.read<AuthController>().loginGoogle(() =>
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const ProfilePage()),
                              (route) => false));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      height: 57,
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Google.png",
                            width: 25,
                            height: 25,
                          ),
                          7.horizontalSpace,
                          const Text(
                            "Google",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              32.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff858C94)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff2972FE)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
