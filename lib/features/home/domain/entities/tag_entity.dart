import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String? id;
  final String? title;

  const TagEntity({
    this.id,
    this.title,
  });

  @override
  List<Object?> get props => [];
}
