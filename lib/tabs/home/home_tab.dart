import 'package:flutter/material.dart';
import 'package:movies_app/api/new_release_respons/api_serveices.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/tabs/home/model/newreleases.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<NewReleases> newReleases = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNewReleases();
  }

  Future<void> fetchNewReleases() async {
    try {
      final releases = await ApiServices().fetchNewReleases();
      setState(() {
        newReleases = releases;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching movies: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: AppTheme.grey,
        width: width,
        height: height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New release",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppTheme.white),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newReleases.length,
                        itemBuilder: (_, index) => newReleases[index]),
                  ),
          ],
        ),
      ),
    );
  }
}
