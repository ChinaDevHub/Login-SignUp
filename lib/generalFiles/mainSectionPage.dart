import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mainSectionPage extends StatefulWidget {
  const mainSectionPage({super.key});

  @override
  State<mainSectionPage> createState() => _mainSectionPageState();
}

class _mainSectionPageState extends State<mainSectionPage> {
  final String fullText = "I'm Chingiz Zaidov";
  String displayedText = "";
  int currentIndex = 0;


   final String fullTextTwo = "A Mobile Developer";
  String displayedTextTwo = "";
  int currentIndexTwo = 0;

  String displayedTextThree = '''
 My name is Chingiz Zaidov, and I am a Computer Engineering student at the Azerbaijan State Oil and Industry University. I have a strong passion for technology, especially in programming and app development. Currently, I focus on mobile application development, primarily working with Dart and Flutter to build cross-platform projects. I have gained hands-on experience through various projects, ranging from simple login/register systems to more advanced apps using local databases like SQLite. Alongside Flutter, I also have knowledge of C# and ASP.NET MVC, and I’m familiar with HTML, CSS, and UI/UX design principles.

My goal is to continuously improve my technical skills and create useful, functional applications that solve real-life problems. I view each project as an opportunity to grow, both professionally and personally. In the future, I aim to become a recognized expert in mobile development and participate in international-level projects.
''';
  @override
  void initState() {
    super.initState();
    _startTypingEffect();
  }


//Herflerin sira ile cagirilmasi
  void _startTypingEffect() {
    Timer.periodic(Duration(milliseconds: 80), (timer){
       if(currentIndex<fullText.length)
       {
        setState(() {
          displayedText+=fullText[currentIndex];
          currentIndex++;
        });
       }else {
        timer.cancel();
        _startTypingEffectTwo();
       }
    }
    );
  }


 void _startTypingEffectTwo() {
    Timer.periodic(Duration(milliseconds: 80), (timer){
       if(currentIndexTwo<fullTextTwo.length)
       {
        setState(() {
          displayedTextTwo+=fullTextTwo[currentIndexTwo];
          currentIndexTwo++;
        });
       }else {
        timer.cancel();
       }
    }
    );
  }


//GlobalKey Part
  int hoveredIndex = -1;

final homeKey = GlobalKey();
final aboutKey = GlobalKey();
final experienceKey = GlobalKey();
final contactKey = GlobalKey();

  late List<Map<String,dynamic>> drawerSections =
  [
      {'title' : 'Home' , 'key' : homeKey},
      {'title': 'About Me', 'key': aboutKey},
      {'title': 'Experience', 'key': experienceKey},
      {'title': 'Contact Us', 'key': contactKey},
  ];

  void scrollTo(GlobalKey key)
  {
    final context = key.currentContext;
    if(context != null)
    {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    final screeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("Chingiz",style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          ),),
        ),
      ),
      endDrawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 7, 8, 0),
          width: 250,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              curve: Curves.linear,
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            for (int i = 0; i < drawerSections.length; i++)
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    hoveredIndex = i;
                  });
                },
                onExit: (_) {
                  setState(() {
                    hoveredIndex = -1;
                  });
                },
                child: AnimatedScale(//AnimatedScale ile sadece text in hover olanda olcusunu artirdiq
                  scale: hoveredIndex == i ? 1.06 : 1.0,//0.06 faiz artdi
                  duration: Duration(milliseconds: 200),//0.2 saniyeye kecid edir
                  child: ListTile(
                    title: Text(
                      drawerSections[i]['title'],
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: hoveredIndex == i
                            ? Colors.amberAccent
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23
                        )
                      )
                    ),
                    onTap: () {
                      scrollTo(drawerSections[i]['key'] as GlobalKey);
                      Navigator.pop(context);
                    },
                    splashColor: Colors.transparent,
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.antiAlias,
            children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                //Top Point
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.brown.shade400,
                  ),
                  width: screeWidth * 0.3,
                  height: 7,
                ),
                const SizedBox(height: 60),
                Container(
                  key: homeKey,
                 child: Column(
                  children: [
                    Text("Hello!",
                style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent
                      )
                ),
                ),
                 const SizedBox(height: 15),


                // Name with slowly
                Text(
                  displayedText,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                //Speciality with slowly
                Text(
                    displayedTextTwo,
                    style: GoogleFonts.alef(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.amberAccent,
                      ),
                      child: Text("Contact Us",style: GoogleFonts.montserrat(
                            backgroundColor: Colors.amberAccent,
                            textStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            )
                          ),),
                    ),
                  ),
                const SizedBox(height: 150),
                  ],
                 ),
                ),
                //Picture 
                Container(
                  key: aboutKey,
                  child: Column(
                    children: [
                      Container(
                  height: 400,
                  width: screeWidth * 0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("lib/assets/my_picture.jpeg",
                     fit: BoxFit.cover,
                     frameBuilder: (context, child, frame , loading ){
                      if(loading || frame !=null)
                      {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.amberAccent,
                            strokeWidth: 3,
                          ),
                        );
                      }
                     }
                     ),
                  ),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        spreadRadius: 7,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                //About with slowly
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 20),
                  child: Text(
                    displayedTextThree,
                    style: GoogleFonts.alef(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ),
                    ],
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
