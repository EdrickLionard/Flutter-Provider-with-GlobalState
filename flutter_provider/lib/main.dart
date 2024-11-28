import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'global_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Counter App'),
      ),
      body: ReorderableListView.builder(
        itemCount: globalState.counters.length,
        onReorder: globalState.reorderCounters,
        itemBuilder: (context, index) {
          return CounterWidget(
            key: ValueKey(index),
            index: index,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: globalState.addCounter,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CounterWidget extends StatelessWidget {
  final int index;

  const CounterWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final counter = globalState.counters[index];

    return Card(
      color: counter.color,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.drag_handle, color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${counter.label}: ${counter.value}',
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () => _editCounterDialog(context, index, counter),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () => globalState.incrementCounter(index),
            ),
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.white),
              onPressed: () => globalState.decrementCounter(index),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () => globalState.removeCounter(index),
            ),
          ],
        ),
      ),
    );
  }

  void _editCounterDialog(
      BuildContext context, int index, CounterItem counter) {
    final globalState = Provider.of<GlobalState>(context, listen: false);
    final TextEditingController labelController =
        TextEditingController(text: counter.label);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Counter'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: labelController,
                decoration: const InputDecoration(labelText: 'Label'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Color:'),
                  ElevatedButton(
                    onPressed: () async {
                      final color = await showDialog<Color>(
                        context: context,
                        builder: (context) =>
                            ColorPickerDialog(initialColor: counter.color),
                      );
                      if (color != null) globalState.changeColor(index, color);
                    },
                    child: const Text('Pick Color'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                globalState.changeLabel(index, labelController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class ColorPickerDialog extends StatelessWidget {
  final Color initialColor;

  const ColorPickerDialog({super.key, required this.initialColor});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = initialColor;

    return AlertDialog(
      title: const Text('Select Color'),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: initialColor,
          onColorChanged: (color) {
            selectedColor = color;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(selectedColor),
          child: const Text('Select'),
        ),
      ],
    );
  }
}
