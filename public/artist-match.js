var app = angular.module("ArtistMatch", []);

app.controller("ArtistListCtrl", ['$scope', '$http', function($scope, $http) {
  var names = ["Incubus", "Good Charlotte", "Take That", "Selena Gomez",
    "Moby", "Fort Minor", "Linkin Park", "Hoobastank",
    "Green Day", "Coldplay", "A-HA", "Imagine Dragons",
    "Thousand Foot Krutch", "Sunrise Avenue", "The All-American Rejects", "James Blunt"];
  $http.get("/info?" + $.param({ names:names })).success(function(artists) {
    $scope.artists = angular.fromJson(artists);
  });
}]);
