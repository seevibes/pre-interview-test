/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package imdbtitlesearch;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import java.net.*;
import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.select.Elements;

/**
 *
 * @author Roman Novitski
 */
public class ImdbTitleSearch {

    /**
     * @param args the command line arguments
     */
public static void main(String[] args) {
    if(args.length==0)
     System.out.println("The input parameter is Missing!");
    else
    scrapeTitle("http://www.imdb.com/find?ref_=nv_sr_fn&q="+args[0]+"&s=tt");
    
}
public static void scrapeTitle(String url){
    String html = getUrl(url);
    Document doc = Jsoup.parse(html);
    //System.out.println(doc);
    Elements el=doc.select(".result_text");
    if(el.first()!=null){
        String content = el.first().text();
        String pattern = "[(][0-9]{4}[)]";

        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(content);
        if (m.find( )) {
            String year=m.group(0);
            String title=content.replace(year, "");           
            System.out.println("Title: " +title+"\nYear: "+year);
          }
    }else
        System.out.println("Nothing found!");
}
public static String getUrl(String url){
    URL urlObj = null;
    try{
        urlObj = new URL(url);
    }
    catch(MalformedURLException e){
        System.out.println("The url was malformed!");
        return "";
    }
    URLConnection urlCon = null;
    BufferedReader in = null;
    String outputText = "";
    try{
        urlCon = urlObj.openConnection();
        in = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
        String line = "";
        while((line = in.readLine()) != null){
        outputText += line;
    }
        in.close();
    }catch(IOException e){
    System.out.println("There was an error connecting to the URL");
    return "";
    }
    return outputText;
}
    
}
