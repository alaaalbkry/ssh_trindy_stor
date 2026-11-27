import 'package:equatable/equatable.dart';
import 'package:trndy_stor/Entity/home_entity.dart';

abstract class ProdactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProdactsEvent extends ProdactEvent {}

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final ProdactsModel product;

  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final ProdactsModel product;

  RemoveFromCartEvent(this.product);
}
