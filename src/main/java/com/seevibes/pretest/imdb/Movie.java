package com.seevibes.pretest.imdb;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by patrek on 24/11/14.
 */
//Just read the properties needed to accomplish the task at hand.
@JsonIgnoreProperties(ignoreUnknown = true)
public class Movie {

    // Get 4 digits
    private static final Pattern yearPattern = Pattern.compile("(\\d{4}).*");
    private String title;
    private String titleDescription;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleDescription() {
        return titleDescription;
    }

    public void setTitleDescription(String titleDescription) {
        this.titleDescription = titleDescription;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "title='" + title + '\'' +
                ", titleDescription='" + titleDescription + '\'' +
                '}';
    }

    public String getYear() {
        Matcher m = yearPattern.matcher(titleDescription);
        if (m.find()) {
            return m.group(1);
        } else {
            return "unknown";
        }
    }
}
