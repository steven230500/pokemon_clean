import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_pokemon/app/_childrens/favorites/presenter/bloc/favorites_bloc.dart';
import 'package:test_pokemon/app/shared/widgets/icon_svg.dart';
import 'package:test_pokemon/app/ui/colors.dart';
import 'package:test_pokemon/app/ui/module_ui.dart';
import 'package:test_pokemon/app/ui/text.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;

  const ScaffoldWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<FavoritesBloc>()
        ..add(
          const FavoritesStarted(),
        ),
      child: _View(child: child),
    );
  }
}

class _View extends StatelessWidget {
  const _View({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PockeColors.backgroundColor,
      appBar: AppBar(
        actions: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Modular.to.pushNamed('/favorite'),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: SvgIcon(UiValues.heartFilledSvg),
                    ),
                    if (state is FavoritesLoad)
                      Positioned(
                        top: 0,
                        right: 8.0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: PockeColors.btnColor,
                            shape: BoxShape.circle,
                          ),
                          child: PockeText.small(
                            label: state.pokemon.length.toString(),
                            color: PockeColors.white,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
        title: const SvgIcon(UiValues.iconSvg),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: child,
      ),
    );
  }
}
