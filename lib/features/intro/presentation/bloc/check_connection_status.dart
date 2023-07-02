// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CheckConnectionStatus extends Equatable {}

class CheckConnectionInitial extends CheckConnectionStatus {
  @override
  List<Object?> get props => [];
}

class CheckConnectionOn extends CheckConnectionStatus {
  @override
  List<Object?> get props => [];
}

class CheckConnectionOff extends CheckConnectionStatus {
  final String message;

  CheckConnectionOff({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
