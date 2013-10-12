var app = angular.module("ArtistMatch", []);

app.controller("ArtistListCtrl", ['$scope', '$http', function($scope, $http) {
  var artists = [];
  var names = ["Incubus", "Good Charlotte", "Take That", "Selena Gomez",
    "Moby", "Fort Minor", "Linkin Park", "Hoobastank",
    "Green Day", "Coldplay", "A-HA", "Imagine Dragons",
    "Thousand Foot Krutch", "Sunrise Avenue", "The All-American Rejects", "James Blunt"];

  angular.forEach(names, function(name) {
    $http.get("/info", { params: { name: name } }).success(function(artist) {
      artists.push(angular.fromJson(artist));
      if(artists.length == names.length) $scope.artists = artists;
    });
  });
}]);
