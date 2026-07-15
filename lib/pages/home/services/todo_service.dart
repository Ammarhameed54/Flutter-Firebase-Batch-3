import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_3/pages/home/model/todo_model.dart';

class TodoService {
  //

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //

  void addTodoTask(String title) async {
    TodoModel newmodel = TodoModel(id: '', title: title);

    // Save to firebase

    await firestore.collection('todos').doc().set(newmodel.toMap());
  }

  //

  Future<void> toggleTodoTask(TodoModel todo) async {
    await firestore.collection('todos').doc(todo.id).update({
      'isDone': !todo.isDone,
    });
  }

  //

  Future<List<TodoModel>> fetchTodos() async {
    final data = await firestore.collection('todos').get();



    return data.docs.map((e) {
      return TodoModel.fromMap(e.data());
    },).toList();
   
  }
}
