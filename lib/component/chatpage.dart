import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../controller/controllers.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? (Provider.of<AddContactVariable_provider>(context, listen: false)
                .chats
                .isNotEmpty)
            ? Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: Provider.of<AddContactVariable_provider>(context,
                          listen: false)
                      .chats
                      .length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        CupertinoListTile.notched(
                          onTap: () {},
                          // leading: Container(
                          //   height: 70,
                          //   width: 70,
                          //   decoration: BoxDecoration(
                          //   color: Colors.red,
                          //     shape: BoxShape.circle
                          //   ),
                          // ),
                          leadingSize: 8.h,
                          leading: CircleAvatar(
                            radius: 4.h,
                          ),
                          title: Text(
                            "${Provider.of<AddContactVariable_provider>(context).fullName[i]}",
                            style: TextStyle(
                              fontSize: 18,
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            "${Provider.of<AddContactVariable_provider>(context).chats[i]}",
                            style: TextStyle(fontSize: 16),
                          ),
                          // trailing: Text("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}, ${DateTime.now().hour}:${DateTime.now().minute}"),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              )
            : Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Icon(
                  Icons.hourglass_empty,
                  size: 10.h,
                ),
              )
        : (Provider.of<AddContactVariable_provider>(context, listen: false)
                .chats
                .isNotEmpty)
            ? Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: ListView.builder(
                    itemCount: Provider.of<AddContactVariable_provider>(context)
                        .chats
                        .length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          ListTile(
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year},${TimeOfDay.now().hour}:${TimeOfDay.now().minute}")
                              ],
                            ),
                            title: Text(
                                '${Provider.of<AddContactVariable_provider>(context).fullName[i]}'),
                            subtitle: Text(
                                '${Provider.of<AddContactVariable_provider>(context).chats[i]}'),
                            leading: CircleAvatar(
                              radius: 4.h,
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    }),
              )
            : Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.hourglass_empty,
                  size: 10.h,
                ),
              );
  }
}
