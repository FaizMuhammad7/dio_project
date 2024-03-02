import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlExample2 extends StatelessWidget {
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
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Graph QL Example 2",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GraphQLProvider(
        client: client,
        child: Query(
          options: QueryOptions(
            document: gql(query),
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}){
            if (result.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (result.data == null || result.data!['characters']['results'] == null) {
              return Text("No Data Found !");
            }

            List<dynamic> countriesList = result.data!['characters']['results'];

            return ListView.separated(
              shrinkWrap: true,
              itemCount: countriesList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.blueGrey,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CircleAvatar(
                      radius: 20,
                      child: Image.network(countriesList[index]['image']),
                    ),
                ),
                  title: Text(countriesList[index]['name']),
                  subtitle: Text(countriesList[index]['species']),
                );
              },
            ).paddingAll(12);
          },
        ),
      ),
    );
  }
}
