import 'package:flutter/material.dart';
import 'package:whatsapp_chat/components/page_route.dart';
import 'package:whatsapp_chat/utils/colors.dart';
import 'package:whatsapp_chat/views/AuthScreen/NumberScreen/number_screen.dart';
import 'package:whatsapp_chat/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              color: white.withOpacity(.8),
              width: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'Simple, Secure,\nReliable messaging.',
                  style: TextStyle(
                      color: white.withOpacity(.030),
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  'Simple, Secure,\nReliable messaging.',
                  style: TextStyle(
                      color: white,
                      fontSize: 20,
                      height: 1,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            customButton(
              size: size,
              title: 'Get Started',
              onTap: (){
                navigator(context, const NumberScreen());
              }
            ),
          ],
        ),
      ),
    );
  }
}
