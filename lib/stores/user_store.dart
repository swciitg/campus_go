
import 'package:campus_go/globals/enums.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  ViewType viewType = ViewType.admin;

  @action
  void setViewType(ViewType v){
    viewType = v;
  }


}
