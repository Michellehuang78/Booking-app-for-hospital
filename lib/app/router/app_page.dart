import 'package:get/get.dart';
import 'package:flutter_booking/presentation/views/views.dart';
import 'package:flutter_booking/presentation/bindings/bindings.dart';

part 'app_route.dart';

class AppPage {
  static _pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
    bool preventDuplicates = true,
  }) =>
      GetPage(
        name: name,
        page: page,
        binding: binding,
        preventDuplicates: preventDuplicates,
        transition: Transition.cupertino,
        popGesture: true,
      );

  static List<GetPage> routes = [
    _pageBuilder(
      name: AppRoute.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    _pageBuilder(
      name: AppRoute.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    _pageBuilder(
      name: AppRoute.forgetPwd,
      page: () => const ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),
    _pageBuilder(
      name: AppRoute.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    _pageBuilder(
      name: AppRoute.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    _pageBuilder(
      name: AppRoute.booking,
      page: () => const BookingPage(),
      binding: BookingBinding(),
    ),
    _pageBuilder(
      name: AppRoute.moment,
      page: () => const MomentPage(),
      binding: MomentBinding(),
    ),
    _pageBuilder(
      name: AppRoute.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
