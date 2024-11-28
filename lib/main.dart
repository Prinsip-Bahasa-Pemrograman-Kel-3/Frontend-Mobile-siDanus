import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_danus/pages/on_boarding_page.dart';
import 'package:si_danus/providers/on_boarding_provider.dart';

void main() {
  runApp(const SiDanus());
}

class SiDanus extends StatelessWidget {
  const SiDanus({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnBoardingProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnBoardingPage(),
        );
      }),
    );
  }
}
