package com.seevibes.pretest.imdb;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

/**
 * Created by patrek on 24/11/14.
 */
//Just read the properties needed to accomplish the task at hand.
@JsonIgnoreProperties(ignoreUnknown = true)
public class TitleList {

    private List<Movie> titlePopular;

    public List<Movie> getTitlePopular() {
        return titlePopular;
    }

    public void setTitlePopular(List<Movie> titlePopular) {
        this.titlePopular = titlePopular;
    }
}
