import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/all_products/domain/use_case/products_use_case.dart';
import 'package:flutter_clean_arch/features/all_products/presentation/bloc/product_event.dart';
import 'package:flutter_clean_arch/features/all_products/presentation/bloc/product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState>{
  final ProductsUseCase productsUseCase;

  ProductsBloc({required this.productsUseCase}) : super(GetProductsInitialState()) {
    on<GetAllProducts>(_onGetAllProducts);
  }

  FutureOr<void> _onGetAllProducts(GetAllProducts event, Emitter<ProductsState> emit) async{
    emit(GetProductsLoadingState());

    try {
      final products = await productsUseCase();
      emit(GetProductsSuccessState(allProducts: products));
    } catch (e) {
      emit(GetProductsErrorState(errorMassage: e.toString()));
    }
  }
}