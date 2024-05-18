import 'package:flutter/material.dart';
import 'package:flutter_application_4/http_service/httpMovie.dart';
import 'package:flutter_application_4/widgets/movie_detail.dart';
// import '../http_service/httpMovie.dart';
import '../widgets/bottom_navigasi.dart';

class FilmList extends StatefulWidget {
  const FilmList({super.key});

  @override
  State<FilmList> createState() => _FilmListState();
}

class _FilmListState extends State<FilmList> {
  int? moviesCount;
  List? film;
  HttpService? service;

  String result = "";

  Future initialize() async{
    film = [];
    film = (await service?.getPopularMovies());
    setState(() {
      moviesCount = film?.length;
      film = film;
    });
  }
  
  @override
  void initState(){
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    service!.getPopularMovies().then((value) => {
      setState(() {
        result =(value != null) as String;
      })
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: film!.isEmpty ? Container() : 
      ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image(image: NetworkImage(film![position].posterPath)),
              title: Text(film![position].title),
              subtitle: Text("Rating : ${film![position].voteAverage.toString()}"),
              onTap: (){
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(film?[position]));
                  Navigator.push(context, route);
              },
            ),
          );
        }
      ),
      bottomNavigationBar: BottomNav(selectedItem: 1)
    );
  }
}