import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app_mon_c21/model/my_user.dart';

class FirebaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  static Future<void> addUserInFireStore(MyUser myUser) {
    //todo: 1- collection
    CollectionReference<MyUser> collectionRef = getUsersCollection();
    //todo: 2- document
    DocumentReference<MyUser> docRef = collectionRef.doc(myUser.id);
    return docRef.set(myUser);
    // getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> getUserFromFireStore(String uId) async {
    var doc = await getUsersCollection().doc(uId).get();
    return doc.data();
  }
}

/// Firebase => Json => Java script object notation  => Map
/// Developer => Object
/// json   => object
/// object => json
/// json => add => {}
/// object => set
/// -------------------------------------------------------------
/// 1- collection('')
/// 2- withConverter<Model>
/// 3- Model => (collectionName , Attributes , Constructor , fromJson , toJson)
/// 4- collection.doc(id).set(object)
/// 5- collection.doc(id).add({})
