import 'package:exem4/controller/AuthController.dart';
import 'package:exem4/local_store/local.dart';
import 'package:exem4/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthController>().getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Center(
                child: CustomImageNetwork(
                    image: context.watch<AuthController>().user?.avatar ?? '')),
            const SizedBox(
              height: 12,
            ),
            Text(
              context.watch<AuthController>().user?.name ?? '',
            ),
            Text(
              context.watch<AuthController>().user?.email ?? '',
            ),
            ElevatedButton(
                onPressed: () {
                  LocalStore.storeClear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => SignUpPage()),
                      (route) => false);
                },
                child: Text("LogOut")),
          ],
        ),
      ),
    );
  }
}
