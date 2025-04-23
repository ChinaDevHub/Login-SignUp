import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login/SignUp/loginPage.dart';
import 'package:flutter_application_1/Login/SignUp/registerPage.dart';

class entryPage extends StatefulWidget {

  @override
  State<entryPage> createState() => _entryPageState();
}

class _entryPageState extends State<entryPage> {
  bool isDarkMode = false;

//Kecid metodu
  void navigatePages(BuildContext context,Widget page)
  {
    MaterialPageRoute pageRoute = MaterialPageRoute(
        builder: (context) {
          return page;
        }
    );
    Navigator.push(context, pageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ?
      ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)
        ),
      )
      : ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Welcome",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.9),
            fontFamily: 'IndieFlower'
          ),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: ()
          {
            Navigator.pop(context);
          },
              icon: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 28,),
              )
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue,Colors.greenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
              )
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                activeColor: Colors.white,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: isDarkMode ? [Colors.black87,Colors.black54]
                : [Colors.blue.shade50,Colors.green.shade50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 25,),
              Expanded(
                flex: 3,
               child: Stack(
                 alignment: Alignment.center,
                 children: [
                   Container(
                     width: double.infinity,
                     height: 220,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       gradient: LinearGradient(
                           colors: isDarkMode ? [Colors.grey,Colors.black]
                         : [Colors.blue,Colors.blueGrey,Colors.indigoAccent],
                         begin: Alignment.topLeft,
                         end: Alignment.bottomRight,
                       ),
                       boxShadow:
                         [
                           BoxShadow(
                             color: isDarkMode ? Colors.grey.withOpacity(0.6)
                             : Colors.lightBlue.withOpacity(0.4),
                             spreadRadius: 15,
                             blurRadius: 15,
                           )
                         ]
                     ),
                   ),
                   ClipOval(
                       child: Image.network("https://images.unsplash.com/photo-1737804719022-f70a238a65ef?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDd8Q0R3dXdYSkFiRXd8fGVufDB8fHx8fA%3D%3D",
                         width: 200,
                         height: 200,
                         fit: BoxFit.cover,
                       ),
                     ),
                 ],
               ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                onPressed: ()
                {
                  navigatePages(context, loginPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
                ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 15),
                      child: Text("Login",
                        style: TextStyle(
                          color: isDarkMode ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                ),
              SizedBox(height: 15),
          ElevatedButton(onPressed: () {
            navigatePages(context , RegisterPage());
          },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 53,vertical: 15),
                      child:  Text("Register",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
          ),
              SizedBox(height: 15),
              TextButton(onPressed: () {
                //Sadece LoginRegister olduguna gore guest kimi hansisa real proyekte daxiletmeye icaze vermemisem
                navigatePages(context, entryPage());
              },
                  style: TextButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.grey[800] : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                        child: Text("Continue as a guest",
                          style: TextStyle(
                            fontSize: 20,
                            color: isDarkMode ? Colors.blueAccent : Colors.blue,
                          ),
                        ),
                      )
                  ),
              SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
