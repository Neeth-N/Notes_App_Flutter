import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/Provider/theme_provider.dart';
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        // toolbarHeight: 90,
        //   titleSpacing: 0,
        //   leading: Icon(Icons.book, color: Colors.white, size: 35,),
        //   title: Text('Notes App', style: TextStyle(color: Palette.textwhite,fontSize: 60, fontFamily:'Teko', fontWeight:FontWeight.bold),),
        //   backgroundColor: Colors.amber,
        //   shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(10),
        //  ),
        //),
        actions: [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: (){
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text("Notes App", style: GoogleFonts.dmSerifText(fontSize: 50, color: Theme.of(context).colorScheme.inversePrimary)),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: noteProvider.notes.length,
              itemBuilder: (context, index) {
                final note = noteProvider.notes[index];
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                          BoxShadow(
                            color: Theme.of(context).colorScheme.secondary,
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
                      title: Text(note.title, style: TextStyle(fontSize: 20, fontFamily: 'Exo_2'), ),
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
          )
        ],

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
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
