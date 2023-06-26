import 'package:campus_go/models/item_model.dart';
import 'package:flutter/material.dart';

class EditItemPage extends StatefulWidget {
  final ItemModel? itemModel;
  const EditItemPage({super.key, this.itemModel});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}