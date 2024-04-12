import 'dart:io';

import 'package:carparking/Auth/provider/auth_provider.dart';
import 'package:carparking/Home/Secret%20Locker/model/secret_locker_model.dart';
import 'package:carparking/Home/Secret%20Locker/provider/secret_locker_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../util/color.dart';

class SecretLockerScreen extends StatefulWidget {
  const SecretLockerScreen({super.key});

  @override
  State<SecretLockerScreen> createState() => _SecretLockerScreenState();
}

class _SecretLockerScreenState extends State<SecretLockerScreen> {
  File? doc;
  String name = '';
  String dropDownValue = 'Aadhar Card';
  bool isLoading = false;

  pickFile() async {
    var file = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (file != null) {
      setState(() {
        doc = File(file.files.first.path!);
        name = file.files.first.name;
      });
      print(doc!.path);
    }
  }

  saveDocument() async {
    final secretLockerProvider =
        Provider.of<SecretLockerProvider>(context, listen: false);
    try {
      await secretLockerProvider.addDocument(name, dropDownValue, doc);
      Navigator.of(context).pop();
    } catch (e) {
      // TODO
    }
  }

  List<String> categoryList = [
    "Aadhar Card",
    "Pan Card",
    "Marksheet",
    "Driving Licenece",
    "Voter Id card"
  ];

  showDialogBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Dialog(
                child: Container(
                  height: 255,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Document',
                          style: TextStyle(color: grayColor, fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButton(
                            hint: Text(
                              'Select Document',
                              style: TextStyle(color: grayColor, fontSize: 18),
                            ),
                            value: dropDownValue,
                            items: categoryList
                                .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: TextStyle(fontSize: 18),
                                    )))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                dropDownValue = value!;
                              });
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () async {
                              var file = await FilePicker.platform
                                  .pickFiles(allowMultiple: false);
                              if (file != null) {
                                setState(() {
                                  doc = File(file.files.first.path!);
                                  name = file.files.first.name;
                                });
                                print(doc!.path);
                              }
                            },
                            child: (doc != null)
                                ? Text(
                                    name,
                                    style: TextStyle(
                                        color: grayColor, fontSize: 16),
                                  )
                                : Text(
                                    'Choose File',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 18),
                                  )),
                        SizedBox(
                          height: 20,
                        ),
                        (isLoading == true)
                            ? Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: whiteColor,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await saveDocument();
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final secretLockerProvider =
        Provider.of<SecretLockerProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text(
          'Secret Locker',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: FutureBuilder(
          future: secretLockerProvider.getDocument(),
          builder: (BuildContext context,
              AsyncSnapshot<List<SecretLockerModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
           if(snapshot.hasError){
             return Text(snapshot.hasData.toString());
           }
              else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text('Secret Locker is Empty'),
                );
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Image.network(snapshot.data![index].document!),
                        ],
                      ),
                    );
                  },
                );
              }
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            showDialogBox();
          },
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'Add Document',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
