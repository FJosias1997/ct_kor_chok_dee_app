import 'package:ct_kor_chok_dee_app/data/bloc/home_bloc.dart';
import 'package:ct_kor_chok_dee_app/data/bloc/home_event.dart';
import 'package:ct_kor_chok_dee_app/data/bloc/home_state.dart';
import 'package:ct_kor_chok_dee_app/data/models/students_model.dart';
import 'package:ct_kor_chok_dee_app/global_widgets/appbar/custom_appbar_widget.dart';
import 'package:ct_kor_chok_dee_app/global_widgets/drawer/custom_drawer_widget.dart';
import 'package:ct_kor_chok_dee_app/pages/student_details/student_details_page.dart';
import 'package:ct_kor_chok_dee_app/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeBloc _homeBloc;
  List<StudentsModel> students = [];

  @override
  void initState() {
    super.initState();
    initBloc();
    getUsers();
  }

  void initBloc() {
    _homeBloc = HomeBloc();
  }

  void getUsers() {
    _homeBloc.add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _homeBloc,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadedState) {
            return Column(
              children: [
                CustomAppbarWidget(
                  onLogoTapped: () {
                    context.goPushAnimated(CustomDrawerWidget());
                  },
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alunos',
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.students.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.goPush(
                                  StudentDetailsPage(
                                    student: state.students[index],
                                  ),
                                );
                              },
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      state.students[index].profileImage ?? '',
                                    ),
                                  ),
                                  title: Text(state.students[index].name),
                                  subtitle: Text(
                                    'Grau Vermelho',
                                    style: context.theme.textTheme.titleSmall
                                        ?.copyWith(
                                          color:
                                              context.theme.colorScheme.primary,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is HomeErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getUsers,
        tooltip: 'Cadastrar Aluno',
        backgroundColor: context.theme.colorScheme.primary,
        foregroundColor: context.theme.colorScheme.inversePrimary,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }
}
