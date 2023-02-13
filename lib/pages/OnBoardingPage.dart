import 'package:exem4/controller/AuthController.dart';
import 'package:exem4/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthController>();
    final event = context.read<AuthController>();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/${ state.page == 1 ? "image" : state.page == 2
                    ? "image2"
                    : "image3"}.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 34.h,
                  ),
                   Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24),
                    child: Text( state.page == 1 ? "The Biggest Real Estate Appof the Century" :
                    state.page == 2
                        ? "We Focus on Providing a Comfortable Place for You"
                        : "Find your Beloved Family's Dream House with us",
                      style: const TextStyle(
                        color: Color(0xff2972FE),
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, right: 24, left: 24),
                    child: Text(
                      state.page== 1?
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus vennatis, lectus magna fringilla urna, porttitor":
                          state.page == 2?
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor.":
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor.",

                      style: TextStyle(
                          color: const Color(0xff2C3A4B),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(flex: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.page == 1
                              ? const Color(0xff2972FE)
                              : const Color(0xffEBEEF2),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.page == 2
                              ? const Color(0xff2972FE)
                              : const Color(0xffEBEEF2),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.page == 3
                              ? const Color(0xff2972FE)
                              : const Color(0xffEBEEF2),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const SignUpPage()), (
                          route) => false);
                    },
                    child: const Text("Skip", style: TextStyle(
                      color: Color(0xff2972FE),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only( left: 24, right: 24),
                    child: GestureDetector(
                      onTap: () {
                        if(state.page==3){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const SignUpPage()), (
                              route) => false);
                        }else{
                        event.changeIndex();}
                      },
                      child: Container(
                        height: 55.h,
                        width: 380.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33.r),
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff2972FE),
                                  Color(0xff6499FF),
                                ]
                            )

                        ),
                        child: const Center(child: Text("Next",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                          ),)),

                      ),
                    ),
                  ),
                  const Spacer(flex: 2,),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
