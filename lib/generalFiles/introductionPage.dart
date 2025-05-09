import 'package:flutter/material.dart';
import 'package:flutter_application_1/PortfolioOfChingiz/mainScreenPage.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
       children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
        colors: [ Colors.black45, Colors.black],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Image(
              image: AssetImage("lib/assets/LOGO.png"),
              fit: BoxFit.cover,
              ),
          ),
        ),
       ],
       ),
       floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
           MaterialPageRoute pageRoute = MaterialPageRoute(
            builder: (context) {
              return MainScreenPage();
            }
            );
            Navigator.push(context, pageRoute);
        }
        ),
    );
  }
}