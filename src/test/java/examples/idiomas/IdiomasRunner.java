package examples.idiomas;

import com.intuit.karate.junit5.Karate;

class IdiomasRunner {
    
    @Karate.Test
    Karate testPostIdiomas() {
        return Karate.run("post-idiomas.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testGetIdiomas() {
        return Karate.run("get-idiomas.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPutIdiomas() {
        return Karate.run("put-idiomas.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testDeleteIdiomas() {
        return Karate.run("delete-idiomas.feature").relativeTo(getClass());
    }
}

