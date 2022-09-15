// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_flutter_ui/pages/util/coffee_tile.dart';
import 'package:learning_flutter_ui/pages/util/coffee_type.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.notification_important), label: ''),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffe for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find Your Coffee ...",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600))),
          ),
        ),
        SizedBox(height: 25),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
            itemBuilder: (context, index) {
              return CoffeeType(
                coffeeType: coffeeType[index][0],
                isSelected: coffeeType[index][1],
                onTap: () {
                  coffeeTypeSelected(index);
                },
              );
            },
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              coffeetile(
                coffeeImagePath: 'images/cappaciono_latte.jpg',
                coffeeName: "latte",
                coffeePrice: "4.20",
              ),
              coffeetile(
                coffeeImagePath: 'images/latte.jpg',
                coffeeName: "Cappaciono",
                coffeePrice: "4.10",
              ),
              coffeetile(
                coffeeImagePath: 'images/milk.jpg',
                coffeeName: "latte",
                coffeePrice: "3.20",
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
