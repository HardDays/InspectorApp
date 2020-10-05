import 'package:flutter/material.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/hive/hive_persistance_service.dart';
import 'package:inspector/services/mock_auth_service.dart';
import 'package:inspector/services/mock_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:provider/provider.dart';

class InjectorWidget extends StatelessWidget {

  final Widget child;

  const InjectorWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PersistanceService>(
      create: (_) => HivePersistanceService(),
      child: Provider<AuthService>(
        create: (context) => MockAuthService(Provider.of<PersistanceService>(context, listen: false)),
        child: child,
      ),
    );
  }
}