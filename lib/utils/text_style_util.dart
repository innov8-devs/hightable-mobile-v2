import 'package:flutter/material.dart';

TextStyle boldStyle(double size, Color color,
    {TextDecoration? decoration, String? family}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle semiBoldStyle(double size, Color color,
    {TextDecoration? decoration, String? family}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w600,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle mediumStyle(double size, Color color,
    {TextDecoration? decoration, String? family}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w500,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle normalStyle(double size, Color color,
    {TextDecoration? decoration, String? family}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.normal,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle extraLightStyle(double size, Color color,
    {TextDecoration? decoration, String? family}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w200,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle lightStyle(double size, Color color,
    {TextDecoration? decoration, String? family}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w300,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle italicStyle(
  double size,
  Color color,
  FontWeight fontWeight, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontStyle: FontStyle.italic,
    fontWeight: fontWeight,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}

TextStyle customStyle(
  double size,
  Color color,
  FontWeight fontWeight, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontStyle: FontStyle.italic,
    fontWeight: fontWeight,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Inter',
  );
}
