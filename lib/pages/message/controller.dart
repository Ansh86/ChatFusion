import 'package:firebase_chat/common/store/store.dart';
import 'package:firebase_chat/pages/message/state.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:firebase_chat/common/entities/msg.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessageController extends GetxController{
  MessageController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final MessageState state  = MessageState();
  var listener;

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );
  @override
  void onReady(){
    super.onReady();
    getUserLocation();
    getFcmToken();

  }

  void onRefresh(){
    asyncLoadAllData().then(
        (_){
          refreshController.refreshCompleted(resetFooterState: true);
        }
    ).catchError((_){
      refreshController.refreshFailed();
    });
  }

  void onLoading(){
    asyncLoadAllData().then(
        (_){
          refreshController.loadComplete();
        }
    ).catchError((_){
      refreshController.loadFailed();
    });
  }

  asyncLoadAllData() async {
   var from_message = await db.collection("message").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options)=> msg.toFirestore()).where(
      "from_uid", isEqualTo: token
    ).get();

    var to_message = await db.collection("message").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options)=> msg.toFirestore()).where(
        "to_uid", isEqualTo: token
    ).get();
    state.msgList.clear();

    if(from_message.docs.isNotEmpty){
      state.msgList.assignAll(from_message.docs);
    }

    if(to_message.docs.isNotEmpty){
      state.msgList.assignAll(to_message.docs);
    }
  }

  getUserLocation(){
    print('hy ansh');
  }

  getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if(fcmToken!=null){
      var user = await db.collection("users").where("id", isEqualTo: token).get();
      if(user.docs.isNotEmpty){
        var doc_id= user.docs.first.id;
        await db.collection("users").doc(doc_id).update({
          "fcmtoken":fcmToken
        });
      }
    }
  }



}