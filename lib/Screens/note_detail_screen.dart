import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:provider/provider.dart';
import 'create_edit_note_screen.dart';


class NoteDetailScreen extends StatefulWidget {
  final Note? note;

  NoteDetailScreen({this.note});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();

}

class _NoteDetailScreenState extends State<NoteDetailScreen> {


  // void _deleteNote() {
  //   if (widget.note != null) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Delete Note"),
  //           content: Text("Are you sure you want to delete this note?"),
  //           actions: [
  //             TextButton(
  //               child: Text("Cancel"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             TextButton(
  //               child: Text("Delete"),
  //               onPressed: () {
  //                 Provider.of<NoteProvider>(context, listen: false)
  //                     .deleteNote(widget.note!.id);
  //                 Navigator.of(context).pop();
  //                 Navigator.of(context).pop();
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                     SnackBar(content: Text("Note ${widget.note?.title} Deleted"))
  //                 );
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          widget.note?.title ?? 'No Title',
          style: GoogleFonts.dmSerifText(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          if (widget.note != null)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => CreateEditNoteScreen(note: widget.note),),);
              },
            ),
          // IconButton(
          //     icon: Icon(Icons.delete), onPressed: (_deleteNote),
          // ),
        ],
      ),
      body: Column(
        children: [
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.note?.content ?? 'No Content',
          style: const TextStyle(fontSize: 21),
        ),
          ),
        ],
      ),
    );
  }
}
