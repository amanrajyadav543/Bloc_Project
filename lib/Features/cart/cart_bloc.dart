import 'dart:async';
import 'dart:html';

import 'package:bloc_project/Features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/Features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/Features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/Features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/Features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/data/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_bloc.dart';



class Cartbloc extends Bloc<CartEvent, CartState> {
  cartbloc(): super(CartInitial()){
    on<CartInitialEvent>(CartInitialEvent);
    on<CartRemoveFromCartEvent>(CartRemoveFromCartEvent);
  }
  FutureOr <void> CartInitialEvent(
    CartInitialEvent event , Emitter<CartState> emitt
  ){
    emit(CartSuccessState(cartItems: cartItem));
  }
  FutureOr <void> CartRemoveFromCartEvent(
    CartRemoveFromCartEvent event, Emitter<CartState>emit ){
      emit(CartSuccessState(cartItems: cartItems));
    }
  
}