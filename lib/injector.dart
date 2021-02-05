import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/bloc.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/profile/bloc.dart';
import 'package:inspector/blocs/profile/state.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/department_control/api/department_control_api_client.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/location/geolocator_location_service.dart';
import 'package:inspector/services/location/location_service.dart';
import 'package:inspector/services/network_status_service/connection_status_service.dart';
import 'package:inspector/services/network_status_service/data_sending_mode_service.dart';
import 'package:inspector/services/network_status_service/main_network_status_service.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:provider/provider.dart';

import 'blocs/profile/event.dart';

class InjectorWidget extends StatelessWidget {
  final Widget child;

  const InjectorWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PersistanceService>(
            create: (_) => ObjectDbPersistanceService()),
        Provider(create: (_) => Connectivity()),
        Provider(create: (_) => ApiProvider()),
        Provider(
            create: (context) => DepartmentControlApiClient(
                apiProvider: Provider.of<ApiProvider>(context, listen: false))),
        Provider(create: (_) => DataSendingModeStatusService()),
        Provider(
            create: (context) => AuthService(
                Provider.of<PersistanceService>(context, listen: false))),
        Provider<NetworkStatusService>(
          create: (context) => MainNetworkStatusService(
            ConnectionStatusService(
              Provider.of<Connectivity>(context, listen: false),
            ),
            Provider.of<DataSendingModeStatusService>(context, listen: false),
          ),
        ),
        Provider(
          create: (context) => DepartmentControlService(
            Provider.of<DepartmentControlApiClient>(context, listen: false),
          ),
        ),
        Provider<LocationService>(
          create: (_) => GeolocatorLocationService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NotificationBloc(),
          ),
          BlocProvider<ProfileBloc>(
            create: (BuildContext context) => ProfileBloc(
              EmptyBlocState(),
              Provider.of<PersistanceService>(context, listen: false),
              Provider.of<DataSendingModeStatusService>(context, listen: false),
              BlocProvider.of<NotificationBloc>(context),
            )..add(InitEvent()),
          ),
          BlocProvider(
            create: (context) => ControlListBloc(
              Provider.of<DepartmentControlService>(context, listen: false),
              Provider.of<NetworkStatusService>(context, listen: false),
              Provider.of<LocationService>(context, listen: false),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
