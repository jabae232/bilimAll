part of 'wishlist_screen_bloc.dart';

@immutable
abstract class WishlistScreenState {}

class WishlistScreenInitial extends WishlistScreenState {}
class WishlistScreenLoadingState extends WishlistScreenState {}
class WishlistScreenLoadedState extends WishlistScreenState {
  final List<WishlistDto> wishlist;
  WishlistScreenLoadedState({
    required this.wishlist
});
}
class WishlistScreenErrorState extends WishlistScreenState {}
