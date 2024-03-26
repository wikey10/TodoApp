import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todocubitlistener/Pages/todopage_view.dart';
import 'package:todocubitlistener/cubits/filtered_todos/filtered_todo_cubis_cubit.dart';
import 'package:todocubitlistener/cubits/todo_active/active_todo_cubit.dart';
import 'package:todocubitlistener/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todocubitlistener/cubits/todo_lists/todo_lists_cubit.dart';
import 'package:todocubitlistener/cubits/todo_search/todo_search_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(create: (context)=>TodoFilterCubit()),
        BlocProvider<TodoSearchCubit>(create: (context)=>TodoSearchCubit()),
        BlocProvider<TodoListsCubit>(create: (context)=>TodoListsCubit()),
        BlocProvider<ActiveTodoCubit>(create: (context)=>ActiveTodoCubit(
          initialActiveTodoCount :context.read<TodoListsCubit>().state.todos.length,
        )),
        BlocProvider<FilteredTodoCubisCubit>(create: (context)=>FilteredTodoCubisCubit(
          initialTodos: BlocProvider.of<TodoListsCubit>(context).state.todos,

        )),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: TodoPageView(),
      ),
    );
  }
}


