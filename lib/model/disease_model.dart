class DiseaseModel {
  String uid;
  String diagnoseID;
  String? name;
  String? image;
  num? confidence;
  DateTime dateTime;
  DiseaseModel(
      {this.name,
      this.image,
      this.confidence,
      required this.uid,
      required this.diagnoseID,
      required this.dateTime});

  // receiving data from server
  factory DiseaseModel.fromMap(map) {
    return DiseaseModel(
        uid: map['uid'],
        diagnoseID: map['diagnoseID'],
        name: map['name'],
        image: map['image'],
        confidence: map['confidence'],
        dateTime: map['dateTime']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'diagnoseID': diagnoseID,
      'name': name,
      'image': image,
      'confidence': confidence,
      'dateTime': dateTime
    };
  }
}
