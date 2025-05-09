import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_SignUp/SignUp/loginPage.dart';
import 'package:flutter_application_1/PortfolioOfChingiz/mainScreenPage.dart';

class RegisterPage extends StatelessWidget {

  TextEditingController usernameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void identifierRegister(BuildContext context)
  {
    String user_name = usernameController.text;
    String email = registerEmailController.text;
    String password = registerPasswordController.text;
    String confirm_password = confirmPasswordController.text;

    //Hecbir yer bos buraxilmasin
    if(user_name.isEmpty || email.isEmpty || password.isEmpty || confirm_password.isEmpty)
      {
        showError("All fields are required!", context);
        return;
      }

    //Username 3 simvoldan cox olmalidir
    if(user_name.length<3)
      {
        showError("Username must be at least 3 characters long!", context);
        return;
      }
    //password 6 simvoldan cox olmalidir
    if(password.length<6)
      {
        showError("Password must be at least 6 characters long!", context);
        return;
      }
    //email ici @ ve . olmalidir
    if(!email.contains("@") || !email.contains("."))
      {
        showError("Enter correctly email address (example@mail.com)", context);
        return;
      }
    //password==confirm_password duzgun olmalidir
    if(!(password==confirm_password))
      {
        showError("Passwords do not match!", context);
        return;
      }

    else {
      successfullyRegister(context, "Registration successful!");
      MaterialPageRoute pageRoute = MaterialPageRoute(
          builder: (context) {
            return MainScreenPage();
          }
          );
          Navigator.pushReplacement(context, pageRoute);
    }
  }


  void successfullyRegister(BuildContext context,String message)
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("⚠️ ${message}",
            style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.lightGreenAccent,
          duration: Duration(seconds: 2),
        )
    );
  }

  void showError(String message,BuildContext context)
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("⚠️ ${message}",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ), backgroundColor: Colors.red.shade400,
          duration: Duration(seconds: 1),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6),
            ),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 14,vertical: 15)
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                child: Text("Hello! Register to get started",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: "Username",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Icon(Icons.account_circle,size: 22,color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 20)
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: registerEmailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Icon(Icons.email,size: 22,color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: registerPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Icon(Icons.password,size: 22,color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: "Confirm password",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Icon(Icons.security,size: 22,color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),
            SizedBox(height: 28),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {identifierRegister(context);},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text("Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27),
                    child: Divider(
                      color: Colors.grey[500],
                      thickness: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Or Register with",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 27),
                    child: Divider(
                      color: Colors.grey[500],
                      thickness: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Image.network('https://img.icons8.com/?size=100&id=z657ovoGgS2o&format=png&color=000000',height: 72,width: 60,),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Image.network('https://img.icons8.com/?size=100&id=4hR4Ih04Je2t&format=png&color=000000',height: 72,width: 60),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/020/489/291/small_2x/3d-logo-of-apple-iphone-free-png.png',height: 72,width: 60),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    MaterialPageRoute pageRoute = MaterialPageRoute(
                        builder: (BuildContext context) {
                          return loginPage();
                        }
                    );
                    Navigator.push(context, pageRoute);
                  },
                  child: Text("Login Now",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
