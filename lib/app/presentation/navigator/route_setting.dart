import 'package:flutter/material.dart';
import 'package:flutter_bloc_di/app/data/data_interfaces/local_interfaces.dart';
import 'package:flutter_bloc_di/app/data/local_data/shared_prefences/preferences_storage.dart';
import 'package:flutter_bloc_di/app/domain/business_interfaces/business_interfaces.dart';
import 'package:flutter_bloc_di/app/domain/usecases/business_usecase.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen/test_controller.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen/test_view.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen/test_viewmodel.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen1/test_controller.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen1/test_view.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen1/test_viewmodel.dart';

import 'route_name.dart';

class RouteSetting {
  static final PreferencesStorageInterfaces _storage = PreferentStorage();

  static Map<String, Widget Function(BuildContext)> pages = {
    RouteName.test_screen: (context) {
      final BusinessExampleInterfaces _usecases = BusinessUsecases();

      TestViewModel _viewModelInterfaces =
          TestViewModel(storage: _storage, usecases: _usecases);
      TestController _testController =
          TestController(viewModel: _viewModelInterfaces);
      return TestView(_testController);
    },
    RouteName.test_screen1: (context) {
      TestViewModel1 _viewModelInterfaces = TestViewModel1(storage: _storage);
      TestController1 _testController =
          TestController1(viewModel: _viewModelInterfaces);
      return TestView1(_testController);
    },
  };
}

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static push(Widget page) => navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => page),
      );

  static pushNamed(String name) => navigatorKey.currentState?.pushNamed(name);

  static pop() => navigatorKey.currentState?.pop();
}
