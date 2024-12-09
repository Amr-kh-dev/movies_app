import 'package:flutter/material.dart';
import 'package:movies_app/app_theme.dart';

class NewReleases extends StatefulWidget {
  final String imagePath;
  final String title;
  final String rating;

  NewReleases({
    required this.imagePath,
    required this.title,
    required this.rating,
  });

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  bool togele = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: GestureDetector(
                  onTap: () {
                    togele = !togele;
                    setState(() {});
                  },
                  child: togele
                      ? Container(
                          width: 30,
                          height: 30,
                          decoration:
                              BoxDecoration(color: AppTheme.goldenYellow),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(color: AppTheme.grey),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 14),
            const SizedBox(width: 4),
            Text(
              widget.rating,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
// class NewReleases {
//   final String imagePath;
//   final String title;
//   final String rating;

//   NewReleases({
//     required this.imagePath,
//     required this.title,
//     required this.rating,
//   });
// }
