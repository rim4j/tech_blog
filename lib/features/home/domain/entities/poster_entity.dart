import 'package:equatable/equatable.dart';

class PosterEntity extends Equatable {
  final String? id;
  final String? title;
  final String? image;

  const PosterEntity({
    this.id,
    this.title,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
      ];
}
