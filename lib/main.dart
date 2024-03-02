import 'package:dio_project/screens/auth_screen/screen_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'hive_models/example2_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Hive document directory path
  var directory = await getApplicationDocumentsDirectory();
   Hive.init(directory.path);

   Hive.registerAdapter(Example2ModelAdapter());
   await Hive.openBox<Example2Model>('notes');


  // await Hive.initFlutter();
  // await Hive.openBox('MyBox');


  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.withOpacity(.3),
          titleTextStyle: TextStyle(color: Colors.black,fontSize: 24),
          centerTitle: true,
        ),
      ),
      // home:  FetchFileFirebaseStorage(ref: FirebaseStorage.instance.ref(),),
      home: ScreenSignup(),
    );
  }
}

