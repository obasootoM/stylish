import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/authentication/signIn/service/sign_in_service.dart';
import 'package:stylish/features/splash_screen/splash_screen.dart';
import 'package:stylish/provider/provider.dart';
import 'package:stylish/route/route.dart';





void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Service _service = Service();
  @override
  void initState() {
    _service.getUserData(context: context);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LandingScreen(),
        onGenerateRoute: (setting) => generateRoute(setting));
  }
}
