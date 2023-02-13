import 'package:exem4/controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              child: SizedBox(
                height: 100,
                child: ClipOval(
                  child: Image.network(
                    context.watch<AuthController>().user?.avatar ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Text(context.watch<AuthController>().user?.name ?? '',),
            Text(context.watch<AuthController>().user?.email ?? '',),
          ],
        ),
      ),
    );
  }
}
