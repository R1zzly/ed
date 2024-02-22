import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgroupbuy/provider/user_provider.dart';
import 'package:tgroupbuy/routes.dart';
import 'package:tgroupbuy/widgets/signIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserProvider(),
      child: MaterialApp(
        title: 'Together',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home:
            const SignInWidget(),
           onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
