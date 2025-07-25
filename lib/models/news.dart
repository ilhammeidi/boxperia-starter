import 'package:booking_app/constants/img_api.dart';

class News {
  final String title;
  final String thumb;
  final String date;

  News({required this.title, required this.thumb, required this.date});
}

final List<News> newsList = [
  News(
    title: 'Overstock Sales Calendar: When to Shop to Save the Most',
    thumb: ImgApi.photo[193],
    date: '22 Mar 2024'
  ),
  News(
    title: 'Lovehoney Returns & Discreet Shipping',
    thumb: ImgApi.photo[202],
    date: '23 Mar 2024'
  ),
  News(
    title: 'Macy\'s Cyber Monday Guide',
    thumb: ImgApi.photo[203],
    date: '22 Mar 2024'
  ),
  News(
    title: 'Labor Day weekend is definitely the best time to shop',
    thumb: ImgApi.photo[183],
    date: '20 Mar 2024'
  ),
  News(
    title: 'Lovehoney Returns & Discreet Shipping',
    thumb: ImgApi.photo[188],
    date: '18 Mar 2024'
  )
];