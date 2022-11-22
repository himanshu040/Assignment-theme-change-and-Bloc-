part of'getdetails_bloc.dart';

abstract class GetDetailsState{}

class GetDetailsInitial extends GetDetailsState{

}

class GetDetailsLoading extends GetDetailsState{

}

class GetDetailsLoaded extends GetDetailsState{
late final ResponseGetDetails data;
GetDetailsLoaded(this.data);
}

class GetDetailsError extends GetDetailsState{
late final ResponseErrorOtp data;
GetDetailsError(this.data);
}