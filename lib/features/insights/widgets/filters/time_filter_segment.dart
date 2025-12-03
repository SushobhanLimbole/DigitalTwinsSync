import 'package:flutter/material.dart';

class TimeFilterSegment extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  const TimeFilterSegment({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<int>(
      segments: const [
        ButtonSegment(value: 0, label: Text('Day')),
        ButtonSegment(value: 1, label: Text('Week')),
        ButtonSegment(value: 2, label: Text('Month')),
        ButtonSegment(value: 3, label: Text('All Time')),
      ],
      selected: {selected},
      onSelectionChanged: (value) => onChanged(value.first),
      style: SegmentedButton.styleFrom(
        selectedBackgroundColor: const Color(0x1A39FF14),
        selectedForegroundColor: const Color(0xFF39FF14),
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: Colors.white70,
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}