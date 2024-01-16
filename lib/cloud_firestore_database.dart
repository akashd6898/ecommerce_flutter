import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users
{
  static Users get instance => Get.find();
  final String uid;
  final String profileName;
  final String email;
  final int mobileNumber;
  final String password;

  Users({required this.uid, required this.profileName,required this.email,required this.mobileNumber,required this.password});

  toJSONUserDetails()
  {
    return
    {
    "uid" : uid,
    "profile name" : profileName,
    "email" : email,
    "mobile number" : mobileNumber,
    "password" : password
    };
  }
}

class Address
{
  static Address get instance => Get.find();
  static final db = FirebaseFirestore.instance;
  final String uid;
  final String address;
  //final TextEditingController addressController = TextEditingController();
  Address({required this.uid, required this.address});

  toJSONUserAddress()
  {
    return
      {
        "uid" : uid,
        "address" : address,
      };
  }
addressCheck() async
{
  final CollectionReference addressCollectionRef = db.collection('address');
  QuerySnapshot querySnapshot = await addressCollectionRef.where('uid', isEqualTo: uid).get();
  //bool addressDocFlag = querySnapshot.docs.isNotEmpty;
  if(querySnapshot.docs.isNotEmpty)
    {
      DocumentSnapshot addressDoc  = querySnapshot.docs[0];
      await addressDoc.reference.update({'address': address});
        print("Address Document : $addressDoc");
    }
  else
    {
      await db.collection("address").add(toJSONUserAddress());
      print("Address in addressCheck function: $address");
      print("Address added to DB");
    }
}
static initialAddressCheck(String uid) async
{
  var initialAddress;
  final CollectionReference addressCollectionRef = db.collection('address');
  QuerySnapshot querySnapshot = await addressCollectionRef.where('uid', isEqualTo: uid).get();
  //DocumentSnapshot addressDoc  = querySnapshot.docs[0];
  /*initialAddress = await addressDoc.get('address') as String?;
  print("initial Address in address check function : $initialAddress");*/
  if(querySnapshot.docs.isNotEmpty)
  {
    DocumentSnapshot addressDoc  = querySnapshot.docs[0];
    initialAddress = await addressDoc.get('address') as String?;
    print("initial Address  : $initialAddress");
    //return initialAddress;
  }
  else
    {
      initialAddress = "Please add address";
    }
  return initialAddress;
}
}