import 'package:flutter/material.dart';

class Globalkey extends StatefulWidget {
  @override
  State<Globalkey> createState() => _GlobalkeyState();
}

class _GlobalkeyState extends State<Globalkey> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(content: Text("Context not found")),
      );
    }
  }

  int hoveredIndex = -1;

  late List<Map<String, dynamic>> drawerSections;

  @override
  void initState() {
    super.initState();
    drawerSections = [
      {'title': 'Home', 'key': homeKey},
      {'title': 'About Us', 'key': aboutKey},
      {'title': 'Skills', 'key': skillsKey},
      {'title': 'Projects', 'key': projectsKey},
      {'title': 'Contact Us', 'key': contactKey}
    ];
  }


//AppBar Part 
AppBar appBarPart() {
  return AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("lib/assets/picture.jpeg"),
            radius: 20,
          ),
        ),
        backgroundColor: Colors.amberAccent.shade100,
        title: Text("Cingiz Portfolio"),
        centerTitle: true,
      );
}

//EndDrawer Part 
Drawer endDrawerPart(){
  return Drawer(
        backgroundColor: const Color.fromARGB(255, 7, 8, 0),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              curve: Curves.linear,
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 25),
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
                      style: TextStyle(
                        color: hoveredIndex == i
                            ? Colors.amberAccent
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      scrollTo(drawerSections[i]['key'] as GlobalKey);
                      Navigator.pop(context);
                    },
                    splashColor: Colors.cyanAccent,
                  ),
                ),
              ),
          ],
        ),
      );
}

//Body Part
SingleChildScrollView bodyPart(){
  final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;
       return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              key: homeKey,
              height: screenHeight,
              width: screenWidht,
              color: Colors.amber,
              child: Center(
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              key: aboutKey,
              height: screenHeight,
              width: screenWidht,
              color: const Color.fromARGB(255, 124, 226, 41),
              child: Center(
                child: Text(
                  "About Us",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              key: skillsKey,
              height: screenHeight,
              width: screenWidht,
              color: const Color.fromARGB(255, 232, 81, 89),
              child: Center(
                child: Text(
                  "Skills",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              key: projectsKey,
              height: screenHeight,
              width: screenWidht,
              color: const Color.fromARGB(255, 82, 142, 215),
              child: Center(
                child: Text(
                  "Projects",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              key: contactKey,
              height: screenHeight,
              width: screenWidht,
              color: const Color.fromARGB(255, 227, 181, 148),
              child: Center(
                child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 132, 123, 123).withRed(30),
      appBar: appBarPart(),
      endDrawer: endDrawerPart(),
      body: bodyPart(),
    );
  }
}
