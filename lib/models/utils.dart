import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurpleAccent,
      brightness: Brightness.light,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
  );
}

DateTime? pickDate;
TimeOfDay? pickTime;

TextEditingController fullNameController = TextEditingController();
TextEditingController phoneumberController = TextEditingController();
TextEditingController chatConversationController = TextEditingController();

TextEditingController profileNameController = TextEditingController();
TextEditingController profileBioController = TextEditingController();

GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
