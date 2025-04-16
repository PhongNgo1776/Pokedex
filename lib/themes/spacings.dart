import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/themes/sizes.dart';

const SizedBox horizontalSpaceXxs = SizedBox(width: xxs);
const SizedBox horizontalSpaceXs = SizedBox(width: xs);
const SizedBox horizontalSpaceS = SizedBox(width: s);
const SizedBox horizontalSpaceBase = SizedBox(width: base);
const SizedBox horizontalSpaceM = SizedBox(width: m);
const SizedBox horizontalSpaceL = SizedBox(width: l);
const SizedBox horizontalSpaceXl = SizedBox(width: xl);
const SizedBox horizontalSpaceXxl = SizedBox(width: xxl);

const SizedBox horizontalSpace19 = SizedBox(width: n19);

const SizedBox verticalSpaceXxs = SizedBox(height: xxs);
const SizedBox verticalSpaceXs = SizedBox(height: xs);
const SizedBox verticalSpaceS = SizedBox(height: s);
const SizedBox verticalSpaceBase = SizedBox(height: base);
const SizedBox verticalSpaceM = SizedBox(height: m);
const SizedBox verticalSpaceL = SizedBox(height: l);
const SizedBox verticalSpaceXl = SizedBox(height: xl);
const SizedBox verticalSpaceXxl = SizedBox(height: xxl);

const SizedBox verticalSpace44 = SizedBox(height: n44);

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceBase,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceBase,
  ],
);
