import 'package:flutter/material.dart';
import 'package:pcs_5/model/note.dart'; 
import 'package:pcs_5/pages/note_page.dart';

class ItemNote extends StatefulWidget {
  const ItemNote({super.key, required this.note, required this.onDelete});
  
  final Note note; 
  final Function(Note) onDelete;

  @override
  _ItemNoteState createState() => _ItemNoteState();
}

class _ItemNoteState extends State<ItemNote> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotePage(note: widget.note)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255), 
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Expanded(child: Center(child: Image.asset(widget.note.imageUrl, fit: BoxFit.cover))),
                SizedBox(height: 8), 
                Text('- Цена: ${widget.note.price} рублей', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16)),
                SizedBox(height: 4), 
                Text('${widget.note.textNote}', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16)),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

