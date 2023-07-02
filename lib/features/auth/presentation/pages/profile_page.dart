import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech_blog/common/constants/page_const.dart';
import 'package:tech_blog/common/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const storage = FlutterSecureStorage();

  Future<void> readStorage() async {
    var token = await storage.read(key: "token");
    var userId = await storage.read(key: "userId");

    print(token);
    print(userId);
  }

  Future<void> logout(context) async {
    await storage.deleteAll().then((value) {
      Navigator.pushReplacementNamed(context, PageConst.registerPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("profile page"),
            CustomButton(
              title: "read token",
              onTap: () {
                readStorage();
              },
            ),
            CustomButton(
              title: "logout",
              onTap: () {
                logout(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
