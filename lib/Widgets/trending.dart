import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';

class Trending_movies extends StatelessWidget {

  final List trending;
  Trending_movies({required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trending Movies"),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
                itemBuilder: (context,index){
                return InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>Description(
                    name: trending[index]['title'] ?? 'Data not availabele',

                    bannerurl: trending[index]['backdrop_path'] != null
                    ? 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path']
                        : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',

                    posterurl: trending[index]['poster_path'] != null
                    ? 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path']
                        : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',

                    description: trending[index]['overview'] ?? 'Data not availabele',

                    vote: trending[index]['vote_average']?.toString() ?? '0.00',

                  launch_on: trending[index]['release_date'] ?? 'Data not availabele'
                ),),),
                  child: Container(
                    height: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image:
                            NetworkImage('https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']))
                          ),
                        ),
                        Container(
                          child: Text(trending[index]['title'] != null ?
                          trending[index]['title'] : 'loading',style: TextStyle(fontSize: 15),),
                        )
                      ],
                    ),
                  )
                  ,
                );
                }),
          )
        ],
      ),
    );
  }
}
