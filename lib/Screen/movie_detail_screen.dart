import 'package:flutter/material.dart';

import '../Widget/custom_app_bar.dart';
import '../Widget/download_options.dart';
import '../Widget/movie_review.dart';
import '../Widget/options_for_720p.dart';
import '../Widget/top_cast_names.dart';

// ignore: must_be_immutable
class MovieDetail extends StatefulWidget {
  MovieDetail({super.key,
    required this.movieTitle,
    required this.movieYear,
    required this.movieGenre,
    required this.movieImage,
    required this.movieRating,
    required this.movieRuntime,
    required this.movieSummary,
    required this.movieSize});

  String movieTitle;
  int movieYear;
  List<String> movieGenre;
  String movieImage;
  num? movieRating;
  num? movieRuntime;
  String movieSummary;
  String movieSize;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> with TickerProviderStateMixin {
  late TabController bartabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    bartabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1d1d1d),
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movieTitle,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.movieYear.toString(),
                  style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 20,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                    const Text(
                      '/',
                      style: TextStyle(color: Colors.white, fontSize: 21),
                      overflow: TextOverflow.ellipsis,
                    ),
                    itemCount: widget.movieGenre.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Text(
                        widget.movieGenre[index],
                        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 235,
                          width: 160,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(widget.movieImage),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            width: 160,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(color: const Color(0xff00FFE7), borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              'Watch Now',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.green,
                              ),
                              const Spacer(),
                              Text(
                                widget.movieRuntime.toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 18,
                                width: 50,
                                child: Image(
                                  image: AssetImage('assets/images/IMDB_Logo_2016.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                widget.movieRating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        DownloadOptions(optionName: '720p.BluRay'),
                        const SizedBox(height: 5),
                        DownloadOptions(optionName: '1080p.BluRay'),
                        const SizedBox(height: 5),
                        DownloadOptions(optionName: 'Download Subtitles'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Plot Summary',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  widget.movieSummary,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Director',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Jeff Wamester',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: const Color(0xff2f2f2f),
                  ),
                ),
                const Text(
                  'Top Cast',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 5),
                TopCastNames(name: 'Jensen Ackles', subName: ' as Batman'),
                const Divider(color: Color(0xff555555)),
                TopCastNames(name: 'Matt Boomer', subName: ' as The Flash'),
                const Divider(color: Color(0xff555555)),
                TopCastNames(name: 'Gideon Adlon', subName: ' as Phantom Girl'),
                const Divider(color: Color(0xff555555)),
                TopCastNames(name: 'Harry Shum Jr.', subName: ' as  Brainaic 5'),
                const Divider(color: Color(0xff555555)),
                const SizedBox(height: 5),
                TabBar(
                  controller: bartabcontroller,
                  tabs: const [Text('720p.BLU'), Text('1080p.BLU')],
                ),
                Container(
                  height: 350,
                  color: const Color(0xff171717),
                  child: TabBarView(
                    controller: bartabcontroller,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          OptionsFor20p(name: '768.71 MB', icon: const Icon(Icons.folder, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: '1280*720', icon: const Icon(Icons.expand, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: 'English 2.0', icon: const Icon(Icons.volume_up, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: 'PG-13', icon: const Icon(Icons.remove_red_eye, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: 'Subtitles', icon: const Icon(Icons.subtitles, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: '23.976 fps', icon: const Icon(Icons.camera_alt_rounded, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: '1 hr 23 min', icon: const Icon(Icons.alarm, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          Row(
                            children: const [
                              Text(
                                'P/S',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '23.976 fps',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          OptionsFor20p(name: '768.71 MB', icon: const Icon(Icons.folder, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: '1280*720', icon: const Icon(Icons.expand, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: 'English 2.0', icon: const Icon(Icons.volume_up, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: 'PG-13', icon: const Icon(Icons.remove_red_eye, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: 'Subtitles', icon: const Icon(Icons.subtitles, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: '23.976 fps', icon: const Icon(Icons.camera_alt_rounded, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          OptionsFor20p(name: '1 hr 23 min', icon: const Icon(Icons.alarm, color: Colors.grey)),
                          const Divider(color: Color(0xff555555)),
                          Row(
                            children: const [
                              Text(
                                'P/S',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '23.976 fps',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const MovieReviewWidget(),
                const Divider(color: Color(0xff555555)),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: const Text('Read more IMDb reviews', textAlign: TextAlign.end, style: TextStyle(color: Colors.grey)),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.message,
                      color: Colors.green,
                      size: 30,
                    ),
                    const SizedBox(width: 5),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '20',
                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
                          ),
                          TextSpan(
                            text: 'Comments',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),)
          ,
        )
        ,
      )
      ,
    );
  }
}
