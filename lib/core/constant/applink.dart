class AppLink {
  static const String server = 'https://atowi7.com/ECommerce_app/delivery';
  static const String test = '$server/test.php';

  //Auth
  static const String signup = '$server/auth/signup.php';
  static const String sifnupVerifyCode = '$server/auth/verifycode.php';
  static const String resendVerifyCode = '$server/auth/resendverifycode.php';
  static const String login = '$server/auth/login.php';
  static const String checkemail = '$server/forget_password/checkemail.php';
  static const String verifyCode = '$server/forget_password/verifycode.php';
  static const String resetpassword =
      '$server/forget_password/resetpassword.php';

  //Home
  static const String home = '$server/home.php';

  //Orders
  static const String ordersPending = '$server/orders/pending.php';
  static const String ordersApproval = '$server/orders/approval.php';
  static const String ordersAccepted = '$server/orders/accepted.php';
  static const String ordersDone = '$server/orders/done.php';
  static const String ordersArchive = '$server/orders/archive.php';
  static const String ordersDetials = '$server/orders/details.php';

  //Notification
  static const String notification = '$server/notification.php';
}
