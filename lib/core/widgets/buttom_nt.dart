import 'package:flutter/material.dart';
import 'package:trndy_stor/cart/cart.dart';
import 'package:trndy_stor/home/prsntation/home_scren.dart';

import 'package:trndy_stor/screns/screns%20.dart';

class buttom_notfecayion extends StatefulWidget {
  const buttom_notfecayion({super.key});

  @override
  State<buttom_notfecayion> createState() => _buttom_notfecayionState();
}

class _buttom_notfecayionState extends State<buttom_notfecayion> {
  int currindex = 0;
  final List<Widget> _pegest = [
    home_Page(),
    CartPage(),
    start_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pegest[currindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currindex,
          onTap: (index) {
            setState(() {
              currindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: Colors.black),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black), label: "Profile")
          ]),
    );
  }
}
