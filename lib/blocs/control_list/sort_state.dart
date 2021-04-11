// enum ControlObjectsSortState {
//   byLastSurveyDate,
//   byType,
//   byName,
//   byAddress,
//   byLastCheckDate,
//   byResolveDate,
// }
abstract class ControlObjectSortStrings {
  static const lastSurveyDate = 'lastSurveyDate';
  static const name = 'name';
  static const type = 'type';
  static const address = 'address';
  static const lastCheckDate = 'lastCheckDate';
  static const resolveDate = 'resolveDate';

  static const all = [lastSurveyDate, name, type, address, lastCheckDate, resolveDate];
}