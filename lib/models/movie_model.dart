// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
    final String? movie;
    final int? year;
    final DateTime? releaseDate;
    final String? director;
    final String? character;
    final String? movieDuration;
    final String? timestamp;
    final String? fullLine;
    final int? currentWhoaInMovie;
    final int? totalWhoasInMovie;
    final WhoaGrouping? whoaGrouping;
    final String? poster;
    final Video? video;
    final String? audio;

    MovieModel({
        this.movie,
        this.year,
        this.releaseDate,
        this.director,
        this.character,
        this.movieDuration,
        this.timestamp,
        this.fullLine,
        this.currentWhoaInMovie,
        this.totalWhoasInMovie,
        this.whoaGrouping,
        this.poster,
        this.video,
        this.audio,
    });

    MovieModel copyWith({
        String? movie,
        int? year,
        DateTime? releaseDate,
        String? director,
        String? character,
        String? movieDuration,
        String? timestamp,
        String? fullLine,
        int? currentWhoaInMovie,
        int? totalWhoasInMovie,
        WhoaGrouping? whoaGrouping,
        String? poster,
        Video? video,
        String? audio,
    }) => 
        MovieModel(
            movie: movie ?? this.movie,
            year: year ?? this.year,
            releaseDate: releaseDate ?? this.releaseDate,
            director: director ?? this.director,
            character: character ?? this.character,
            movieDuration: movieDuration ?? this.movieDuration,
            timestamp: timestamp ?? this.timestamp,
            fullLine: fullLine ?? this.fullLine,
            currentWhoaInMovie: currentWhoaInMovie ?? this.currentWhoaInMovie,
            totalWhoasInMovie: totalWhoasInMovie ?? this.totalWhoasInMovie,
            whoaGrouping: whoaGrouping ?? this.whoaGrouping,
            poster: poster ?? this.poster,
            video: video ?? this.video,
            audio: audio ?? this.audio,
        );

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        movie: json["movie"],
        year: json["year"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        director: json["director"],
        character: json["character"],
        movieDuration: json["movie_duration"],
        timestamp: json["timestamp"],
        fullLine: json["full_line"],
        currentWhoaInMovie: json["current_whoa_in_movie"],
        totalWhoasInMovie: json["total_whoas_in_movie"],
        whoaGrouping: json["whoa_grouping"] == null ? null : WhoaGrouping.fromJson(json["whoa_grouping"]),
        poster: json["poster"],
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        audio: json["audio"],
    );

    Map<String, dynamic> toJson() => {
        "movie": movie,
        "year": year,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "director": director,
        "character": character,
        "movie_duration": movieDuration,
        "timestamp": timestamp,
        "full_line": fullLine,
        "current_whoa_in_movie": currentWhoaInMovie,
        "total_whoas_in_movie": totalWhoasInMovie,
        "whoa_grouping": whoaGrouping?.toJson(),
        "poster": poster,
        "video": video?.toJson(),
        "audio": audio,
    };
}

class Video {
    final String? the1080P;
    final String? the720P;
    final String? the480P;
    final String? the360P;

    Video({
        this.the1080P,
        this.the720P,
        this.the480P,
        this.the360P,
    });

    Video copyWith({
        String? the1080P,
        String? the720P,
        String? the480P,
        String? the360P,
    }) => 
        Video(
            the1080P: the1080P ?? this.the1080P,
            the720P: the720P ?? this.the720P,
            the480P: the480P ?? this.the480P,
            the360P: the360P ?? this.the360P,
        );

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        the1080P: json["1080p"],
        the720P: json["720p"],
        the480P: json["480p"],
        the360P: json["360p"],
    );

    Map<String, dynamic> toJson() => {
        "1080p": the1080P,
        "720p": the720P,
        "480p": the480P,
        "360p": the360P,
    };
}

class WhoaGrouping {
    final int? movieWhoaGroupIndex;
    final int? currentWhoaInGroup;
    final int? totalWhoasInGroup;

    WhoaGrouping({
        this.movieWhoaGroupIndex,
        this.currentWhoaInGroup,
        this.totalWhoasInGroup,
    });

    WhoaGrouping copyWith({
        int? movieWhoaGroupIndex,
        int? currentWhoaInGroup,
        int? totalWhoasInGroup,
    }) => 
        WhoaGrouping(
            movieWhoaGroupIndex: movieWhoaGroupIndex ?? this.movieWhoaGroupIndex,
            currentWhoaInGroup: currentWhoaInGroup ?? this.currentWhoaInGroup,
            totalWhoasInGroup: totalWhoasInGroup ?? this.totalWhoasInGroup,
        );

    factory WhoaGrouping.fromJson(Map<String, dynamic> json) => WhoaGrouping(
        movieWhoaGroupIndex: json["movie_whoa_group_index"],
        currentWhoaInGroup: json["current_whoa_in_group"],
        totalWhoasInGroup: json["total_whoas_in_group"],
    );

    Map<String, dynamic> toJson() => {
        "movie_whoa_group_index": movieWhoaGroupIndex,
        "current_whoa_in_group": currentWhoaInGroup,
        "total_whoas_in_group": totalWhoasInGroup,
    };
}
