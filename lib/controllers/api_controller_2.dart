// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// class ApiController2 extends GetxController {
//   String query = ''' query {
//     characters {
//       results {
//         name
//         species
//         image
//       }
//     }
//   } ''';
//
//   HttpLink httpLink = HttpLink("https://rickandmortyapi.com/graphql");
//   final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
//     GraphQLClient(
//       link: httpLink,
//       cache: GraphQLCache(
//         store: HiveStore(),
//       ),
//     ),
//   );
// }
