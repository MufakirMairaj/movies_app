import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controllers/movie_controller.dart';
import 'package:movies_app/services/api_respons.dart';
import 'package:movies_app/styles/text_styles.dart';
import 'package:movies_app/widgets/movie_list_item_widget.dart';
import 'package:movies_app/widgets/show_error_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _movieController = Get.put(MovieController());
  bool isDataFetched = false;

  @override
  void initState() {
    _fetchPopularMovies();
    super.initState();
  }

  Future<void> _fetchPopularMovies() async {
    await _movieController.fetchPopularMovies();
    setState(() {
      isDataFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Center(
        child:
            (isDataFetched) ? _pageBody() : const CircularProgressIndicator(),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title:  Text(
        "Upcoming Movies List",
        style: TextStyles.appBarTitle,
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget _pageBody() {
    return SizedBox(
      child: GetBuilder<MovieController>(
          init: MovieController(), // INIT IT ONLY THE FIRST TIME
          builder: (_movieController) {
            if (_movieController.movieResults?.status == Status.completed) {
              if ((_movieController.movieResults!.data!.isNotEmpty)) {
                return GridView.builder(
                  itemCount: _movieController.movieResults!.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return MovieListItemWidget(
                      moviesResponse:
                          _movieController.movieResults!.data![index],
                    );
                  },
                );
              } else {
                return const Text("Sorry! No Movies Found! 🤕");
              }
            } else if (_movieController.movieResults?.status == Status.error) {
              return ShowErrorWidget(
                  text: _movieController.movieResults!.message ??
                      "Some Error Occurred");
            }
            return const SizedBox();
          }),
    );
  }
}
