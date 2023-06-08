import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  Map<String, int> cart = {};

  @observable
  int totalItems=0;

  @action
  void emptyCart() {
    cart.clear();
    totalItems=0;
  }

  @action
  void addItem(String itemID) {
    cart[itemID] = 1;
    totalItems++;
  }

  @action
  void removeItem(String itemID) {
    cart.removeWhere((key, value) => key == itemID);
    totalItems--;
  }

  @action 
  void increaseItemCount(String itemID){
    cart[itemID]=cart[itemID]! + 1;
  }

  @action 
  void decreaseItemCount(String itemID){
    cart[itemID]=cart[itemID]! - 1;
    if(cart[itemID]==0) removeItem(itemID);
  }


}
