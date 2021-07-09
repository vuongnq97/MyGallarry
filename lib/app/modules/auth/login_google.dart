import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//
import 'package:my_gallarry/app/modules/auth/controller/login.controller.dart';
import 'package:my_gallarry/app/routers/app_pages.dart';

class LoginGoogle extends StatefulWidget {
  @override
  State createState() => LoginGoogleState();
}

class LoginGoogleState extends State<LoginGoogle> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildBody() {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return controller.currentUser != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ListTile(
                    leading: GoogleUserCircleAvatar(
                      identity: controller.currentUser!.value,
                    ),
                    title:
                        Text(controller.currentUser!.value.displayName ?? ''),
                    subtitle: Text(controller.currentUser!.value.email),
                  ),
                  const Text("Signed in successfully."),
                  ElevatedButton(
                    child: const Text('Sign out'),
                    onPressed: () => controller.handleSignOut(),
                  ),
                  ElevatedButton(
                    child: const Text('Go to my gallarry'),
                    onPressed: () => {Get.toNamed(Routes.GALLARRY)},
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text("You have to sign in to use the application"),
                  ElevatedButton(
                    child: const Text('SIGN IN'),
                    onPressed: () => controller.handleSignIn(),
                  ),
                ],
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: _buildBody(),
      ),
    );
  }
}
