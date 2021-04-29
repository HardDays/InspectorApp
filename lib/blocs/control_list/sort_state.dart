// enum ControlObjectsSortState {
//   byLastSurveyDate,
//   byType,
//   byName,
//   byAddress,
//   byLastCheckDate,
//   byResolveDate,
// }
abstract class ControlObjectSortStrings {
  static const lastSurveyDate = 'last_survey_date';
  static const name = 'name';
  static const type = 'type';
  static const address = 'address';
  static const lastCheckDate = 'last_check_date';
  static const resolveDate = 'resolve_date';

  static const all = [lastSurveyDate, name, type, address, lastCheckDate, resolveDate];
}