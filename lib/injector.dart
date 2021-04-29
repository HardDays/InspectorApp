import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/background_loading/bloc.dart';
import 'package:inspector/blocs/control_background_service/bloc.dart';
import 'package:inspector/blocs/control_list/bloc.dart';
import 'package:inspector/blocs/dictionary/bloc.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/profile/bloc.dart';
import 'package:inspector/blocs/profile/state.dart';
import 'package:inspector/environment_config.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/department_control/client/api/department_control_api_client.dart';
import 'package:inspector/services/department_control/client/local/department_control_local_service.dart';
import 'package:inspector/services/department_control/client/local/sqlite/department_control_local_sqlite_service_client.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/location/geolocator2_location_service.dart';
import 'package:inspector/services/location/location_service.dart';
import 'package:inspector/services/network_status_service/connection_status_service.dart';
import 'package:inspector/services/network_status_service/data_sending_mode_service.dart';
import 'package:inspector/services/network_status_service/main_network_status_service.dart';
import 'package:inspector/services/network_status_service/mock_network_status_service.dart';
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
        Provider(create: (_) => DictionaryService()),
        Provider(
            create: (context) => DepartmentControlApiClient(
                apiProvider: Provider.of<ApiProvider>(context, listen: false))),
        Provider(create: (_) => DepartmentControlLocalSqliteServiceClient()),
        Provider(create: (_) => DataSendingModeStatusService()),
        Provider(
            create: (context) => AuthService(
                Provider.of<PersistanceService>(context, listen: false))),
        Provider<ConnectionStatusService>(
          create: (context) => ConnectionStatusService(
            Provider.of<Connectivity>(context, listen: false),
          ),
        ),
        Provider<NetworkStatusService>(
          create: (context) {
            if(EnvironmentConfig.NETWORK_SERVICE_TO_USE == 'Mock')
              return MockNetworkStatusService(
                Provider.of<DataSendingModeStatusService>(context, listen: false),
              );
            else 
              return MainNetworkStatusService(
                Provider.of<ConnectionStatusService>(context, listen: false), 
                Provider.of<DataSendingModeStatusService>(context, listen: false),
              );
          },
        ),
        Provider(
          create: (context) => DepartmentControlService(
            Provider.of<DepartmentControlApiClient>(context, listen: false),
            Provider.of<DepartmentControlLocalSqliteServiceClient>(context, listen: false),
            Provider.of<DictionaryService>(context, listen: false),
          ),
        ),
        Provider<LocationService>(
          create: (_) => GeoLocator2LocationService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NotificationBloc(),
          ),
          BlocProvider(
            create: (_) => BackgroundLoadingBloc(),
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
              BlocProvider.of<NotificationBloc>(context),
            ),
          ),
          BlocProvider(
            create: (context) => DictionaryBloc(
              dictionaryService: Provider.of<DictionaryService>(context, listen: false),
              notificationBloc: BlocProvider.of<NotificationBloc>(context),
              backgroundLoadingBloc: BlocProvider.of<BackgroundLoadingBloc>(context),
            ),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => ControlBackgroundServiceBloc(
              notificationBloc: BlocProvider.of<NotificationBloc>(context),
              backgroundLoadingBloc: BlocProvider.of<BackgroundLoadingBloc>(context),
              departmentControlService: Provider.of<DepartmentControlService>(context, listen: false),
              networkStatusService: Provider.of<NetworkStatusService>(context, listen: false),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
