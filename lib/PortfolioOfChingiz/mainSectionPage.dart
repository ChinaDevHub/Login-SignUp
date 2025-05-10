import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_SignUp/SignUp/entryPage.dart';
import 'package:flutter_application_1/PortfolioOfChingiz/fullScreenImage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_devicon/flutter_devicon.dart';

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

final GlobalKey homeKey = GlobalKey();
final aboutKey = GlobalKey();
final experienceKey = GlobalKey();
final skillsKey = GlobalKey();
final contactKey = GlobalKey();

  late List<Map<String,dynamic>> drawerSections =
  [
      {'title' : 'Home' , 'key' : homeKey},
      {'title': 'About Me', 'key': aboutKey},
      {'title': 'Experience', 'key': experienceKey},
      {'title' : 'Skills' , 'key' : skillsKey},
      {'title': 'Contact Me', 'key': contactKey},
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

 ScrollController scrollController = ScrollController();

  Uri githubUrl = Uri.parse("https://github.com/ChinaDevHub");
  Uri linkedinUrl = Uri.parse("https://www.linkedin.com/in/chingiz-zaidov-86241b328/");

  void openGitHubUri() async
  {
    if(!await launchUrl(githubUrl, mode: LaunchMode.externalApplication))
    {
      throw "Could not ${githubUrl}";
    }
  }

  void openLinkedInUri() async {
        if(!await launchUrl(linkedinUrl , mode: LaunchMode.externalApplication))
        {
          throw "Could not ${linkedinUrl}";
        }
  }


  void ShowCallInfo(BuildContext context)
  {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
                backgroundColor: Colors.grey.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                actions: [
                  TextButton(onPressed: () {Navigator.pop(context);}, child: Text("Close",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),))
                ],
                title: Center(child: Text("My contact number",style: TextStyle(fontSize: 25,color: Colors.white),)),
                content: Text("+ 994 50 480 70 89 ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 19,color: Colors.amber)),),
          );
      }
      );
  }

  void ShowEmailInfo(BuildContext context)
  {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
              backgroundColor: Colors.grey.shade700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actions: [
                TextButton(onPressed: () {Navigator.pop(context);}, child: Text("Close",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),))
              ],
              title: Center(child: Text("My email account",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 25,color: Colors.white)),)),
              content: Text("zaidovcingiz2019@gmail.com",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 17,color: Colors.amber)),),
        );
      }
      );
  }

late double screeWidth;

