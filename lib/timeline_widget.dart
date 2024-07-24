import 'package:flutter/material.dart';
import 'timeline_event_model.dart';

class TimelineWidget extends StatelessWidget {
  final List<TimelineEvent> events;

  TimelineWidget({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          leading: Text(event.time.format(context)),
          title: Text(event.description),
          onTap: event.header != null ? () => _showEventDetails(context, event) : null,
        );
      },
    );
  }

  void _showEventDetails(BuildContext context, TimelineEvent event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.header!),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.details!),
                SizedBox(height: 8),
                Text('Location: ${event.mapPosition}'),
                SizedBox(height: 8),
                if (event.imageUrl != null) Image.network(event.imageUrl!),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}