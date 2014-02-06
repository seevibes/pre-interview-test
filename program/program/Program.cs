using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using Newtonsoft.Json;

namespace program
{
    class Program
    {
        static void Main(string[] args)
        {
            const string api = "http://deanclatworthy.com/imdb/";
            if (args.Length > 0)
            {
                if (IsOnline(api))
                {
                    var webClient = new WebClient();
                    string title = args[0].Replace(' ', '+');
                    string json = webClient.DownloadString(String.Format("{0}?q={1}", api, title));
                    var movie = JsonConvert.DeserializeObject<Movie>(json);
                    Console.WriteLine("Title: " + movie.Title);
                    Console.WriteLine("Year: " + movie.Year);
                }
                else
                {
                    Console.WriteLine("Connection with the server is impossible, please wait a couple of hours and try again");
                }
            }
            else
            {
                Console.WriteLine("Please enter at least one argument");
            }
        }
        static bool IsOnline(string url)
        {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "HEAD";
            try
            {
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                return (response.StatusCode == HttpStatusCode.OK);
            }
            catch
            {
                return false;
            }

        }
    }
}
