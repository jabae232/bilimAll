import 'dart:convert';
import 'package:bilim_all/src/features/ui/account_screen/data/dto/account_dto.dart';
import '../../../../api/api.dart';


class RepoAccount {
  RepoAccount({required this.api});
  final Api api;
  Future<AccountDto> fetch() async {
    final result = await api.dio.get(
      '/get-user-info/',
    );
    print(result.data);
    final AccountDto account = accountDtoFromJson(json.encode(result.data));
    return account;
  }
}