package imdb.api;
import java.io.*;
import java.net.*;
import java.util.*;


public class Connection {
	 
	 public static void main(String[] args){
	   
	  URL url = null;
	  Scanner sc = null;
	  String apiurl="http://www.deanclatworthy.com/imdb/";
	  String moviename=null; 
	  String dataurl=null;
	  String movie_title = null;
	  String movie_year = null;
    String inputLine;
    String outputLine = null;	  
	  InputStream is = null;
    int index;
    int index_next;

	  try{
		  
	   System.out.print("$ ./program ");
		  
	   //Getting movie name from user
	   sc = new Scanner(System.in);
	   moviename=sc.nextLine();
	   
	   moviename = title.get_title(moviename);
	   
	   movie_title = moviename.substring(0,moviename.indexOf("#"));
	   movie_year = moviename.substring(moviename.indexOf("#")+1);
	   
	   //Check if user has inputted nothing or blank
	   if(moviename==null || moviename.equals("")){
	    System.out.println("No movie found");
	    System.exit(1);
	   }
	   
	   //Remove unwanted space from moviename yb trimming it
	   movie_title = movie_title.trim();
	   movie_year = movie_year.trim();
	   
	   //Forming a complete url ready to send (type parameter can be JSON also)
	   dataurl=apiurl+"?q=" + movie_title + "&year=" + movie_year;
	   url = new URL(dataurl);
	   
      BufferedReader in = new BufferedReader(
      new InputStreamReader(url.openStream()));
	   
       while ((inputLine = in.readLine()) != null)
       {
	        if(inputLine.contains("title"));
	        {
	        	index = inputLine.indexOf("title");
	        	if(index != -1)
	        		outputLine = inputLine;
	        }
       }
       in.close();
       
       index = outputLine.indexOf("\"title\":\"");
       index_next = outputLine.indexOf("\"", index+9);   
       System.out.println("Title: " + outputLine.substring(index+9, index_next));
       
       index = outputLine.indexOf("\"year\":\"");
       index_next = outputLine.indexOf("\"", index+8);
       System.out.println("Year: " + outputLine.substring(index+8, index_next));

   
	  }  
	  catch(Exception e){
	   System.out.println(e);
	  }
	  finally{
	   try{
	   
	    if(is!=null){
	     is.close();
	    }
	    
	    if(is!=null){
	     is.close();
	     
	    }
	    
	    if(sc!=null){
	     sc.close();
	    }
	   }
	   catch(Exception e2){
	    ;
	   }
	  }
	   
	     
	 }

}
