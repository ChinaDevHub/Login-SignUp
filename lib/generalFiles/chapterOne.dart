import 'package:flutter/material.dart';

class ChapterOne extends StatefulWidget {

  @override
  State<ChapterOne> createState() => _ChapterOneState();
}

class _ChapterOneState extends State<ChapterOne> {
int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.deepPurpleAccent.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createRow(),
                createColumn(),
              ],
            ),
          ),
        ),
      );
  }
  
  Row createRow() {
    
    return Row(
                  children: [
                    Flexible(
                      child: Container(
                          width: 300,
                          height: 300,
                          color: Colors.pink.shade50,
                          child: Center(
                            child: Text(number.toString(),style: TextStyle(fontSize: 60),),
                          ),
                        ),
                    ),
                    SizedBox(width: 30,),
                    Flexible(
                      child: Container(
                          width: 300,
                          height: 300,
                          color: Colors.pink.shade100,
                          child: Center(
                            child: Text("${number+1}",style: TextStyle(fontSize: 60),),
                          ),
                        ),
                    ),
                    SizedBox(width: 30,),
                    Flexible(
                      child: Container(
                          width: 300,
                          height: 300,
                          color: Colors.pink.shade200,
                          child: Center(
                            child: Text("${number+2}",style: TextStyle(fontSize: 60),),
                          ),
                        ),
                    ),
                    SizedBox(width: 30,),
                    Flexible(
                      child: Container(
                          width: 300,
                          height: 300,
                          color: Colors.pink.shade300,
                          child: Center(
                            child: Text("${number+3}",style: TextStyle(fontSize: 60),),
                          ),
                        ),
                    ),
                    SizedBox(width: 30,),
                    Flexible(
                      child: Container(
                          width: 300,
                          height: 300,
                          color: Colors.pink.shade400,
                          child: Center(
                            child: Text("${number+4}",style: TextStyle(fontSize: 60),),
                          ),
                        ),
                    ),
                  ],
                );
  }
  Column createColumn() {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade50,
                        child: Center(
                          child: Text("${number+1}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                    SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade100,
                        child: Center(
                          child: Text("${number+2}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                    SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade200,
                        child: Center(
                          child: Text("${number+3}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                    SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade300,
                        child: Center(
                          child: Text("${number+4}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                    SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade400,
                        child: Center(
                          child: Text("${number+5}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                    SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade500,
                        child: Center(
                          child: Text("${number+6}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                    SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade600,
                        child: Center(
                          child: Text("${number+7}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                    SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade700,
                        child: Center(
                          child: Text("${number+8}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
                      SizedBox(height: 30),
                    Container(
                        width: 220,
                        height: 300,
                        color: Colors.pink.shade800,
                        child: Center(
                          child: Text("${number+9}",style: TextStyle(fontSize: 60),),
                        ),
                      ),
      ],
    );
  }
}