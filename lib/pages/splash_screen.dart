import 'package:exem4/pages/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../local_store/local.dart';
import 'OnBoardingPage.dart';

class SplashScreen extends StatefulWidget {
  bool isActive;
  bool isChangeTheme;

  SplashScreen({Key? key, this.isActive = false, this.isChangeTheme = false})
      : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? docId = await LocalStore.getDocId();
      if (docId == null) {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const OnBoardingPage()),
                (route) => false);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const ProfilePage()),
                (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Rectangle.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/Group.png",
        ),
      ),
    ));
  }
}


// import 'package:exem4/pages/ProfilePage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
//
// import '../Sign_In.dart';
// import '../local_store/local.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       Future.delayed(Duration(seconds: 3), () async {
//         String? docId = await LocalStore.getDocId();
//         if (docId == null) {
//           // ignore: use_build_context_synchronously
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (_) => const SignInPage()),
//                   (route) => false);
//         } else {
//           // ignore: use_build_context_synchronously
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (_) => const ProfilePage()),
//                   (route) => false);
//         }
//       });
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/Group.png',
//                 height: 334, width: 346.52),
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: LoadingAnimationWidget.inkDrop(
//                   color: Colors.purple , size: 12),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }