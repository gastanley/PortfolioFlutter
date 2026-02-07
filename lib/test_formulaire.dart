import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  final events = [
    {
      "speaker": "Lior chamla",
      "date": "13h à 13h30",
      "subject": "Le code legacy",
      "avatar": "lior"
    },
    {
      "speaker": "Damien Cavailles",
      "date": "17h30 à 18h",
      "subject": "git blame --no-offense",
      "avatar": "damien"
    },
    {
      "speaker": "Defend Intelligence",
      "date": "18h à 18h30",
      "subject": "A la découverte des IA generatif",
      "avatar": "defintelligence"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Planning du salon"),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              // final event = [index];

              return const Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text('Two line ListTile'),
                  subtitle: Text('Here is a second line'),
                  trailing: Icon(Icons.more_vert),
                ),
              );
            },
          ),
        ));
  }
}
