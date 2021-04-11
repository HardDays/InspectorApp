class EnvironmentConfig {
  static const ENV = String.fromEnvironment(
    'DEFINEENV',
    defaultValue: 'test',
  );

  static const API_URL = String.fromEnvironment(
    'DEFINEAPI_URL',
    defaultValue: 'https://oati-app.fors.ru',
  );
}
