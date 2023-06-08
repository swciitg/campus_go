import 'package:campus_go/models/item_model.dart';

enum AcceptanceStatus {
  queued("Queued"),
  accepted("Accepted"),
  rejected("Rejected");

  final String status;
  const AcceptanceStatus(this.status);
}

enum PrepStatus {
  preparing("Preparing"),
  ready("Ready"),
  outForDelivery("Out for delivery");

  final String status;
  const PrepStatus(this.status);
}

enum PaymentStatus {
  failed("Failed"),
  pending("Pending"),
  successful("Successful");

  final String status;
  const PaymentStatus(this.status);
}

enum OrderModes {
  delivery("Delivery"),
  takeaway("Takeaway");

  final String orderMode;
  const OrderModes(this.orderMode);
}

enum FoodCategories {
  veg("VEG"),
  nonveg("NON-VEG"),
  vegNonVeg("VEG & NON-VEG");

  final String category;
  const FoodCategories(this.category);
}

enum ViewType { user, admin }

final Map<String, ItemModel> itemModels = {
  'pc': ItemModel(
      id: "pc",
      name: "Papdi Chaat",
      price: "160",
      category: "VEG",
      offeringOutlet: "offeringOutlet"),
  'cb': ItemModel(
      id: "cb",
      name: "Chicken Biryani",
      price: "160",
      category: "NON-VEG",
      offeringOutlet: "offeringOutlet"),
};
