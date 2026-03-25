import 'package:flutter_mvvm/data/data_source/user_api.dart';
import 'package:flutter_mvvm/data/model/users_model.dart';

class UserRopo {
  final UserApi api;
  UserRopo(this.api);

  Future<List<UsersModel>> getUser() async {
    final data = await api.fetchData();
    return data.map(UsersModel.fromJson).toList();
  }

  Future<List<UsersModel>> getUserTop10ByUserName() async {
    final data = await api.fetchData();
    return data.map(UsersModel.fromJson).toList().take(10).toList();
  }
}
