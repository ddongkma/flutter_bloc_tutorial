part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeInitialEvent extends HomeEvent{}
class HomeProductWishlistButtonClickedEvent extends HomeEvent {
      final ProductDataModel clikedProduct;
  HomeProductWishlistButtonClickedEvent({required this.clikedProduct});
}
class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clikedProduct;
  HomeProductCartButtonClickedEvent({required this.clikedProduct});
}
class HomeWishlistButtonNavigateEvent extends HomeEvent {

}
class HomeCartButtonNavigateEvent extends HomeEvent {

}
