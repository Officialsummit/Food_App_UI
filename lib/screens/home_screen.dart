import 'package:flutter/material.dart';
import 'package:food_app_ui/data/data.dart';
import 'package:food_app_ui/widgets/recent_orders.dart';
import 'package:food_app_ui/widgets/restaurants_list.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle, size: 30),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Food',
              style: GoogleFonts.robotoCondensed(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'Ghar',
              style: GoogleFonts.robotoCondensed(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          FlatButton(
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: GoogleFonts.robotoCondensed(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                hintText: 'Search Food or Restaurants',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  'Recent Orders',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              RestaurantListWidget(),
            ],
          )
        ],
      ),
    );
  }
}
