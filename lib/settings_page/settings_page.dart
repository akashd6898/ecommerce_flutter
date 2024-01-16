import 'package:ecommerce/cloud_firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';





class Edit extends GetxController
{
  RxBool nonEditable = RxBool(true);
}


class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  var userID;
  var initialProfileName;
  var initialUsername;
  var initialMobileNo;
  var initialPassword;
  var initialAddress;
  @override
  void initState() {
    super.initState();

    FirebaseAuth auth = FirebaseAuth.instance;
    userID = auth.currentUser!.uid;
    //Future<String> initialAddress = Address.initialAddressCheck(userID);
    /*final initialAddressGet = Address.instance;
    var initialAddress = initialAddressGet.initialAddressCheck();*/

    /*Address.initialAddressCheck(userID).then((result) {
      setState(() {
        initialAddress = result ?? "Please enter address";
        addressController.text = initialAddress;
        print("Initial address : $initialAddress");
      });
    });*/
    /*final CollectionReference addressCollectionRef = db.collection('address');
    //Future<QuerySnapshot> querySnapshot = addressCollectionRef.where('uid', isEqualTo: userID).get();
    addressCollectionRef.where('uid', isEqualTo: userID).get().then((QuerySnapshot querySnapshot)
    {
      setState(()
      {
        if(querySnapshot.docs.isNotEmpty)
        {
          DocumentSnapshot addressDoc  = querySnapshot.docs[0];
          initialAddress = addressDoc.get({'address'});
          print("initial Address  : $initialAddress");
        }
        else
        {
          initialAddress = "Please enter address";
        }

      });
    });*//*
    initialAddress = Address.initialAddressCheck(userID).then((address) {
      setState(() {
        addressController.text = address;
      });
      return address;
    });*/
    final initialData = db.collection('users').doc(userID);
    initialData.get().then((DocumentSnapshot docValue) {
      setState(() {
        //final initialAddressGet = Address.instance;
        initialProfileName = docValue["profile name"];
        initialUsername = docValue["email"];
        initialMobileNo = docValue["mobile number"];
        initialPassword = docValue["password"];
        profileController.text = initialProfileName;
        usernameController.text = initialUsername;
        mobileController.text = initialMobileNo;
        passwordController.text = initialPassword;
        /*addressController.text = initialAddress;
        print("Initial Address $initialAddress");*/
    }
    );
      });
    }
  final Edit editButtonEnable = Get.put(Edit());
  final GlobalKey<FormState> _settingsFormKey = GlobalKey<FormState>();
  final db = FirebaseFirestore.instance;
  final TextEditingController profileController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  late String buttonType;
  //late final userAddress = Address.instance;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final usrd = UserDetails();
    return FutureBuilder<dynamic>(
        future: Address.initialAddressCheck(userID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }
          else if (snapshot.hasData) {
            initialAddress = snapshot.data!;
            addressController.text = initialAddress;
            return Scaffold(
                      appBar: AppBar(
                        title: const Text("Settings"),
                backgroundColor: Colors.deepOrange,
                ),
                    body: SingleChildScrollView(
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
                          color: Colors.white70,
                          child: Obx(()
                            {
                            if(editButtonEnable.nonEditable.value == true)
                            {
                            buttonType = "Edit";
                            //return usrd.userDetails(editButtonEnable, "Edit", _settingsFormKey, profileController, usernameController, passwordController, addressController, mobileController, db, userID);
                            }
                            else
                            {
                            buttonType = "Save";
                            //return usrd.userDetails(editButtonEnable, "Save", _settingsFormKey, profileController, usernameController, passwordController, addressController, mobileController, db);
                            }
                            return usrd.userDetails(editButtonEnable, buttonType, _settingsFormKey, profileController, usernameController, passwordController, addressController, mobileController, db, userID, initialProfileName, initialUsername, initialMobileNo, initialPassword, initialAddress/*, userAddress*/);
                            },
                            ),
                            ),
                            ));
                        } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
      /*appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white70,
        child: Obx(()
          {
            if(editButtonEnable.nonEditable.value == true)
              {
                buttonType = "Edit";
                //return usrd.userDetails(editButtonEnable, "Edit", _settingsFormKey, profileController, usernameController, passwordController, addressController, mobileController, db, userID);
              }
            else
              {
                buttonType = "Save";
                //return usrd.userDetails(editButtonEnable, "Save", _settingsFormKey, profileController, usernameController, passwordController, addressController, mobileController, db);
              }
            return usrd.userDetails(editButtonEnable, buttonType, _settingsFormKey, profileController, usernameController, passwordController, addressController, mobileController, db, userID, initialProfileName, initialUsername, initialMobileNo, initialPassword, initialAddress*//*, userAddress*//*);
          },
        ),
      ),
    ));*/
  }
}

