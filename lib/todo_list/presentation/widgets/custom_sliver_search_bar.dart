import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../design_system/constants/constants_strings.dart';
import '../../../design_system/constants/spacing.dart';
import '../../../global/aplication/mobx_controller.dart/todo_controller.dart';

///widget de barra de busca para buscar os itens por meio da
///consulta da usuário
class CustomSliverSearchBar extends StatelessWidget {
  const CustomSliverSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///recuperação do TodoController por meio do provider.
    final dataController = Provider.of<TodoController>(context);

    ///sliverList para possibilitar o uso da serachBar no CustomScrollView.
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.all(DSSpacing.medium),
          child: TextFormField(
            ///uso do método filterSearch do TodoController para executar a
            ///busca
            onChanged: dataController.filterSearch,
            decoration: const InputDecoration(
              labelText: ConstantsStrings.searchBarLabel,
            ),
          ),
        ),
      ]),
    );
  }
}
