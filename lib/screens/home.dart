import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_match/widgets/candidateItem.dart';
import '../data/dummyCandidates.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Match'),
        centerTitle: true,
      ),
      body: Stack(
        children: DUMMY_CANDIDATES.map((candidate) => CandidateItem(
          candidateId: candidate.candidateId, 
          candidateName: candidate.candidateName, 
          candidateImgs: candidate.candidateImgs, 
          candidateAge: candidate.candidateAge, 
          candidateGender: candidate.candidateGender))
          .toList()
      ),
    );
  }
}
