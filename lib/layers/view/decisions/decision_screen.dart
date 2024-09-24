import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_project/layers/bloc/decision_bloc/decision_cubit.dart';
import '../../../core/ui/waiting_widget.dart';
import '../../../injection_container.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_drawer.dart';

class DecisionScreen extends StatefulWidget {
  const DecisionScreen({super.key});

  @override
  State<DecisionScreen> createState() => _DecisionScreenState();
}

class _DecisionScreenState extends State<DecisionScreen> {
  final _decisionCubit = sl<DecisionCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!(_decisionCubit.state is DecisionLoaded)) {
      _decisionCubit.getDecisions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("القرارات"),
      ),
      body: BlocBuilder<DecisionCubit, DecisionState>(
        bloc: _decisionCubit,
        builder: (context, state) {
          if (state is DecisionLoading) {
            return Center(
              child: WaitingWidget(),
            );
          } else if (state is DecisionLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              itemCount: state.decisions.length,
              itemBuilder: (context, index) {
                final decision = state.decisions[index];
                return custom_card(
                  mainImage: decision.mainImage,
                  withoutSubImages: true,
                  title: decision.title,
                  date: decision.date,
                  desc: decision.desc,
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
