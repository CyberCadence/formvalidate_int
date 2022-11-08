import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formvalidate/Models/modeldata.dart';

class Firebasefunctions {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//readdata

  Future adddata(FormModel model) async {
    firebaseFirestore
        .collection('Formdata')
        .add(model.toMap())
        .then((value) => print(value));
  }

//listalldata

  Stream<List<FormModel>> getalldata() {
    return firebaseFirestore
        .collection('Formdata')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) {
              return FormModel.fromMap(e);
            }).toList());
  }

//update

  updatedata(FormModel formModel) {
    firebaseFirestore
        .collection('Formdata')
        .doc(formModel.id)
        .update(formModel.toMap());
  }

//delete

  deletedata(FormModel formModel) {
    firebaseFirestore.collection('Formdata').doc(formModel.id).delete();
  }
}
