class RoomPackage {
  final String id;
  final String name;
  final String? description;
  final double price;
  final double discount;
  final bool refundable;
  final List<bool> enableFeature;
  final String per;

  RoomPackage({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.discount = 0,
    this.refundable = false,
    required this.enableFeature,
    required this.per
  });
}

final List<String> roomHotelFeatureList = [
  'Free Wi-Fi',
  'Air Conditioning',
  'Coffee & Tea',
  'Free Breakfast',
  'Smoking',
  'Reschedule',
  'Refundable',
];

final List<String> roomSpaceFeatureList = [
  'Free Wi-Fi',
  'Air Conditioning',
  'VIP Room',
  'Meeting Rooms',
  'Coffee & Tea',
  'Printer & Scanner',
  'Projector & Screen',
];

final List<RoomPackage> roomHotelPackageList = [
  RoomPackage(
    id: '1',
    name: 'Deluxe - Breakfast',
    description: '2 adult - 1 double bed or 2 single bed',
    price: 500,
    discount: 10,
    enableFeature: <bool>[true, true, true, true, false, false, false],
    per: '/room/night before taxes',
  ),
  RoomPackage(
    id: '2',
    name: 'Deluxe - Room Only',
    description: '2 adult - 1 double bed or 2 single bed',
    price: 300,
    discount: 10,
    enableFeature: <bool>[true, true, true, false, false, false, false],
    per: '/room/night before taxes',
  ),
  RoomPackage(
    id: '3',
    name: 'Deluxe - Breakfast',
    description: '1 adult - 1 single bed',
    price: 400,
    discount: 15,
    enableFeature: <bool>[true, true, true, true, false, false, false],
    per: '/room/night before taxes',
  ),
  RoomPackage(
    id: '4',
    name: 'Deluxe - Room Only',
    description: '1 adult - 1 single bed',
    price: 250,
    discount: 5,
    enableFeature: <bool>[true, true, true, false, false, false, false],
    per: '/room/night before taxes',
  ),
  RoomPackage(
    id: '5',
    name: 'Deluxe - Free Cancelation',
    description: '2 adult - 1 double bed or 2 single bed',
    price: 500,
    discount: 0,
    enableFeature: <bool>[true, true, true, true, false, true, true],
    per: '/room/night before taxes',
  )
];

final List<RoomPackage> roomSpacePackageList = [
  RoomPackage(
    id: '1',
    name: 'Team - Ultimate',
    description: 'Move-in ready office with private amenities',
    price: 500,
    discount: 10,
    enableFeature: <bool>[true, true, true, true, true, true, true],
    per: '/space/month before taxes',
  ),
  RoomPackage(
    id: '2',
    name: 'Team - Office',
    description: 'Spacious full-floor office space for lease, perfect for large teams.',
    price: 300,
    discount: 10,
    enableFeature: <bool>[true, true, true, true, true, false, false],
    per: '/space/month before taxes',
  ),
  RoomPackage(
    id: '3',
    name: 'Team - Basic',
    description: 'Well-equipped spaces for your team essential needs',
    price: 150,
    discount: 15,
    enableFeature: <bool>[true, true, true, true, false, false, false],
    per: '/space/month before taxes',
  ),
];