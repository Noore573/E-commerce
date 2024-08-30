import 'package:flutter/material.dart';

const firstBackColor = Color.fromARGB(255, 255, 255, 255);
const Color secondBackColor = Color.fromARGB(255, 255, 255, 0);
const Color thirdBackColor = Color.fromARGB(255, 0, 89, 213);
const Color fourthBackColor = Color.fromARGB(255, 0, 0, 0);

const BoxDecoration gardientBackground= BoxDecoration(
gradient:LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
firstBackColor,
secondBackColor,
//thirdBackColor,
],));
const BoxDecoration gardientBackground2= BoxDecoration(
gradient:LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
  secondBackColor,
firstBackColor,

//thirdBackColor,
],));
const BoxDecoration gardientBackground4= BoxDecoration(
gradient:LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
  fourthBackColor,
//secondBackColor,
thirdBackColor,
//thirdBackColor,
],));
const BoxDecoration gardientBackground5= BoxDecoration(
gradient:LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
  fourthBackColor,
//secondBackColor,
thirdBackColor,
//thirdBackColor,
],));
const BoxDecoration gardientBackground3= BoxDecoration(
gradient:LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
firstBackColor,
secondBackColor,
//thirdBackColor,
],));
