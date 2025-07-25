import 'package:booking_app/constants/booking_status.dart';
import 'package:booking_app/models/homestay.dart';

final List<String> bookingHomestaySteps = ['Contact', 'Facilities', 'Review', 'Payment', 'Done'];

class BookingHomestay {
  final String id;
  final Homestay? homestay;
  final DateTime dateOrder;
  final double price;
  final DateTime checkin;
  final DateTime checkout;
  final BookStatus status;

  BookingHomestay({
    required this.id,
    this.homestay,
    required this.dateOrder,
    required this.price,
    required this.checkin,
    required this.checkout,
    required this.status
  });
}

final List<BookingHomestay> bookingHomestayList = [
  BookingHomestay(
    id: '1',
    homestay: homestayList[1],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.active
  ),
  BookingHomestay(
    id: '2',
    homestay: homestayList[8],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.waiting
  ),
  BookingHomestay(
    id: '3',
    homestay: homestayList[10],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.done
  ),
  BookingHomestay(
    id: '4',
    homestay: homestayList[4],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    checkin: DateTime.parse('2025-07-20 20:18:00'),
    checkout: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.done
  ),
];