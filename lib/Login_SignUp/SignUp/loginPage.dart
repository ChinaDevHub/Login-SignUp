import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_SignUp/SignUp/registerPage.dart';
import 'package:flutter_application_1/PortfolioOfChingiz/mainScreenPage.dart';

class loginPage extends StatefulWidget {

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  void isPressed()
  {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void identifierLogin()
  {
    String myEmail = "cingiz.zaidov@gmail.com";
    String myPassword = "cina2005.1";
    //Email ve Password bos olmamalidir
    if(emailController.text.isEmpty || passwordController.text.isEmpty)
      {
        showError("⚠️ Username and password cannot be empty!");
        return;
      }
    //Email formati duzgun olmalidir
    if(!emailController.text.contains("@") || !emailController.text.contains("."))
      {
        showError("⚠️ Enter correctly email address (example@mail.com)");
        return;
      }
    //Password uzunlugu min 6 olmalidir
    if(passwordController.text.length < 6)
      {
        showError("⚠️ Password must be at least 6 characters long!");
      }
    //info lar duzdurse diger sehifeye kec
    if(emailController.text==myEmail && passwordController.text==myPassword)
      {
        successfullyLogIn(context, "LogIn successful!");
        MaterialPageRoute pageRoute = MaterialPageRoute(
          builder: (context) {
            return MainScreenPage();
          }
          );
          Navigator.pushReplacement(context, pageRoute);
      }
    //Incorrect email ve password daxil edilerse 
    else {
      showError("⚠️ Incorrect email or password");
    }
  }
//Error snackBar ucun ayrica metod
  void showError(String message)
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message,
            style: TextStyle(fontSize: 18),
          ), backgroundColor: Colors.red.shade400,
          duration: Duration(seconds: 2),
        )
    );
  }

  //Daxil olarsa successfull mesaji
  void successfullyLogIn(BuildContext context , String message)
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
           borderRadius: BorderRadius.circular(6),
           shape: BoxShape.rectangle
         ),
         child: OutlinedButton(
             onPressed: ()
             {
               Navigator.pop(context);
             },
             child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.black,),
           style: OutlinedButton.styleFrom(
             padding: EdgeInsets.symmetric(vertical: 14,horizontal: 15)
           ),
         ),
       ),
     ),
   ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text("Welcome back! Glad to see you, Again !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black,
                  ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)
                      ),
                      //Asagidakilar TextFieldin icini rengli edir
                      filled: true,
                      fillColor: Colors.grey[200],
                      label: Text("Enter your email"),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                      //Asagidaki textFieldin hundurluyunu artirir
                      contentPadding: EdgeInsets.symmetric(vertical: 22),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Icon(Icons.email,size: 22,color: Colors.black,),
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    obscureText: isObscure,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      labelText: "Enter your password",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700]
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 22),
                      prefixIcon: Icon(Icons.lock,size: 22,color: Colors.black),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: IconButton(
                            onPressed: isPressed,
                            icon: isObscure ? Icon(Icons.visibility,size: 23,color: Colors.black,) :
                                Icon(Icons.visibility_off,size: 23,color: Colors.black,)
                        ),
                      ),
                    ),
                  ),
                ),
              ),


                  Padding(
                    padding: const EdgeInsets.only(right: 15,top: 5),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                            onPressed: () {},
                            child: Text("Forgot Password ?",
                              style: TextStyle(
                              color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                    ),
                  ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {
                      identifierLogin();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text("Login",
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
             SizedBox(height: 25),
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
                    child: Text("Or Login with",
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
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      ),
                  TextButton(
                      onPressed: () {
                        MaterialPageRoute pageRoute = MaterialPageRoute(
                            builder: (BuildContext context) {
                              return RegisterPage();
                            }
                        );
                        Navigator.push(context, pageRoute);
                      },
                      child: Text("Register Now",
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
      ),
    );
  }
}
