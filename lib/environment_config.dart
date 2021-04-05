class EnvironmentConfig {
  static const ENV = String.fromEnvironment(
    'DEFINEENV',
    defaultValue: 'test',
  );

  static const API_URL = String.fromEnvironment(
    'DEFINEAPI_URL',
    defaultValue: 'https://oati-app.fors.ru',
  );

  static const NETWORK_SERVICE_TO_USE = String.fromEnvironment(
    'NETWORK_SERVICE_TO_USE',
    defaultValue: 'Main', // Main, Mock
  );

  static const CAN_CHANGE_DATA_SENDING_MODE = bool.fromEnvironment(
    'CAN_CHANGE_DATA_SENDING_MODE',
    defaultValue: false, // true if NETWORK_SERVICE_TO_USE - Mock
  );
}
