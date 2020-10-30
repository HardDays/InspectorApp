import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/bloc.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:provider/provider.dart';

class InjectorWidget extends StatelessWidget {
  final Widget child;

  const InjectorWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PersistanceService>(
      create: (_) => ObjectDbPersistanceService(),
      child: Provider<AuthService>(
        create: (context) => AuthService(
            Provider.of<PersistanceService>(context, listen: false)),
        child: BlocProvider<ControlListBloc>(
          create: (context) => ControlListBloc(
            InstructionsService(),
            Provider.of<PersistanceService>(context, listen: false),
          ),
          child: child,
        ),
      ),
    );
  }
}
