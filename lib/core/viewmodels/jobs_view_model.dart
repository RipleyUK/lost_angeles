import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lost_angeles/core/enums/job_filter.dart';
import 'package:lost_angeles/core/enums/view_state.dart';
import 'package:lost_angeles/core/models/job.dart';
import 'package:lost_angeles/core/services/job_service.dart';
import 'package:lost_angeles/core/services/safe_area_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../locator.dart';
import 'base_view_model.dart';

class JobsViewModel extends BaseViewModel {
  final _jobService = locator<JobService>();
  final _safeAreaService = locator<SafeAreaService>();

  final PanelController jobPanel = PanelController();

  JobFilter filter = JobFilter.All;
  int waitingTime = 0;

  Future loadJobs() async {
    setState(ViewState.Busy);

    try {
      await _jobService.getJobs();
    } catch (ex) {}

    setState(ViewState.Idle);
  }

  updateSafeArea(BoxConstraints constraints) {
    _safeAreaService.update(constraints);
  }

  updateFilter(JobFilter selectedFilter) {
    setState(ViewState.Busy);
    filter = selectedFilter;
    _jobService.filterJob(filter);
    setState(ViewState.Idle);
  }

  selectJob(Job job) {
    setState(ViewState.Busy);
    _jobService.setSelectedJob(job);
    jobPanel.open();
    setState(ViewState.Idle);
  }

  dropOffJob(Job job) {
    job.waited = waitingTime;
    waitingTime += job.route.duration;
    _jobService.dropOffJob(job);
    _jobService.filterJob(filter);
  }

  Future scan() async {
    setState(ViewState.Busy);

    try {
      var barcode = await FlutterBarcodeScanner.scanBarcode(
          "#57CC99", "Cancel", false, ScanMode.DEFAULT);

      if (barcode != '-1') {
        var job = _jobService.getJob(barcode);
        selectJob(job);
      }
    } catch (e) {}

    setState(ViewState.Idle);
  }
}
