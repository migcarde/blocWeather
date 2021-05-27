import 'package:get_it/get_it.dart';
import 'package:data/data_injection_container.dart' as dataInjectorContainer;
import 'package:domain/domain_injection_container.dart'
    as domainInjectorContainer;

final GetIt getIt = GetIt.instance;

void init() {
  dataInjectorContainer.init();
  domainInjectorContainer.init();
}
