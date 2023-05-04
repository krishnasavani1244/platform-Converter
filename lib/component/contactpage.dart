import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controllers.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? CupertinoPageScaffold(
            child: Container(
              alignment: Alignment.center,
              color: CupertinoColors.activeBlue,
              child: Text("Contacts Page Cupertino"),
            ),
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.grey,
            child: Text("Contacts Page Material"),
          );
  }
}
