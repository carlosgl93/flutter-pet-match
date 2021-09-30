import './candidateModel.dart';

const DUMMY_CANDIDATES = const [
  Candidate(
    candidateId: 1,
    candidateImgs: [
      'https://http2.mlstatic.com/D_NQ_NP_685115-MLC25168650938_112016-O.jpg',
      'https://http2.mlstatic.com/D_NQ_NP_644132-MLC26326225548_112017-O.jpg',
    ],
    candidateAge: '2',
    candidateBreed: 'Poodle Toy',
    candidateDescription:
        'Miel es una poodle toy de 2 años. Buscamos cruzarla con un perrito de su tamaño',
    candidateGender: Gender.Female,
    candidateName: 'Miel',
  ),
  Candidate(
    candidateId: 2,
    candidateImgs: [
      'https://www.hola.com/imagenes/estar-bien/20201202180412/perro-doberman-raza-perro-mitos/0-896-732/dobermann-m.jpg',
      'https://www.mividaporunperro.com/wp-content/uploads/2019/03/doberman-raza-de-perros-grandes.jpg',
    ],
    candidateAge: '4',
    candidateBreed: 'Doberman',
    candidateDescription:
        'Busco una hembra doberman para cruzar a mi perro',
    candidateGender: Gender.Male,
    candidateName: 'Hunter',
  )

];
