import 'package:booking_app/models/list_item.dart';
import 'package:flutter/material.dart';

final List<ListItem> regulationHotelList = [
  ListItem(
    value: 'check_in_out',
    label: 'Check-in/Check-out Time',
    text: 'Check-in: From 14:00 - Check-out: Before: 12:00',
    icon: Icons.access_time
  ),
  ListItem(
    value: 'documents',
    label: 'Required Documents',
    text: 'Upon check-in, you are required to bring ID Card. Please bring the required documents in hard copy.',
    icon: Icons.file_copy_sharp
  ),
  ListItem(
    value: 'facility',
    label: 'Facility',
    text: 'Spa closed temporarily from 16-10-2023 to 31-12-2025.',
    icon: Icons.stream_sharp
  ),
  ListItem(
    value: 'early_check_in',
    label: 'Early Check-in',
    text: 'You\'re allowed to check-in before the accommodation\'s check-in time. If you wish to do so, please contact the accommodation. Additional charges apply.',
    icon: Icons.timer
  ),
  ListItem(
    value: 'late_check_out',
    label: 'Late Check-out',
    text: 'You\'re allowed to check-out past the accommodation\'s check-out time. If you wish to do so, please contact the accommodation. Additional charges apply.',
    icon: Icons.access_alarm
  ),
  ListItem(
    value: 'extra_breakfast',
    label: 'Extra Breakfast',
    text: 'Accommodation charges IDR 150,000/guest for extra breakfast.',
    icon: Icons.food_bank
  ),
  ListItem(
    value: 'breakfast',
    label: 'Breakfast',
    text: 'Breakfast at the accommodation will be provided from 07:00 - 10:00.',
    icon: Icons.restaurant
  ),
  ListItem(
    value: 'smoking',
    label: 'Smoking',
    text: 'Smoking is allowed only in the designated smoking area.',
    icon: Icons.smoking_rooms
  ),
  ListItem(
    value: 'pets',
    label: 'Pets',
    text: 'Pets are not allowed in the accommodation.',
    icon: Icons.pets
  ),
  ListItem(
    value: 'additional_policy',
    label: 'Additional Policy',
    text: 'All Hotel in Bali will not provide check-in or check-out service on this day.',
    icon: Icons.document_scanner
  ),
  ListItem(
    value: 'airport_transfer',
    label: 'Airport Transfer',
    text: 'Airport transfer is available for USD 20/person.',
    icon: Icons.airport_shuttle
  ),
  ListItem(
    value: 'gala_dinner',
    label: 'Gala Dinner',
    text: 'There will be mandatory gala dinner (New Year Eve Gala Dinner) on 31-12-2024 - 31-12-2025.',
    icon: Icons.dining_rounded
  )
];