String key = "mEHN4VTXFteOGTPbdTRLLNnWi1EZiKtxiOEmg7gQ";

String urlGetAll = "https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=$key";
String urlGetSpecific(id) =>
    "https://api.nasa.gov/neo/rest/v1/neo/$id?api_key=$key";
String urlGetByDate(startDate, endDate) =>
    "https://api.nasa.gov/neo/rest/v1/feed?start_date=$startDate&end_date=$endDate&api_key=$key";
//2015-09-07