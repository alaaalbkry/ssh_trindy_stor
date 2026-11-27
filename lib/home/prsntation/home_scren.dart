import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trndy_stor/bloc/prodact.dart';
import 'package:trndy_stor/bloc/prodact_event.dart';
import 'package:trndy_stor/bloc/prodact_state.dart';
import 'package:trndy_stor/core/Text.dart';
import 'package:trndy_stor/core/widgets/button.dart';

import 'package:trndy_stor/core/widgets/custom_Textfill.dart';
import 'package:trndy_stor/core/widgets/sizbox.dart';
import 'package:trndy_stor/data_respons/home_respons.dart';

class home_Page extends StatefulWidget {
  const home_Page({super.key});

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ProdactBlock(ProdactRespons())..add(LoadProdactsEvent()),
        child: Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              )
            ]),
            body: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSpaces.h20,
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppText.welcom,
                    ),
                  ],
                ),
                AppSpaces.h20,
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: sersh_teaxt(),
                ),
                AppSpaces.h32,
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: 200,
                    child: BlocBuilder<ProdactBlock, ProdactState>(
                        builder: (context, state) {
                      if (state is Prodactloddeng) {
                        return const CircularProgressIndicator();
                      }
                      if (state is ProdactErorr) {
                        return const Text("Erorr");
                      }
                      if (state is Prodactloded) {
                        final items = state.prodacts;

                        return Builder(builder: (pagcontext) {
                          return GridView.builder(
                            scrollDirection: Axis.horizontal,
                            // shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.0,
                            ),
                            itemBuilder: (context, index) {
                              final prodact = items[index];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28.6),
                                  color: Colors.grey,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (prodact.images.isNotEmpty)
                                        SizedBox(
                                          height: 120,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                                prodact.images.first,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      AppSpaces.h12,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            prodact.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppSpaces.h12,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${prodact.price} \$",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          AddButton.Addbuttn(
                                              pagcontext, prodact)
                                        ],
                                      ),
                                    ]),
                              );
                            },
                            itemCount: items.length,
                          );
                        });
                      }
                      return const SizedBox();
                    }),
                  ),
                ),
              ],
            ))));
  }
}
