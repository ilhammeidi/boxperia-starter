import 'package:booking_app/models/company.dart';
import 'package:booking_app/models/user.dart';
import 'package:booking_app/constants/img_api.dart';

User userDummy = User(
  id: '1',
  name: 'Jean Doe',
  title: 'Mr',
  avatar: ImgApi.avatar[2],
  idCard: '0123456789',
  dateOfBirth: 'Jan 12, 1994',
  phone: '+628940391122',
  email: 'john_doe@mail.com',
  country: 'Japan',
);

// Content
class ContentApi {
  static const title = 'Lorem ipsum';
  static const subtitle = 'Ut a lorem eu odio cursus laoreet.';
  static const sentences = 'Donec lacus sem, scelerisque sed ligula nec, iaculis porttitor mauris.';
  static const paragraph = 'Sed rutrum augue libero, id faucibus quam aliquet sed. Phasellus interdum orci quam, volutpat ornare eros rhoncus sed. Donec vestibulum leo a auctor convallis. In dignissim consectetur molestie. Vivamus interdum tempor dui, nec posuere augue consequat sit amet. Suspendisse quis semper quam. Nullam nec neque sem.';
  static const location = 'Jl. Loremipsum No. 123, Dummy Village, Fictional District, Imagination City, 12345, France.';
  static const date = '19 Sep 2024';
}

// Project
Company branding = Company(
  id: '1',
  name: 'Booking App',
  logo: '',
  title: 'Easy booking. Endless experience',
  desc: 'Find the best deals on hotels, homestays, and workspaces',
  version: '1.0',
  prefix: 'bxp',
  footerText: 'Find the best deals on hotels, homestays, and workspaces',
  year: 2025,
  logoText: 'Booking App',
  url: 'boxperia.indisains.com'
);
