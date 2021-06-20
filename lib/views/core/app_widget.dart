import 'package:flutter/material.dart';
import 'package:project_scanit/injection.dart';
import 'package:project_scanit/models/settings/permissions_model.dart';
import 'package:project_scanit/services/permission_handler/permission_handler_service.dart';
import 'package:project_scanit/views/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<PermissionsModel>(),
      child: MaterialApp(
        home: OnboardingScreen(),
      ),
    );
  }
}
