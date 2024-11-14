// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

List<Map<String, String>> contentsData = [
  {
    "text": "Lorem ipsum dolor sit amet,\n consectetur adipiscing.",
    "titre": "The best way\n to do business"
  },
  {
    "text": "Lorem ipsum dolor sit amet,\n consectetur adipiscing.",
    "titre": "The best way\n to do business"
  },
  {
    "text": "Lorem ipsum dolor sit amet,\n consectetur adipiscing.",
    "titre": "The best way\n to do business"
  },
];

enum Statut { UP, DOWN }

getColor(Statut statut) {
  switch (statut) {
    case Statut.UP:
      return Colors.green.shade400;
    case Statut.DOWN:
      return Colors.red.shade400;
    default:
      return Colors.white;
  }
}
