import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';



part 'active_todo_state.dart';

class ActiveTodoCubit extends Cubit<TodoActiveCountState> {
  final int initialActiveTodoCount;

  ActiveTodoCubit({
    required this.initialActiveTodoCount,

}) : super(TodoActiveCountState(activeCount: initialActiveTodoCount)){

  }

  calaculateActiveTodoCount(int ActiveTodoCount){
    emit(state.copywith(activeTodoCount: ActiveTodoCount));
  }



}
