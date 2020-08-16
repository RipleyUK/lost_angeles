enum JobState { Waiting, Complete }

String jobStateToString(JobState status) {
  return '$status'.split('.').last;
}
