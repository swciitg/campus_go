import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {

  @observable
  Map<String,int> cart={};

  @observable
  int totalItemsAdded=0;

  @action 
  void calcTotalItems(){
    int cnt= 0;
    for(var v in cart.values) {
      cnt=cnt+v;
    }
    totalItemsAdded=cnt;
  }
  


  @action
  void addItem(String itemID){
    cart[itemID]=1;
    calcTotalItems();
  }

  @action
  void removeItem(String itemID){
    cart.removeWhere((key, value) => key==itemID);
    calcTotalItems();
  }
 
}
