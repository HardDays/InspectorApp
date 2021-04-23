import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/report_status_info.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/model/instruction.dart';

part 'api_service.g.dart';
part 'api_service.freezed.dart';

class ApiService {
  final api = ApiProvider();

  dynamic _parse(Function parser) {
    try {
      return parser();
    } catch (ex) {
      throw ParseException();
    }
  }

  // instructions

  Future<List<Instruction>> getInstructions() async {
    final data = await api.getInstructions();
    return await _parse(() => List<Instruction>.from(
        data['data'].map((d) => Instruction.fromJson(d))));
  }

  Future<Instruction> getInstruction(int id) async {
    final data = await api.getInstruction(id);
    return await _parse(() => Instruction.fromJson(data));
  }

  Future<List<Report>> getInstructionReports(int id) async {
    final data = await api.getInstructionReports(id);
    return await _parse(
        () => List<Report>.from(data['data'].map((d) => Report.fromJson(d))));
  }

  Future<Instruction> updateInstruction(int id,
      {InstructionStatus instructionStatus, String rejectReason}) async {
    final data = await api.updateInstruction(id,
        instructionStatus: instructionStatus, rejectReason: rejectReason);
    return await _parse(() => Instruction.fromJson(data));
  }

  // reports

  Future<Report> createReport(Report report) async {
    final data = await api.createReport(report);
    return await _parse(() => Report.fromJson(data));
  }

  Future<Report> updateReport(Report report) async {
    final data = await api.updateReport(report);
    return await _parse(() => Report.fromJson(data));
  }

  Future removeReport(Report report) async {
    await api.removeReport(report);
  }

  Future<ReportStatusInfo> getReportStatusInfo(Report report) async =>
      await _parse(
        () async =>
            ReportStatusInfo.fromJson(await api.getReportStatusInfo(report)),
      );

  Future<ApiParameters> getApiParameters() async =>
      ApiParameters.fromJson(await api.getParams());
}

@freezed
abstract class ApiParameters with _$ApiParameters {
  const factory ApiParameters(
    int nativeDepControl,
    String depControlUrl,
  ) = _ApiParameters;

  factory ApiParameters.fromJson(Map<String, dynamic> json) =>
      _$ApiParametersFromJson(json);
}
