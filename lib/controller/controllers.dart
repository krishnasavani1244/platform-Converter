import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/globals.dart';
import '../models/utils.dart';

class SwitchValue_Provider extends ChangeNotifier {
  SwitchValue_Model switchValue_Model;

  SwitchValue_Provider({required this.switchValue_Model});

  AlternateValue() async {
    switchValue_Model.switchValue = !switchValue_Model.switchValue;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('SwitchValue', switchValue_Model.switchValue);
    notifyListeners();
  }
}

class ProfileSwitchValue_Provider extends ChangeNotifier {
  ProfileSwitchValue_Model profileSwitchValue_Model;

  ProfileSwitchValue_Provider({
    required this.profileSwitchValue_Model,
  });

  AlternateValue() async {
    profileSwitchValue_Model.ProfileSwitchValue =
        !profileSwitchValue_Model.ProfileSwitchValue;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(
        'ProfileSwitch', profileSwitchValue_Model.ProfileSwitchValue);
  }
}

class SettingSwitchValue_Provider extends ChangeNotifier {
  SettingSwitchValue_Model settingsSwitchValue_Model;

  SettingSwitchValue_Provider({
    required this.settingsSwitchValue_Model,
  });

  AlternateValue() async {
    settingsSwitchValue_Model.SettingSwitchValue =
        !settingsSwitchValue_Model.SettingSwitchValue;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(
        'SettingSwitch', settingsSwitchValue_Model.SettingSwitchValue);
  }
}

class Theme_Provider extends ChangeNotifier {
  Theme_Model theme_model;

  Theme_Provider({required this.theme_model});

  AlternateValue() async {
    theme_model.isDarkMode = !theme_model.isDarkMode;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isDarkMode', theme_model.isDarkMode);
  }
}

class DatePicker_Provider extends ChangeNotifier {
  DatePicker_Model datePicker_Model = DatePicker_Model(
    initialDate: DateTime.now(),
    initialTime: TimeOfDay.now(),
    initialCupertinoTime: DateTime.now(),
  );

  initializationDate() async {
    datePicker_Model.initialDate = pickDate!;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(
        'Date', datePicker_Model.initialTime.toString());
  }

  initializationTime() async {
    datePicker_Model.initialTime = pickTime ?? TimeOfDay.now();
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        'Time', datePicker_Model.initialDate.toString());
  }

  Converter() async {
    datePicker_Model.initialTime =
        datePicker_Model.initialCupertinoTime as TimeOfDay;
  }
}

class AddVariable_provider extends ChangeNotifier {}

class AddContactVariable_provider extends ChangeNotifier {
  List<String> fullName = [];
  List<String> mobileNumber = [];
  List<String> chats = [];
  List<String> recentCallFullName = [];
  List<String> recentCallMobileNumber = [];
  List<String> recentCallChats = [];
  AddContactVariable_Model addContactVariable_Model;

  AddContactVariable_provider({required this.addContactVariable_Model});

  initialization() async {
    addContactVariable_Model.fullName = fullNameController.text;
    addContactVariable_Model.mobileNumber = phoneumberController.text;
    addContactVariable_Model.Chats = chatConversationController.text;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('FullName', addContactVariable_Model.fullName);
    await preferences.setString(
        'MobileNumber', addContactVariable_Model.mobileNumber);
    await preferences.setString('Chats', addContactVariable_Model.Chats);
    notifyListeners();
  }

  AddAllContactinitialization() async {
    fullName.add(addContactVariable_Model.fullName);
    mobileNumber.add(addContactVariable_Model.mobileNumber);
    chats.add(addContactVariable_Model.Chats);

    fullNameController.clear();
    phoneumberController.clear();
    chatConversationController.clear();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setStringList('FullNameList', fullName);
    await preferences.setStringList('MobileNumberList', mobileNumber);
    await preferences.setStringList('ChatsList', chats);
    notifyListeners();
  }

  AddRecentCall(fullName, mobileNumber, chats) async {
    recentCallFullName.add(fullName);
    recentCallMobileNumber.add(mobileNumber);
    recentCallChats.add(chats);
  }
}

class Profile_Provider extends ChangeNotifier {
  Profile_Model profile_model;

  Profile_Provider({required this.profile_model});

  initialization() async {
    profile_model.name = profileNameController.text;
    profile_model.bio = profileBioController.text;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('ProfileName', profile_model.name);
    await preferences.setString('ProfileBio', profile_model.bio);

    notifyListeners();
  }

  clear() async {
    profile_model.name = "";
    profile_model.bio = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('ProfileName', profile_model.name);
    await preferences.setString('ProfileBio', profile_model.bio);

    profileNameController.clear();
    profileBioController.clear();
    notifyListeners();
  }
}
