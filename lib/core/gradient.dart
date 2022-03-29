import 'package:flutter/material.dart';

class GradientTile extends StatelessWidget {
  const GradientTile({
    Key? key,
    required this.child,
    // required this.animationsMap,
  }) : super(key: key);

  final Widget child;
  //final Map<String, AnimationInfo> animationsMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomLeft,
          stops: const [
            0.2,
            0.4,
            0.9,
          ],
          colors: [
            const Color(0xFFE91E63).withOpacity(0.7),
            const Color(0xFFc6426e).withOpacity(1),
            const Color(0xFF642b73).withOpacity(0.8),
          ],
        ),
      ),
      child: child,
    );
  }
}
