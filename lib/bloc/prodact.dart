import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trndy_stor/Entity/home_entity.dart';
import 'package:trndy_stor/bloc/prodact_event.dart';
import 'package:trndy_stor/bloc/prodact_state.dart';
import 'package:trndy_stor/data_respons/home_respons.dart';

class ProdactBlock extends Bloc<ProdactEvent, ProdactState> {
  final ProdactRespons respons;
  ProdactBlock(this.respons) : super(Prodactintial()) {
    on<LoadProdactsEvent>((event, emit) async {
      emit(Prodactloddeng());
      try {
        final data = await respons.getProdactFromBackend();
        emit(Prodactloded(data));
      } catch (e) {
        emit(ProdactErorr(e.toString()));
      }
    });
  }
}

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<ProdactsModel> _cartItems = [];

  CartBloc() : super(CartINitial()) {
    on<AddToCartEvent>((event, emit) {
      _cartItems.add(event.product);
      emit(CartUpdet(List.from(_cartItems)));
    });

    on<RemoveFromCartEvent>((event, emit) {
      _cartItems.remove(event.product);
      emit(CartUpdet(List.from(_cartItems)));
    });
  }
}
