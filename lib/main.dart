import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:project_scanit/injection.dart';
import 'package:project_scanit/views/core/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
