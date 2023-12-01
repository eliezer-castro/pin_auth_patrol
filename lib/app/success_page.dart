import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/widgets/button.dart';
import '../../common/themes/text_styles.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isAnimationReady = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), upperBound: 0.5);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _controller.duration != null) {
        setState(() {
          _isAnimationReady = true;
          _controller.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: const Text(
          'Hi, Alex',
          style: TextStyle(
            color: AppColors.textOnPrimary,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                alignment: Alignment.center, // Alinha os widgets no centro
                children: [
                  Lottie.asset(
                    'assets/lottie/verified.json',
                    controller: _controller, // Associando o controlador
                    width: 180,
                    repeat: false,
                    onLoaded: (composition) {
                      _controller.duration = composition.duration;

                      if (_isAnimationReady) {
                        _controller.forward();
                      }
                    },
                  ), // Check na frente
                  Lottie.asset('assets/lottie/Confetti.json',
                      repeat: false,
                      width: 300,
                      height: 300), // Confetti por trás
                ],
              ),
              Text(
                'Seu número foi verificado!',
                style: AppTextStyles.headline2(color: AppColors.textOnPrimary),
                textAlign: TextAlign.center,
              ),
              Text(
                'A partir de agora você faz parte de nós!',
                style: AppTextStyles.bodyText1(color: AppColors.textOnPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const Button(
                key: ValueKey("back_to_start_button"),
                label: 'Voltar para o início',
              )
            ],
          ),
        ),
      ),
    );
  }
}
