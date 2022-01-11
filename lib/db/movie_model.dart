const String tableMovie = 'tbl_movie';
const String tableMovieColId = 'id';
const String tableMovieColName = 'name';
const String tableMovieColCategory = 'category';
const String tableMovieColReleaseDate = 'release_date';
const String tableMovieColImage = 'image';
const String tableMovieColRating = 'Rating';
const String tableMovieColFavorite = 'favorite';
class Movie {
  int id;
  String name;
  String category;
  String releaseDate;
  String image;
  double rating;
  bool isFavorite;

  Movie(
      {this.id = -1,
      required this.name,
      required this.category,
      required this.releaseDate,
      this.image = 'images/after.jpg',
      this.rating = 0.0,
        this.isFavorite = false,
      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableMovieColName: name,
      tableMovieColCategory: category,
      tableMovieColReleaseDate: releaseDate,
      tableMovieColImage: image,
      tableMovieColRating: rating,
      tableMovieColFavorite: isFavorite? 1 : 0,
    };
    if(id > 0){
      map[tableMovieColId] =id;
    }
    return map;
  }

  factory Movie.fromMap(Map<String, dynamic> map) => Movie(
        id: map[tableMovieColId],
        name: map[tableMovieColName],
        category: map[tableMovieColCategory],
        releaseDate: map[tableMovieColReleaseDate],
        image: map[tableMovieColImage],
        rating: map[tableMovieColRating],
        isFavorite: map[tableMovieColFavorite] == 1 ? true : false,
  );
}
