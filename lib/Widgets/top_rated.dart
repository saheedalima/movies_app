import 'package:flutter/material.dart';

import '../description.dart';

class top_rated extends StatelessWidget {

  final List toprate;
  top_rated({required this.toprate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top rated"),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprate.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>Description(
                          name: toprate[index]['title'] ?? 'Data not availabele',

                          bannerurl: toprate[index]['backdrop_path'] != null
                              ? 'https://image.tmdb.org/t/p/w500' + toprate[index]['backdrop_path']
                              : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',

                          posterurl: toprate[index]['poster_path'] != null
                              ? 'https://image.tmdb.org/t/p/w500' + toprate[index]['poster_path']
                              : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',

                          description: toprate[index]['overview'] ?? 'Data not availabele',

                          vote: toprate[index]['vote_average']?.toString() ?? '0.00',

                          launch_on: toprate[index]['release_date'] ?? 'Data not availabele'
                      ),),),
                    child: Container(
                      height: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(image:
                                NetworkImage('https://image.tmdb.org/t/p/w500'+toprate[index]['poster_path']))
                            ),
                          ),
                          Container(
                            child: Text(toprate[index]['title'] != null ?
                            toprate[index]['title'] : 'loading',style: TextStyle(fontSize: 15),),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );;
  }
}
