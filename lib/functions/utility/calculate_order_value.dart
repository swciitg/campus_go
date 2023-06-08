import 'package:campus_go/globals/enums.dart';

int orderTotal(Map<String,int> items){
  int sum=0;
  for(var v in items.entries){
    int price=int.parse(itemModels[v.key]!.price);
    sum = sum + price * v.value;
  }
  return sum;
}