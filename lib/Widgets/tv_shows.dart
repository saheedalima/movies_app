import 'package:flutter/material.dart';

import '../description.dart';

class tv_shows extends StatelessWidget {

  final List tv;
  tv_shows({required this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("TV Shows"),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>Description(
                          name: tv[index]['title'] ?? 'Data not availabele',

                          bannerurl: tv[index]['backdrop_path'] != null
                              ? 'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path']
                              : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',

                          posterurl: tv[index]['poster_path'] != null
                              ? 'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path']
                              : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',

                          description: tv[index]['overview'] ?? 'Data not availabele',

                          vote: tv[index]['vote_average']?.toString() ?? '0.00',

                          launch_on: tv[index]['release_date'] ?? 'Data not availabele'
                      ),),),
                    child: Container(
                      height: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(image:
                                NetworkImage('https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']))
                            ),
                          ),
                          Container(
                            child: Text(tv[index]['title'] != null ?
                            tv[index]['title'] : 'loading',style: TextStyle(fontSize: 15),),
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
