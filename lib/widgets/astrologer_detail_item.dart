import 'package:flutter/material.dart';

class AstrologerDetailItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isBold;
  const AstrologerDetailItem(
      {Key? key, required this.icon, required this.text, this.isBold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(
              icon,
              color: Colors.orange,
              size: 15,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ))
        ],
      ),
    );
  }
}