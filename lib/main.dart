import 'package:flutter/material.dart';
import 'package:flutter_random_year_api_app/controller/function_provider.dart';
import 'package:flutter_random_year_api_app/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FunctionProvider())
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
