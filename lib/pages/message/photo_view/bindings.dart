import 'package:firebase_chat/pages/message/photo_view/controller.dart';
import 'package:get/get.dart';
class PhotoImageViewBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }

}