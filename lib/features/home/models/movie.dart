import 'package:cinezone_app/features/home/models/cast_member.dart';

class Movie {
  final String title;
  final String image;
  final double rating;
  final String genre;
  final String? summary;
  final List<CastMember> cast;

  Movie({
    required this.title,
    required this.image,
    required this.rating,
    required this.genre,
    required this.summary,
    required this.cast,
  });

  static List<CastMember> defaultCast = [
    CastMember(
      name: 'Hayley Atwell',
      character: 'Captain Carter',
      image: 'assets/images/cast.jpg',
    ),
    CastMember(
      name: 'Elizabeth Olsen',
      character: 'Wanda Maximoff / The Scarlet Witch',
      image: 'assets/images/cast.jpg',
    ),
    CastMember(
      name: 'Rachel McAdams',
      character: 'Dr. Christine Palmer',
      image: 'assets/images/cast.jpg',
    ),
    CastMember(
      name: 'Charlize Theron',
      character: 'Clea',
      image: 'assets/images/cast.jpg',
    ),
  ];

  static const String defaultSummary =
      'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse...';

  static List<Movie> movieList = [
    Movie(
      title: 'Captain America',
      image: 'assets/images/onboard2.png',
      rating: 7.7,
      genre: 'Action',
      summary: defaultSummary,
      cast: defaultCast,
    ),
    Movie(
      title: 'The Dark Knight',
      image: 'assets/images/onboard3.png',
      rating: 7.7,
      genre: 'Action',
      summary: defaultSummary,
      cast: defaultCast,
    ),
    Movie(
      title: 'Black Widow',
      image: 'assets/images/onboard4.png',
      rating: 7.7,
      genre: 'Action',
      summary: defaultSummary,
      cast: defaultCast,
    ),
    Movie(
      title: 'The Mask',
      image: 'assets/images/onboard1.png',
      rating: 7.0,
      genre: 'Comedy',
      summary: defaultSummary,
      cast: defaultCast,
    ),
    Movie(
      title: 'Home Alone',
      image: 'assets/images/onboard2.png',
      rating: 7.5,
      genre: 'Comedy',
      summary: defaultSummary,
      cast: defaultCast,
    ),
    Movie(
      title: 'Johnny English',
      image: 'assets/images/onboard3.png',
      rating: 6.2,
      genre: 'Comedy',
      summary: defaultSummary,
      cast: defaultCast,
    ),
    Movie(
      title: 'Mr. Bean’s Holiday',
      image: 'assets/images/onboard4.png',
      rating: 6.4,
      genre: 'Comedy',
      summary: defaultSummary,
      cast: defaultCast,
    ),
  ];
}
