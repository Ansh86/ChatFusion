import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/pages/message/photo_view/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoImageView extends GetView<PhotoImageViewController> {
  const PhotoImageView({super.key});

  AppBar _buildAppBar(){
    return AppBar(
      bottom: PreferredSize(
        preferredSize:const  Size.fromHeight(1.0),
        child:  Container(
          color: AppColors.secondaryElement,
          height: 2.0,
        ),
      ),
      title:  Text(
        "Photo View",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryText
        ) ,
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(
              controller.state.url.value
          ),
        ),
      ),
    );
  }
}
