import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_SignUp/SignUp/entryPage.dart';
import 'package:flutter_application_1/PortfolioOfChingiz/mainScreenPage.dart';
import 'package:flutter_application_1/PortfolioOfChingiz/mainSectionPage.dart';
import 'package:flutter_application_1/generalFiles/restApi_Get.dart';
import 'package:flutter_application_1/generalFiles/restApi_Post.dart';
//Terminalda evvelki git deyisikliyini silmek
//Remove-Item -Recurse -Force .git

void main()
{
  runApp(
    DevicePreview(
      enabled : true,
      builder: (context){
        return MyWidget();
        },
        ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: entryPage(),
    );
  }
}