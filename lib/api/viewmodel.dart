import 'package:newsapp/api/fetch_repo.dart';

import 'newsapi.dart';

class viewmodel
{
  final repo = fetchrepo();
  Future<newsapi> fetchNews() async{
    final respond = await repo.fetchNews();
    return respond;
  }


}