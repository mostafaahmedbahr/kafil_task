import '../../../../core/utils/app_services/remote_services/api_service.dart';
import 'countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo {
  final ApiService? apiService;

  CountriesRepoImpl(this.apiService);


}