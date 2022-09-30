import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'list_cubit_state.dart';

class ListCubitCubit extends Cubit<ListCubitState> {
  ListCubitCubit({required String l1,required String l2,required String l3})
      : super(ListCubitState(dropdownChoice1: l1,dropdownChoice2: l2,dropdownChoice3: l3));
  void update1({required String l}) {
    emit(ListCubitState(dropdownChoice2: '',dropdownChoice3:'',dropdownChoice1: l));
  }
  void update2({required String l}) {
    emit(ListCubitState(dropdownChoice2: l,dropdownChoice3:'',dropdownChoice1: state.dropdownChoice1));
  }
 void update3({required String l}) {
    emit(ListCubitState(dropdownChoice2: state.dropdownChoice2,dropdownChoice3:l,dropdownChoice1: state.dropdownChoice1));
  } 
}
