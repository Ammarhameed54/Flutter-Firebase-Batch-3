import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home/services/todo_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //

  TodoService todoService = TodoService();

  final todoController = TextEditingController();

  //

  void myDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                todoService.addTodoTask(todoController.text);
              },
              child: Text("Add"),
            ),
          ],

          content: Column(
            children: [
              //
              TextField(controller: todoController),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: todoService.fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              //

              final todo = data[index];

              return ListTile(
                title: Text(todo.title),
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) async{
                 setState(() async{
               await todoService.toggleTodoTask(todo) ;
                 });
                  },
                ),
              );
            },
          );
        },
      ),

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
