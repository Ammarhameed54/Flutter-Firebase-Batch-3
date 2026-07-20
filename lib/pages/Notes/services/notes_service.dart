import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/pages/Notes/model/notes_model.dart';

class NotesService {
  //

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //

  Future<void> addNote(String noteText) async {
    NotesModel note = NotesModel(title: noteText, id: '');

    await firestore.collection('notes').doc().set(note.toMap());
  }

  //

  Future<void> updateNote(NotesModel note, String updatedTitle) async {
    await firestore.collection('notes').doc(note.id).update({
      'title': updatedTitle,
    });
  }

  //

  Future<List<NotesModel>> fetchNotes() async {
    final data = await firestore.collection('notes').get();

    return data.docs.map((e) {
      return NotesModel.fromMap(e.data());
    }).toList();
  }

  //

  Stream<List<NotesModel>> fetchNotesStream() {
    return firestore.collection('notes').snapshots().map((event) {
      return event.docs.map((e) {
        return NotesModel.fromMap(e.data());
      }).toList();
    });
  }

  //

  Future<void> deleteNote(NotesModel note) async {
    await firestore.collection('notes').doc(note.id).delete();
  }
}
