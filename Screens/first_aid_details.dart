import 'package:flutter/material.dart';
import '../models/first_aid_service.dart';
import '../models/first_aid_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FirstAidDetailScreen extends StatefulWidget {
  final String categoryId;

  const FirstAidDetailScreen({required this.categoryId});

  @override
  _FirstAidDetailScreenState createState() => _FirstAidDetailScreenState();
}

class _FirstAidDetailScreenState extends State<FirstAidDetailScreen> {
  late Future<FirstAidModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = FirstAidService.loadCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirstAidModel>(
      future: futureData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final data = snapshot.data!;
        final videoController = YoutubePlayerController(
          initialVideoId: data.video.videoId,
          flags: const YoutubePlayerFlags(autoPlay: false),
        );

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFFF1744),
              title: Text(data.name,style: TextStyle(color: Colors.white),),
              bottom: const TabBar(
                unselectedLabelColor: Colors.white,
                dividerColor: Colors.white,
                labelColor: Colors.white,
                tabs: [
                  Tab(text: "Video"),
                  Tab(text: "Text"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // Video Tab
                SizedBox(
                  child: YoutubePlayer(
                    width: 50,
                    aspectRatio: 12/3,
                    controller: videoController,
                    showVideoProgressIndicator: true,
                    actionsPadding: EdgeInsets.all(8.0),
                  ),
                ),

                // Text Tab → Onboarding style steps
                PageView.builder(
                  itemCount: data.steps.length,
                  itemBuilder: (context, index) {
                    final step = data.steps[index];
                    return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Title at the top
                        Text(
                          step.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Image with step number overlay
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Image.asset(
                              step.image,
                              height: 220,
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              top: 10,
                              child: Text(
                                "Step ${step.stepNumber}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Description below the image
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            step.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
