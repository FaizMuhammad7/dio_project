import 'package:dio_project/auth_controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../compress_video/video_screen.dart';

class ScreenSignup extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text("SingUp"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
              ),
            ).paddingAll(8),
            TextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Enter your email",
              ),
            ).paddingAll(8),
            TextField(
              controller: controller.passController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Enter your password",
              ),
            ).paddingAll(8),
            ElevatedButton(
              onPressed: () async {
                await controller.signupController();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoScreen()));
              },
              child: Obx(() {
                  return controller.isLoading.value ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                      : Text(
                          "SignUp",
                          style: TextStyle(color: Colors.white),
                        );
                },
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: Colors.blue,
                fixedSize: Size(300, 46),
              ),
            ).paddingOnly(top: 270),
          ],
        ).paddingAll(10),
      ),
    );
  }
}
