import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieDetail extends StatefulWidget {
  MovieDetail(
      {super.key,
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
        appBar: AppBar(
          // ignore: use_full_hex_values_for_flutter_colors
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Logo-YTS.svg/1200px-Logo-YTS.svg.png'),
          ),
          actions: const [
            Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search)),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  '4K',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ))),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.bar_chart)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.list_alt)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.person)),
          ],
        ),
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
                    separatorBuilder: (context, index) => const Text(
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
                        Container(
                          height: 32,
                          width: 125,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.download,
                                color: Colors.green,
                              ),
                              Text(
                                '720p.BluRay',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 32,
                          width: 125,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.download,
                                color: Colors.green,
                              ),
                              Text(
                                '1080p.BluRay',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 60,
                          width: 125,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.download,
                                  color: Colors.green,
                                ),
                                Flexible(
                                  child: Text(
                                    'Download Subtitles',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff2f2f2f),
                  ),
                ),
                const Text(
                  'Top Cast',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: 'Jensen Ackles', style: TextStyle(color: Colors.grey)),
                          TextSpan(text: ' as Batman', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff2f2f2f),
                  ),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: 'Matt Boomer', style: TextStyle(color: Colors.grey)),
                          TextSpan(text: ' as The Flash', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff2f2f2f),
                  ),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: 'Gideon Adlon', style: TextStyle(color: Colors.grey)),
                          TextSpan(text: ' as Phantom Girl', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff2f2f2f),
                  ),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: 'Harry Shum Jr.', style: TextStyle(color: Colors.grey)),
                          TextSpan(text: ' as Brainaic 5', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff2f2f2f),
                  ),
                ),
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
                          Row(
                            children: const [
                              Icon(
                                Icons.folder,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '768.71 MB',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.expand,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '1280*720',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.volume_up,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'English 2.0',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'PG-13',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.subtitles,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Subtitles',
                                style: TextStyle(color: Colors.green, fontSize: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '23.976 fps',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.alarm,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '1 hr 23 min',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
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
                      const Text('444444444'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Movie Reviews',
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Reviewed by',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.star, color: Colors.green, size: 15),
                    Text(
                      '/10',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff2f2f2f),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25  ),
                          ),
                          TextSpan(text: 'Comments', style: TextStyle( fontSize: 25  ),)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
