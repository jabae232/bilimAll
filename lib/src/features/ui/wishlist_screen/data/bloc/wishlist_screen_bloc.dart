import 'dart:async';

import 'package:bilim_all/src/features/ui/wishlist_screen/data/dto/wishlist_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repo/wishlist_repo.dart';

part 'wishlist_screen_event.dart';
part 'wishlist_screen_state.dart';

class WishlistScreenBloc extends Bloc<WishlistScreenEvent, WishlistScreenState> {
  final RepoWishlist repo;
  WishlistScreenBloc({
    required this.repo
}) : super(WishlistScreenInitial()) {
   on<GetWishlistEvent>(_onGetWishlist);
   on<RemoveWishlistEvent>(_onRemove);
   on<AddWishlistEvent>(_onAdd);
  }
  _onGetWishlist(GetWishlistEvent event,Emitter<WishlistScreenState> emitter) async{
    emit(WishlistScreenLoadingState());
    final List<WishlistDto> wishlist = await repo.fetch();
    emit(WishlistScreenLoadedState(wishlist:  wishlist));
  }
  _onRemove(RemoveWishlistEvent event,Emitter<WishlistScreenState> emitter) async {
    await repo.remove(event.id);
    add(GetWishlistEvent());
  }
  _onAdd(AddWishlistEvent event,Emitter<WishlistScreenState> emitter) async {
    await repo.add(event.id);
  }
}
