import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:whatsapp_chat/components/page_route.dart';
import 'package:whatsapp_chat/utils/colors.dart';
import 'package:whatsapp_chat/views/AuthScreen/SetupProfile/setup_profile.dart';
import '../../../widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  final String number;

  const OtpScreen({super.key, required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';
  int _resendAttempt = 1;
  int _resendTime = 5;
  int _resendAttemptLeft = 3;
  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_resendTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _resendTime--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/json/otp.json',
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter One Time Password',
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
                'We sent an SMS with a One Time Password to',
                style: TextStyle(color: white.withOpacity(.5)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.number,
                    style: TextStyle(color: white.withOpacity(.5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: background,
                          title: Text(
                            'Change number?',
                            style: TextStyle(
                              color: white.withOpacity(.8),
                            ),
                          ),
                          content: Text(
                            'Your number ${widget.number} that is invalid and do you want to change it now?',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: white.withOpacity(.5)),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Wrong number?',
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
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
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  style: TextStyle(
                    color: white.withOpacity(.5),
                    fontSize: 20,
                    wordSpacing: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "- - - - - -",
                    hintStyle: TextStyle(
                      color: white.withOpacity(.5),
                      wordSpacing: 15,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              customButton(
                size: size,
                title: 'CONFIRM',
                onTap: () {
                  if (otp.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: primary,
                        duration: Duration(seconds: 2),
                        content: Text('Please Enter Your OTP!'),
                      ),
                    );
                  } else if (otp.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: primary,
                        content: Text('Please enter 6 digit OTP!'),
                      ),
                    );
                  } else {
                    navigator(
                      context,
                      const SetupProfile(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive the code?',
                    style: TextStyle(color: white.withOpacity(.5)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: _resendTime != 0
                        ? null
                        : () {
                            if (_resendAttempt > 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: primary,
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                    'Your request has been blocked !!!',
                                  ),
                                ),
                              );
                            } else {
                              setState(
                                () {
                                  _resendTime = 5;
                                  startTimer();
                                  _resendAttempt++;
                                  _resendAttemptLeft--;
                                },
                              );
                            }
                          },
                    child: Text(
                      _resendTime == 0
                          ? 'Resend SMS'
                          : 'Resend in $_resendTime second',
                      style: const TextStyle(
                          color: primary, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _resendAttemptLeft == 0
                    ? 'You have reached maximum resend limit !'
                    : 'You can resend $_resendAttemptLeft more times',
                style: TextStyle(
                  color: _resendAttemptLeft == 0 ? secondary : primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
