import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

Widget sel<T extends ChangeNotifier, V>(
  V Function(T) selector,
  Widget Function(V) builder,
) {
  return Selector<T, V>(
    selector: (_, controller) => selector(controller),
    builder: (_, value, __) => builder(value),
  );
}

void waitBuilding(Function f) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    f();
  });
}

Widget loading() {
  return const CircularProgressIndicator().centered();
}