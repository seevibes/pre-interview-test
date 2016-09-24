using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using program.Model;
using program.Services;
using program.Repositories;

namespace program
{
    class Program
    {
        static void Main(string[] args)
        {
            string movieName = "";
            if (args.Length > 0)
            {
                movieName = args[0];
            }
            PrintMovie(GetMovieByTitle(movieName));
        }

        /// <summary>
        /// Get a movie from IMDB SERVICE
        /// </summary>
        /// <param name="movieName">movie name as string</param>
        /// <returns>a Movie object or Null if not found</returns>
        private static Movie GetMovieByTitle(string movieName)
        {
            if (String.IsNullOrEmpty(movieName))
            {
                throw new Exception("Please provide a movie name");
            }

            //Inject a RestRespsitory
            var service = new IMDBService(new RestRepository());
            return service.Get(movieName);
        }
        /// <summary>
        /// print movie in screen
        /// precondition movie must be defined 
        /// </summary>
        /// <param name="movie">movie object</param>
        private static void PrintMovie(Movie movie)
        {
            if (movie == null)
            {
                throw new Exception("Movie not found");
            }
            Console.WriteLine(movie.ToString());
        }
    }

}
