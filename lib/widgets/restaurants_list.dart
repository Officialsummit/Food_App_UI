import 'package:flutter/material.dart';
import 'package:food_app_ui/data/data.dart';
import 'package:food_app_ui/models/restaurants.dart';
import 'package:food_app_ui/screens/restaurant_screen.dart';
import 'package:food_app_ui/widgets/rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RestaurantScreen(restaurant: restaurant)));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey[300],
                width: 1.0,
              ),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      fit: BoxFit.cover,
                      height: 150.0,
                      width: 150.0,
                      image: AssetImage(restaurant.imageUrl),
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: GoogleFonts.pattaya(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingStars(
                          rating: restaurant.rating,
                        ),
                        Text(
                          restaurant.address,
                          style: GoogleFonts.pattaya(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 15,
                              color: Colors.deepOrange,
                            ),
                            Text(
                              '${restaurant.distance.toString()} Miles Away',
                              style: GoogleFonts.pattaya(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }
}
