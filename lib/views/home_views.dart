import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search_sharp,
            ),
          )
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, State) {
          if (State is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (State is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: State.weatherModel,
            );
          } else {
            return const Center(
              child: Text(
                'Sorry, try it later or enter the correct city',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
