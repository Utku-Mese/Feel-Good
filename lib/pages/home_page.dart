import 'package:alistirma/util/emoji_face.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 152, 71, 166),
        unselectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 33, 68, 243),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 27,
            ),
            label: "All exercises",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 27,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 27,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.blue,
              Color.fromARGB(255, 33, 68, 243),
              Color.fromARGB(255, 128, 33, 243),
              Color.fromARGB(255, 198, 84, 210),
              Color(0xffca485c),
              Colors.red,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.mirror,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    //* header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi, Utku!",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(2.5, 2.5),
                                  blurRadius: 5.0,
                                  color: Color.fromARGB(255, 216, 162, 158),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 109, 177, 232),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Oops!'),
                                    content: const Text("no any notification"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            iconSize: 30,
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //* search bar
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 131, 187, 232),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.red,
                              )),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                          hintText: "Search",
                          hintStyle: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onSubmitted: (String value) async {
                          await showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Sorry!'),
                                content: Text("'$value' is not found."),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    //* how do you feel?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "How do you feel?",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    //* emojis
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        EmojiFace(
                          emoji: "😁",
                          topMessage: "Nice!",
                          message: "I'm so glad you're happy",
                        ),
                        EmojiFace(
                          emoji: "🙂",
                          topMessage: "Nice!",
                          message:
                              "You should do our exercises to cheer up more",
                        ),
                        EmojiFace(
                          emoji: "😐",
                          topMessage: "Himm",
                          message:
                              "We want you to smile so much. You should do the 'Happy people' exercise now",
                        ),
                        EmojiFace(
                          emoji: "😞",
                          topMessage: "Noo!",
                          message:
                              "You shouldn't be unhappy, you can come back to yourself by doing an exercise right away.",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //*bottom menu
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Container(
                    color: const Color.fromARGB(255, 212, 212, 212),
                    child: Center(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),

                        //* exercises heading
                        Text(
                          "EXERCİSES",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        //* listwiew of excercises
                        const SizedBox(
                          height: 25,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: Icon(
                                Icons.tag_faces_rounded,
                                color: Colors.blue[400],
                                size: 35,
                              ),
                              title: Text(
                                "Happy people",
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              subtitle: Text(
                                "This excercis will make you feel happy.",
                                style: GoogleFonts.inter(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 35,
                              ),
                              title: Text(
                                "A good heartbeat",
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              subtitle: Text(
                                "This excercis regulate you heart rate.",
                                style: GoogleFonts.inter(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: const Icon(
                                Icons.bedtime,
                                color: Colors.grey,
                                size: 35,
                              ),
                              title: Text(
                                "A good sleep",
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              subtitle: Text(
                                "This excercis helps you have a good sleep.",
                                style: GoogleFonts.inter(),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: Icon(
                                Icons.add_reaction,
                                color: Colors.green[400],
                                size: 35,
                              ),
                              title: Text(
                                "a regular breath",
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              subtitle: Text(
                                "Regulate your breathing and relax with this exercise.",
                                style: GoogleFonts.inter(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
