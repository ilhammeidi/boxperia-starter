import 'package:booking_app/constants/img_api.dart';

class HotelRoom {
  final String id;
  final String name;
  final String description;
  final List<String> photos;
  final List<String> amenities;
  final int size;
  final int maxGuest;
  final int bed;
  final bool smoke;
  final bool refundable;
  final double price;
  final double discount;

  HotelRoom({
    required this.id,
    required this.name,
    required this.description,
    required this.photos,
    required this.amenities,
    required this.size,
    this.maxGuest = 1,
    this.bed = 1,
    this.smoke = false,
    this.refundable = false,
    required this.price,
    this.discount = 0
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  double get finalPrice => (price - price * discount / 100);
}

final List<HotelRoom> roomList = [
  HotelRoom(
    id: 'r1',
    name: 'Deluxe Double Room',
    description: 'Spacious room with a queen-sized bed, perfect for couples or business travelers.',
    photos: [ImgApi.photo[21], ImgApi.photo[22], ImgApi.photo[31], ImgApi.photo[32], ImgApi.photo[41], ImgApi.photo[42]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'TV', 'Snack & Drinks', 'Free Breakfast'],
    size: 25,
    maxGuest: 2,
    bed: 1,
    smoke: false,
    refundable: true,
    price: 120.0,
    discount: 10,
  ),
  HotelRoom(
    id: 'r2',
    name: 'Superior King Room',
    description: 'Enjoy your stay in a large room with a king-size bed and city view.',
    photos: [ImgApi.photo[24], ImgApi.photo[23], ImgApi.photo[33], ImgApi.photo[34], ImgApi.photo[43], ImgApi.photo[44]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'TV', 'Fitness Center', 'Restaurant'],
    size: 30,
    maxGuest: 2,
    bed: 1,
    smoke: true,
    refundable: false,
    price: 150.0,
  ),
  HotelRoom(
    id: 'r3',
    name: 'Standard Twin Room',
    description: 'Ideal for friends or family, featuring two single beds and modern amenities.',
    photos: [ImgApi.photo[28], ImgApi.photo[26], ImgApi.photo[35], ImgApi.photo[36], ImgApi.photo[45], ImgApi.photo[46]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'TV', 'Spa & Wellness Center', 'Fitness Center'],
    size: 22,
    maxGuest: 2,
    bed: 2,
    smoke: false,
    refundable: true,
    price: 90.0,
    discount: 5,
  ),
  HotelRoom(
    id: 'r4',
    name: 'Executive Suite',
    description: 'Luxurious suite with living area, work desk, and premium services.',
    photos: [ImgApi.photo[27], ImgApi.photo[28], ImgApi.photo[37], ImgApi.photo[38], ImgApi.photo[47], ImgApi.photo[48]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'Restaurant', 'Fitness Center', 'Free Breakfast'],
    size: 40,
    maxGuest: 3,
    bed: 1,
    smoke: false,
    refundable: true,
    price: 250.0,
    discount: 15,
  ),
  HotelRoom(
    id: 'r5',
    name: 'Family Room',
    description: 'Comfortable room suitable for families with children.',
    photos: [ImgApi.photo[29], ImgApi.photo[30], ImgApi.photo[39], ImgApi.photo[40], ImgApi.photo[49], ImgApi.photo[50]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'Fitness Center', 'Spa & Wellness Center', 'Free Breakfast'],
    size: 35,
    maxGuest: 4,
    bed: 2,
    smoke: false,
    refundable: false,
    price: 180.0,
  ),
  HotelRoom(
    id: 'r6',
    name: 'Budget Room',
    description: 'Affordable option with essential facilities.',
    photos: [ImgApi.photo[31], ImgApi.photo[24], ImgApi.photo[32], ImgApi.photo[34], ImgApi.photo[42], ImgApi.photo[44]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'TV', 'Spa & Wellness Center', 'Restaurant'],
    size: 15,
    maxGuest: 3,
    bed: 1,
    smoke: false,
    refundable: false,
    price: 45.0,
  ),
  HotelRoom(
    id: 'r7',
    name: 'Ocean View Room',
    description: 'Relax with a beautiful view of the ocean from your balcony.',
    photos: [ImgApi.photo[41], ImgApi.photo[28], ImgApi.photo[36], ImgApi.photo[38], ImgApi.photo[46], ImgApi.photo[48]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'Coffee & Tea', 'Spa & Wellness Center', 'Free Parking'],
    size: 28,
    maxGuest: 2,
    bed: 1,
    smoke: true,
    refundable: true,
    price: 200.0,
    discount: 20,
  ),
  HotelRoom(
    id: 'r8',
    name: 'Studio Room',
    description: 'Open plan studio with kitchenette and workspace.',
    photos: [ImgApi.photo[42], ImgApi.photo[25], ImgApi.photo[33], ImgApi.photo[35], ImgApi.photo[43], ImgApi.photo[45]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'TV', 'Free Parking', 'Free Breakfast'],
    size: 32,
    maxGuest: 2,
    bed: 1,
    smoke: false,
    refundable: true,
    price: 135.0,
  ),
  HotelRoom(
    id: 'r9',
    name: 'Presidential Suite',
    description: 'Top-tier suite offering unparalleled comfort, service, and luxury.',
    photos: [ImgApi.photo[43], ImgApi.photo[29], ImgApi.photo[37], ImgApi.photo[39], ImgApi.photo[47], ImgApi.photo[49]],
    amenities: ['Free Wi-Fi', 'Coffee & Tea', 'Free Parking', 'Spa & Wellness Center', 'Free Breakfast'],
    size: 60,
    maxGuest: 4,
    bed: 2,
    smoke: false,
    refundable: true,
    price: 500.0,
    discount: 25,
  ),
  HotelRoom(
    id: 'r10',
    name: 'Garden View Room',
    description: 'Cozy room overlooking the tranquil garden.',
    photos:[ImgApi.photo[45], ImgApi.photo[59], ImgApi.photo[40], ImgApi.photo[49], ImgApi.photo[30], ImgApi.photo[39]],
    amenities: ['Free Wi-Fi', 'Air Conditioning', 'TV', 'Free Parking', 'Free Breakfast'],
    size: 26,
    maxGuest: 2,
    bed: 1,
    smoke: false,
    refundable: false,
    price: 110.0,
  ),
];
