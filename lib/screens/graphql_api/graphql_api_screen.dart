import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlApiScreen extends StatelessWidget {
  final String query = """
    query {
      countries {
        name
      }
    }
  """;
  HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Graph QL Screen",
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
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (result.data == null || result.data!['countries'] == null) {
              return Text("No Data Found !");
            }

            List<dynamic> countriesList = result.data!['countries'];

            return ListView.separated(
              shrinkWrap: true,
              itemCount: countriesList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.blueGrey,
                  title: Text(countriesList[index]['name']),
                );
              },
            ).paddingAll(12);
          },
        ),
      ),
    );
  }
}
