import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginRegister/entryPage.dart';
import 'package:flutter_application_1/example.dart';
import 'package:flutter_application_1/globalKey.dart';
import 'package:flutter_application_1/introductionPage.dart';
import 'package:flutter_application_1/mainScreenPage.dart';
import 'package:flutter_application_1/mainSectionPage.dart';
void main()
{
  runApp(
    DevicePreview(
      enabled : true , 
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