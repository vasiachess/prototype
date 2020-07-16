import 'package:flutter/material.dart';

const colorViolet = Color(0xFF8E3B6D);
const colorRed = Color(0xFFDE1C1C);
const colorGrey = Color(0xFFE8EAEB);
const colorGreyShadow = Color(0xFFC4C4C4);
const colorGreyCountdown = Color(0xFFF3F5F5);
const colorTextDark = Color(0xFF143039);
const colorTextLight = Color(0xFF8A989C);

const kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.5)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorGrey, width: 0.5),
    borderRadius: BorderRadius.all(Radius.circular(2.5)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorViolet, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(2.5)),
  ),
);