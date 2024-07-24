import 'package:flutter/material.dart';
import 'timeline_event_model.dart';

class TimelineEntry extends StatelessWidget {
  const TimelineEntry({
    Key? key,
    required this.event,
    required this.isSelected,
  }) : super(key: key);

  final TimelineEvent event;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            event.time.format(context),
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            event.description,
            style: TextStyle(fontSize: 8),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}