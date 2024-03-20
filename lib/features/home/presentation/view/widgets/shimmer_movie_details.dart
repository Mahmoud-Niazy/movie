import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMovieDetails extends StatelessWidget{
  const ShimmerMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 1.0,
              child: SizedBox(
                height: screenSize.height * .4,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: screenSize.height * .07,
            ),
            Center(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Card(
                      elevation: 1.0,
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}