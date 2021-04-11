class NetworkStatus {
  const NetworkStatus(this.connectionStatus, this.dataSendingMode);

  final ConnectionStatus connectionStatus;
  final DataSendingMode dataSendingMode;

  NetworkStatus copyWith({
    ConnectionStatus connectionStatus,
    DataSendingMode dataSendingMode,
  }) => NetworkStatus(
    connectionStatus ?? this.connectionStatus,
    dataSendingMode ?? this.dataSendingMode,
  );
}

enum ConnectionStatus {
  offline,
  online,
}

enum DataSendingMode {
  automatic,
  manual,
}
