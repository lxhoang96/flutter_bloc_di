abstract class PreferencesStorageInterfaces {
  Future<bool> setItemExample(String key, String value);

  Future<bool> removeItemExample(String key);

  Future<bool> clearPreferences();

  Future<String?> getItemExample(String key);
}

abstract class SqliteInterfaces {

  

}
