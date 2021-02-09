import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_filters/bloc.dart';
import 'package:inspector/blocs/control_filters/event.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/dc_object_type.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';


class ControlFiltersWidget extends StatelessWidget {

  final _dcObjectTypeController = TextEditingController();


  Future<Iterable<DCObjectType>> _onDCObjectTypeSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).dcObjectTypes(name);
  }

  void _onDCObjectTypeSelect(DCObjectType type) {
    
  }

  void _onClear(BuildContext context) {
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ControlFiltersBloc(),
      child: BlocBuilder<ControlFiltersBloc, ControlFiltersBlocState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ProjectAutocomplete('Тип объекта',
                      hintText: 'Все',
                      enabled: true,
                      suggestionsCallback: (text)=> _onDCObjectTypeSearch(context, text),
                      onSuggestionSelected: _onDCObjectTypeSelect,
                      controller: _dcObjectTypeController,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                //   Flexible(
                //     child: ProjectSelect(
                //       title: 'Вид объекта',
                //       hintText: 'Все',
                //     ),
                //   ),
                ]
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ProjectTextField(
                        title: 'ID объекта',
                        hintText: 'Введите данные',
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectTextField(
                        title: 'Наименование объекта',
                        hintText: 'Введите данные',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProjectButton.buildOutlineButton('Сбросить',
                      onPressed: ()=> _onClear(context)
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20)), 
                    ProjectButton.builtFlatButton('Найти',
                    )
                  ],
                ),
              ),
            ],
          
          );
        }
      )
    );
  }
}
