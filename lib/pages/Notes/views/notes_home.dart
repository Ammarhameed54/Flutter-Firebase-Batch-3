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


  //

  void myDialog(TextEditingController titleController){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            children: [
              //
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.note),
                  border: OutlineInputBorder()
                ),
                controller: titleController,
              )
            ],
          ),
        ),

        //
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Cancel")),

          //
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(titleController.text.isEmpty ? "Add" : "Update"),
            )
        ],
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<NotesModel>>(
        future: notesService.fetchNotes(),
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
              return ListTile(
                //
                title: Text(note.title),

                //

                trailing: IconButton(onPressed: () {
                  myDialog(titleController);
                }, icon: Icon(Icons.edit)),
              );
            },
          );
        },
      ),

      //

      floatingActionButton: FloatingActionButton(onPressed: () {
        myDialog(titleController);
      }, child: Icon(Icons.add),),
    );
  }
}
