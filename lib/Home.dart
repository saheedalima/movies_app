import 'package:flutter/material.dart';
import 'package:movies_app/Widgets/top_rated.dart';
import 'package:movies_app/Widgets/trending.dart';
import 'package:movies_app/Widgets/tv_shows.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingmovies = [];
  List top_ratedmovies = [];
  List tv_showsmovies = [];

  final String apikey = '8b1bf6edbd1383ded6a296ce466376fb';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjFiZjZlZGJkMTM4M2RlZDZhMjk2Y2U0NjYzNzZmYiIsInN1YiI6IjY0YjRjNWQxMTIxOTdlMDBmZjAxZDYxZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rJV3z2Ga6zULokIeC5H6WnvA9WN9vy-fu2o-vCfwfiI';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text("Movies App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
      ),),
      body: ListView(
        children: [
          Trending_movies(trending : trendingmovies),//refractoring widgets
          top_rated(toprate: top_ratedmovies),
          tv_shows(tv: tv_showsmovies)
        ],
      ),
    );
  }

   loadmovies() async {
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(apikey, readaccesstoken),logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));

    Map trendinglist = await tmdbwithcustomlogs.v3.trending.getTrending();  //fetch all the trending movies
    Map toprated = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvshows = await tmdbwithcustomlogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendinglist['results'];
      top_ratedmovies = toprated['results'];
      tv_showsmovies =  tvshows['results'];
    });
    print(trendingmovies);
  }
}
