import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'component/addContactpage.dart';
import 'component/chatpage.dart';
import 'component/contactpage.dart';
import 'component/profilepage.dart';
import 'component/recentpage.dart';
import 'controller/controllers.dart';

class MotherPage extends StatefulWidget {
  const MotherPage({Key? key}) : super(key: key);

  @override
  State<MotherPage> createState() => _MotherPageState();
}

class _MotherPageState extends State<MotherPage> {
  PageController pageController = PageController();

  List children = [
    AddContactPage(),
    RecentsPage(),
    ContactsPage(),
    ChatsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person_crop_circle_badge_plus,
                    ),
                    label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.chat_bubble_2,
                    ),
                    label: "CHATS"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.phone,
                    ),
                    label: "CALLS"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.settings,
                    ),
                    label: "SETTINGS"),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person_crop_circle,
                    ),
                    label: "RECENTS")
              ],
            ),
            tabBuilder: (context, i) => CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    backgroundColor:
                        (Provider.of<Theme_Provider>(context, listen: false)
                                .theme_model
                                .isDarkMode)
                            ? Colors.black38
                            : CupertinoColors.white,
                    trailing: CupertinoSwitch(
                      value: Provider.of<SwitchValue_Provider>(context)
                          .switchValue_Model
                          .switchValue,
                      onChanged: (_) => Provider.of<SwitchValue_Provider>(
                              context,
                              listen: false)
                          .AlternateValue(),
                    ),
                    middle: Text(
                      "Cupertino App",
                      style: TextStyle(
                          color: (Provider.of<Theme_Provider>(context,
                                      listen: false)
                                  .theme_model
                                  .isDarkMode)
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                    ),
                  ),
                  child: children[i],
                );
              },
            ),
          )
        : DefaultTabController(
            length: 5,
            animationDuration: Duration(milliseconds: 400),
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Text("Data"),
                    Text("RECENTS"),
                    Text("CHATS"),
                    Text("CALLS"),
                    Text("SETTING"),
                  ],
                ),
                title: Text("Platform Converter"),
                actions: [
                  Transform.scale(
                    scale: 0.09.h,
                    child: Switch(
                      value: Provider.of<SwitchValue_Provider>(context)
                          .switchValue_Model
                          .switchValue,
                      onChanged: (_) => Provider.of<SwitchValue_Provider>(
                              context,
                              listen: false)
                          .AlternateValue(),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
              body: TabBarView(children: [
                AddContactPage(),
                RecentsPage(),
                ContactsPage(),
                ChatsPage(),
                ProfilePage(),
              ]),
            ),
          );
  }
}
