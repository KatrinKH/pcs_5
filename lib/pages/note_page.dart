import 'package:flutter/material.dart';
import 'package:pcs_5/model/note.dart'; 

class NotePage extends StatefulWidget {
  final Note note; 

  const NotePage({super.key, required this.note}); 

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note.title), 
      ),
      body: SingleChildScrollView(  
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
              child: Text(
                widget.note.title, 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Image.asset(widget.note.imageUrl, width: 340, height: 260),
            ),
            SizedBox(height: 16),
            Text(
              'Дата релиза: ${widget.note.releaseDate}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Производитель: ${widget.note.developer}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Жанр: ${widget.note.genre}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Цена: ${widget.note.price}P',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Информация по игре: ${widget.note.textMain}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            // Text(note.textNote, style: TextStyle(fontSize: 16),米可-06),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Логика удаления заметки
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Заметка удалена')),
                  );
                },
                style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.red), // Цвет текста кнопки
                child: Text('Удалить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}