import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'splash_view_model.dart';
import '../../products/constants/string_constants.dart';
import '../../products/enums/Collections.dart';
import '../../products/services/index.dart';
import 'package:provider/provider.dart';

class UserViewModel with ChangeNotifier {
  UserModel? _userModel = const UserModel();
  UserModel? get userModel => _userModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> readUserModel(BuildContext context) async {
    final splashViewModel =
        Provider.of<SplashViewModel>(context, listen: false);

    _userModel = await FireStoreService.readDocument(
      model: _userModel!,
      collection: Collections.Users,
      docId: splashViewModel.userId!,
    );
    _isLoading = false;
    notifyListeners();

    if (_userModel == null) return;
  }

  String get userName {
    if (_userModel == null) return StringConstants.goodMoring;
    if (_userModel!.name == null) return StringConstants.goodMoring;
    return "Good morning ${_userModel!.name!}!";
  }
}
