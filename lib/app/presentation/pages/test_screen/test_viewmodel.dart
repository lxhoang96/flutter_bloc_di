import 'dart:async';

import 'package:flutter_bloc_di/app/data/data_interfaces/local_interfaces.dart';
import 'package:flutter_bloc_di/app/domain/business_interfaces/business_interfaces.dart';
import 'package:flutter_bloc_di/app/presentation/view_interfaces/test_viewmodel_interfaces.dart';
import 'package:rxdart/rxdart.dart';

class TestViewModel implements TestViewModelInterfaces {
  final BusinessExampleInterfaces usecases;
  final PreferencesStorageInterfaces storage;

  TestViewModel({required this.storage, required this.usecases}) {
    onInit();
  }
  final _testStream = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get testValue => _testStream.stream;
  bool get currentTest => _testStream.value;
  late Timer _timer;
  int startTime = 60;

  void onInit() async {
    bool _value = await workingExample();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (startTime == 0) _timer.cancel();
      startTime--;
      if (startTime % 3 == 0) {
        _value = !_value;
        _testStream.sink.add(_value);
      }
    });
  }

  @override
  Future<bool> workingExample() async {
    String? _localData = await storage.getItemExample('test');
    return await usecases.businessExampleBool(_localData);
  }

  void dispose() {
    _testStream.close();
  }
}
