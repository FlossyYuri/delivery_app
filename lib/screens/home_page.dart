import 'package:ergo_delivery/screens/Common/chat_screen.dart';
import 'package:ergo_delivery/screens/Common/history_screen.dart';
import 'package:ergo_delivery/screens/Common/wallet_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Text('data'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ),
                  );
                },
                child: const Text('History')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: const Text('Mensagem')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WalletScreen(),
                  ),
                );
              },
              child: const Text('Carteira'),
            ),
            const Divider(),
            ElevatedButton(onPressed: () {}, child: const Text('Splash 1')),
            ElevatedButton(onPressed: () {}, child: const Text('Oboarding')),
            ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
            ElevatedButton(onPressed: () {}, child: const Text('Sign In')),
            ElevatedButton(
                onPressed: () {}, child: const Text('Setup GPS locations')),
          ],
        ),
      ),
    );
  }
}
