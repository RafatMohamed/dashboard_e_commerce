class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductError extends AddProductState {
  final String message;
  AddProductError({required this.message});
}

final class AddProductSuccess extends AddProductState {}