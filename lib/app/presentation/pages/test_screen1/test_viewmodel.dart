import 'package:flutter_bloc_di/app/data/data_interfaces/local_interfaces.dart';
import 'package:flutter_bloc_di/app/presentation/view_interfaces/test_viewmodel_interfaces.dart';
import 'package:rxdart/rxdart.dart';

class TestViewModel1 implements TestViewModel1Interfaces {
  final PreferencesStorageInterfaces storage;

  TestViewModel1({required this.storage}) {
    onInit();
  }
  final _testStream = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get testValue => _testStream.stream;

  void onInit() async {}

  void dispose() {
    _testStream.close();

  }

  
}
