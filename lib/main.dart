import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pcs_test/app.dart';
import 'package:pcs_test/environment/environment.dart';
import 'package:pcs_test/screen/user/user_list_screen.dart';
import 'package:pcs_test/screen/user/user_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  Environment.flavorName = 'develop';
  await dotenv.load(fileName: Environment.fileName);
  await App.initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => App.locator<UserNotifier>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const UserListScreen(),
      ),
    );
  }
}
