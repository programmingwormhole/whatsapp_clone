import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_chat/utils/colors.dart';
import 'package:whatsapp_chat/utils/config.dart';
import 'package:whatsapp_chat/widgets/custom_button.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  
  String selectedCountry = '+1';
  List countryData = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/country_list.json');
    final data = await json.decode(response);
    setState(() {
      countryData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              color: white,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome to $appName',
              style: TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enter your phone number to proceed',
              style: TextStyle(color: white.withOpacity(.5)),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: size.width * .9,
              decoration: BoxDecoration(
                color: white.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (_) => AlertDialog(
                        backgroundColor: background,
                        title: const Text('Select Country', style: TextStyle(
                          color: white
                        ),),
                        content: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: countryData.length,
                            itemBuilder: (_, index){
                          return ListTile(
                            onTap: (){
                              setState(() {
                                selectedCountry = countryData[index]['dial_code'];
                              });
                              Navigator.pop(context);
                            },
                            title: Text(countryData[index]['name'],
                            style: const TextStyle(
                              color: white
                            ),),
                            subtitle: Text(countryData[index]['dial_code'],
                            style: TextStyle(
                              color: white.withOpacity(.5)
                            ),),
                            trailing: Text(countryData[index]['code'],
                            style: TextStyle(
                              color: white.withOpacity(.5)
                            ),),
                          );
                        }),
                      ));
                    },
                    child: SizedBox(
                      width: 60,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: white,
                          wordSpacing: 1,
                          fontSize: 18,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: selectedCountry,
                          hintStyle: TextStyle(
                            color: white.withOpacity(.5),
                            fontSize: 18
                          ),
                          border: InputBorder.none,
                          enabled: false
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "|",
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: white.withOpacity(.5),
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "--- --- -- --",
                      hintStyle: TextStyle(
                        color: white.withOpacity(.5),
                        wordSpacing: 1,
                        fontSize: 18,
                      ),
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            customButton(
              size: size,
              title: 'SEND',
            )
          ],
        ),
      ),
    );
  }
}
