import 'package:flutter/material.dart';
import 'package:flutter_complete_project/doc_app.dart';

import 'core/debendency_injection/di.dart';
import 'core/routing/app_router.dart';

void main() async {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
