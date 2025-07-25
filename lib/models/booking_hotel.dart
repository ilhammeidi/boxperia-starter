import 'package:booking_app/constants/booking_status.dart';
import 'package:booking_app/models/hotel.dart';
import 'package:booking_app/models/hotel_room.dart';

final List<String> bookingHotelSteps = ['Contact', 'Amenities', 'Review', 'Payment', 'Done'];

class BookingHotel {
  final String id;
  final Hotel? hotel;
  final HotelRoom? room;
  final DateTime dateOrder;
  final double price;
  final DateTime checkin;
  final DateTime checkout;
  final BookStatus status;

  BookingHotel({
    required this.id,
    this.hotel,
    this.room,
    required this.dateOrder,
    required this.price,
    required this.checkin,
    required this.checkout,
    required this.status
  });
}

final List<BookingHotel> bookingHotelList = [
  BookingHotel(
    id: '1',
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    hotel: hotelList[10],
    room: roomList[2],
    price: 500,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.active
  ),
  BookingHotel(
    id: '2',
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    hotel: hotelList[4],
    room: roomList[2],
    price: 800,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.active
  ),
  BookingHotel(
    id: '3',
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    hotel: hotelList[11],
    room: roomList[2],
    price: 400,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.done
  ),
  BookingHotel(
    id: '4',
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    hotel: hotelList[13],
    room: roomList[4],
    price: 1000,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.done
  ),
];