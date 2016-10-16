import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class HttpReq {

	private static final String URLstr="http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q=";
	
	private static void sendReq(String title) throws IOException{
		URL obj=new URL(URLstr+title);
		HttpURLConnection con=(HttpURLConnection)obj.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			String str = null;
			boolean record=false;
			for(int i=0;i<response.length();i++){
				if(response.charAt(i)=='{'){
					record=true;
				}
				if(record){
					str+=response.charAt(i);
				}
				if(response.charAt(i)=='}'){
					record=false;
					break;
				}
				
			}
			String word1="\"title\":";
			String word2="\"title_description\":";
			StringBuffer titleS=new StringBuffer();
			StringBuffer yearS=new StringBuffer();
			int index=str.indexOf(word1);
			int index2=str.indexOf(word2);
			for(int i=index2+word2.length();i<str.length();i++){
				if(str.charAt(i)==',')break;
				yearS.append(str.charAt(i));
			}
			int stop=0;
			System.out.println(index);
			for(int i=index+word1.length();i<str.length();i++){
				if(stop==2)break;
				if(str.charAt(i)=='"')stop++;
				titleS.append(str.charAt(i));
			}
			
			System.out.println("Title : " +titleS);
			System.out.println("Year : " + yearS);
		} else {
			System.out.println("GET request not worked");
		}
	}
	
	public static void main(String[] args) {
		try {
			sendReq("dude");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
