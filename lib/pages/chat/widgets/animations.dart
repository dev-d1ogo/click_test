import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ActiveMic extends StatelessWidget {
  const ActiveMic({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
        'https://lottie.host/53009fb2-9a7f-4354-89c0-c67e7e954253/F8eIVotCJi.json',
        height: 150,
        width: 150,
        animate: true);
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
        'https://lottie.host/947a83f0-f969-4d76-b03a-b71b86348cce/uINORyGRUG.json',
        height: 150,
        width: 150,
        animate: true);
  }
}

class SpeakAnimation extends StatelessWidget {
  const SpeakAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
        'https://lottie.host/4a6f9e33-3939-4abe-88ff-e98c53a30f8a/uJLB9RiqVB.json',
        height: 150,
        width: 150,
        animate: true);
  }
}
