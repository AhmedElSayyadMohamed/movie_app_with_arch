import 'package:flutter/material.dart';

import '../image_with_shader.dart';

class NowPlayingMovieComponent extends StatelessWidget {

  final String image;
  final String movieName;
  final Function()? onTap;
  const NowPlayingMovieComponent({
    super.key,
    required this.image,
    required this.movieName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Stack(
        children: [
          ImageWithShader(
              image: image,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                const Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Now Playing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 16),
                  child: Text(
                    movieName,
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
