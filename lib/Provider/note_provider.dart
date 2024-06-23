import 'package:flutter/material.dart';
import 'package:notes_app/model/note.dart';

class NoteProvider with ChangeNotifier{
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  void addNote(Note note){
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    final index = _notes.indexWhere((item) => item.id == note.id);
    if (index != -1) {
      _notes[index] = note;
      notifyListeners();
    }
  }

    void deleteNote(String id){
      _notes.removeWhere((note) => note.id == id);
      notifyListeners();
    }

  void moveNote (int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final note = _notes.removeAt(oldIndex);
    _notes.insert(newIndex, note);
    notifyListeners();
  }

}


