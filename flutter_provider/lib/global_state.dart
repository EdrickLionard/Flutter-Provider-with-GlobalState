import 'package:flutter/material.dart';

class CounterItem {
  int value;
  Color color;
  String label;

  CounterItem({
    required this.value,
    this.color = Colors.blue,
    this.label = "Counter",
  });
}

class GlobalState extends ChangeNotifier {
  final List<CounterItem> _counters = [];

  List<CounterItem> get counters => List.unmodifiable(_counters);

  void addCounter() {
    _counters.add(CounterItem(value: 0));
    notifyListeners();
  }

  void removeCounter(int index) {
    if (index >= 0 && index < _counters.length) {
      _counters.removeAt(index);
      notifyListeners();
    }
  }

  void incrementCounter(int index) {
    if (index >= 0 && index < _counters.length) {
      _counters[index].value++;
      notifyListeners();
    }
  }

  void decrementCounter(int index) {
    if (index >= 0 && index < _counters.length && _counters[index].value > 0) {
      _counters[index].value--;
      notifyListeners();
    }
  }

  void changeColor(int index, Color color) {
    if (index >= 0 && index < _counters.length) {
      _counters[index].color = color;
      notifyListeners();
    }
  }

  void changeLabel(int index, String label) {
    if (index >= 0 && index < _counters.length) {
      _counters[index].label = label;
      notifyListeners();
    }
  }

  void reorderCounters(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex--;
    final item = _counters.removeAt(oldIndex);
    _counters.insert(newIndex, item);
    notifyListeners();
  }
}
