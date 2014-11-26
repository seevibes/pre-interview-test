## Compile / Package
Use the following command to compile and package the project:

    mvn package

## Run
Use the following command to run the packaged result

    java -jar target/seevibes-pre-test-1.0.0.jar query-string

## Sample Results:

    $ java -jar target/seevibes-pre-test-1.0.0.jar batman
    Movie: Batman
    Year: 1989

    $ java -jar target/seevibes-pre-test-1.0.0.jar avengers
    Movie: The Avengers
    Year: 2012

    $ java -jar target/seevibes-pre-test-1.0.0.jar masq
    Movie: The Man in the Iron Mask
    Year: 1998

    $ java -jar target/seevibes-pre-test-1.0.0.jar robin
    Movie: Robin Hood
    Year: 2010

    $ java -jar target/seevibes-pre-test-1.0.0.jar wind
    No match found for "wind"

    $ java -jar target/seevibes-pre-test-1.0.0.jar benjamin
    Movie: The Curious Case of Benjamin Button
    Year: 2008
