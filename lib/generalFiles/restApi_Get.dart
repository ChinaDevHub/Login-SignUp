import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class ApiService{

  final String baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<dynamic>> fetchData() async{
    var response = await http.get(Uri.parse("$baseUrl/comments"));

    if(response.statusCode == 200)
    {
      return jsonDecode(response.body);//Json->Dart
    }else {
      throw Exception("Information has not been found");
    }
  }
}


class GetUrl extends StatelessWidget {
  const GetUrl({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiService();
    return Scaffold(
        appBar: AppBar(title: Text("Get explanation",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.indigoAccent.shade200,fontWeight: FontWeight.bold)),),centerTitle: true,),
        body: FutureBuilder(
          future: api.fetchData(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError)
            {
              return Center(child: Text("Error occured..."),);
            }
            else {
              final posts = snapshot.data as List;
              var filteredData = posts.where(
                (post)=> 
                // post["body"].toString().toLowerCase().contains("ipsum") ||
                // post["body"].toString().toLowerCase().contains("dolor") ||
                post["id"] >= 5 && post["id"] <= 10 
                ).toList();
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredData[index]["id"].toString()),
                    subtitle: Text(filteredData[index]["body"]),
                  );
                }
                );
            }
          }
          ),
    );
  }
}