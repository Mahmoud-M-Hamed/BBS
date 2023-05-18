import 'package:bbs/application/constants/constants.dart';
import 'package:bbs/application/service_setup_locator/dependancy_injection.dart';
import 'package:bbs/data/repository/repository.dart';
import 'package:bbs/data/repository/transfer_repo.dart';
import 'package:bbs/domain/usecases/customer_usecases/create_table.dart';
import 'package:bbs/domain/usecases/customer_usecases/fetch_customer_data.dart';
import 'package:bbs/domain/usecases/customer_usecases/update_customer_data.dart';
import 'package:bbs/domain/usecases/transfer_usecases/create_table.dart';
import 'package:bbs/domain/usecases/transfer_usecases/insert_data.dart';
import 'package:bbs/presentation/resources/routes/routes.dart';
import 'package:bbs/presentation/resources/themes/theme.dart';
import 'package:bbs/presentation/view_model/customer/customer_data_cubit/fetch_customer_data_cubit.dart';
import 'package:bbs/presentation/view_model/customer/database_cubit/database_cubit.dart';
import 'package:bbs/presentation/view_model/transfer/transfer_database_cubit/transfer_database_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp._();

  static const MyApp _myAppInstance = MyApp._();

  factory MyApp() => _myAppInstance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DatabaseCubit(
            CreateAndOpenCustomerDatabaseUseCase(
              locatorService.get<RepositoryImpl>(),
            ),
          )..createAndOpenDatabase(),
        ),
        BlocProvider(
          create: (context) => FetchCustomerDataCubit(
            FetchCustomerDataUseCase(
              locatorService.get<RepositoryImpl>(),
            ),
          )..fetchCustomerData(),
        ),
        BlocProvider(
          create: (context) => TransferDatabaseCubit(
            CreateAndOpenTransferTableUseCase(
              locatorService.get<TransferRepositoryImpl>(),
            ),
            InsertTransferProcessUseCase(
              locatorService.get<TransferRepositoryImpl>(),
            ),
            UpdateCustomerDataUseCase(locatorService.get<RepositoryImpl>()),
          ),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.kAppTitle,
        theme: AppTheme.applicationTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.splashScreenRoute,
        onGenerateRoute: RoutesGenerator.getRoute,
      ),
    );
  }
}
