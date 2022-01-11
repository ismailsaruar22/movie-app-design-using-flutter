
import 'movie_model.dart';

final movies = [
  Movie(id: 1, name: 'Avengers',category: 'Action/Sci-fi', releaseDate: '2012', rating: 7.2, image: 'images/avangers.jpg'),
  Movie(id: 2, name: 'Avatar',category: 'Action/Sci-fi', releaseDate: '2013', rating: 6.2, image: 'images/avatar.jpg'),
  Movie(id: 3, name: '2012',category: 'Action/Sci-fi', releaseDate: '2014', rating: 7.2, image: 'images/2012.jpg'),
  Movie(id: 4, name: 'Frozen',category: 'Action/Sci-fi', releaseDate: '2015', rating: 8.2, image: 'images/frozen.jpg'),
  Movie(id: 5, name: 'Spiderman',category: 'Action/Sci-fi', releaseDate: '2016', rating: 9.2, image: 'images/spidarman.jpg'),
  Movie(id: 6, name: 'Twilight',category: 'Action/Sci-fi', releaseDate: '2017', rating: 7.2, image: 'images/twilight.jpg'),
  Movie(id: 7, name: 'Thor',category: 'Action/Sci-fi', releaseDate: '2011', rating: 6.2, image: 'images/thor.jpg'),
  Movie(id: 8, name: 'After',category: 'Romance', releaseDate: '2017', rating: 7.2, image: 'images/after.jpg'),
  Movie(id: 9, name: 'Harry Potter',category: 'Fantasy', releaseDate: '2011', rating: 8.2, image: 'images/harry potter.jpg'),
  Movie(id: 10, name: 'Troy',category: 'War', releaseDate: '2017', rating: 7.0, image: 'images/troy.jpg'),
];
final List <String> categoryList = [
  'Action',
  'Action/Sci-fi',
  'Comedy',
  'Thriller',
  'Horror',
  'Romance',
  'Fantasy'
];

const String movieDetials = '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been 
the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make 
a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially 
unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with 
desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be
 distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a 
 more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable
  English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a 
  search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years,
   sometimes by accident, sometimes on purpose (injected humour and the like) vero eos et accusamus et iusto odio dignissimos
    ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi 
     occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum
      et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nob
      is est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas 
       est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus 
        eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapi
        ente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus 
         repella. ''';