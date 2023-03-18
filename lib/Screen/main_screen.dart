import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts_movie/Bloc/app_bloc.dart';
import 'package:yts_movie/Models/MainScreenModals/movie_details.dart';

import '../Widget/movie_list.dart';
import '../Widget/top_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
       context.read<AppBloc>().getMediaList();
        return ;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff23241F),
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
          body: BlocBuilder<AppBloc, Data>(
            builder: (context, state) => SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TopBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xff2D2C28),
                      ),
                    ),
                    const MovieList(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Latest YIFY movies Torrent',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Browse All',
                            style: TextStyle(color: Color(0xff868584)),
                          ),
                        )
                      ],
                    ),
                    const MovieList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
