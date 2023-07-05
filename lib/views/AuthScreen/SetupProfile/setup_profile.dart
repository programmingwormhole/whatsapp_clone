import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whatsapp_chat/components/page_route.dart';
import 'package:whatsapp_chat/utils/colors.dart';
import 'package:whatsapp_chat/views/HomeScreen/home_screen.dart';
import 'package:whatsapp_chat/views/InitializingScreen/initializing_screen.dart';
import 'package:whatsapp_chat/widgets/custom_button.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  String nameController = '';
  final img =
      'https://images.unsplash.com/photo-1507019403270-cca502add9f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&w=1000&q=80';

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
            const Text(
              'Setup Profile',
              style: TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Please fill the details below to proceed your request',
              style: TextStyle(color: white.withOpacity(.5)),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    height: size.width * .3,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: white.withOpacity(.2),
                                  border: Border.all(color: white),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: white.withOpacity(.8),
                                    size: 35,
                                  ),
                                ),
                              ),
                              const Text(
                                'Camera',
                                style: TextStyle(color: white),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: white.withOpacity(.2),
                                  border: Border.all(color: white),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.photo_camera_back_rounded,
                                    color: white.withOpacity(.8),
                                    size: 35,
                                  ),
                                ),
                              ),
                              const Text(
                                'Gallery',
                                style: TextStyle(color: white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: white.withOpacity(.5),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    onChanged: (value) {
                      nameController = value;
                      setState(() {});
                    },
                    style: TextStyle(
                      color: white.withOpacity(.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: white.withOpacity(.5),
                      ),
                      border: InputBorder.none,
                      labelText: "Enter Your Name",
                      labelStyle: TextStyle(
                        color: white.withOpacity(.5),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            customButton(
                size: size,
                title: 'CONTINUE',
                onTap: () {
                  if (nameController.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: primary,
                        duration: Duration(seconds: 2),
                        content: Text('Please Enter Your Name'),
                      ),
                    );
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const InitializingScreen()),
                        (route) => false);
                  }
                })
          ],
        ),
      ),
    );
  }
}
