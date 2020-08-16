import 'dart:async';

import 'package:lost_angeles/core/enums/job_filter.dart';
import 'package:lost_angeles/core/enums/job_state.dart';
import 'package:lost_angeles/core/models/job.dart';
import 'package:lost_angeles/core/services/route_service.dart';

import '../../locator.dart';
import 'api_service.dart';

class JobService {
  StreamController<List<Job>> jobsController = StreamController<List<Job>>();
  StreamController<Job> jobController = StreamController<Job>();

  final ApiService _apiService = locator<ApiService>();
  final _routeService = locator<RouteService>();

  List<Job> jobs = new List<Job>();

  Future getJobs() async {
    var response = await _apiService.get('tech+test+json.json');

    for (var job in response) {
      var newJob = Job.fromJson(job);
      newJob.status = JobState.Waiting;
      newJob.route = _routeService.calculateRoute(newJob.caravan);
      newJob.waited = 0;
      jobs.add(newJob);
    }

    jobsController.add(jobs);
  }

  filterJob(JobFilter filter) {
    var filteredJobs = jobs;

    switch (filter) {
      case JobFilter.All:
        jobsController.add(filteredJobs);
        break;
      case JobFilter.Waiting:
        filteredJobs = jobs
            .where((element) => element.status == JobState.Waiting)
            .toList();
        jobsController.add(filteredJobs);
        break;
      case JobFilter.Complete:
        filteredJobs = jobs
            .where((element) => element.status == JobState.Complete)
            .toList();
        jobsController.add(filteredJobs);
        break;
    }
  }

  setSelectedJob(Job job) {
    jobController.add(job);
  }

  dropOffJob(Job job) {
    var dropOffJob =
        jobs.where((element) => element.familyid == job.familyid).first;

    dropOffJob.status = JobState.Complete;
  }

  Job getJob(String id) {
    var job = jobs.where((element) => element.familyid.toString() == id).first;
    return job;
  }
}
