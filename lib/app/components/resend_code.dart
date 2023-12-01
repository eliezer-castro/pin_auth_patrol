import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/common/themes/text_styles.dart';

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  ResendCodeState createState() => ResendCodeState();
}

class ResendCodeState extends State<ResendCode> {
  int _seconds = 10;
  Timer? _timer;

  void _startTimer() {
    _seconds = 10; // Reinicia o contador
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer!.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        if (_seconds > 0)
          Text(
            "Solicite um novo código em $_seconds segundos",
            style: AppTextStyles.bodyText2(),
            textAlign: TextAlign.start,
          )
        else
          TextButton(
            key: ValueKey('resend_code'),
            style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft),
            onPressed: () {
              setState(() {
                _startTimer();
              });
            },
            child: Text(
              'Reenviar código',
              style: AppTextStyles.bodyText2(
                  color: const Color.fromARGB(255, 53, 146, 252)),
            ),
          ),
      ],
    );
  }
}
