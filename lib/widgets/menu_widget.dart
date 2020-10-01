import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app_ui/models/food.dart';
import 'package:food_app_ui/models/restaurants.dart';

class MenuWidget extends StatelessWidget {
  final Restaurant restaurant;
  MenuWidget({@required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          restaurant.menu.length,
          (index) {
            Food menuItem = restaurant.menu[index];
            return Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(menuItem.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                  Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.white.withOpacity(0.3),
                          Colors.black54.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 65.0,
                    child: Column(
                      children: [
                        Text(
                          menuItem.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          "${menuItem.price.toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
