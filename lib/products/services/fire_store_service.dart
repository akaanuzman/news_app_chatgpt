import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../base/base_firebase_model.dart';
import '../enums/Collections.dart';

final class FireStoreService {
  FireStoreService._();

  /// Generic method that allows you to add a document to the related collection
  ///
  /// Parameters:
  /// [model] -> The model you created for the related collection
  /// [collections] -> Enum type returning a reference to the corresponding collection
  /// [docId] -> The documentId needed to find the related document in the collection
  ///
  /// Returns:
  /// Returns [true] if the insertion was successful and error-free, [false] if there was an error
  static Future<bool> createDocument<T extends BaseFirebaseModel>({
    required T model,
    required Collections collection,
    required String docId,
  }) async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionReference =
          collection.reference;
      await collectionReference.doc(docId).set(model.toJson());
      return true;
    } on FirebaseException catch (e) {
      log(e.message.toString());
      return false;
    }
  }

  /// Generic method that allows you to read a document to the related collection
  ///
  /// Parameters:
  /// [model] -> The model you created for the related collection
  /// [collections] -> Enum type returning a reference to the corresponding collection
  /// [docId] -> The documentId needed to find the related document in the collection
  static Future<T?> readDocument<T extends BaseFirebaseModel>({
    required T model,
    required Collections collection,
    required String docId,
  }) async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionReference =
          collection.reference;
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await collectionReference.doc(docId).get();
      final Map<String, dynamic>? data = documentSnapshot.data();

      if (data == null) return null;
      model = model.fromJson(data);
      return model;
    } on FirebaseException catch (e) {
      log(e.message.toString());
      return null;
    }
  }
}
