import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/common/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget HeadItem(UserLoginResponseEntity item){
  return Container(
    padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w, bottom: 15.w),
    margin: EdgeInsets.only(bottom: 10.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.circular(0),
      boxShadow:const [
        BoxShadow(
          color: AppColors.tabCellSeparator,
          offset: Offset(0.0, 5.0),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        )
      ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){},
              child: SizedBox(
                width: 54.w,
                height: 54.w,
                child: netImageCached(
                  item.photoUrl??"",
                  height: 54.w,
                  width: 54.w
                ),
              ),
            ),
            SizedBox(
              width: 250.w,

              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5.w, left: 15.w, bottom: 0.w, right: 0.w),
                    width: 190.w,
                    height: 54.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.displayName??"",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Avenir',
                              color: AppColors.thirdElement

                          ),
                          // style: ,
                        ),
                        Text(
                          "ID: ${item.accessToken??""}",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Avenir',
                              color: AppColors.thirdElement

                          ),
                          // style: ,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),

      ],
    ),
  );
}