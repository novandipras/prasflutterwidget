import '../core.dart';

final injection = GetIt.instance;

void customInjectionInit(
  void initAppInjection,
) {
  initInternal();
  initAppInjection;
}

Future<void> initInternal() async {
  NavigationService().setupGlobalKeyNavigation();

  injection.registerLazySingleton<LocalSharedPreferences>(
    () => LocalSharedPreferences(),
  );

  injection.registerLazySingleton<Dio>(
    () => Dio(),
  );
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void setupGlobalKeyNavigation() {
    injection
        .registerLazySingleton<NavigationService>(() => NavigationService());
  }
}
