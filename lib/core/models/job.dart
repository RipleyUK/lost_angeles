import 'package:lost_angeles/core/enums/job_state.dart';
import 'package:lost_angeles/core/models/job_route.dart';

class Job {
  int familyid;
  int groupsize;
  int caravan;
  JobState status;
  JobRoute route;
  int waited;
  Job(
      {this.familyid,
      this.groupsize,
      this.caravan,
      this.status,
      this.route,
      this.waited});

  Job.fromJson(Map<String, dynamic> json) {
    familyid = json['familyid'];
    groupsize = json['groupsize'];
    caravan = json['caravan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['familyid'] = this.familyid;
    data['groupsize'] = this.groupsize;
    data['caravan'] = this.caravan;
    return data;
  }
}
