class Movie {
  final String title;
  final String image;
  final double rating;
  final String? genre;

  Movie({
    required this.title,
    required this.image,
    required this.rating,
    required this.genre,
  });
  static List<Movie> movieList = [
    Movie(
      title: '1917',
      image: 'assets/images/onboard1.png',
      rating: 7.7,
      genre: 'Action',
    ),
    Movie(
      title: 'Captain America',
      image: 'assets/images/onboard2.png',
      rating: 7.7,
      genre: 'Action',
    ),
    Movie(
      title: 'The Dark Knight',
      image: 'assets/images/onboard3.png',
      rating: 7.7,
      genre: 'Action',
    ),
    Movie(
      title: 'Black Widow',
      image: 'assets/images/onboard4.png',
      rating: 7.7,
      genre: 'Action',
    ),

    Movie(
      title: 'The Mask',
      image: 'assets/images/onboard1.png',
      rating: 7.0,
      genre: 'Comedy',
    ),
    Movie(
      title: 'Home Alone',
      image: 'assets/images/onboard2.png',
      rating: 7.5,
      genre: 'Comedy',
    ),
    Movie(
      title: 'Johnny English',
      image: 'assets/images/onboard3.png',
      rating: 6.2,
      genre: 'Comedy',
    ),
    Movie(
      title: 'Mr. Bean’s Holiday',
      image: 'assets/images/onboard4.png',
      rating: 6.4,
      genre: 'Comedy',
    ),
  ];
}
