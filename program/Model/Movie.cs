using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace program.Model
{
    public class Movie
    {
        public Movie()
        {

        }
        public string Title { get; set; }
        public int Year { get; set; }

        public override string ToString()
        {
            return string.Format("Title : {0} \nYear : {1}",Title, Year);
        }
    }
}
