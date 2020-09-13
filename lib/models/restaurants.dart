import 'package:flutter/foundation.dart';
import 'package:food_app_ui/models/food.dart';

class Restaurant {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final double distance;
  final List<Food> menu;

  Restaurant(
      {this.imageUrl,
      this.name,
      this.address,
      this.rating,
      this.menu,
      @required this.distance});
}
