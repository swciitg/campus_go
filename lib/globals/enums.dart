import 'package:campus_go/models/item_model.dart';
import 'package:campus_go/models/order_model.dart';
import 'package:campus_go/models/outlet_model.dart';

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

final Map<String, OutletModel> outletModels = {
  'a': OutletModel(
    outletName: "Lohit Canteen",
    location: "Lohit Hostel",
    phoneNumber: "8502909980",
    category: FoodCategories.veg.category,
    status: true,
    outletKey: "outletKey",
    id: "a",
    service: [OrderModes.delivery.orderMode, OrderModes.takeaway.orderMode],
  ),
  'b': OutletModel(
      outletName: "Lohit Canteen",
      location: "Lohit Hostel",
      phoneNumber: "8502909980",
      category: FoodCategories.nonveg.category,
      status: false,
      outletKey: "outletKey",
      id: "b",
      service: [OrderModes.takeaway.orderMode]),
  'c': OutletModel(
    outletName: "Lohit Canteen",
    location: "Lohit Hostel",
    phoneNumber: "8502909980",
    category: FoodCategories.vegNonVeg.category,
    status: true,
    outletKey: "outletKey",
    id: "c",
    service: [OrderModes.delivery.orderMode, OrderModes.takeaway.orderMode],
  ),
};

final Map<String, OrderModel> orderModels = {
  'r': OrderModel(
      id: "r",
      outletID: "Florentine",
      userID: "Chanchal Yadav",
      orderMode: "Delivery",
      instructions: "instructions",
      items: {},
      deliveryLocation: "deliveryLocation",
      prepStatus: PrepStatus.preparing.status,
      acceptanceStatus: AcceptanceStatus.rejected.status,
      paymentStatus: PaymentStatus.pending.status,
      qrCodeSecret: "qrCodeSecret",
      orderDateTime: DateTime.now()),
       'q': OrderModel(
      id: "q",
      outletID: "Florentine",
      userID: "Chanchal Yadav",
      orderMode: "Delivery",
      instructions: "instructions",
      items: {},
      deliveryLocation: "deliveryLocation",
      prepStatus: PrepStatus.preparing.status,
      acceptanceStatus: AcceptanceStatus.queued.status,
      paymentStatus: PaymentStatus.pending.status,
      qrCodeSecret: "qrCodeSecret",
      orderDateTime: DateTime.now()),
       'ap': OrderModel(
      id: "ap",
      outletID: "Florentine",
      userID: "Chanchal Yadav",
      orderMode: "Delivery",
      instructions: "instructions",
      items: {},
      deliveryLocation: "deliveryLocation",
      prepStatus: PrepStatus.preparing.status,
      acceptanceStatus: AcceptanceStatus.accepted.status,
      paymentStatus: PaymentStatus.pending.status,
      qrCodeSecret: "qrCodeSecret",
      orderDateTime: DateTime.now()),
       'asp': OrderModel(
      id: "asp",
      outletID: "Florentine",
      userID: "Chanchal Yadav",
      orderMode: "Delivery",
      instructions: "instructions",
      items: {},
      deliveryLocation: "deliveryLocation",
      prepStatus: PrepStatus.preparing.status,
      acceptanceStatus: AcceptanceStatus.accepted.status,
      paymentStatus: PaymentStatus.successful.status,
      qrCodeSecret: "qrCodeSecret",
      orderDateTime: DateTime.now()),
       'asr': OrderModel(
      id: "asr",
      outletID: "Florentine",
      userID: "Chanchal Yadav",
      orderMode: "Delivery",
      instructions: "instructions",
      items: {},
      deliveryLocation: "deliveryLocation",
      prepStatus: PrepStatus.ready.status,
      acceptanceStatus: AcceptanceStatus.accepted.status,
      paymentStatus: PaymentStatus.successful.status,
      qrCodeSecret: "qrCodeSecret",
      orderDateTime: DateTime.now()),
       'aso': OrderModel(
      id: "aso",
      outletID: "Florentine",
      userID: "Chanchal Yadav",
      orderMode: "Delivery",
      instructions: "instructions",
      items: {},
      deliveryLocation: "deliveryLocation",
      prepStatus: PrepStatus.outForDelivery.status,
      acceptanceStatus: AcceptanceStatus.accepted.status,
      paymentStatus: PaymentStatus.successful.status,
      qrCodeSecret: "qrCodeSecret",
      orderDateTime: DateTime.now()),
};
