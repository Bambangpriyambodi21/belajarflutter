import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/components/button.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 93, 85),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  const SizedBox(height: 25),

                  //shop name
                  Text(
                    "Restaurant Sushi",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('lib/images/sushi.png'),
                  ),

                  const SizedBox(height: 25),

                  //title
                  Text(
                    "The Taste Of Japanese Food",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 25),

                  //subtitle
                  Text(
                    "Sushi is a traditional Japanese dish featuring vinegared rice combined with seafood or vegetables served in various forms like nigiri or maki known for its delicate flavors and artistic presentation",
                    style: TextStyle(
                      color: Colors.grey[200],
                      height: 2,
                    ),
                  ),

                  const SizedBox(height: 35),

                  MyButton(
                      text: "Get Started",
                    onTap: (){
                        Navigator.pushNamed(context, '/menupage');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}