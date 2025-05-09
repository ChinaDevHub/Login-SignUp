import 'package:flutter/material.dart';
import 'package:flutter_application_1/PortfolioOfChingiz/mainSectionPage.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
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
            child: GestureDetector(
              onTap: ()
              {
                MaterialPageRoute pageRoute = MaterialPageRoute(
                  builder: (context) {
                    return mainSectionPage();
                  }
                );
                Navigator.pushReplacement(context, pageRoute);
              },
              child: Column(
                children: [
                  const SizedBox(height: 110),
                  //Karol
                  Center(
                child: Image.asset("lib/assets/LOGO.png",fit: BoxFit.cover,cacheHeight: 175,cacheWidth: 175,)
              ),
              SizedBox(height: 70),
              
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
              ),
            )
          ),
     
   ),
    );
  }
}