
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_app/data/cart_items.dart';
import 'package:counter_app/data/grocery_data.dart';
import 'package:counter_app/data/wishlist_items.dart';
import 'package:counter_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent> (homeInitialEvent);
   on<HomeProductWishlistButtonClickedEvent> (homeProductWishlistButtonClickedEvent);
   on<HomeProductCartButtonClickedEvent> (homeProductCartButtonClickedEvent);
   on<HomeWishlistButtonNavigateEvent> (homeWishlistButtonNavigateEvent);
   on<HomeCartButtonNavigateEvent> (homeCartButtonNavigateEvent);

  }
  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds : 3));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(id: e['id'], name: e['name'], description: e['description'], price: e['price'], imageUrl: e['imageUrl'],)).toList()));
  }
  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('wish product list');
    wishlistItems.add(event.clikedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('cart product list');
    cartItems.add(event.clikedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('wish navigate list');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart navigate');
    emit(HomeNavigateToCartPageActionState());
  }


}
