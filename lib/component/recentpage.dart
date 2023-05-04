import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../controller/controllers.dart';

class RecentsPage extends StatefulWidget {
  const RecentsPage({Key? key}) : super(key: key);

  @override
  State<RecentsPage> createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? (Provider.of<AddContactVariable_provider>(context, listen: false)
                .recentCallFullName
                .isNotEmpty)
            ? Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  itemCount: Provider.of<AddContactVariable_provider>(context,
                          listen: false)
                      .recentCallFullName
                      .length,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        Expanded(
                            child:
                                Icon(CupertinoIcons.phone_fill_arrow_up_right)),
                        Expanded(
                          flex: 9,
                          child: CupertinoListTile(
                            leading: CircleAvatar(
                              radius: 10.h,
                            ),
                            title: Text(
                              "${Provider.of<AddContactVariable_provider>(context).recentCallFullName[i]}",
                              style: TextStyle(
                                color: CupertinoColors.black,
                              ),
                            ),

                            subtitle: Text(
                                "${Provider.of<AddContactVariable_provider>(context).recentCallMobileNumber[i]}"),

                            // trailing: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Text(
                            //         "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}, ${DateTime.now().hour}:${DateTime.now().minute}"),
                            //   ],
                            // ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.hourglass_empty_outlined,
                  size: 10.h,
                ),
              )
        : (Provider.of<AddContactVariable_provider>(context, listen: false)
                .recentCallFullName
                .isNotEmpty)
            ? Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount:
                          Provider.of<AddContactVariable_provider>(context)
                              .recentCallFullName
                              .length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                      CupertinoIcons.phone_fill_arrow_up_right),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  CircleAvatar(
                                    radius: 4.h,
                                  ),
                                ],
                              ),
                              title: Text(
                                  "${Provider.of<AddContactVariable_provider>(context).recentCallFullName[i]}"),
                              subtitle: Text(
                                  "${Provider.of<AddContactVariable_provider>(context).recentCallMobileNumber[i]}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}, ${DateTime.now().hour}:${DateTime.now().minute}"),
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.receipt_long,
                  size: 10.h,
                ),
              );
  }
}
