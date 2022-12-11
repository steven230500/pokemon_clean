part of '../home_page.dart';

class ListPoke extends StatelessWidget {
  const ListPoke({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PokeListBloc, PokeListState>(
        builder: (context, state) {
          if (state is PokeListLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokeListLoad) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 15.0,
                ),
                itemCount: state.model.length,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                itemBuilder: (BuildContext context, int index) {
                  return BlocProvider.value(
                    value: Modular.get<PokeDetailBloc>(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: PokeDetail(
                        name: state.model[index].name ?? '',
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: PockeText.h1(
              label: 'Not Found',
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}
