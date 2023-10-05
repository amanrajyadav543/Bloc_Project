


import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc(): super(HomeInitial()){
    on<HomeInitialEvent>(HomeInitialEvent);
    on<HomeProductWishlistButtonClickEvent>(
      homeProductWishlistButtonClickEvent
    );
    on<HomeProductcartButtonClickEvent>(homeProductcartButtonClickEvent);
    on<HomeWishCartButtonNavigationEvent>(HomeProductWishlistButtonClickEvent);
    on<HomecartButtonNavigationEvent>(homecartButtonNavigationEvent);
  }
  FutureOr<void> HomeInitialEvent(
    HomeInitialEvent event, Emitter<HomeState> emit) async {
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 3));
      emit(HomeLoadedSuccessState(
        prdoucts:GroceryData.groceryProducts.map((e) => ProductDataModel(id: e['id'], 
        name: e['name'], 
        description: e['description'], 
        price: e['price'], 
        imageUrl: e['imageUrl'])).toString()
      ));
    }

    FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit
    ){
      print('wishlist product clicked');
      wishlistItems.add(event.clickedProduct);
      emit(HomeProductItemWishlistedActionState());
    }
    FutureOr<void> homeProductcartButtonClickEvent(
      HomeProtuceCartButtonClickedEvent event , Emitter<HomeState> emit
    ){
      print('cart product clicked');
      cartItems.add(event.clickedProduct);
      emit(HomeProductItemCartedActionState());
    }
    FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishCartButtonNavigationEvent event , Emitter<HomeState>emit
    ){
      print("whistlist navigate clicked");
      emit(HomeNavigateToWishlistPageActionState());
    }
    FutureOr<void> homeCartButtonNavigationEvent(
      HomecartButtonNavigationEvent event, Emitter<HomeState> emit
    ){
      print('cart navigate clicked');
      emit(HomeNavigateTocartActionState());
    }
  
}
