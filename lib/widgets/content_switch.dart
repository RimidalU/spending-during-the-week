import 'package:flutter/material.dart';

class ContentSwitch extends StatelessWidget {
  final double heightWidget;
  final bool showChart;
  final Function handleSwitch;

  const ContentSwitch(
      {super.key,
      required this.heightWidget,
      required this.showChart,
      required this.handleSwitch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightWidget,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Show Transactions',
            style: TextStyle(),
          ),
          Switch(
            value: showChart,
            onChanged: (val) {
              handleSwitch(val);
            },
          ),
          const Text(
            'Show Chart',
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
