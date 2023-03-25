import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fakestore/controller/home/home_controller.dart';
import 'package:get/get.dart';

class BannerSection extends StatelessWidget {
  final HomeController controller = Get.find();
  final List<dynamic> products;

  BannerSection({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
          ),
          items: products.map((product) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        product['image'],
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        product['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
