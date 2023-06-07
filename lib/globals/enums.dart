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
