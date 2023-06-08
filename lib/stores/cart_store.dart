import 'package:campus_go/functions/utility/calculate_order_value.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  Map<String, int> cart = {};

  @observable
  int totalItems=0;

  @observable
  int cartTotal=0;

  @action
  void emptyCart() {
    cart.clear();
    totalItems=0;
    cartTotal=0;
  }

  @action calCartTotal(){
    cartTotal=orderTotal(cart);
  }

  @action
  void addItem(String itemID) {
    cart[itemID] = 1;
    totalItems++;
    calCartTotal();
  }

  @action
  void removeItem(String itemID) {
    cart.removeWhere((key, value) => key == itemID);
    totalItems--;
    calCartTotal();
  }

  @action 
  void increaseItemCount(String itemID){
    cart[itemID]=cart[itemID]! + 1;
    calCartTotal();
  }

  @action 
  void decreaseItemCount(String itemID){
    cart[itemID]=cart[itemID]! - 1;
    if(cart[itemID]==0) removeItem(itemID);
    calCartTotal();
  }


}
