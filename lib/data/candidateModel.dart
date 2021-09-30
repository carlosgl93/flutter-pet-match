enum Gender {
  Male,
  Female,
}

class Candidate {
  final int candidateId;
  final List<String> candidateImgs;
  final String candidateName;
  final String candidateDescription;
  final String candidateBreed;
  final Gender candidateGender;
  final String candidateAge;

  const Candidate({
    required this.candidateId,
    required this.candidateImgs,
    required this.candidateName,
    required this.candidateDescription,
    required this.candidateBreed,
    required this.candidateGender,
    required this.candidateAge,
  });
}
