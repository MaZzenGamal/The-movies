import 'package:flutter/material.dart';
import 'package:the_movies/movies/presentation/screens/movies_screen.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MoviesScreen()));
        }, child: Text('HHHHHH'),),
      ),
    );
  }
}
