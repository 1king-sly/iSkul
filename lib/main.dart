import 'package:flutter/material.dart';
import 'package:ischool/pages/Dashboard/dashboard.dart';
import 'package:ischool/pages/landingPage/homepage.dart';
import 'package:ischool/providers/auth_provider.dart';
import 'package:ischool/providers/students_providers.dart';
import 'package:ischool/providers/teachers_provider.dart';
import 'package:ischool/utils/app_styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
        ChangeNotifierProvider(create: (context) => TeachersProvider()),
        ChangeNotifierProvider(create: (context) => StudentsProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
 
    ],
       child:const  MyApp()),
    );
}

class MyApp extends StatelessWidget {

  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primary),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}
