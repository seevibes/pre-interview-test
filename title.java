package imdb.api;
import java.net.*;
import java.io.*;

public class title {
	

	public static String get_title(String part_title) throws Exception {

    	String outputLine = null;
    	String data = null;
    	int index = -1;
    	int index_prev = -1;
    	int index_next = -1;
        URL url = new URL("http://www.imdb.com/find?q=" + part_title + "&s=tt&ttype=ft&ref_=fn_ft");
        BufferedReader in = new BufferedReader(
        new InputStreamReader(url.openStream()));

        String inputLine;
        while ((inputLine = in.readLine()) != null)
        {
	        if(inputLine.contains("\"findResult"));
	        {
	        	index = inputLine.indexOf("\"findResult");
	        	if(index != -1)
	        		outputLine = inputLine;
	        }
        }
        in.close();
        
        index = outputLine.indexOf("<a", outputLine.indexOf("</a>") + 3 );
        index_prev = outputLine.indexOf(">", index);
        index_next = outputLine.indexOf("<", index_prev);    
        data = outputLine.substring(index_prev+1, index_next);
        
        index_prev = outputLine.indexOf("(", index_next);
        index_next = outputLine.indexOf(")", index_prev);
        data = data + "#" + outputLine.substring(index_prev+1, index_next);
        
        data.replace(" ","+");

        return data;
    }
}
