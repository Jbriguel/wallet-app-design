import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.contentData});
  final Map<String, String> contentData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (contentData['titre'] ?? ''),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Aller"),
            ),
            const SizedBox(height: 10),
            Text(
              contentData['text'] ?? '',
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Aller"),
            ),
          ]),
    );
  }
}
