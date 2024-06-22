import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _TopBox(),
          const _IconTop(),
          child,
        ],
      ),
    );
  }
}

class _IconTop extends StatelessWidget {
  const _IconTop();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _TopBox extends StatelessWidget {
  const _TopBox();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _topBoxDecoration(),
      child: const Stack(
        children: [
          Positioned(
            top: -40,
            left: -20,
            child: _Bubble(),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: _Bubble(),
          ),
          Positioned(
            top: 90,
            right: 100,
            child: _Bubble(),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _topBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
