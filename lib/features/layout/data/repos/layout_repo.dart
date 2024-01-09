 import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class LayoutRepo{
  //Future<Either<Failure,int>> changePageIndex({required int pageIndex});
    int  changePageIndex({required int pageIndex});
}