import 'package:pcs_test/domain/entity/user.dart';
import 'package:pcs_test/domain/usecase/get_user_list.dart';
import 'package:pcs_test/helper/helper_enum.dart';
import 'package:pcs_test/screen/base/base_notifier.dart';

class UserNotifier extends BaseNotifier {
  final GetUserList _getUserList;

  UserNotifier(this._getUserList);

  List<User> _userList = [];

  List<User> get userList => _userList;

  Future<void> fetchUserList() async {
    setState(RequestState.loading);
    notifyListeners();

    final result = await _getUserList.execute();

    result.fold(
      (failure) {
        setMessage(failure.message);
        setState(RequestState.error);
        notifyListeners();
      },
      (data) {
        _userList.clear();
        _userList.addAll(data);

        setState(RequestState.loaded);
        notifyListeners();
      },
    );
  }
}
