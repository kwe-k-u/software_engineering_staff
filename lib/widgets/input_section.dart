import 'package:flutter/material.dart';


class InputSection extends StatelessWidget {
  final List<Widget> inputs;
  final List<String>? labels;
  const InputSection({
    required this.inputs,
    this.labels,
    Key? key
  }) : super(key: key);

  List<Widget> _createInputs(BuildContext context){
    List<Widget> list = [];
    
    if (labels == null){
      return inputs;
    }
    for (int index = 0; index < inputs.length; index++){
      list.add(
          Text(labels!.elementAt(index),
            style: Theme.of(context).textTheme.labelMedium,
          )
      );
      list.add(inputs.elementAt(index));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createInputs(context),
      ),
    );
  }
}