Container home_Part(){
  return Container(
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
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.amberAccent,
                      ),
                      child: TextButton(onPressed: () {scrollTo(contactKey);},child: Text("Contact Me",style: GoogleFonts.montserrat(
                            backgroundColor: Colors.amberAccent,
                            textStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            )
                          ), ),
                          ),
                    ),
                const SizedBox(height: 150),
                  ],
                ));
}
Container about_Part(){
  return Container(
                  key: aboutKey,
                  child: Column(
                    children: [
                      Container(
                  height: 400,
                  width: screeWidth * 0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network("https://images.cointelegraph.com/cdn-cgi/image/format=auto,onerror=redirect,quality=90,width=1434/https://s3.cointelegraph.com/uploads/2023-02/01dc312d-150d-4fe8-95bb-6a09294f4ae0.jpg",
                    fit: BoxFit.cover,
                    frameBuilder: (context, child, frame , loading ){
                      if(loading || frame !=null)
                      {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
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
                );
}
Container experience_Part(){
  return Container(
                  key: experienceKey,
                  child: Column(
                    children: [
                      Center(
                  child: Text("My Experience",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text("Learning, Building, Becoming",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                    color: Colors.white30,
                    textStyle: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  ),
                ),
                SizedBox(height: 20),
                      Container(
                  height: 150,
                  width: screeWidth*0.85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Text("Sep 16 , 2022 - June 30 , 2023",
                        style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        ),
                      ),   
                        ),
                          SizedBox(height: 10),
                          Text("Computer Engineering",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            )
                          ),
                          ),
                          SizedBox(height: 6),
                          Text("ASOIU",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                            )
                          ),
                          ),
                      ],
                    ),
                  )
                  ),
                  SizedBox(height: 30),
                    Container(
                  height: 150,
                  width: screeWidth*0.85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Text("Sep 16 , 2023 - June 30 , 2026",
                        style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        ),
                      ),   
                        ),
                          SizedBox(height: 10),
                          Text("SABAH Groups",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            )
                          ),
                          ),
                          SizedBox(height: 6),
                          Text("ASOIU",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                            )
                          ),
                          ),
                      ],
                    ),
                  )
                  ),
                  SizedBox(height: 30),
                    Container(
                  height: 150,
                  width: screeWidth*0.85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Text("May 10 , 2023 - Dec 10 , 2023",
                        style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        ),
                      ),   
                        ),
                          SizedBox(height: 10),
                          Text("Flutter & C# ",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            )
                          ),
                          ),
                          SizedBox(height: 6),
                          Text("CodeNext Innovation School",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                            )
                          ),
                          ),
                      ],
                    ),
                  )
                  ),
                  SizedBox(height: 30),
                  Container(
                  height: 150,
                  width: screeWidth*0.85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Text("Sep 16 , 2024 - Jan 30 , 2025",
                        style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        ),
                      ),   
                        ),
                          SizedBox(height: 10),
                          Text("Mobile Programming",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            )
                          ),
                          ),
                          SizedBox(height: 6),
                          Text("Udemy Platform",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                            )
                          ),
                          ),
                      ],
                    ),
                  )
                  ),
                  SizedBox(height: 30),
                  Container(
                  height: 150,
                  width: screeWidth*0.85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Text("May 13 , 20253 - June 24 , 2025",
                        style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        ),
                      ),   
                        ),
                          SizedBox(height: 10),
                          Text("Mobil Development",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            )
                          ),
                          ),
                          SizedBox(height: 6),
                          Text("Coursera Platform",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                            )
                          ),
                          ),
                      ],
                    ),
                  )
                  ),
                    ],
                  ),
                );
}
Container skills_Part(){
  return Container(
                    key: skillsKey,
                    child: Column(
                      children: [
                        Center(
                    child: Text("Tech Stack",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )
                    ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Learning constantly, Building confidently",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                    color: Colors.white30,
                    textStyle: TextStyle(
                      fontSize: 16,
                    )
                  ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                            height: 160,
                            width: 130,
                              image: NetworkImage(
                                "https://img.pikbest.com/origin/10/41/85/35HpIkbEsTU62.png!f305cw"
                              )
                              )
                          ),
                          SizedBox(width: 25),
                          SizedBox(width: 25),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                              width: 110,
                              height: 120,
                              image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/640px-Python-logo-notext.svg.png"
                              )
                              )
                          ),
                          SizedBox(width: 25),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                              width: 135,
                              height: 150,
                              image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/4/4f/Csharp_Logo.png",
                              )
                              )
                          ),
                          SizedBox(width: 25),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                            height: 130,
                            width: 130,
                              image: NetworkImage(
                                "https://images.velog.io/images/dev_zzame/post/52c84788-6beb-4e89-a56c-bb6518e7be7b/image2-1.webp"
                              )
                              )
                          ),
                          SizedBox(width: 25),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                            height: 110,
                            width: 110,
                              image: NetworkImage(
                                "https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png",
                              ),
                              )
                          ),
                          SizedBox(width: 40),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                            height: 110,
                            width: 110,
                              image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/1200px-Octicons-mark-github.svg.png",
                              ),
                              )
                          ),
                          SizedBox(width: 30,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              fit: BoxFit.cover,
                            height: 110,
                            width: 110,
                              image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Figma-dynamic-color.png/1200px-Figma-dynamic-color.png",
                              ),
                              )
                          ),
                          SizedBox(width: 15,),
                      ],
                    ),
                  ),
                ),
                      ],
                    ),
                  );
}
Container contact_Part(){
  return Container(
                    key: contactKey,
                    child: Column(
                      children: [
                          Center(
                  child: Text("Contact Me",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  ),
                ),
                  SizedBox(height: 20),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text("Let’s turn visions into reality — together.",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                    color: Colors.white30,
                    textStyle: TextStyle(
                      fontSize: 16,
                    )
                  ),
                  ),
                ),
                SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(onPressed: (){
                                ShowCallInfo(context);
                                }, icon: Icon(Icons.phone,size: 25,color: Colors.amber),tooltip: "Call me",)
                              //Icon(Icons.phone,size: 25,color: Colors.amber,),
                            ),
                          ),
                          //SizedBox(width: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Tooltip(
                              message: "GitHub",
                              child: GestureDetector(
                                onTap: openGitHubUri,
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Icon(FontAwesomeIcons.github,size: 25,color: Colors.amber,)
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(width: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Tooltip(
                              message: "LinkedIn",
                              child: GestureDetector(
                                onTap: openLinkedInUri,
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Icon(FontAwesomeIcons.linkedinIn,size: 25,color: Colors.amber,),
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(width: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(onPressed: (){ShowEmailInfo(context);}, icon: Icon(Icons.email,size: 25,color: Colors.amber),tooltip: "Send me an Email",)
                              ),
                            ),
                          SizedBox(width: 10),
                        ],
                        ),
                ),
                      SizedBox(height: 100),
                      ],
                    ),
                  );
}


  AppBar appBar_Part(){
    return AppBar(
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
      );
  }

  Drawer drawer_Part(){
    return Drawer(
          backgroundColor: const Color.fromARGB(255, 7, 8, 0),
          width: 250,
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return FullImage();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage("lib/assets/my.png"),
                      //backgroundColor: Colors.transparent,
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Chingiz Zaidov",style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                )
              ),
              ),
              SizedBox(height: 5),
              Text("Flutter Developer",style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70
                )
              ),),
              SizedBox(height: 30),

              Divider(color: Colors.white24,thickness: 1,indent: 40,endIndent: 40),

              Expanded(
                child: ListView(
                          children: [
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
              const SizedBox(height: 20),
            ],
          ),
        );
  }
  
  Container body_Part()
  {
    return Container(
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
          controller: scrollController,
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.antiAlias,
            children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                home_Part(),
                about_Part(),
                SizedBox(height: 100),
                experience_Part(),
                SizedBox(height: 100),
                skills_Part(),
                SizedBox(height: 80),
                contact_Part(),
              ],
            ),
            ],
          ),
        ),
      );
  }
  
  FloatingActionButton fab_Part(){
    return FloatingActionButton(
        onPressed: (){
          scrollController.animateTo(
            0.0, 
            duration: Duration(milliseconds: 850),
            curve: Curves.easeInOut
            );
        },
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tooltip: "Back to Top",
        child: Icon(Icons.arrow_upward_sharp,size: 30,color: Colors.white),
        );
  }
 
  @override
  Widget build(BuildContext context) {
    screeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar_Part(),
      endDrawer: drawer_Part(),
      body: body_Part(),
      floatingActionButton: fab_Part(),
    );
  }
}
