import 'package:flutter/material.dart';
import 'package:movie_app/db/movie_model.dart';
import 'package:movie_app/db/sqlite_db.dart';
import 'package:movie_app/db/temp_db.dart';
import 'package:movie_app/helper_functions.dart';

class NewMoviePage extends StatefulWidget {
  static const String routeName = '/new_movie';

  const NewMoviePage({Key? key}) : super(key: key);

  @override
  _NewMoviePageState createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  String? category;
  String? releaseDate;
  final _formKey = GlobalKey<FormState> ();
  final nameController = TextEditingController();
  final ratingController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    ratingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Movie Page'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: ' Movie Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: ratingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: ' Movie Rating(Optional)',
              ),
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  if (double.parse(value) < 0.0 || double.parse(value) > 10.0) {
                    return 'The rating should be between 0 and 10';
                  }
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: DropdownButton<String>(
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    category = value;
                  });
                },
                hint: const Text('Select Category'),
                value: category,
                items: categoryList
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
              ),
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          _showDatePickerDialog();
                        },
                        child: const Text('Select date')),
                    Text(releaseDate == null ? '' : releaseDate!)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: _saveMovie, child: const Text('Save')))
          ],
        ),
      ),
    );
  }

  void _showDatePickerDialog() async {
    final DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(DateTime.now().year + 2));
    if (dateTime != null) {
      setState(() {
        releaseDate = getFormattedDate(dateTime, 'dd/mm/yy');
      });
    }
  }

  void _saveMovie() {
    if(_formKey.currentState!.validate()){
      if(category == null){
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Please select a category')));
        return;
      }
      if(releaseDate == null){
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Please select release date')));
      }
      final movie = Movie(
          name: nameController.text,
          category: category!,
          releaseDate: releaseDate!,
          rating: double.parse(ratingController.text));

      SQLiteHelper.insertMovie(movie).then((newId){
        Navigator.pop(context);

      }).catchError((error) {
        throw error;
        }
        );
    }
  }
}
