import 'package:booking_app/constants/amenity_const.dart';
import 'package:flutter/widgets.dart';

class Amenity {
  final String name;
  final IconData? icon;
  final String? desc;
  final double price;

  Amenity({
    required this.name,
    this.icon,
    this.desc,
    this.price = 0
  });
}

final List<Amenity> addonHomeAmenities = [
  Amenity(
    name: 'Breakfast',
    icon: amenityIcon['Restaurant'],
    price: 10,
  ),
  Amenity(
    name: 'Snack & Drinks',
    icon: amenityIcon['Snack & Drinks'],
    price: 5,
  ),
  Amenity(
    name: 'Coffee & Tea',
    icon: amenityIcon['Coffee & Tea'],
    price: 3,
  ),
  Amenity(
    name: 'Cleaning Services',
    icon: amenityIcon['Cleaning Services'],
    price: 5,
  ),
  Amenity(
    name: 'Smoking',
    icon: amenityIcon['Smoking'],
    price: 2,
  ),
  Amenity(
    name: 'Laundry',
    icon: amenityIcon['Laundry'],
    price: 10,
  )
];

final List<Amenity> addonWorkspaceAmenities = [
  Amenity(
    name: 'Dedicated Desk',
    icon: amenityIcon['Dedicated Desk'],
    price: 30,
  ),
  Amenity(
    name: 'Snack & Drinks',
    icon: amenityIcon['Snack & Drinks'],
    price: 5,
  ),
  Amenity(
    name: 'Coffee & Tea',
    icon: amenityIcon['Coffee & Tea'],
    price: 3,
  ),
  Amenity(
    name: 'VIP Room',
    icon: amenityIcon['VIP Room'],
    price: 10,
  ),
  Amenity(
    name: 'Meeting Rooms',
    icon: amenityIcon['Meeting Rooms'],
    price: 15,
  ),
  Amenity(
    name: 'Cleaning Services',
    icon: amenityIcon['Cleaning Services'],
    price: 5,
  ),
];

