// Programme : MoviesIMDB Pre-Interview Test
// Auteur : Vincent Desrosiers - 15039557
// Université de Sherbrooke
// Date : 02-10-2015

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using Newtonsoft.Json;

namespace preinterviewtest
{
    class Program
    {
        // String statique de l'api de imdb
        private static string imdbUrl = "http://www.omdbapi.com/?t=%&y=&type=movie&r=json";

        static void Main(string[] movieTitle)
        {
            // Variable d'erreur dans le cas ou une erreur se produit
            int iError = 0;

            // Vérification du paramètre reçu
            if(movieTitle.Length != 0)
            {
                // On lance l'appel à l'API
                WebRequest imdbRequest = WebRequest.Create(imdbUrl.Replace("%", movieTitle[0].ToString()));

                // On encapsule l'appel pour attraper toutes les erreurs possibles
                try
                {
                    // On initialise une réponse
                    WebResponse imdbResponse = imdbRequest.GetResponse();

                    // On définie un stream de lecture de la réponse
                    Stream responseContent = imdbResponse.GetResponseStream();

                    // On définie un stream de lecture du contenu
                    StreamReader responseReader = new StreamReader(responseContent);
                    
                    // On traite le json
                    dynamic jsonResponse = JsonConvert.DeserializeObject(responseReader.ReadToEnd());

                    // On ferme les streams
                    responseReader.Close();
                    imdbResponse.Close();

                    // Si on a pas de film en retour
                    if(jsonResponse.Error != null)
                    {
                        Console.WriteLine("No movies found");
                    }
                    else
                    {
                        // Extraction des données du JSON reçu
                        string Title = jsonResponse.Title;
                        string Year = jsonResponse.Year;

                        // Écriture du résultat en console
                        Console.WriteLine("Title: " + Title);
                        Console.WriteLine("Year: " + Year);
                    }                    
                }
                catch
                {
                    // Une erreur est survenue durant le traitement
                    // Écriture du message d'erreur et définition d'un code d'erreur
                    Console.WriteLine("An error as occured, please try again.");
                    iError = 2;
                }
            }
            else
            {
                // Écriture message d'erreur
                Console.WriteLine("No movie title entered");
                iError = 1;
            }

            // On quitte le programme avec le code de sortie
            System.Environment.Exit(iError);
        }
    }
}
