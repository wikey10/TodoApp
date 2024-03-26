import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todocubitlistener/models/todo_model.dart';


part 'filtered_todo_cubis_state.dart';

class FilteredTodoCubisCubit extends Cubit<FilteredTodoState> {

  final List<TodoModel> initialTodos;



  FilteredTodoCubisCubit({
    required this.initialTodos,
}) : super(FilteredTodoState(filteredTodos: initialTodos)){

  }

  void setFilteredTodos(Filter filter,List<TodoModel> todos,String search){
    List<TodoModel> _filteredTodos;

    switch(filter){
      case Filter.active : _filteredTodos = todos
          .where((TodoModel todoModel) => !todoModel.completed).toList();
      break;
      case Filter.completed : _filteredTodos = todos
          .where((TodoModel todoModel) => todoModel.completed).toList();
      break;
      case Filter.all : _filteredTodos = todos;
      break;
    }

    if(search.isNotEmpty){
      _filteredTodos = _filteredTodos.where((TodoModel todoModel) => todoModel.description.toLowerCase().contains(search)).toList();
    }
    emit(state.copywith(filteredTodos: _filteredTodos));
  }




}
