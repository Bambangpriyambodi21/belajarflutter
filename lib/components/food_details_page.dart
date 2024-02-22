import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/theme/colors.dart';

import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget{
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage>{

  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity(){
    setState(() {
      quantityCount--;
    });
  }

  //increment quantity
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  // add to cart
  void addToCart(){}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //image
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),

                const SizedBox(width: 5,),

              //rating
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),

                    const SizedBox(height: 10,),

                    //rating number
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                  const SizedBox(height: 10,),

                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(height: 10,),

                  //deskripsi
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Text(
                    "Sushi is a traditional Japanese dish consisting of vinegared rice combined with various ingredients such as raw or cooked seafood, vegetables, and occasionally tropical fruits, wrapped in seaweed (nori) or served as bite-sized pieces. It's renowned for its delicate balance of flavors, textures, and presentation. Sushi can be served in various forms, including nigiri (a slice of fish atop a small bed of rice), maki (rolled sushi with rice and ingredients wrapped in nori), sashimi (sliced raw fish served without rice), and more elaborate creations like sushi rolls with diverse fillings. It's often accompanied by soy sauce, wasabi, and pickled ginger, with each element contributing to its distinctive taste experience.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price, quantity, cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                  //price, quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text("\Rp. "+widget.food.price.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),

                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white,),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        // quality
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),

                        // plus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white,),
                            onPressed: incrementQuantity,
                          ),
                        )

                      ],
                    )
                  ],
                ),

                const SizedBox(height: 25,),

                // add cart button
                MyButton(text: "add to cart", onTap: addToCart)
              ],
            ),
          )

        ],
      ),
    );
  }
}