import 'package:app_example/api/enterprise_repository.dart';
import 'package:app_example/models/enterprise.dart';
import 'package:mobx/mobx.dart';
part 'home_searching_store.g.dart';

class HomeSearchingStore = _HomeSearchingStoreBase with _$HomeSearchingStore;

abstract class _HomeSearchingStoreBase with Store {
  _HomeSearchingStoreBase(this.repo);
  final EnterpriseRepository repo;

  @observable
  ObservableFuture<Map<String, dynamic>>? asyncEnterprises;

  @action
  void fetchEnterprises() => asyncEnterprises = repo.fetchAll().asObservable();

  @computed
  List<Enterprise>? get enterprises => asyncEnterprises?.value?['data'];
}
