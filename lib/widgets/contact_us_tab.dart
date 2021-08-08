import 'package:url_launcher/url_launcher.dart';

import '../constants/colors_constant.dart';
import 'package:flutter/material.dart';

class ContactUsTab extends StatefulWidget {
  final int index;
  const ContactUsTab({Key? key, required this.index}) : super(key: key);

  @override
  _ContactUsTabState createState() => _ContactUsTabState();
}

class _ContactUsTabState extends State<ContactUsTab> {
  String? name, description, subject;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future launchEmail({
    required String toEmail,
    required String name,
    required String subject,
    required String message,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull("Hi, My Name is $name. " + message)}';

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.index == 0
        ? Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: "info@aviandesign.in",
                      cursorColor: kAccentColor,
                      style: const TextStyle(color: kAccentColor),
                      decoration: InputDecoration(
                        labelText: 'To',
                        labelStyle: const TextStyle(
                          color: kPrimaryColor,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kAccentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: kAccentColor,
                      style: const TextStyle(color: kAccentColor),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: const TextStyle(
                          color: kPrimaryColor,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kAccentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      maxLines: 1,
                      minLines: 1,
                      validator: (val) {
                        return val!.isEmpty ? 'Enter Name' : null;
                      },
                      onSaved: (input) {
                        name = input;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: kAccentColor,
                      style: const TextStyle(color: kAccentColor),
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        labelStyle: const TextStyle(
                          color: kPrimaryColor,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kAccentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      maxLines: 2,
                      minLines: 1,
                      validator: (val) {
                        return val!.isEmpty ? 'Enter subject' : null;
                      },
                      onSaved: (input) {
                        subject = input;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: kAccentColor,
                      style: const TextStyle(color: kAccentColor),
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: const TextStyle(
                          color: kPrimaryColor,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kAccentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kPrimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      maxLines: 5,
                      minLines: 3,
                      validator: (val) {
                        return val!.isEmpty ? 'Enter Description' : null;
                      },
                      onSaved: (input) {
                        description = input;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          launchEmail(
                              toEmail: "info@aviandesign.in",
                              name: name.toString(),
                              subject: subject.toString(),
                              message: description.toString());
                        }
                      },
                      child: const Text("Send Mail")),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Image.asset("assets/images/usa.png",
                                width: 35, height: 35),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "+1",
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: "8125583209",
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Icon(Icons.arrow_right_alt,
                            color: Colors.white),
                        onPressed: () async {
                          launch('tel:+18125583209');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Image.asset("assets/images/india.png",
                                width: 35, height: 35),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "+91",
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: "9354906525",
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: kPrimaryColor,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Icon(Icons.arrow_right_alt,
                            color: Colors.white),
                        onPressed: () {
                          launch('tel:+919354906525');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
