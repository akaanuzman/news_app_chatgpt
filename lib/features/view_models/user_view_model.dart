// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_chatgpt/products/widgets/alert_dialog/approve_dialog.dart';

import '../../products/constants/string_constants.dart';
import '../../products/enums/Collections.dart';
import '../../products/services/index.dart';
import '../../products/utilities/routes/app_routes.dart';
import '../models/user_model.dart';

class UserViewModel with ChangeNotifier {
  UserModel? _userModel = const UserModel();
  UserModel? get userModel => _userModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> readUserModel(BuildContext context) async {
    String? userId =
        await LocaleStorageService().read(LocaleStorageKeys.userId.name);

    _userModel = await FireStoreService.readDocument(
      model: _userModel!,
      collection: Collections.Users,
      docId: userId!,
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

  Future<void> showLogoutDialog(BuildContext context) async {
    ApproveDialog.show(
      context: context,
      title: StringConstants.dearUser,
      content: StringConstants.areUSureLogout,
      isHasYesNoActions: true,
      onYesPressed: () async => _logout(context),
    );
  }

  Future<void> _logout(BuildContext context) async {
    await LocaleStorageService().delete(LocaleStorageKeys.userId.name);
    // Clear cache
    PaintingBinding.instance.imageCache.clear();

    context.pushReplacement(AppRoutes.login.path);
  }
}
