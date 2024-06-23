import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/Provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/Provider/note_provider.dart';
import 'note_detail_screen.dart';
import 'create_edit_note_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              "Notes App",
              style: GoogleFonts.dmSerifText(
                fontSize: 50,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                noteProvider.moveNote(oldIndex, newIndex);
              },
              children: [
                for (int index = 0; index < noteProvider.notes.length; index++)
                  ListTile(
                    key: ValueKey(noteProvider.notes[index].id),
                    title: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.secondary,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        border: Border(
                          left: BorderSide(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            width: 5,
                          ),
                        ),
                      ),
                      height: 60,
                      margin: EdgeInsets.only(top: 9),
                      child: Slidable(
                        endActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [
                        SlidableAction(
                          icon: Icons.edit,
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
                          onPressed: (context){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  CreateEditNoteScreen(note: noteProvider.notes[index]),),);
                            },
                          ),
                          SlidableAction(
                            icon: Icons.delete,
                            backgroundColor: Theme.of(context).colorScheme.surface,
                            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
                            //borderRadius: BorderRadius.circular(10),
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                            onPressed: (context){
                            Provider.of<NoteProvider>(context, listen: false)
                              .deleteNote(noteProvider.notes[index].id);
                            },)]
                          ),
                        child: ListTile(
                          title: Text(
                            noteProvider.notes[index].title,
                            style: TextStyle(fontSize: 20, fontFamily: 'Exo_2'),
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => NoteDetailScreen(
                                    note: noteProvider.notes[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15, right: 5),
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
      ),
    );
  }
}
