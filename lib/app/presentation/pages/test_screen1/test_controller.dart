import 'package:flutter_bloc_di/app/presentation/navigator/route_setting.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen1/test_viewmodel.dart';

class TestController1 {
  final TestViewModel1 viewModel;
  TestController1({required this.viewModel});

  void backTestView() {
    viewModel.dispose();
    AppRouter.pop();
  }
}
