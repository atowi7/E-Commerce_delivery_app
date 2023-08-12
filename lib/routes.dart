import 'package:ecommerce_delivery_app/core/middleware/firstmiddlewares.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/view/screen/auth/login_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/auth/signup_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/auth/signup_verfication_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/auth/sucesssignupscreen.dart';
import 'package:ecommerce_delivery_app/view/screen/forgetpassword/checkemail_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/forgetpassword/resetpassword_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/forgetpassword/sucessresetpasswordscreen.dart';
import 'package:ecommerce_delivery_app/view/screen/forgetpassword/verfication_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/home_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/language_screen.dart';
import 'package:ecommerce_delivery_app/view/screen/orders/ordersarchive.dart';
import 'package:ecommerce_delivery_app/view/screen/orders/ordersdetails.dart';
import 'package:ecommerce_delivery_app/view/screen/orders/orderstracking.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const LanguageScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignupScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.checkemail,
    page: () => const CheckemailScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.signupVerfication,
    page: () => const SignupVerficationScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.successSignup,
    page: () => const SuccessSignupScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.verfication,
    page: () => const VerficationScreen(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoute.homePage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.ordersArchive,
    page: () => const OrdersArchiveScreen(),
  ),
  GetPage(
    name: AppRoute.ordersDetails,
    page: () => const OrderDetailsScreen(),
  ),
  GetPage(
    name: AppRoute.ordersTracking,
    page: () => const OrderTrackingScreen(),
  ),
];
