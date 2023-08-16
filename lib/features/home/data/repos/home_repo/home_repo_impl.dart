import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var localBooksList = homeLocalDataSource.fetchFeaturedBooks();
      if (localBooksList.isNotEmpty) {
        return right(localBooksList);
      }
      var remoteBooksList = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(remoteBooksList);
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var localBooksList = homeLocalDataSource.fetchNewestBooks();
      if (localBooksList.isNotEmpty) {
        return right(localBooksList);
      }
      var remoteBooksList = await homeRemoteDataSource.fetchNewestBooks();
      return right(remoteBooksList);
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
