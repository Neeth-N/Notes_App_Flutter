import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/Provider/note_provider.dart';
import 'package:notes_app/model/note.dart';
import 'package:uuid/uuid.dart';

class CreateEditNoteScreen extends StatefulWidget {
  final Note? note;

  CreateEditNoteScreen({this.note});

  @override
  _CreateEditNoteScreenState createState() => _CreateEditNoteScreenState();
}

class _CreateEditNoteScreenState extends State<CreateEditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;

  @override
  void initState() {
    super.initState();
    _title = widget.note?.title ?? '';
    _content = widget.note?.content ?? '';
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final noteProvider = Provider.of<NoteProvider>(context, listen: false);

      if (widget.note == null) {
        final newNote = Note(
          id: Uuid().v4(),
          title: _title,
          content: _content,
        );
        noteProvider.addNote(newNote);
      } else {
        final updatedNote = Note(
          id: widget.note!.id,
          title: _title,
          content: _content,
        );
        noteProvider.updateNote(updatedNote);
      }
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Note ${_title} ${widget.note == null ? 'created' : 'updated'}'),
        ),
      );

    }
  }

  void _deleteNote() async {
    if (widget.note != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete Note"),
            content: Text("Are you sure you want to delete this note?"),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Delete"),
                onPressed: () {
                    Provider.of<NoteProvider>(context, listen: false)
                        .deleteNote(widget.note!.id);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Note ${_title} Deleted"))
                    );
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(widget.note == null ? 'New Note' : 'Edit Note', style: TextStyle(color: Colors.white,fontSize: 40, fontFamily:'Teko'),),
        actions: [
          if (widget.note != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _deleteNote,
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(
                  labelText: 'Title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              TextFormField(
                initialValue: _content,
                decoration: InputDecoration(
                    labelText: 'Content',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
                onSaved: (value) {
                  _content = value!;
                },
                style: TextStyle(fontSize: 18),
                maxLines: 100,
                minLines: 1,

              ),
              // ElevatedButton(
              //   onPressed: _saveForm,
              //   child: Text('Save'),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addtag',
        onPressed: _saveForm,
        label: Row(
        children: [Icon(Icons.save), Text('Save')],
        ),
      ),
    );
  }
}
