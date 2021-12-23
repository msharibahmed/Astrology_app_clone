
import 'package:flutter/material.dart';

class SunrRiseAndSetItem extends StatelessWidget {
  const SunrRiseAndSetItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.time,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 12, color: Colors.blueAccent),
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
         
        ],
      ),
    );
  }
}
