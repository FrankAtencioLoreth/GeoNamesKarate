function fn() {

    karate.configure("connectTimeout", 5000);
    karate.configure("readTimeout", 5000);

    //via CLI
    var baseUrl = karate.properties["baseUrl"] || "http://api.geonames.org/"
    var user  = karate.properties["user"] || "karate"

    return {

        api: {
            baseUrl: baseUrl
        },
        user: {
            name: user
        }

    }

}