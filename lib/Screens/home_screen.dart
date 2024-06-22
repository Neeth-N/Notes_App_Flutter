import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/Provider/note_provider.dart';
import 'note_detail_screen.dart';
import 'create_edit_note_screen.dart';
import 'package:notes_app/Utils/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
          titleSpacing: 0,
          leading: Icon(Icons.book, color: Colors.white, size: 35,),
          title: Text('Notes App', style: TextStyle(color: Palette.textwhite,fontSize: 60, fontFamily:'Teko', fontWeight:FontWeight.bold),),
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
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

      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white24, Colors.white10],
          )
        ),
        child: ListView.builder(
          itemCount: noteProvider.notes.length,
          itemBuilder: (context, index) {
            final note = noteProvider.notes[index];
            return ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    border: const Border(
                        left: BorderSide(
                          color: Colors.lightBlue,
                          width: 5,
                        )
                    )
                ),
                height: 60,
                margin: EdgeInsets.only(top: 9),
                child: ListTile(
                  title: Text(note.title, style: TextStyle(fontSize: 23, fontFamily: 'Exo_2'), ),
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
      ),
      //backgroundColor: CupertinoColors.lightBackgroundGray,
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
