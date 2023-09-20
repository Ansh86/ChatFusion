import 'package:flutter/material.dart';
import 'package:firebase_chat/common/middlewares/middlewares.dart';
import 'package:get/get.dart';
import 'package:firebase_chat/pages/sign_in/index.dart';
import 'package:firebase_chat/pages/welcome/index.dart';
import 'package:firebase_chat/pages/application/index.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:firebase_chat/pages/message/chat/index.dart';
import 'package:firebase_chat/pages/profile/index.dart';
import 'package:firebase_chat/pages/message/photo_view/index.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Application = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1)
      ]
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    // check if needed to login or not
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
       // RouteAuthMiddleware(priority: 1),
      ],
    ),


    GetPage(name: AppRoutes.Contact,
        page: () => const ContactPage(),
        binding: ContactBinding()),

    /*


    GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding()),
    //我的
    */

    GetPage(name: AppRoutes.Me, page: () => const  ProfilePage(), binding: ProfileBinding()),
    //聊天详情

    GetPage(name: AppRoutes.Chat, page: () => const ChatPage(), binding: ChatBinding()),

    GetPage(name: AppRoutes.Photoimgview, page: () =>const PhotoImageView(), binding: PhotoImageViewBinding()),
  ];






}
