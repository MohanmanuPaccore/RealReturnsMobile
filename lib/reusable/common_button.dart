import 'package:RealReturns/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CommonButton{
  Widget primaryButton(
    BuildContext context,

    {
double height=20,
double width=100,
    VoidCallback? onTap,

String buttonText=''

    }

  ){
return InkWell(
  onTap: onTap,
  child: Container(
    height: height,
    width: width,
alignment: Alignment.center,
    decoration: BoxDecoration(color: ColorConstants.primaryColor,
borderRadius: BorderRadius.circular(15),

    ),
    child: Text(buttonText,
    textAlign: TextAlign.center,
    
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w400,
      color: Colors.white,

      fontSize: 18
    ),
    ),
  ),
  

);
  }
}