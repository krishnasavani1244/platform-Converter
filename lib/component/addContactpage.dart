import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../controller/controllers.dart';
import '../models/utils.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  File? file;

  late DateTime initialDate;
  late TimeOfDay initialTime;
  late String periodName;
  late DateTime initialCupertinoDate;
  late DateTime initialCupertinoTime;

  int currentStep = 0;

  Future<void> getImageFromCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.camera);

    String? path = image!.path;

    if (image != null) {
      file = File(path);
    }
  }

  @override
  void initState() {
    super.initState();
    initialDate = DateTime.now();
    initialTime = TimeOfDay.now();
    initialCupertinoDate = DateTime.now();
    initialCupertinoTime = DateTime.now();
    (initialTime.hour <= 12) ? periodName = "am" : periodName = "pm";
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchValue_Provider>(context)
            .switchValue_Model
            .switchValue)
        ? Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            child: Form(
              key: formKey1,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.deepPurple,
                          foregroundImage:
                              (file != null) ? FileImage(file as File) : null,
                        ),
                        IconButton(
                          onPressed: () async {
                            print(file.toString());
                            await getImageFromCamera();
                            setState(() {
                              print(file.toString());
                            });
                          },
                          icon: Icon(
                            CupertinoIcons.camera_fill,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoTextFormFieldRow(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Full Name...";
                        } else {
                          return null;
                        }
                      },
                      placeholder: "Full Name",
                      controller: fullNameController,
                      keyboardType: TextInputType.name,
                      prefix: Icon(
                        CupertinoIcons.person,
                        color: Colors.blue,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CupertinoTextFormFieldRow(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Phone Number...";
                        } else {
                          return null;
                        }
                      },
                      controller: phoneumberController,
                      keyboardType: TextInputType.name,
                      prefix: Icon(
                        CupertinoIcons.phone,
                        color: Colors.blue,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CupertinoTextFormFieldRow(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Chat Conversation...";
                        } else {
                          return null;
                        }
                      },
                      controller: chatConversationController,
                      keyboardType: TextInputType.name,
                      prefix: Icon(
                        CupertinoIcons.chat_bubble,
                        color: Colors.blue,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: CupertinoDatePicker(
                                      minimumYear: 2000,
                                      maximumYear: 2099,
                                      mode: CupertinoDatePickerMode.date,
                                      initialDateTime:
                                          Provider.of<DatePicker_Provider>(
                                                  context)
                                              .datePicker_Model
                                              .initialDate,
                                      onDateTimeChanged: (val) {
                                        Provider.of<DatePicker_Provider>(
                                                context,
                                                listen: false)
                                            .datePicker_Model
                                            .initialDate = val;
                                      },
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            CupertinoIcons.calendar,
                            color: Colors.blue,
                          ),
                        ),
                        CupertinoButton(
                            child: Text(
                                "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.day}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.month}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.year}"),
                            onPressed: null),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: CupertinoDatePicker(
                                      use24hFormat: false,
                                      initialDateTime:
                                          Provider.of<DatePicker_Provider>(
                                                  context)
                                              .datePicker_Model
                                              .initialCupertinoTime,
                                      mode: CupertinoDatePickerMode.time,
                                      onDateTimeChanged: (val) {
                                        Provider.of<DatePicker_Provider>(
                                                context,
                                                listen: false)
                                            .datePicker_Model
                                            .initialCupertinoTime = val;
                                      },
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            CupertinoIcons.time_solid,
                            color: Colors.blue,
                          ),
                        ),
                        (Provider.of<DatePicker_Provider>(context,
                                        listen: false)
                                    .datePicker_Model
                                    .initialCupertinoTime !=
                                null)
                            ? (Provider.of<DatePicker_Provider>(context,
                                            listen: false)
                                        .datePicker_Model
                                        .initialCupertinoTime
                                        .hour >=
                                    12)
                                ? (Provider.of<DatePicker_Provider>(
                                                context,
                                                listen: false)
                                            .datePicker_Model
                                            .initialCupertinoTime
                                            .hour <=
                                        12)
                                    ? CupertinoButton(
                                        child: Text(
                                            "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.hour}:${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.minute} pm"),
                                        onPressed: null)
                                    : CupertinoButton(
                                        child: Text(
                                            "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.hour - 12}:${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.minute} pm"),
                                        onPressed: null)
                                : CupertinoButton(
                                    child: Text(
                                        "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.hour}:${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialCupertinoTime.minute} am"),
                                    onPressed: null)
                            : CupertinoButton(
                                child: Text("Pick Time"), onPressed: null)
                      ],
                    ),
                    CupertinoButton.filled(
                        child: Text("Save"),
                        onPressed: () {
                          if (formKey1.currentState!.validate()) {
                            formKey1.currentState!.save();

                            Provider.of<AddContactVariable_provider>(context,
                                    listen: false)
                                .initialization();
                            Provider.of<AddContactVariable_provider>(context,
                                    listen: false)
                                .AddAllContactinitialization();
                          }
                        })
                  ],
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(2.h),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      foregroundImage:
                          (file != null) ? FileImage(file as File) : null,
                      child: IconButton(
                        onPressed: () async {
                          print(file.toString());
                          await getImageFromCamera();
                          setState(() {
                            print(file.toString());
                          });
                        },
                        icon: Icon(
                          Icons.camera,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: fullNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: "Full Name",
                          labelText: "Full Name"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Full Name First...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: phoneumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.call),
                          hintText: "Phone Number",
                          labelText: "Mobile Number"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Phone Number First...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: chatConversationController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.message_outlined),
                          hintText: "Chat Conversation",
                          labelText: "Chats"),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter description First...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            DateTime? pickDate = await showDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );

                            setState(() {
                              if (pickDate != null) {
                                Provider.of<DatePicker_Provider>(context,
                                        listen: false)
                                    .initializationDate();
                                initialDate = pickDate;
                              }
                            });
                          },
                          icon: Icon(Icons.date_range_outlined),
                        ),
                        (Provider.of<DatePicker_Provider>(context,
                                        listen: false)
                                    .datePicker_Model
                                    .initialDate !=
                                null)
                            ? Text(
                                "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.day}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.month}-${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialDate.year}")
                            : Text("Pick Date"),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            pickTime = await showTimePicker(
                              context: context,
                              initialTime: Provider.of<DatePicker_Provider>(
                                      context,
                                      listen: false)
                                  .datePicker_Model
                                  .initialTime,
                            );
                            if (pickTime != null) {
                              Provider.of<DatePicker_Provider>(context,
                                      listen: false)
                                  .initializationTime();
                            }
                          },
                          icon: Icon(Icons.access_time_outlined),
                        ),
                        // (Provider.of<DatePicker_Provider>(context,listen: false).datePicker_Model.initialTime.hour != null)
                        //     ?
                        (Provider.of<DatePicker_Provider>(context,
                                        listen: false)
                                    .datePicker_Model
                                    .initialTime
                                    .period
                                    .index ==
                                1)
                            ? (Provider.of<DatePicker_Provider>(context,
                                            listen: false)
                                        .datePicker_Model
                                        .initialTime
                                        .hour >
                                    12)
                                ? Text(
                                    "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.hour - 12}/${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.minute} ${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.period.name}")
                                : Text(
                                    "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.hour}/${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.minute} ${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.period.name}")
                            : Text(
                                "${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.hour}/${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.minute} ${Provider.of<DatePicker_Provider>(context).datePicker_Model.initialTime.period.name}")
                        // : Text("Pick Date"),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          Provider.of<AddContactVariable_provider>(context,
                                  listen: false)
                              .initialization();

                          Provider.of<AddContactVariable_provider>(context,
                                  listen: false)
                              .AddAllContactinitialization();
                        }
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
