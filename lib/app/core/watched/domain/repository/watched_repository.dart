import 'package:anime_dart/app/core/watched/domain/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class WatchedRepository {
  Future<Either<WatchedException, void>> setEpisodeWatchedStats(
    String id,
    double stats,
  );
  Future<Either<WatchedException, double>> getEpisodeWatchedStats(String id);
  Future<Either<WatchedException, String>> exportWatchedData();
  Future<Either<WatchedException, void>> importWatchedData(
    String source, {
    bool merge,
  });
  Future<Either<WatchedException, void>> resetWatchedData();
}
