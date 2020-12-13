import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/input_title.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';

typedef  Future<Iterable<dynamic>> AutocompleteCallback(String value);

class ProjectAutocomplete extends StatelessWidget { 
  final bool enabled;
  final String title;
  final String hintText;
  final TextEditingController controller;
  final AutocompleteCallback suggestionsCallback;
  final Function(dynamic) onSuggestionSelected;
  final Function(dynamic) formatter;
  final Function(String) validator;

  ProjectAutocomplete(this.title, {
    this.controller,
    this.hintText, 
    this.suggestionsCallback,
    this.onSuggestionSelected,
    this.validator,
    this.formatter,
    this.enabled = false,
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
        alignment: Alignment.topRight,
        children: [
          TypeAheadFormField(
            onSuggestionSelected: onSuggestionSelected, 
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              color: Colors.white,
              elevation: 1,
            ),
            
            validator: validator,
            hideOnLoading: true,
            hideOnEmpty: true,
            hideOnError: true,
            //noItemsFoundBuilder: (c) => null,
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              enabled: enabled,
              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.only(left: 10, top: 15, right: 40),
                hintStyle: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
                border: border,
                enabledBorder: border,
                focusedBorder: border
              ),
            ),
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                child: Text(formatter != null ? formatter(item) : item.toString(),
                  style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                )
              );
            },
            suggestionsCallback: suggestionsCallback,
          ),
          controller?.text?.isEmpty ?? false ? Padding(
            padding: const EdgeInsets.only(top: 13, right: 10),
            child: Icon(Icons.keyboard_arrow_down, 
              color: ProjectColors.darkBlue,
            ),
          ) : InkWell(
            onTap: () {
              if (enabled) {
                controller?.clear();
                onSuggestionSelected(null);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 14, right: 10),
              child: Icon(Icons.close, 
                size: 20,
                color: ProjectColors.darkBlue,
              ),
            )
          ),
        ],
      ),
    );
  }
}