import 'package:flutter/material.dart';
import 'package:pcs_5/components/item_note.dart';
import 'package:pcs_5/model/note.dart';
import 'package:pcs_5/pages/add_note_page.dart'; 

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

  void _navigateToAddNotePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddNotePage(
          onNoteAdded: (newNote) {
            addNote(newNote);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Видеоигры')),
      ),
      backgroundColor: const Color(0xFF67BEEA),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
        ),
        itemCount: _notes.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemNote(note: _notes[index], onDelete: deleteNote);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddNotePage,
        backgroundColor: const Color.fromARGB(255, 78, 255, 65),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
