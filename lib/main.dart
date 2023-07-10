import 'package:ergo_delivery/screens/Auth/login_screen.dart';
import 'package:ergo_delivery/screens/Client/checkout/delivery_screen.dart';
import 'package:ergo_delivery/screens/Client/checkout/rate_screen.dart';
import 'package:ergo_delivery/screens/Client/checkout/rates_screen.dart';
import 'package:ergo_delivery/screens/Client/vendor_screen.dart';
import 'package:ergo_delivery/screens/Client/checkout/cart_screen.dart';
import 'package:ergo_delivery/screens/OnBoarding/onboarding_screen.dart';
import 'package:ergo_delivery/screens/Vendor/register.dart';
import 'package:ergo_delivery/screens/home_page.dart';
import 'package:ergo_delivery/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor("#FF6339"),
        secondaryHeaderColor: HexColor("#50555C"),
        canvasColor: HexColor("#F2F2F2"),
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade500,
          thickness: 1,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
          ),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/auth/login': (context) => const LoginScreen(),
        '/home': (context) => const MainScreen(),
        '/cart': (context) => const CartScreen(),
        '/vendor': (context) => const VendorScreen(),
        '/delivery': (context) => const DeliveryScreen(),
        '/rate': (context) => const RateScreen(),
        '/rates': (context) => const RatesScreen(),
        '/vendor/register': (context) => const RegisterVendor(),
        '/vendor/product': (context) => const RegisterVendor(),
        '/extra': (context) => const MyHomePage(),
      },
    );
  }
}
