package com.seevibes.pretest.imdb;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import joptsimple.OptionParser;
import joptsimple.OptionSet;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by patrek on 24/11/14.
 */
@Configuration
@EnableAutoConfiguration
public class ImdbTitleSearchConfig implements CommandLineRunner{

    private static OptionSet options;

    public static void main(String[] args) {
        OptionParser parser = new OptionParser();
        options = parser.parse(args);

        if (options.nonOptionArguments().isEmpty()) {
            System.err.println("You must provide part of a title to search for");
            System.exit(1);
        }

        SpringApplication.run(ImdbTitleSearchConfig.class, args);
    }

    // Implement the operation here to keep things simple for this test.
    @Override
    public void run(String... args) throws Exception {
        String titlePart = (String) options.nonOptionArguments().get(0);
        Map<String, String> vars = new HashMap<String, String>();
        vars.put("title", titlePart);

        RestTemplate template = new RestTemplate();
        ResponseEntity<String> entity = template.getForEntity("http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q={title}", String.class, vars);

        String body = entity.getBody();

        ObjectMapper mapper = new ObjectMapper();
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES);
        TitleList titleList = mapper.readValue(body, TitleList.class);

        List<Movie> movieList = titleList.getTitlePopular();
        if (null != movieList && !movieList.isEmpty()) {
            // Fetch and display only the first result
            Movie movie = movieList.get(0);
            System.out.println(String.format("Movie: %s", movie.getTitle()));
            System.out.println(String.format("Year: %s", movie.getYear()));
        } else {
            System.out.println(String.format("No match found for \"%s\"", titlePart));
        }
    }

}
