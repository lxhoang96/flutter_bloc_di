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

  void onInit() async {
    await Future.delayed(Duration(seconds: 2));
    bool _value = await workingExample();
    _testStream.sink.add(_value);
  }

  @override
  Future<bool> workingExample() async {
    await Future.delayed(Duration(seconds: 2));
    String? _localData = await storage.getItemExample('test');
    return await usecases.businessExampleBool(_localData);
  }

  void dispose() {
    _testStream.close();
  }

  
}
