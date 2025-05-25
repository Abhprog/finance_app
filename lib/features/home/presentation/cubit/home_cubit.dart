import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState);

  void setTabIndex(int newIndex) {
    emit(state.copyWith(index: newIndex));
  }
}

class HomeState {
  final int index;

  HomeState({required this.index});

  HomeState copyWith({int? index}) {
    return HomeState(index: index ?? this.index);
  }
}
