import 'package:flutter/material.dart';

class ValueSelector extends StatefulWidget {
  final List<String> values;
  final int initialValueIndex;

  const ValueSelector({
    super.key,
    required this.values,
    this.initialValueIndex = 0,
  });

  @override
  State<ValueSelector> createState() => _ValueSelectorState();
}

class _ValueSelectorState extends State<ValueSelector> {
  late int selectedValueIndex;

  @override
  void initState() {
    super.initState();
    selectedValueIndex = widget.initialValueIndex;
  }

  @override
  void didUpdateWidget(covariant ValueSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValueIndex != oldWidget.initialValueIndex) {
      selectedValueIndex = widget.initialValueIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.values.length,
        (index) => ChoiceChip(
          label: Text(widget.values[index]),
          selected: selectedValueIndex == index,
          onSelected: (bool selected) => setState(() {
            if (selected) {
              selectedValueIndex = index;
            }
          }),
          selectedColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            color: selectedValueIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
