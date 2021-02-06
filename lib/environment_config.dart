class EnvironmentConfig {
  static const ENV = String.fromEnvironment(
    'DEFINEENV',
    defaultValue: 'test',
  );

  static const API_URL = String.fromEnvironment(
    'DEFINEAPI_URL',
    defaultValue: 'http://212.46.14.26:9930',
  );
}
