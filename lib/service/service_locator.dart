import 'package:flutter/material.dart';
import 'package:geo_agency_mobile/repository/login/login_repo_local.dart';
import 'package:geo_agency_mobile/repository/login/login_repo_remote.dart';
import 'package:ioc_container/ioc_container.dart';
import 'package:geo_agency_mobile/view_model/login/login_view_model.dart';

late IocContainer container;

Future<void> main() async{
    final builder = IocContainerBuilder(allowOverrides: true);
    builder.add((container) => LoginRepositoryLocalImpl());
    builder.add((container) => LoginRepositoryRemoteImpl());
    builder.add((container) => LoginDetailsModelImpl(loginLocalRep: container<LoginRepositoryLocalImpl>(), loginRemoteRep: container<LoginRepositoryRemoteImpl>()));
  
    container = builder.toContainer();

    // final loginVM = container<LoginDetailsModelImpl>(); // Way of using container 
}