class UserDetails extends Material {
  final _focusNode = FocusNode();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool fieldChanged = false;
  bool addressFieldChanged = false;
  final setPage = _SettingsState();
  //final addressDetails = Address(uid: , address: );
  //final db = FirebaseFirestore.instance;
  userDetails(Edit editButtonEnable, String buttonType,
      GlobalKey<FormState> _settingFormKey, TextEditingController profileController, TextEditingController usernameController, TextEditingController passwordController, TextEditingController addressController, TextEditingController mobileController, FirebaseFirestore db, var userID, String initialProfileName, String initialUsername, String initialMobileNo, String initialPassword, String initialAddress/*, Address userAddress*/) {
    //userID = auth.currentUser.uid;
    userID = auth.currentUser!.uid;
    //final userAddress =  Address.instance;
    //final addressStatus = await db.collection("address").add(addressDetails.toJSONUserAddress());
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Form(
                    key: _settingFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextFormField(
                              controller: profileController,
                              readOnly: editButtonEnable.nonEditable.value,
                              decoration: const InputDecoration(
                                labelText: "Profile name",
                                  prefixIcon: Icon(Icons.person_pin_rounded),
                                  contentPadding: EdgeInsets.all(12)),
                            strutStyle: const StrutStyle(
                              height: 1,
                            ),
                            onEditingComplete: (){
                                fieldChanged = true;
                                _focusNode.unfocus();
                            },
                              validator: (value)
                              {
                                if(value != null && (!value.contains(RegExp(r'[0-9]')))) {
                                  return  null;
                                }
                                else
                                {
                                  return "Please enter profile name only with alphabets";
                                }
                              }
                          ),
                        TextFormField(
                          controller: usernameController,
                          readOnly: editButtonEnable.nonEditable.value,
                          decoration: const InputDecoration(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.all(12)),
                          onEditingComplete: (){
                            fieldChanged = true;
                            _focusNode.unfocus();
                          },
                            validator: (value)
                            {
                              if(value != null && (value.contains('@') && (value.contains('.in')|| value.contains('.com')))) {
                                return  null;
                              }
                              else
                              {
                                return "Please enter correct email ID";
                              }
                            }
                        ),
                          TextFormField(
                              controller: mobileController,
                              readOnly: editButtonEnable.nonEditable.value,
                              decoration: const InputDecoration(
                                  labelText: "Mobile No.",
                                  prefixIcon: Icon(Icons.phone),
                                  contentPadding: EdgeInsets.all(12)),
                            onEditingComplete: (){
                              fieldChanged = true;
                              _focusNode.unfocus();
                            },
                              validator: (value)
                              {
                                if(value != null && (value.contains(RegExp(r'[0-9]')) && (value.length == 10))) {
                                  return  null;
                                }
                                else
                                {
                                  return "Please enter valid mobile number";
                                }
                              }
                          ),
                          TextFormField(
                              controller: passwordController,
                              readOnly: editButtonEnable.nonEditable.value,
                              decoration: const InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.password),
                                  contentPadding: EdgeInsets.all(12)),
                            onEditingComplete: (){
                              fieldChanged = true;
                              _focusNode.unfocus();
                            },
                            validator: (value)
                            {
                              if(value!.length < 8)
                              {
                                return "Password must be greater than 8 characters";
                              }
                            },
                          ),
                          TextFormField(
                              controller: addressController,
                              readOnly: editButtonEnable.nonEditable.value,
                              decoration: const InputDecoration(
                                  labelText: "Address",
                                  prefixIcon: Icon(Icons.location_city_rounded),
                                  contentPadding: EdgeInsets.all(12)),
                            onEditingComplete: (){
                                fieldChanged = true;
                                addressFieldChanged = true;
                              _focusNode.unfocus();
                              print("Address to be sent to DB: ${addressController.text}");
                            },
                              validator: (value)
                              {
                                if(value != null) {
                                  return  null;
                                }
                                else
                                {
                                  return "Please enter Address";
                                }
                              }
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
        buttons(buttonType, editButtonEnable, _settingFormKey, profileController, usernameController, passwordController, addressController, mobileController, db, userID, initialProfileName, initialUsername, initialMobileNo, initialPassword, initialAddress/*, userAddress*/)
      ],
    );
  }

  buttons(String buttonType, Edit editButtonEnable, GlobalKey<FormState> _settingsFormKey, TextEditingController profileController, TextEditingController usernameController, TextEditingController passwordController, TextEditingController addressController, TextEditingController mobileController, FirebaseFirestore db, dynamic userID, String initialProfileName, String initialUsername, String initialMobileNo, String initialPassword, String initialAddress/*, Address userAddress*/) {
    if (buttonType == "Edit") {
      return ElevatedButton(onPressed: () {
        editButtonEnable.nonEditable.value = false;
      }
          , child: Text(buttonType));
    }
    else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(onPressed: () async {
              //if (_settingsFormKey.currentState != null) {
                print("Field value $fieldChanged");
                print(userID.toString());
                if (fieldChanged == true) {
                  final userDBRef = db.collection('users').doc(
                      userID.toString());
                 await userDBRef.update(
                      {
                        "profile name": profileController.text,
                        "email": usernameController.text,
                        "mobile number": mobileController.text,
                        "password": passwordController.text
                      });
                 print("Address field changed $addressFieldChanged");
                 if(addressFieldChanged == true)
                   {
                     final userAddress = Address(uid: userID, address: addressController.text);
                     print("Address in button ${addressController.text}");
                     await userAddress.addressCheck();
                   }
                  //final CollectionReference addressCollectionRef = await db.collection('address');
                  //final dbAddress = await db.collection("address").add(userAddress.toJSONUserAddress());
                 print("Changes saved to DB");
                  editButtonEnable.nonEditable.value = true;
              }
              else
                {
                  print("Make changes to Save");
                }
            }
                , child: Text(buttonType)),
            ElevatedButton(onPressed: () {
              profileController.text = initialProfileName;
              usernameController.text = initialUsername;
              mobileController.text = initialMobileNo;
              passwordController.text = initialPassword;
              addressController.text = initialAddress;
              editButtonEnable.nonEditable.value = true;
            }
                , child: const Text("Cancel"))
          ]
      );
    }
  }
}