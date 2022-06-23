import 'package:flutter/material.dart';
import 'package:flutter_bloc_di/app/presentation/pages/test_screen/test_controller.dart';
import 'package:flutter_bloc_di/cores/theme.dart';

class TestView extends StatelessWidget with RouteAware {
  final TestController controller;
  TestView(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Center(
          child: StreamBuilder(
        stream: controller.viewModel.testValue,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          Color _color;
          if (snapshot.hasData && snapshot.data!) {
            _color = AppTheme.blue;
          } else {
            _color = AppTheme.colorRed;
          }

          return InkWell(
            onTap: controller.toTestView1,
            child: Container(
              width: 100,
              height: 100,
              color: _color,
            ),
          );
        },
      )
          // Obx(() {
          //   Color _color;
          //   if (controller.viewModel.testValue.value) {
          //     _color = AppTheme.blue;
          //   } else {
          //     _color = AppTheme.colorRed;
          //   }
          //   return Container(
          //     width: 100,
          //     height: 100,
          //     color: _color,
          //   );
          // }),

          ),
    );
  }

  @override
  void didPop() {
    controller.viewModel.dispose();
    super.didPop();
  }
}
