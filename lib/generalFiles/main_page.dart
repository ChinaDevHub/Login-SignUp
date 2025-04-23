import 'package:flutter/material.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
          ),
        useMaterial3: true
      ),
      home: Scaffold(
        drawer: Drawer(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 25),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.house),
                  ),ListTile(
                    title: Text("Abous Us"),
                    leading: Icon(Icons.info_outline)
                  )
                ],
              ),
            ),
        ),
        appBar: AppBar(
          title: Text("MyApp"),
          centerTitle: true,
          //backgroundColor: Colors.blueAccent,
          actions: [
            Icon(Icons.search,color: Colors.black),
            SizedBox(width: 18),
            Icon(Icons.settings,color: const Color.fromARGB(255, 11, 11, 11)),
            SizedBox(width: 15,),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text("Hello 1"),
                Text("Hello 2"),
              ],
            ),
        )
        ),
        // floatingActionButton: FloatingActionButton(
        //   tooltip: "Click this button",
        //   child: FlutterLogo(size: 25,),
        //   //backgroundColor: Colors.deepOrange,
        //   onPressed: (){},
        //   ),
    );
  }
}