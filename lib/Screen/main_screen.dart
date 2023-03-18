import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yts_movie/Bloc/app_bloc.dart';
import 'package:yts_movie/Models/MainScreenModals/movie_details.dart';

import '../Widget/custom_app_bar.dart';
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
          appBar: const CustomAppBar(),
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

