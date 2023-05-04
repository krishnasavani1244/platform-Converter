import 'package:flutter/material.dart';

class SwitchValue_Model {
  bool switchValue;

  SwitchValue_Model({required this.switchValue});
}

class Theme_Model {
  bool isDarkMode;

  Theme_Model({required this.isDarkMode});
}

class ProfileSwitchValue_Model {
  bool ProfileSwitchValue;

  ProfileSwitchValue_Model({required this.ProfileSwitchValue});
}

class SettingSwitchValue_Model {
  bool SettingSwitchValue;

  SettingSwitchValue_Model({required this.SettingSwitchValue});
}

class DatePicker_Model {
  DateTime initialDate;
  TimeOfDay initialTime;
  DateTime initialCupertinoTime;

  DatePicker_Model({
    required this.initialDate,
    required this.initialTime,
    required this.initialCupertinoTime,
  });
}

class AddContactVariable_Model {
  String fullName;
  String mobileNumber;
  String Chats;

  AddContactVariable_Model({
    required this.fullName,
    required this.Chats,
    required this.mobileNumber,
  });
}

class Profile_Model {
  String name;
  String bio;

  Profile_Model({required this.name, required this.bio});
}

class SwitchvalModal {
  bool switchval;

  SwitchvalModal({required this.switchval});
}

class ThemeModal {
  bool isDarkMode;

  ThemeModal({required this.isDarkMode});
}

class DatePickerModal {
  DateTime initialDate;

  DatePickerModal({required this.initialDate});
}

class Contact {
  late String fullname;
  late String phone;
  late String chat;

  Contact({
    required this.fullname,
    required this.phone,
    required this.chat,
  });
}
