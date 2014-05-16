using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Net;
using System.Text.RegularExpressions;

namespace imbd
{
    class Program
    {
        static void Main(string[] args)
        {
            if(args.Length > 0)
            {
              string argument = args[0];
            }
            else
            { 
              Console.WriteLine("You need to write a word");
              argument = "batman";
            }
            //Find HTML contents of the IMBD page
            string url = "http://www.imdb.com/find?q=" + argument + "&s=tt&ttype=ft&ref_=fn_ft";
            WebClient client = new WebClient();
            Stream data = client.OpenRead(url);
            StreamReader reader = new StreamReader(data);
            string s = reader.ReadToEnd();
            data.Close();
            reader.Close();

            //find the first movie with regular expression
            string pattern = @">(\w| )+</a> \(\d{4}\) ";
            Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase);
            Match matche = rgx.Match(s);
            //split the title of the year
            string[] sep = new string[] {">","</a>","(",")"};
            sep = matche.ToString().Trim().Split(sep, StringSplitOptions.RemoveEmptyEntries);
           
            //Show informations
            if(sep.Length > 0)
            {
              Console.WriteLine("Title: " + sep[0]);
              Console.WriteLine("Year: " + sep[2]);
            }
            else
                Console.WriteLine("There's no movie with this name");

        }
    }
}
