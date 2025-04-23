import 'package:flutter/material.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    physics: BouncingScrollPhysics(),
     child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
          colors: [ Colors.black45, Colors.black],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 110),
                //Karol
                Center(
              child: Image.asset("lib/assets/LOGO.png",fit: BoxFit.cover,cacheHeight: 175,cacheWidth: 175,)
            ),
            SizedBox(height: 70,),

            //Portfolio
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Center(
              child: Image.asset("lib/assets/PORTFOLIO.png",fit: BoxFit.cover,)
              ),
              Center(
                child: Image.asset("lib/assets/STATUE.png",fit: BoxFit.contain,alignment: Alignment.bottomCenter,),
              ),
              ],
            ),
              ],
            )
          ),
     
   ),
    );
  }
}