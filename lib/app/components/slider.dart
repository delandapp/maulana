import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

@immutable
class MySlider extends StatelessWidget {
  MySlider({super.key,});
  final List<String> imgSlider = [
  'assets/slider-1.png',
  'assets/slider-2.png',
  'assets/slider-3.png',
];

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.3,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
        ),
        items: imgSlider.map((imgUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(imgUrl), fit: BoxFit.fill)),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
