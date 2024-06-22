import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/Provider/note_provider.dart';
import 'note_detail_screen.dart';
import 'create_edit_note_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Notes App', style: TextStyle(color: Colors.white,fontSize: 40, fontFamily:'Teko'),),
          backgroundColor: Colors.amberAccent,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: (){
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => CreateEditNoteScreen(),
        //         ),
        //       );
        //     },
        //   )
        // ],
      ),

      body:ListView.builder(
        itemCount: noteProvider.notes.length,
        itemBuilder: (context, index) {
          final note = noteProvider.notes[index];
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border(
                  left: BorderSide(
                    color: Colors.lightBlue,
                    width: 5,
                  )
                )
              ),
              height: 55,
              child: ListTile(
                title: Text(note.title, style: TextStyle(fontSize: 22),),
                //subtitle: Text(note.content),
                //leading: Icon(Icons.api_rounded),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NoteDetailScreen(note: note),
                    ),
                  );
                },
                onLongPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateEditNoteScreen(note: note),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15,right: 5),
        height: 80,
        child: FittedBox(
          child: FloatingActionButton(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 9,
            heroTag: 'addtag',
            tooltip: "New Note",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateEditNoteScreen(),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
      )
    );
  }
}
