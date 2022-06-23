import 'package:flutter_bloc_di/app/presentation/navigator/route_name.dart';
import 'package:flutter_bloc_di/app/presentation/navigator/route_setting.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen/test_viewmodel.dart';

class TestController {
  final TestViewModel viewModel;
  TestController({required this.viewModel});

  void toTestView1() {
    AppRouter.pushNamed(RouteName.test_screen1);
  }

}
