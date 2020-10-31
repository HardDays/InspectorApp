mixin DataSendingConfigurationMixin {
  Future<void> saveLastDataSendingDate(DateTime dateTime);
  Future<DateTime> getLastDataSendingDate();
  Future<void> saveFingerprintState(bool state);
  Future<void> saveDataSendingState(bool state);
  Future<bool> getDataSendingState(); 
}