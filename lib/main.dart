import 'package:flutter/material.dart';
import 'package:flutter_bloc_di/app/presentation/navigator/route_name.dart';
import 'package:flutter_bloc_di/app/presentation/navigator/route_setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      localizationsDelegates: [],
      navigatorKey: AppRouter.navigatorKey,
      initialRoute: RouteName.test_screen,
      supportedLocales: [const Locale('vi'), const Locale('en')],
      locale: null,
      routes: RouteSetting.pages,
      navigatorObservers: [ClearFocusOnPush()],
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: (settings) => ,
      theme: ThemeData(
          fontFamily: 'SFProDisplay',
          dividerColor: Colors.transparent,
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent)),
    );
  }
}

/// disable hiệu ứng scroll của android và scroll quá của ios
class MyBehavior extends ScrollBehavior {
  //ios
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      ClampingScrollPhysics();
  //android
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ClearFocusOnPush extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final focus = FocusManager.instance.primaryFocus;
    focus?.unfocus();
  }

}
