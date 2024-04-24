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
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      await secretLockerProvider.addDocument(
          name, dropDownValue, doc, authProvider);
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
                                  print('wrsdvjkn');
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
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: true);
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
          future: secretLockerProvider.getDocument(authProvider),
          builder: (BuildContext context,
              AsyncSnapshot<List<SecretLockerModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.hasData.toString());
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text('Secret Locker is Empty'),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          final netImage = await networkImage(
                              snapshot.data![index].document!);
                          final pdf = pw.Document();
                          pdf.addPage(pw.Page(
                              pageFormat: PdfPageFormat.a4,
                              build: (pw.Context context) {
                                return pw.Center(
                                  child: pw.Image(netImage),
                                ); // Center
                              }));
                          await Printing.layoutPdf(
                              onLayout: (PdfPageFormat format) async =>
                                  pdf.save());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: grayColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (snapshot.data![index].categoryName! ==
                                        "Aadhar Card")
                                    ? Image.network(
                                        'https://cdn.iconscout.com/icon/free/png-256/free-aadhaar-2085055-1747945.png',
                                        height: 50,
                                      )
                                    : (snapshot.data![index].categoryName! ==
                                            "Voter Id card")
                                        ? Image.network(
                                            'https://egov.eletsonline.com/wp-content/uploads/2018/08/election-commission-of-india-logo-324FF87C0E-seeklogo.com_.png',
                                            height: 50,
                                          )
                                        : (snapshot.data![index]
                                                    .categoryName! ==
                                                "Pan Card")
                                            ? Image.network(
                                                'https://www.taxreturnwala.com/wp-content/uploads/2016/09/Is-It-Mandatory-To-Have-Pan-Number-For-The-Indian-Citizens-699x445.jpg',
                                                height: 50,
                                              )
                                            : (snapshot.data![index]
                                                        .categoryName! ==
                                                    "Marksheet")
                                                ? Image.network(
                                                    'https://lh3.googleusercontent.com/SPID4pLSKPKdBJsUzUGKtTCgmd0T6uIx3c93Rsda-42FeNI4OcOzEhycMSThHC7CIR-D',
                                                    height: 50,
                                                  )
                                                : Image.network(
                                                    'https://iconape.com/wp-content/files/hq/258511/png/258511.png',
                                                    height: 50,
                                                  ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(snapshot.data![index].categoryName!)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                  ),
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
