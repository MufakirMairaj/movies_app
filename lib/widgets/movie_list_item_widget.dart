import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/models/movie_response.dart';
import 'package:movies_app/screens/movie_detail_screen.dart';
import 'package:movies_app/services/constants.dart';
import 'package:movies_app/styles/text_styles.dart';

class MovieListItemWidget extends StatelessWidget {
  final Results moviesResponse;

  const MovieListItemWidget({Key? key, required this.moviesResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const MovieDetailScreen(), arguments: [
          moviesResponse.id.toString(),
        ]);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              imageUrl: imageURl + "${moviesResponse.backdropPath}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
              moviesResponse.originalTitle.toString(),
              style: TextStyles.title,
            ),
          )
        ],
      ),
    );
  }
}
