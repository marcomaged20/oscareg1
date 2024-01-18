import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oscareg/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  var displayUserName = "";
  var displayUserphoto = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  void Visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void CheckBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void SginUpUsingFirbase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();

      Get.offNamed(Routes.MainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";
      if (error.code == 'weak-password') {
        message = ' provided password  is too weak...';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email...';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void LogInsingFirbase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName = auth.currentUser!.displayName!);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
      Get.offNamed(Routes.MainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";
      if (error.code == 'user-not-found') {
        message =
            "Account does not exists for that $email.. Create your account by signing up..";
      } else if (error.code == 'wrong-password') {
        message = "Invalid Password... Please try again! ";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void GoogleSinAppsing() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserphoto = googleUser.photoUrl!;
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();

      Get.offNamed(Routes.MainScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void FaceBookSignUpApp() {}

  void resePassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();

      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";
      if (error.code == 'user-not-found') {
        message =
            "Account does not exists for that $email.. Create your account by signing up..";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void SginOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      isSignedIn = false;
      authBox.remove("auth");
      update();

      Get.offNamed(Routes.WelcomeScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
