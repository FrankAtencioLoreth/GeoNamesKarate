package geonames.get;

import com.intuit.karate.junit5.Karate;

public class GeograficalDataGetRunner {

    @Karate.Test
    Karate geograficalDataGet() {
        return Karate.run().relativeTo(getClass());
    }

}
