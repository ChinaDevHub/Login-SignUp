
import 'package:flutter/material.dart';
//https://my-portfolio-two-ruby-65.vercel.app/#projects-RAVAN
class ExamplePage extends StatelessWidget {

String name = "Chingiz";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Container(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible( child: Container(width: 70,height: 200, color: Colors.amber),),
                  Flexible(child: Container(width: 70,height: 200,color: Colors.lightBlueAccent,))
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: FadeInImage.assetNetwork(
              placeholder: "lib/assets/programmer_1.gif",
              fadeInDuration: Duration(seconds: 8),
              fadeOutDuration: Duration(seconds: 5),
              image: "https://media.licdn.com/dms/image/v2/D4E12AQGHhFbEXuzqhw/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1681459399526?e=2147483647&v=beta&t=xN3OJh1WIhowjHsBEbnLK7bMFo6x5WMsme-riwVNQXs",
              width: 250,
              height: 250,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace){
                return Icon(Icons.error,size: 40,);
              },
              ),
          ),
            SizedBox(height: 20,),
            //Text("Welcome ${name}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}