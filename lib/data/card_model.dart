import 'package:flutter/material.dart';

class CardModel {
  String text;
  IconData icon;
  bool isFlipped = false;

  CardModel({required this.text, required this.icon});
}

List<CardModel> cardmodel = [
  CardModel(
    text: "person",
    icon: Icons.person_outline,
  ),
  CardModel(
    text: "person",
    icon: Icons.person_outline,
  ),
  CardModel(
    text: "adb",
    icon: Icons.adb,
  ),
  CardModel(
    text: "adb",
    icon: Icons.adb,
  ),
  CardModel(
    text: "traffic",
    icon: Icons.traffic_sharp,
  ),
  CardModel(
    text: "traffic",
    icon: Icons.traffic,
  ),
  CardModel(
    text: "book",
    icon: Icons.book,
  ),
  CardModel(
    text: "book",
    icon: Icons.traffic,
  ),
  CardModel(
    text: "home",
    icon: Icons.home_outlined,
  ),
];
