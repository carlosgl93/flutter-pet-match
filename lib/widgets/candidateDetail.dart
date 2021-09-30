import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../data/dummyCandidates.dart';
import './likeDislikeCTAs.dart';
import '../config.dart';

class CandidateDetail extends StatelessWidget {

  final width = Config.screenWidth;
  final height = Config.screenHeight;
  
  @override
  Widget build(BuildContext context) {
  final candidateId = Get.parameters['userPet'];
  final selectedCandidate = DUMMY_CANDIDATES
      .firstWhere((candidate) => candidate.candidateId == candidateId as int);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedCandidate.candidateName),
          centerTitle: true,
          actions: [
            Icon(Icons.more_vert)
            // todo implement action to display modal that lets report the profile
          ],
        ),
        body: Column(
          children: [
            CarouselSlider(
                items: selectedCandidate.candidateImgs
                .map(
                    (image) => Container(
                      child: Center(
                        child: Image.network(image, fit: BoxFit.cover),
                      )
                    )
                  ).toList(),
                // Selected items will be the animal images,
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),),),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height! * 0.05,
                  horizontal: width! * 0.1,
                ),
                child: Row(
                  children: [
                    Text(
                  selectedCandidate.candidateName +
                      ', ' +
                      selectedCandidate.candidateAge +
                      ', ' +
                      selectedCandidate.candidateBreed,
                ),
                  ],
                )
              ),
              // candidate desc section
              Container(
                padding: EdgeInsets.symmetric(horizontal: width! * 0.05),
                child: Text(
                  selectedCandidate.candidateDescription, 
                ),
              ),
              // like or dislike CTAS
              LikeDislikeCTAs()
              
          ],
        ));
  }
}
