import 'package:hive/hive.dart';

import '../../modules/authentication/domain/models/token.dart';
import '../../modules/authentication/domain/entities/user.dart';
import '../../modules/authentication/domain/models/usermodel.dart';
import '../../utils/constants.dart';

class UserDb {
  // final User _data = const User();
  static UserDb? _instance;

  static UserDb? getInstance() {
    return _instance ??= UserDb();
  }

  Box get _boxUserDetails => Hive.box(AppConstants.boxUserDetails);
  Box get _boxUserSession => Hive.box(AppConstants.boxUserSession);

  Box get _boxOnboarding => Hive.box(AppConstants.boxOnBoarding);

  void setUserDetails({required User? user}) {
    if (user == null) {
      return;
    }
    _boxUserDetails.put(
      AppConstants.keyUserDetails,
      user,
    );
  }

  void setTokenDetails({required Token? token}) {
    if (token == null) {
      return;
    }
    _boxUserSession.put(
      AppConstants.keyAccessToken,
      token.jwt,
    );
  }

  void setBoxOnboarding() {
    _boxOnboarding.put(
      AppConstants.keyIsOnboarded,
      true,
    );
  }

  dynamic get isUserOnboarded {
    return _boxOnboarding.get('isOnboarded');
  }

  Future<void> clearUserDetails() async {
    await Future.wait([
      _boxUserDetails.delete(
        AppConstants.keyUserDetails,
      ),
      _boxUserSession.delete(
        AppConstants.keyAccessToken,
      ),
      _boxUserSession.delete(AppConstants.keyRefreshToken),
    ]);
  }

  Stream<BoxEvent> userListener() {
    return _boxUserDetails.watch();
  }

  User? get user {
    return _boxUserDetails.get(AppConstants.keyUserDetails) as User?;
  }

  String? get accessToken {
    return _boxUserSession.get(
      AppConstants.keyAccessToken,
      defaultValue: '',
    ) as String?;
  }

  String? get refreshToken {
    return _boxUserSession.get(
      AppConstants.keyRefreshToken,
      defaultValue: '',
    ) as String?;
  }
}
