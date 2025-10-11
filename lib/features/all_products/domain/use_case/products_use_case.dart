import 'package:flutter_clean_arch/features/all_products/domain/repository/product_repository.dart';

class ProductsUseCase {
  final ProductRepository productRepository;

  ProductsUseCase({required this.productRepository});

  Future call() async{
    return productRepository.productRepo();
  }
}