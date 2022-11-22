import 'package:assignment/Model/responseerrorotp.dart';
import 'package:assignment/Model/responsegetdetails.dart';
import 'package:assignment/Model/responsegetotp.dart';
import 'package:assignment/Repository/getOtpRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'getdetails_event.dart';
part 'getdetails_state.dart';

class GetDetailsBloc extends Bloc<GetDetailsEvent, GetDetailsState>
{
  dynamic data;
  final GetOtpRepo getDetails;
  GetDetailsBloc(this.getDetails):super(GetDetailsInitial()){
    on<GetDetailsEvent>((event,emit)async{
      if(event is SendOtp)
        {
          emit(GetDetailsLoading());
          data=await getDetails.fetchDetails(event.otp, event.transId);
          if(!data.toString().contains("Error"))
          {
            print("data in not error bloc:${data.toString()}");
            emit(GetDetailsLoaded(data!));

          }

          else
          {
            print("data in error block:${data.toString()}");
            emit(GetDetailsError(data));
          }
        }
    });
  }

}