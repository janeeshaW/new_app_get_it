import 'package:equatable/equatable.dart';



class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  List<Object> get props => [name, id];
}

