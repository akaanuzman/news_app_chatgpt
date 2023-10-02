// ignore_for_file: constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum Collections {
  SecurityKeys,
  Users;

  CollectionReference<Map<String, dynamic>> get reference =>
      FirebaseFirestore.instance.collection(name);
}
