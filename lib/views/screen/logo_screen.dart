import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
          () =>
      // (Provider.of<SwitchValue_Provider>(context, listen: false)
      //         .switchValue_Model
      //         .switchValue)
      //     ? Navigator.of(context).pushReplacementNamed('/')
      //     :
      Navigator.of(context).pushReplacementNamed('/'),
    );
    return CupertinoPageScaffold(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              radius: 30,
            ),
          ],
        ),
      ),
    );
  }
}

