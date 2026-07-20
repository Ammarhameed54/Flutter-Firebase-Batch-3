import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/Notes/model/notes_model.dart';
import 'package:flutter_application_3/pages/Notes/services/notes_service.dart';

class NotesHome extends StatefulWidget {
  const NotesHome({super.key});

  @override
  State<NotesHome> createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  //

  NotesService notesService = NotesService();

  final titleController = TextEditingController();

  final key = GlobalKey();

  //

  void myDialog(TextEditingController titleController) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                //
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.note),
                    border: OutlineInputBorder(),
                  ),
                  controller: titleController,
                ),
              ],
            ),
          ),

          //
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),

            //
            TextButton(
              onPressed: () async {
                
                await notesService.addNote(titleController.text);
              },
              child: Text("Add" ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FutureBuilder<List<NotesModel>>(
      //   future: notesService.fetchNotes(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator();
      //     }


       body: StreamBuilder<List<NotesModel>>(
        stream: notesService.fetchNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final data = snapshot.data!;

          //

          return ListView.builder(
            itemCount: data.length,

            //
            itemBuilder: (context, index) {
              //

              final note = data[index];
              return Dismissible(
                key: ValueKey(note.id),
                confirmDismiss: (direction) async{
                
                  await notesService.deleteNote(note);
                },
                child: ListTile(
                  //
                  title: Text(note.title),

                  //
                  trailing: IconButton(
                    onPressed: () {
                      myDialog(titleController);
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
              );
            },
          );
        },
      ),

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myDialog(titleController);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
