abstract class ProductsState {}

class GetProductsInitialState extends ProductsState{}
class GetProductsLoadingState extends ProductsState {}
class GetProductsErrorState extends ProductsState {
  final String errorMassage;

  GetProductsErrorState({required this.errorMassage});
}

class GetProductsSuccessState extends ProductsState {
  final Map<String, dynamic> allProducts;

  GetProductsSuccessState({required this.allProducts});
}