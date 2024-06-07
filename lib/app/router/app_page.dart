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
      name: AppRoute.home,
      page: () => const HomePage(),
    ),
    _pageBuilder(
      name: AppRoute.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    _pageBuilder(
      name: AppRoute.signUp,
      page: () => const SingUpPage(),
      binding: SignUpBinding(),
    ),
  ];
}
