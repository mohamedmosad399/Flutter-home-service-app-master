import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapButtonWidget extends StatelessWidget {
  final double latitude;
  final double longitude;

  MapButtonWidget({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _openGoogleMaps(context),
      child: Text('Open Google Maps'),
    );
  }

  void _openGoogleMaps(BuildContext context) async {
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}