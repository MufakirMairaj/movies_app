import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/movie_controller.dart';
import 'package:movies_app/models/movie_response.dart';
import 'package:movies_app/screens/video_screen.dart';
import 'package:movies_app/styles/text_styles.dart';
import 'package:movies_app/widgets/app_button.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final _movieController = Get.put(MovieController());
  var arguments = Get.arguments;
  late Results _results;
  late String movieId;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() {
    setState(() {
      movieId = arguments[0].toString();
      _results = _movieController.findMovieById(movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Watch"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w138_and_h175_face/mdviAeQNEAOSddeViLMPh3Ihiqb.jpg",
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _results.title!.toString(),
                              style: TextStyles.subtitle,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const AppButton(
                              title: "Get Tickets",
                              color: Colors.blue,
                              function: null,
                            ),
                            AppButton(
                                title: "Watch Trailer",
                                color: Colors.transparent,
                                function: () => _onWatchTrailerClicked())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _results.overview!,
                  style: TextStyles.desc,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onWatchTrailerClicked() {
    Get.to(() => const VideoScreen());
  }
}
