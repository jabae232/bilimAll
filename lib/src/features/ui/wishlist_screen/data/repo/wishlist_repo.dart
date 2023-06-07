import 'dart:convert';
import 'package:bilim_all/src/features/ui/account_screen/data/dto/account_dto.dart';
import '../../../../api/api.dart';
import '../dto/wishlist_dto.dart';


class RepoWishlist {
  RepoWishlist({required this.api});
  final Api api;
  Future<List<WishlistDto>> fetch() async {
    final result = await api.dio.get(
      '/whishlist/',
    );
    final List<WishlistDto> list = wishlistDtoFromJson(json.encode(result.data));
    return list;
  }
  Future<void> remove(String id) async {
    final result = await api.dio.delete(
      '/whishlist/remove-course/$id',
    );
   print(result.data);
  }
  Future<void> add(String id) async {
    final result = await api.dio.post(
      'https://rocky-fortress-84759.herokuapp.com/api/whishlist/add-course',
      data: {"courseId":id}
    );
    print(result.data);
  }
}