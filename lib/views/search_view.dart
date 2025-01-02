
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';



class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
            var getWeatherCubit=  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getweather(cityName: value);
           Navigator.pop(context);
            
          } , 
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(213, 65, 246, 10),
                ),
              ),
              hintText: 'Enter City Name',
              suffixIcon: const Icon(Icons.search),
              labelText: 'Search',
           contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20) ),
          ),
        ),
      ),
   
    );
  } 
}

