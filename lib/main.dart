import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/helpers/shared_pref_helper.dart';
import 'package:flutter_complete_project/doc_app.dart';

import 'core/debendency_injection/di.dart';
import 'core/routing/app_router.dart';

bool isLoggedInUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkUserLoggedIn();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}



Future<void> checkUserLoggedIn() async {
  String userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}
