import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_project/core/configuration/styles.dart';
import 'package:government_project/layers/bloc/events_bloc/events_cubit.dart';
import 'package:government_project/layers/data/fake_data.dart';
import '../../../core/ui/waiting_widget.dart';
import '../../../injection_container.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_drawer.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _selectedButton = 0;
  final _eventsCubit = sl<EventsCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!(_eventsCubit.state is EventsLoaded)) {
      _eventsCubit.getEvents(FakeData.eventsCategories[_selectedButton]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("الفعاليات"),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: FakeData.eventsCategories.length,
              separatorBuilder: (context, index) {
                return CommonSizes.hBigSpace;
              },
              itemBuilder: (context, index) {
                final category = FakeData.eventsCategories[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_selectedButton != index) {
                          _selectedButton = index;
                          _eventsCubit.getEvents(category);
                        }
                      });
                    },
                    child: Text(
                      category,
                      style: TextStyle(
                          color: _selectedButton == index
                              ? Colors.white
                              : Colors.black),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: _selectedButton == index
                            ? Styles.colorPrimary
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                );
              },
            ),
          ),
          CommonSizes.vSmallSpace,
          Expanded(
            child: BlocBuilder<EventsCubit, EventsState>(
              bloc: _eventsCubit,
              builder: (context, state) {
                if (state is EventsLoading) {
                  return Center(
                    child: WaitingWidget(),
                  );
                } else if (state is EventsLoaded) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: state.events.length,
                    itemBuilder: (context, index) {
                      final event = state.events[index];
                      return custom_card(
                        mainImage: event.mainImage,
                        withoutSubImages: true,
                        title: event.title,
                        date: event.date,
                        desc: event.desc,
                      );
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
