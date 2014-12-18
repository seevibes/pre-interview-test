package imdb_search;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.MalformedURLException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;


/**
 *
 * @author Gabriel
 */
public class IMDB_Search {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args){
        if(args.length>0)
        {
            System.out.println(getMovieDataFromIMDB(args[0],"Title","Year"));
        }
        else
        {
            System.out.println("A keyword is required to find your movie");
        }
    }

    /**
     * Find the first movie matching the given keyword at the IMDB 
     * and return the value of the specified fields
     * @param keyword a keyword describing the movie to search 
     * @param fields the fields of the movie data to get
     * @return the movie data
     */
    private static String getMovieDataFromIMDB(String keyword,String ... fields)
    {
        String output="";
        HttpURLConnection connection=null;
        try{
            URL url=new URL("http://www.omdbapi.com/?s="+keyword);
            connection=(HttpURLConnection)url.openConnection();
            connection.connect();
            BufferedReader br=new BufferedReader(new InputStreamReader(connection.getInputStream()));
            
            JSONObject jsonInput=new JSONObject(br.readLine());
            JSONArray jsonSearch=jsonInput.getJSONArray("Search");
            JSONObject jsonMovie=jsonSearch.getJSONObject(0);
            for(int i=0;i<fields.length;i++)
            {
                if(!jsonMovie.isNull(fields[i]))
                {
                    output+=fields[i]+": "+jsonMovie.getString(fields[i])+"\n";
                }
            }
        }
        catch (MalformedURLException e1){}
        catch (IOException | JSONException e1){}
        finally{
            if(connection!=null){connection.disconnect();}
        }
        return output;
    }
}
