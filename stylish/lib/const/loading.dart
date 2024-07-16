import 'package:flutter/material.dart';

class ConstLoading extends StatelessWidget {
  const ConstLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}