import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class  UserService {


  //
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;


  

  //



  Future<void> fetchData()async{


    final uid = auth.currentUser!.uid;


    await firestore.collection('users').doc(uid).get();

  }
  
}