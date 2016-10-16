package project;

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
			// print result
			
			String[] arr=str.split(",");
			String tit=arr[1];String year=arr[3];
			String[] origTitle=tit.split(":");String[] origYear=year.split(":");
			System.out.println("Title: " + origTitle[1]);
			System.out.println("Year: " + origYear[1]);
		} else {
			System.out.println("GET request not worked");
		}
	}
	
	public static void main(String[] args) {
		try {
			sendReq(args[0]);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
