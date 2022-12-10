import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomRow extends StatelessWidget {
  final String bulletString;
  final String text;

  const CustomRow({
    Key? key,
    required this.bulletString,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bulletString,
            style: const TextStyle(
              height: 1.6,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const Gap(5),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                height: 1.6,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
