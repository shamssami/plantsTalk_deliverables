import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:plants_talk/model/disease_model.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  final String uid;
  String diagnoseID = const Uuid().v1(); // creates unique id based on time

  DatabaseService({required this.uid});
  final CollectionReference diseaseCollection =
      FirebaseFirestore.instance.collection('diseases');

  Future addDisease(String name, String image, double confidence, String uid,
      DateTime dateTime) async {
    return await diseaseCollection.doc().set({
      'uid': uid,
      'diagnoseID': diagnoseID,
      'name': name,
      'image': image,
      'confidence': confidence,
      'dateTime': dateTime
    });
  }

  Future getDiseasesList() async {
    List itemList = [];

    try {
      await diseaseCollection
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          itemList.add(element.data());
        });
      });
      return itemList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  List<DiseaseModel> _diseasesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return DiseaseModel(
          name: doc.get('name') ?? '',
          image: doc.get('image') ?? '',
          uid: doc.get('uid') ?? '',
          diagnoseID: doc.get('diagnoseID'),
          confidence: doc.get('confidence') ?? 0,
          dateTime: doc.get('dateTime'));
    }).toList();
  }

  Stream<List<DiseaseModel>> get diseases {
    return diseaseCollection.snapshots().map(_diseasesListFromSnapshot);
  }

  final FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  final FirebaseStorage storageRef = FirebaseStorage.instance;
  final String collectionName = 'diseases';

  // adding image to firebase storage

  Future uploadImage(String imagePath) async {
    String _uploadPath = '';

    var uniqueKey = firestoreRef.collection(collectionName);
    String uploadFileName = DateTime.now().minute.toString() + '.jpg';
    Reference reference =
        storageRef.ref().child(collectionName).child(uploadFileName);
    UploadTask uploadTask = reference.putFile(File(imagePath));

    uploadTask.snapshotEvents.listen((event) {
      print(event.bytesTransferred.toString() +
          "\t" +
          event.totalBytes.toString());
    });
    await uploadTask.whenComplete(() async {
      _uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
    });
    return _uploadPath;
  }

  // Delete Post
  Future<String> deleteDiagnosis(String diagnoseID) async {
    String res = "Some error occurred";
    try {
      await diseaseCollection.doc(diagnoseID).delete();
      res = 'success';
      print(res);
      print('say Hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    } catch (err) {
      res = err.toString();
      print(res);
      print('say baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaad');
    }
    return res;
  }
}
