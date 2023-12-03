import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  var isLoading = false.obs;

  //TEXT CONTROLLERS
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  //LOGIN METHOD
  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;

    try{
      userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  //REGISTER METHOD
  Future<UserCredential?> registerMethod({email, password, context}) async{
    UserCredential? userCredential;

    try{
      userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  //STORING DATA METHOD
  storeUserData({name, password, email}) async {
    DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({'name': name, 'password': password, 'email': email, 'imageUrl': '', 'id': currentUser!.uid});
  }

  //LOGOUT METHOD
  logoutMethod(context) async{
    try{
      await auth.signOut();
    }catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

}