import 'package:booking_app/constants/booking_status.dart';
import 'package:booking_app/models/working_room.dart';
import 'package:booking_app/models/workspace.dart';

final List<String> bookingWorkspaceSteps = ['Schedule', 'Facilities', 'Review', 'Payment', 'Done'];

class BookingWorkspace {
  final String id;
  final Workspace? workspace;
  final WorkingRoom? room;
  final DateTime dateOrder;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final BookStatus status;

  BookingWorkspace({
    required this.id,
    this.workspace,
    this.room,
    required this.dateOrder,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.status
  });
}

final List<BookingWorkspace> bookingWorkspaceList = [
  BookingWorkspace(
    id: '1',
    workspace: workspaceList[0],
    room: workingRoomList[0],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    startDate: DateTime.parse('2025-07-20 20:18:00'),
    endDate: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.active
  ),
  BookingWorkspace(
    id: '2',
    workspace: workspaceList[1],
    room: workingRoomList[1],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    startDate: DateTime.parse('2025-07-20 20:18:00'),
    endDate: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.waiting
  ),
  BookingWorkspace(
    id: '3',
    workspace: workspaceList[3],
    room: workingRoomList[0],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    startDate: DateTime.parse('2025-07-20 20:18:00'),
    endDate: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.done
  ),
  BookingWorkspace(
    id: '4',
    workspace: workspaceList[2],
    room: workingRoomList[3],
    dateOrder: DateTime.parse('2025-06-20 20:18:00'),
    price: 800,
    startDate: DateTime.parse('2025-07-20 20:18:00'),
    endDate: DateTime.parse('2025-07-21 20:18:00'),
    status: BookStatus.done
  ),
];