import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List<String> posters = [
  'assets/images/poster 1.jpg',
  'assets/images/poster 2.jpg',
  'assets/images/poster 3.jpg',
  'assets/images/poster 4.jpg',
  'assets/images/poster 5.jpg',
  'assets/images/poster 6.jpg',
  'assets/images/poster 7.jpg',
  'assets/images/poster 8.jpg',
  'assets/images/poster 9.jpg',
  'assets/images/poster 10.jpg',
  'assets/images/poster 11.jpg',
  'assets/images/poster 12.jpg',
  'assets/images/poster 13.jpg',
  'assets/images/poster 14.jpg',
  'assets/images/poster 15.jpg',
  'assets/images/poster 16.jpg',
  'assets/images/poster 17.jpg',
  'assets/images/poster 18.jpg',
];
class CarouselWidget extends StatelessWidget{
  const CarouselWidget({super.key});


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return CarouselSlider(
      items: posters.map((poster) {
        return Image.asset(
          poster,
          fit: BoxFit.cover,
        );
      }).toList(),
      options: CarouselOptions(
        height: screenSize.height * .46,
        viewportFraction: .5,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
        enlargeFactor: 0.45,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}