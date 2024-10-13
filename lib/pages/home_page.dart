import 'package:flutter/material.dart';
import 'package:pcs_5/components/item_note.dart';
import 'package:pcs_5/model/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes = List.from(notes); 

  void deleteNote(Note note) {
    setState(() {
      _notes.remove(note);
    });
  }

  void addNote(Note newNote) {
    setState(() {
      _notes.add(newNote);
    });
  }

  void _showAddNoteDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController textNoteController = TextEditingController();
    TextEditingController textMainController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController genreController = TextEditingController();
    TextEditingController developerController = TextEditingController();
    TextEditingController releaseDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить новую игру'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Название'),
                ),
                TextField(
                  controller: textNoteController,
                  decoration: const InputDecoration(labelText: 'Краткое описание'),
                ),
                TextField(
                  controller: textMainController,
                  decoration: const InputDecoration(labelText: 'Основная информация об игре'),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(labelText: 'URL изображения'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Цена'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: genreController,
                  decoration: const InputDecoration(labelText: 'Жанр игры'),
                ),
                TextField(
                  controller: developerController,
                  decoration: const InputDecoration(labelText: 'Разработчик'),
                ),
                TextField(
                  controller: releaseDateController,
                  decoration: const InputDecoration(labelText: 'Дата выпуска'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Отмена'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Добавить'),
              onPressed: () {
                String title = titleController.text.trim();
                String textNote = textNoteController.text.trim();
                String textMain = textMainController.text.trim();
                String imageUrl = imageUrlController.text.trim();
                String genre = genreController.text.trim();
                String developer = developerController.text.trim();
                String releaseDate = releaseDateController.text.trim();

                if (title.isEmpty || textNote.isEmpty || textMain.isEmpty || genre.isEmpty || developer.isEmpty || releaseDate.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Ошибка'),
                        content: const Text('Пожалуйста, заполните все обязательные поля.'),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                int newId = _notes.isEmpty ? 1 : _notes.last.id + 1;
                double price = double.tryParse(priceController.text) ?? 0.0;
                Note newNote = Note(
                  id: newId,
                  title: title,
                  textNote: textNote,
                  textMain: textMain,
                  imageUrl: imageUrl,
                  price: price,
                  genre: genre,
                  developer: developer,
                  releaseDate: releaseDate,
                );
                addNote(newNote);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Видеоигры')),
      ),
      backgroundColor: const Color(0xFF67BEEA), 
      body: ListView.builder(
        itemCount: _notes.length, 
        itemBuilder: (BuildContext context, int index) {
          return ItemNote(note: _notes[index], onDelete: deleteNote); 
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteDialog(context),
        backgroundColor: const Color.fromARGB(255, 88, 255, 94),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}