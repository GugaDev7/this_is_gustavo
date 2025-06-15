import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  final String imageAsset;
  final String nameValue;
  final String descriptionValue;
  final String linkValue;

  const ProjectWidget({
    super.key,
    required this.imageAsset,
    required this.nameValue,
    required this.descriptionValue,
    required this.linkValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageAsset),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                nameValue,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(descriptionValue),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: () {}, child: Text('Ver projeto')),
            ),
          ],
        ),
      ),
    );
  }
}
