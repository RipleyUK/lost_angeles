import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lost_angeles/core/enums/job_filter.dart';
import 'package:lost_angeles/core/enums/job_state.dart';
import 'package:lost_angeles/core/enums/view_state.dart';
import 'package:lost_angeles/core/models/job.dart';
import 'package:lost_angeles/core/viewmodels/jobs_view_model.dart';
import 'package:lost_angeles/ui/helpers/size_helper.dart';
import 'package:lost_angeles/ui/styles/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'base_view.dart';

class JobsView extends StatefulWidget {
  JobsView({Key key}) : super(key: key);

  @override
  _JobsViewState createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  _JobsViewState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<JobsViewModel>(
        onModelReady: (model) async => await model.loadJobs(),
        builder: (context, model, child) => Scaffold(
              body: SlidingUpPanel(
                  color: Colors.transparent,
                  controller: model.jobPanel,
                  minHeight: 0,
                  maxHeight:
                      panelHeight(context) >= 0 ? panelHeight(context) : 0,
                  panel: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColours.primaryColour,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColours.accentColour,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                      'Group ${Provider.of<Job>(context).familyid}',
                                      style: AppStyles.secondaryHeadingText),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.jobPanel.close();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: AppColours.secondayTextColour,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Group ID: ',
                                            style: AppStyles.primaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${Provider.of<Job>(context).familyid}',
                                      style: AppStyles.primaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Group Size: ',
                                            style: AppStyles.primaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${Provider.of<Job>(context).groupsize}',
                                      style: AppStyles.primaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Caravan: ',
                                            style: AppStyles.primaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${Provider.of<Job>(context).caravan}',
                                      style: AppStyles.primaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Provider.of<Job>(context).status == JobState.Waiting
                                ? SizedBox.shrink()
                                : Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  'Waited: ',
                                                  style: AppStyles.primaryText,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${Provider.of<Job>(context).waited} minutes',
                                            style: AppStyles.primaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Provider.of<Job>(context).route != null
                                ? Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Route: ${Provider.of<Job>(context).route.duration} minutes via caravans',
                                              style: AppStyles.primaryText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            Provider.of<Job>(context).route != null
                                ? Container(
                                    padding: EdgeInsets.all(8),
                                    height: 50,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: Provider.of<Job>(context)
                                          .route
                                          .path
                                          .map((e) => Container(
                                                alignment: Alignment.center,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColours.accentColour,
                                                    shape: BoxShape.circle),
                                                child: Text(
                                                  e.toString(),
                                                  style:
                                                      AppStyles.secondaryText,
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Provider.of<Job>(context).status == JobState.Complete
                          ? SizedBox.shrink()
                          : Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  model.dropOffJob(
                                      Provider.of<Job>(context, listen: false));
                                  model.jobPanel.close();
                                },
                                child: Container(
                                  height: 60,
                                  color: AppColours.accentColour,
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  child: Text('Drop Off',
                                      style: AppStyles.secondaryHeadingText),
                                ),
                              ),
                            ),
                    ],
                  ),
                  body: SafeArea(
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.minHeight != panelHeight(context)) {
                        model.updateSafeArea(constraints);
                      }
                      return Stack(
                        children: <Widget>[
                          Container(
                            color: AppColours.primaryColour,
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      'Lost Angeles Campsite',
                                      style: AppStyles.primaryHeadingText,
                                    )),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Jobs',
                                          style:
                                              AppStyles.primarySubHeadingText,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                model.updateFilter(
                                                    JobFilter.All);
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Text(
                                                  'All',
                                                  style: model.filter ==
                                                          JobFilter.All
                                                      ? AppStyles.accentText
                                                      : AppStyles.primaryText,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                model.updateFilter(
                                                    JobFilter.Waiting);
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Text(
                                                  'Waiting',
                                                  style: model.filter ==
                                                          JobFilter.Waiting
                                                      ? AppStyles.accentText
                                                      : AppStyles.primaryText,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                model.updateFilter(
                                                    JobFilter.Complete);
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Text(
                                                  'Complete',
                                                  style: model.filter ==
                                                          JobFilter.Complete
                                                      ? AppStyles.accentText
                                                      : AppStyles.primaryText,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Waiting Time: ${model.waitingTime} minutes',
                                          style: AppStyles.primaryText,
                                        ),
                                      ),
                                      MaterialButton(
                                        color: AppColours.accentColour,
                                        onPressed: () {
                                          model.scan();
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'Scan',
                                              style: AppStyles.secondaryText,
                                            ),
                                            Icon(
                                              Icons.code,
                                              color:
                                                  AppColours.secondayTextColour,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                model.state == ViewState.Busy
                                    ? Expanded(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : Expanded(
                                        child: Container(
                                          child: ListView(
                                            children:
                                                Provider.of<List<Job>>(context)
                                                    .map((e) => GestureDetector(
                                                          onTap: () {
                                                            model.selectJob(e);
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(20, 0,
                                                                    20, 10),
                                                            height: 110,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                boxShadow: <
                                                                    BoxShadow>[
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.1),
                                                                    blurRadius:
                                                                        3,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Card(
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              15),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            child:
                                                                                Container(
                                                                              width: 60,
                                                                              decoration: BoxDecoration(color: AppColours.caravanBackgroundColour, shape: BoxShape.circle),
                                                                            ),
                                                                          ),
                                                                          Center(
                                                                            child:
                                                                                Icon(
                                                                              Icons.home,
                                                                              size: 60,
                                                                              color: AppColours.caravanColour,
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.only(bottom: 12),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            width:
                                                                                60,
                                                                            child:
                                                                                Text(
                                                                              e.caravan.toString(),
                                                                              style: AppStyles.secondaryText,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'Group ${e.familyid}'.toString(),
                                                                              style: AppStyles.primarySubHeadingText,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.people,
                                                                                  color: AppColours.primaryTextColour,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(left: 4),
                                                                                  child: Text(
                                                                                    '${e.groupsize}',
                                                                                    style: AppStyles.primaryText,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Text(
                                                                              e.status == JobState.Waiting ? '${e.route.duration} min to caravan' : 'Waited ${e.waited} min',
                                                                              style: AppStyles.primaryText,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      child: Text(
                                                                          jobStateToString(e
                                                                              .status),
                                                                          style: e.status == JobState.Waiting
                                                                              ? AppStyles.waitingStatusTextText
                                                                              : AppStyles.completeStatusTextText),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  )),
            ));
  }
}
