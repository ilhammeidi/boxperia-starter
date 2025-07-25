import 'package:booking_app/constants/img_api.dart';

class WorkingRoom {
  final String id;
  final String name;
  final String description;
  final List<String> photos;
  final double price;
  final int guests;
  final List<String> facilities;
  final int size;
  final bool isAvailable;
  final bool smokingAllowed;

  WorkingRoom({
    required this.id,
    required this.name,
    required this.description,
    required this.photos,
    required this.price,
    required this.guests,
    required this.facilities,
    required this.size,
    this.isAvailable = true,
    this.smokingAllowed = false,
  });
  
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';    
}

final List<WorkingRoom> workingRoomList = [
  WorkingRoom(
    id: '1',
    name: 'Private Office',
    description: 'A private office space with all the amenities you need.',
    photos: [ImgApi.photo[128], ImgApi.photo[104], ImgApi.photo[108], ImgApi.photo[114], ImgApi.photo[126]],
    price: 150,
    guests: 10,
    facilities: [
      'Free Wi-Fi',
      'Printer & Scanner',
      'Coffee & Tea',
      'Meeting Rooms',
    ],
    size: 20,
  ),
  WorkingRoom(
    id: '2',
    name: 'Hot Desk',
    description: 'A flexible workspace in a shared environment.',
    photos: [ImgApi.photo[132], ImgApi.photo[129], ImgApi.photo[135], ImgApi.photo[140], ImgApi.photo[142]],
    price: 100,
    guests: 1,
    facilities: [
      'Free Wi-Fi',
      'Coffee & Tea',
      'Snack & Drinks',
      'Free Parking',
    ],
    size: 15,
  ),
  WorkingRoom(
    id: '3',
    name: 'Dedicated Desk',
    description: 'A dedicated workspace with your own desk.',
    photos: [ImgApi.photo[130], ImgApi.photo[127], ImgApi.photo[122], ImgApi.photo[129], ImgApi.photo[137]],
    price: 120,
    guests: 1,
    facilities: [
      'Free Wi-Fi',
      'Printer & Scanner',
      'Coffee & Tea',
      'Meeting Rooms',
    ],
    size: 18,
  ),
  WorkingRoom(
    id: '4',
    name: 'Conference Room',
    description: 'A spacious room for meetings and presentations.',
    photos: [ImgApi.photo[139], ImgApi.photo[140], ImgApi.photo[127], ImgApi.photo[123], ImgApi.photo[115]],
    price: 200,
    guests: 50,
    facilities: [
      'Free Wi-Fi',
      'Projector & Screen',
      'Whiteboard',
      'Coffee & Tea',
    ],
    size: 30,
  ),
  WorkingRoom(
    id: '5',
    name: 'Event Space',
    description: 'A large space for events and gatherings.',
    photos: [ImgApi.photo[110], ImgApi.photo[107], ImgApi.photo[109], ImgApi.photo[148], ImgApi.photo[146]],
    guests: 100,
    price: 300,
    facilities: [
      'Free Wi-Fi',
      'Projector & Screen',
      'Whiteboard',
      'Snack & Drinks',
    ],
    size: 50,
  ),
  WorkingRoom(
    id: '6',
    name: 'Full Floor Office',
    description: 'Move-in ready private floor',
    photos: [ImgApi.photo[125], ImgApi.photo[112], ImgApi.photo[145], ImgApi.photo[114], ImgApi.photo[120]],
    guests: 100,
    price: 300,
    facilities: [
      'Free Wi-Fi',
      'Projector & Screen',
      'Whiteboard',
      'Kitchen',
    ],
    size: 50,
  ),
];              