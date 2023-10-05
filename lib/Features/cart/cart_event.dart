
part of 'cart_bloc.dart';



import 'package:bloc_project/Features/home/model/home_product_data_model.dart';

abstract class cartEvent{}

class CartInitialEvent extends cartEvent{}

class CartRemoveFromCartEvent extends cartEvent{

  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });
}