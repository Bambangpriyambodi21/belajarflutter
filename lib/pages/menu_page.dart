import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/theme/colors.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/components/food_tile.dart';
import 'package:restaurant/models/food.dart';

import '../components/food_details_page.dart';

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{

  //food menu
  List foodMenu = [
    //salmon sushi
    Food(
        name: "Salmon Sushi",
        price: 35000,
        imagePath: "lib/images/sushi (1).png",
        rating: "4.86"
    ),

    //tuna
    Food(
        name: "Tuna Sushi",
        price: 40000,
        imagePath: "lib/images/sushi (2).png",
        rating: "4.95"
    ),
  ];

  //navigasi ke halaman food item details
  void navigateToFoodDetails(int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),

        title: Text(
          "Tokyo",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //promo message
                    Text(
                      'Get 40% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    //redem button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),

                //image

                Image.asset(
                  'lib/images/sushi.png',
                  height: 100,)
              ],
            ),
          ),

          const SizedBox(height: 25,),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here...."
              ),
            ),
          ),

          const SizedBox(height: 25,),

          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodMenu.length,
                    itemBuilder: (context, index) => FoodTile(
                      food: foodMenu[index],
                      onTap: () => navigateToFoodDetails(index),
                    )
                ),

          ),

          const SizedBox(height: 20,),

          //popular food
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),

              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/images/sushi.png',
                        height: 60,
                      ),

                      const SizedBox(width: 20,),

                      //name+price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Salmon Eggs",
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                          ),

                          const SizedBox(height: 10,),

                          //price
                          Text(
                            '\$ 21.00',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //heart
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 28,
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}