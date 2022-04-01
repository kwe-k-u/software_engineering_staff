import 'package:flutter/material.dart';


class InputSection extends StatelessWidget {
  final List<Widget> inputs;
  const InputSection({
    required this.inputs,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: inputs,
      ),
    );
  }
}
