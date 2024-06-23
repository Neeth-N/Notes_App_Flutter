# notes_app

Notes App Flutter Project by Abhineeth N

# Functionalities

The Notes App is a comprehensive tool for creating, managing, and organizing notes. Here is a detailed overview of its functionalities:

## **Core Functionalities**

### Create Notes

Users can create new notes by entering a title and content.
The CreateEditNoteScreen handles the form for note creation, validating input, and saving the note using the NoteProvider.

### Edit Notes

Existing notes can be edited. The user can modify the title and content.
The same CreateEditNoteScreen is used for editing, with pre-filled data from the selected note.

### Delete Notes

Users can delete notes they no longer need.
Deletion is managed through the NoteProvider, which updates the list of notes and notifies listeners to refresh the UI.

### Reorder Notes

Users can reorder notes to organize them as they prefer.
This is facilitated through a ReorderableListView, allowing drag-and-drop functionality to change the order of notes.

### View Note Details

Users can view the full details of a note by selecting it from the list.
The NoteDetailScreen displays the title and content of the selected note and provides options to edit or delete it.

### Toggle Between Light and Dark Themes

Users can switch between light and dark themes to suit their preferences.
The theme toggle functionality is handled by the ThemeProvider, which manages the current theme and updates it across the app.


# Notes App Project Report

## Overview

The Notes App is a Flutter-based application designed for creating, editing, organizing, and managing notes. The app allows users to add, update, delete, and reorder notes, providing a simple and intuitive user interface. It also includes a feature to toggle between light and dark themes.

## Project Structure

The project is organized into the following main components:

### Model

note.dart: Defines the Note class, which models a note with an id, title, and content.

### Provider

note_provider.dart: Manages the state of notes, including adding, updating, deleting, and reordering notes.
theme_provider.dart: Manages the app's theme, allowing toggling between light and dark modes.

### Screens

CreateEditNoteScreen: A stateful widget for creating and editing notes.
HomeScreen: The main screen that displays a list of notes and provides access to note creation.
NoteDetailScreen: Displays the details of a selected note and provides options to edit or delete the note.

### Utils

Theme.dart: Defines the light and dark theme configurations.

### Main

main.dart: The entry point of the app, setting up the MultiProvider for state management and defining the app's theme and home screen.

# Conclusion

The Notes App provides a robust solution for managing notes with a focus on user experience and flexibility. The use of the provider for state management ensures a responsive UI, and the ability to toggle between light and dark themes enhances usability. This application can be extended further with features like cloud sync, sharing notes, and categorizing notes.
