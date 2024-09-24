import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_project/layers/bloc/services_bloc/services_cubit.dart';
import 'package:government_project/layers/data/fake_data.dart';
import 'package:government_project/layers/view/widgets/services_card.dart';
import '../../../core/configuration/styles.dart';
import '../../../core/ui/waiting_widget.dart';
import '../../../injection_container.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_drawer.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedButton = 0;
  final _servicesCubit = sl<ServicesCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!(_servicesCubit.state is ServicesLoaded)) {
      _servicesCubit.getServices(FakeData.servicesCategories[_selectedButton]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("الخدمات"),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: FakeData.servicesCategories.length,
              separatorBuilder: (context, index) {
                return CommonSizes.hBigSpace;
              },
              itemBuilder: (context, index) {
                final category = FakeData.servicesCategories[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_selectedButton != index) {
                          _selectedButton = index;
                          _servicesCubit.getServices(category);
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
            child: BlocBuilder<ServicesCubit, ServicesState>(
              bloc: _servicesCubit,
              builder: (context, state) {
                if (state is ServicesLoading) {
                  return Center(
                    child: WaitingWidget(),
                  );
                } else if (state is ServicesLoaded) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: state.services.length,
                    itemBuilder: (context, index) {
                      final service = state.services[index];
                      return services_card(
                        mainImage: service.mainImage,
                        required_papers: service.required_papers,
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
