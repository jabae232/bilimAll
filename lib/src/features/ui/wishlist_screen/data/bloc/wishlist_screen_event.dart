part of 'wishlist_screen_bloc.dart';

@immutable
abstract class WishlistScreenEvent {}
class GetWishlistEvent extends WishlistScreenEvent {}
class RemoveWishlistEvent extends WishlistScreenEvent {
  final String id;
  RemoveWishlistEvent({
    required this.id
});
}
class AddWishlistEvent extends WishlistScreenEvent {
  final String id;
  AddWishlistEvent({
    required this.id
});
}
