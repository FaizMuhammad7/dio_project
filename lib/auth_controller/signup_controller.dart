import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio_project/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  RxBool isLoading = RxBool(false);

  /// signUp controller
  Future<void> signupController() async {
    isLoading.value = true;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text)
        .then((value) async {
      isLoading.value = false;
      Get.snackbar("Successfully", "Successfully signup");

      /// save user data
      var userObj = UserModel(name: nameController.toString(),
          email: emailController.toString(), password: passController.toString());
      await saveUserData(userObj);
      // Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=> VideoScreen()));
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Get.snackbar("Error", error.toString());
    });
  }

  /// save user data in fireStore data base

  Future<void> saveUserData(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(userModel.toMap());
  }
}
