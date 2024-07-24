import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'timeline_event_model.dart';
import 'hourly_timeline_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> backgroundImages = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image8.jpg',
    'assets/images/image9.jpg',
    'assets/images/image10.jpg',
    'assets/images/image11.jpg',
    'assets/images/image12.jpg',
    'assets/images/image13.jpg',
  ];

  int currentImageIndex = 0;
  TimelineEvent? selectedEvent;
  TimelineEvent? hoveredEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Image.network(
              backgroundImages[currentImageIndex],
              key: ValueKey<int>(currentImageIndex),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 20.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Výlet Svatý Jan pod Skalou'),
                  background: Container(
                    color: Colors.orange.withOpacity(0.5),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Harmonogram',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: HourlyTimelineBuilder(
                    events: timelineEvents,
                    selectedEvent: selectedEvent,
                    onTap: _showEventDetails,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final event = timelineEvents[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: Colors.white.withOpacity(0.8),
                      child: ListTile(
                        title: Text(event.description, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(event.time.format(context)),
                            if (event.details != null) Text(event.details!, maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                        onTap: () => _showEventDetails(event),
                      ),
                    );
                  },
                  childCount: timelineEvents.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Card(
                    color: Colors.white.withOpacity(0.8),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mapa trasy',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[500]),
                          ),
                          SizedBox(height: 16),
                          Container(
                            height: 400, // Adjust the height as needed
                            child: HtmlWidget(
                              '<iframe style="border: none; width: 100%; height: 100%;" src="https://frame.mapy.cz/s/pubapavapu" frameborder="0"></iframe>',
                              onErrorBuilder: (context, element, error) => Text('$element error: $error'),
                              onLoadingBuilder: (context, element, loadingProgress) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              renderMode: RenderMode.column,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTooltip(TimelineEvent event) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
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
    );
  }

  void _showEventDetails(TimelineEvent event) {
    setState(() {
      selectedEvent = event;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.header ?? 'Event Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.time.format(context), style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(event.description),
                if (event.details != null) ...[
                  SizedBox(height: 8),
                  Text(event.details!),
                ],
                if (event.mapPosition != null) ...[
                  SizedBox(height: 8),
                  Text('Location: ${event.mapPosition}'),
                ],
                if (event.imageUrl != null) ...[
                  SizedBox(height: 8),
                  Image.network(event.imageUrl!),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedEvent = null;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startImageAnimation();
  }

  void _startImageAnimation() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % backgroundImages.length;
      });
      _startImageAnimation();
    });
  }
}