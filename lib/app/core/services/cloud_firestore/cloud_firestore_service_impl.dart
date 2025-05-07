// coverage:ignore-file
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service.dart';

class CloudFirestoreServiceImpl<T> implements CloudFirestoreService<T> {
  final FirebaseFirestore _firestore;

  CloudFirestoreServiceImpl() : _firestore = FirebaseFirestore.instance;

  @override
  Future<void> create(String collectionPath, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).add(data);
    } catch (e) {
      log('Erro ao adicionar documento em $collectionPath: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> read(String collectionPath, String id) async {
    try {
      final DocumentSnapshot doc = await _firestore.collection(collectionPath).doc(id).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>?;
      } else {
        log('Documento $id nao encontrado em $collectionPath');
        return null;
      }
    } catch (e) {
      log('Erro ao ler documento $id de $collectionPath: $e');
      rethrow;
    }
  }

  @override
  Future<void> update(String collectionPath, String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).doc(id).update(data);
    } catch (e) {
      log('Erro ao editar documento $id em $collectionPath: $e');
      rethrow;
    }
  }

  @override
  Future<void> delete(String collectionPath, String id) async {
    try {
      await _firestore.collection(collectionPath).doc(id).delete();
    } catch (e) {
      log('Erro ao deletar documento $id de $collectionPath: $e');
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> list(String collectionPath, String tag) async {
    try {
      Query collectionQuery = _firestore.collection(collectionPath);

      if (tag.isNotEmpty) {
        collectionQuery = collectionQuery.where('tag', isEqualTo: tag);
      }

      final QuerySnapshot snapshot = await collectionQuery.get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      log('Erro ao listar documentos de $collectionPath: $e');
      rethrow;
    }
  }
}
