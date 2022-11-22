part of 'getotp_bloc.dart';

abstract class GetOtpState{}

class GetOtpInitial extends GetOtpState{


}

class GetOtpLoading extends GetOtpState{


}

class GetOtpLoaded extends GetOtpState{
late final ResponseGetOtp data;
GetOtpLoaded(this.data);
}

class GetOtpError extends GetOtpState{
  late final ResponseErrorJ data;
  GetOtpError(this.data);
}