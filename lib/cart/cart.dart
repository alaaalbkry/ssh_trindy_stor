import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trndy_stor/bloc/prodact.dart';
import 'package:trndy_stor/bloc/prodact_event.dart';
import 'package:trndy_stor/bloc/prodact_state.dart';
import 'package:trndy_stor/data_respons/home_respons.dart';
import 'package:trndy_stor/home/prsntation/home_scren.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const home_Page();
  }
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdet) {
            final items = state.items;
            if (items.isEmpty) {
              return const Center(
                child: Text("cart is Empty"),
              );
            }

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("${item.price} \$"),
                );
              },
            );
          }

          return Center(child: Text("Cart is empty"));
        },
      ),
    );
  }
}
