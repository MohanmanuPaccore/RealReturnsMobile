import 'dart:developer';
import 'dart:io';

import 'package:RealReturns/exceptions.dart';
import 'package:RealReturns/enums/response_status.dart';
import 'package:RealReturns/firebase/analytics.dart';
import 'package:RealReturns/firebase/appevents.dart';
import 'package:RealReturns/model/user.dart';

class ApiResponse<T> {
  //! Data members with T as generics
  ResponseStatus? status;
  String? message;
  T? data;
  int? statusCode;
  Object? exception; 
  Exceptions? exceptiondetail;// Include an exception property


// ! Contructor
  ApiResponse(this.status, this.message, this.data,this.statusCode,{this.exception,this.exceptiondetail});


  ApiResponse.fromData(T data,int statusCode, {this.exception})
      : data = data
      

         {
          
    if (statusCode==200&&data  is dynamic && (data as dynamic).data == null) {
            status = ResponseStatus.empty;

    } else if(statusCode==200||statusCode==201&& data is Object && (data as dynamic).data != null){
      message='Completed';
            status = ResponseStatus.completed;



    }
    
    else {
      status = ResponseStatus.error;
      message = message;
      
      exception=exception;
     exceptiondetail= ParseException().parseException(exception!);
           Analytics.logEvent(AppEvents.ERROR, {
        'error_code':exceptiondetail?.errorCode.toString(),
        'error':exceptiondetail?.message,
        'error_object':exception.toString()
      });

    }
  }

   ApiResponse.loading() : status = ResponseStatus.loading;

  @override
  String toString() {
    return "status : $status\n message : $message\n data : $data ";
  }
}
