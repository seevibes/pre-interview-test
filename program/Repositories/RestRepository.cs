using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using program.Model;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Script.Serialization;
using System.Configuration;

namespace program.Repositories
{
    public class RestRepository : IRepository
    {
        private static string URL = "http://www.omdbapi.com/"; //we need to have a config file for IDMB URL
        //r for returned format(JSON,XML)
        //t for title
        private static string urlParameters = "?r=JSON&t=";

        /// <summary>
        /// Search a movie by title
        /// </summary>
        /// <param name="title"></param>
        /// <returns>Movie object or null</returns>
        public Movie GetByTitle(string title)
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri(URL);
            
            // Build url parameters.
            urlParameters += title;
            // List data response.
            HttpResponseMessage response = client.GetAsync(urlParameters).Result;
            if (response.IsSuccessStatusCode)
            {
                var serializer = new JavaScriptSerializer();

                var jsonResult = response.Content.ReadAsStringAsync().Result;
                
                //deserialize json object
                var selectedMovie = serializer.Deserialize<Movie>(jsonResult);
                if (!String.IsNullOrEmpty(selectedMovie.Title))
                {
                    return selectedMovie;
                }
            }
            else
            {                
                Console.WriteLine("{0} ({1})", (int)response.StatusCode, response.ReasonPhrase);
            }
            return null;
        }
    }
}
