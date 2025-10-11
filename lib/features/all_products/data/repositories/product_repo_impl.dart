import 'package:flutter_clean_arch/features/all_products/data/data_source/products_remote_data_source.dart';
import 'package:flutter_clean_arch/features/all_products/domain/repository/product_repository.dart';

class ProductRepoImpl implements ProductRepository{
  final ProductsRemoteDataSource productsRemoteDataSource;
  ProductRepoImpl({required this.productsRemoteDataSource});

  @override
  Future<Map<String, dynamic>> productRepo() async{
    return await productsRemoteDataSource.fatchProduct();
  }

}