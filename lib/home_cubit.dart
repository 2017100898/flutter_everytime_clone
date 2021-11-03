import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void getMain() => emit(0);
  void getTime() => emit(1);
  void getList() => emit(2);
  void getAlert() => emit(3);
  void getCampic() => emit(4);
  void getLogin() => emit(5);
}
