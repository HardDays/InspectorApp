import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/input_title.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';

typedef  Future<Iterable<dynamic>> AutocompleteCallback(String value);

class ProjectAutocomplete extends StatelessWidget { 

  final String title;
  final String hintText;
  final TextEditingController controller;
  final AutocompleteCallback suggestionsCallback;
  final Function(dynamic) onSuggestionSelected;

  ProjectAutocomplete(this.title, {
    this.controller,
    this.hintText, 
    this.suggestionsCallback,
    this.onSuggestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: ProjectColors.lightBlue, width: 1)
    );
    return ProjectInputTitle(
      title,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TypeAheadFormField(
            onSuggestionSelected: onSuggestionSelected, 
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              color: Colors.white,
              elevation: 1,
            ),
            hideOnLoading: true,
            hideOnEmpty: true,
            hideOnError: true,
            //noItemsFoundBuilder: (c) => null,
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                hintStyle: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
                border: border,
                enabledBorder: border,
                focusedBorder: border
              ),
            ),
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                child: Text(item.toString(),
                  style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                )
              );
            },
            suggestionsCallback: suggestionsCallback
          ),
          const  Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.keyboard_arrow_down, 
              color: ProjectColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}