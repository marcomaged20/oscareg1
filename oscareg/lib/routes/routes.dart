import 'package:get/get.dart';
import 'package:oscareg/logic/bindings/auth_binding.dart';
import 'package:oscareg/logic/bindings/main_binding.dart';
import 'package:oscareg/logic/bindings/product_binding.dart';
import 'package:oscareg/view/cart_screen.dart';
import 'package:oscareg/view/screens/auth/forgot_password_screen.dart';
import 'package:oscareg/view/screens/auth/login_screen.dart';
import 'package:oscareg/view/screens/auth/main_screen.dart';
import 'package:oscareg/view/screens/auth/signup_screen.dart';
import 'package:oscareg/view/screens/welcome_screen.dart';

class AARoutes {
  //  initialRoute
  static const welcome = Routes.WelcomeScreen;
  static const mainScreen = Routes.MainScreen;

  //  GetPage
  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SignUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ForgetPassworedScreen,
      page: () => ForgetPassworedScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBininding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.CartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const WelcomeScreen = '/welcomeScreen';
  static const LoginScreen = '/LoginScreen';
  static const SignUpScreen = '/SignUpScreen';
  static const ForgetPassworedScreen = '/ForgetPassworedScreen';
  static const MainScreen = '/MainScreen';
  static const CartScreen = '/CartScreen';
}
