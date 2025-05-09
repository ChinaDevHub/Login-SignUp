import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  
  Future<bool> createPost(String title, String body, int userId) async {
  try {
    final response = await http.post(
      Uri.parse("$baseUrl/posts"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode({
        "title": title,
        "body": body,
        "userId": userId
      }),
    );

    if (response.statusCode == 201) {
      print("✅ Post sent successfully: ${response.body}");
      return true;
    } else {
      print("❌ Server error: ${response.statusCode}, ${response.body}");
      return false;
    }
  } catch (e) {
    print("❌ Exception occurred: $e");
    return false;
  }
}

}


class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a new Post",
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.indigo
          )
        ),),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(label: Text("Enter title")),
                  validator: (value) =>
                  value!.isEmpty ? "Please , enter thr title" : null
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: bodyController,
                  decoration: InputDecoration(label: Text("Enter body")),
                  validator: (value) =>
                  value!.isEmpty ? "Please , enter the body" : null
                ),
              ),
            ),
            SizedBox(height: 20),
            isLoading ?
            CircularProgressIndicator() :
            ElevatedButton(
              onPressed: submitForm, 
              child: Text("Send"),
              )
          ],
        )
        ),
    );
  }
  
  void submitForm() async{
    if(formKey.currentState!.validate())
    {
      setState(() =>
      isLoading=true
      );

      final success = await apiService.createPost(
        titleController.text,
         bodyController.text, 
         1
         );


        setState(() {
          isLoading=false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(success ? "Post created!" : "Error occured"))
          );


          if(success){
            titleController.clear();
            bodyController.clear();
          }
    }
    
  }
}