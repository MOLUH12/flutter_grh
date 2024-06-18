import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/auth_screen.dart';
import 'auth/register_screen.dart';
import 'auth/providers/user_provider.dart';

void main() {
  runApp(GestionRHApp());
}

class GestionRHApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Gestion RH',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => RegisterScreen(),
          '/auth': (context) => AuthScreen(),
        },
      ),
    );
  }
}
