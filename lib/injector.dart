import 'package:flutter/material.dart';
import 'package:inspector/pages/splash_screen_page.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:provider/provider.dart';

class InjectorWidget extends StatelessWidget {
  final Widget child;

  const InjectorWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<PersistanceService>(
      create: (_) async {
        final service = ObjectDbPersistanceService();
        await service.init();
        return service;
      },
      builder: (context, widget) {
        if (Provider.of<PersistanceService>(context) == null)
          return SplashScreenPage();
        else
          return Provider<AuthService>(
            create: (context) => AuthService(
                Provider.of<PersistanceService>(context, listen: false)),
            child: child,
          );
      },
    );
  }
}
