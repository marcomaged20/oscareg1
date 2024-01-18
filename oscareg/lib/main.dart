import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oscareg/firebase_options.dart';
import 'package:oscareg/logic/controllers/theme_controller.dart';
import 'package:oscareg/routes/routes.dart';
import 'package:oscareg/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'oscareg library',
        debugShowCheckedModeBanner: false,
        theme: ThemesApp.light,
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>("auth") == true
            ? AARoutes.mainScreen
            : AARoutes.welcome,
        darkTheme: ThemesApp.Dark,
        themeMode: ThemeController().ThemeDataGet,
        getPages: AARoutes.routes);
  }
}
