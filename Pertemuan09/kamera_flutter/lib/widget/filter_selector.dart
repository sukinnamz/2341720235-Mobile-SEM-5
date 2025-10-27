import 'package:flutter/material.dart';
import 'filter_item.dart';

class FilterSelector extends StatefulWidget {
  const FilterSelector({
    super.key,
    required this.onFilterChanged,
    required this.filters,
    this.padding = const EdgeInsets.all(16.0),
  });

  final ValueChanged<Color> onFilterChanged;
  final List<Color> filters;
  final EdgeInsets padding;

  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  int _selectedIndex = 0;

  void _onFilterTapped(int index) {
    setState(() => _selectedIndex = index);
    widget.onFilterChanged(widget.filters[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: widget.padding,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        itemBuilder: (context, index) {
          final color = widget.filters[index];
          return FilterItem(
            color: color,
            onFilterSelected: () => _onFilterTapped(index),
          );
        },
      ),
    );
  }
}
