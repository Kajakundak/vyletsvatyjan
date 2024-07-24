import 'package:flutter/material.dart';
import 'timeline_event_model.dart';

class HourlyTimelineBuilder extends StatefulWidget {
  const HourlyTimelineBuilder({
    Key? key,
    required this.events,
    this.selectedEvent,
    this.onTap,
  }) : super(key: key);

  final List<TimelineEvent> events;
  final TimelineEvent? selectedEvent;
  final Function(TimelineEvent)? onTap;

  @override
  _HourlyTimelineBuilderState createState() => _HourlyTimelineBuilderState();
}

class _HourlyTimelineBuilderState extends State<HourlyTimelineBuilder> {
  OverlayEntry? _overlayEntry;
  TimelineEvent? _hoveredEvent;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showTooltip(BuildContext context, TimelineEvent event, Offset position) {
    _removeOverlay();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy + 20,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(event.time.format(context), style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(event.description),
                if (event.details != null) ...[
                  SizedBox(height: 4),
                  Text(event.details!, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    final startTime = widget.events.first.time;
    final endTime = widget.events.last.time;
    final startHour = startTime.hour;
    final endHour = endTime.hour + (endTime.minute > 0 ? 1 : 0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final hourWidth = width / (endHour - startHour);

        return Stack(
          children: [
            // Timeline line
            Positioned(
              left: 0,
              right: 0,
              top: 20,
              child: Container(
                height: 2,
                color: Colors.grey,
              ),
            ),
            // Hour markers
            ...List.generate(endHour - startHour + 1, (index) {
              final hour = startHour + index;
              return Positioned(
                left: index * hourWidth,
                top: 0,
                child: Text(
                  '${hour.toString().padLeft(2, '0')}:00',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              );
            }),
            // Event points
            ...widget.events.map((event) {
              final eventMinutes = (event.time.hour * 60 + event.time.minute) - (startHour * 60);
              final position = (eventMinutes / 60) * hourWidth;

              return Positioned(
                left: position - 5,
                top: 15,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _hoveredEvent = event;
                    });
                    _showTooltip(context, event, Offset(position, 15));
                  },
                  onExit: (_) {
                    setState(() {
                      _hoveredEvent = null;
                    });
                    _removeOverlay();
                  },
                  child: GestureDetector(
                    onTap: () => widget.onTap?.call(event),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.selectedEvent == event ? Colors.red : Colors.blue,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}