import 'package:equatable/equatable.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trndy_stor/Entity/home_entity.dart';
//import 'package:trndy_stor/bloc/prodact_event.dart';

abstract class ProdactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Prodactintial extends ProdactState {}

class Prodactloddeng extends ProdactState {}

class Prodactloded extends ProdactState {
  final List<ProdactsModel> prodacts;
  Prodactloded(this.prodacts);
  @override
  List<Object?> get props => [prodacts];
}

class ProdactErorr extends ProdactState {
  final String messag;
  ProdactErorr(this.messag);
  List<Object?> get props => [messag];
}

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartINitial extends CartState {}

class CartUpdet extends CartState {
  final List<ProdactsModel> items;
  CartUpdet(this.items);
  @override
  List<Object?> get props => [];
}
