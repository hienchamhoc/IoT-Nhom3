import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/user.dart';
import 'package:smarthome_mobile/feature/presentation/views/auth/auth_control.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();
  final AuthControl authControl = Get.put(AuthControl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: TextField(
                  controller: emailControl,
                  decoration: InputDecoration(
                    hintText: 'user name',
                    border: InputBorder.none,
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 10,),
                        Icon(Icons.email),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: TextField(
                  controller: passControl,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: InputBorder.none,
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 10,),
                        Icon(Icons.password),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                // authControl.login(userName: User.fakeUser.username!, pass: User.fakeUser.password!);
                authControl.login(
                   userName: emailControl.text, pass: passControl.text);
              },
              child: Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}
