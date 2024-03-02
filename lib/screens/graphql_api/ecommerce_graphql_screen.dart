import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EcommerceGraphqlScreen extends StatelessWidget {
  String query = ''' query {
    characters {
      results {
        name
        species
        image
      }
    }
  } ''';
  HttpLink httpLink = HttpLink("https://rickandmortyapi.com/graphql");

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Different Users'),
      ),
      body: GraphQLProvider(
        client: client,
        child: Query(
          options: QueryOptions(
            document: gql(query),
          ),
          builder: (
            QueryResult result, {
            VoidCallback? refetch,
            FetchMore? fetchMore,
          }) {
            if (result.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (result.data == null ||
                result.data!['characters']['results'] == null) {
              return Text("No Data Found !");
            }

            List<dynamic> countriesList = result.data!['characters']['results'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Users',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: countriesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.brown,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              countriesList[index]['image'],
                              fit: BoxFit.cover,
                              width: 140,
                              height: 90,
                            ),
                            Text(countriesList[index]['name'],style: TextStyle(color: Colors.white),).paddingAll(3),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ).paddingAll(14),
    );
  }
}
