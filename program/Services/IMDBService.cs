using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using program.Model;
using program.Repositories;

namespace program.Services
{
    public class IMDBService
    {
        private IRepository MovieRepository;
        public IMDBService(IRepository repository)
        {
            MovieRepository = repository;
        }

        /// <summary>
        /// Get a movie by title from a Repository
        /// </summary>
        /// <param name="title"></param>
        /// <returns></returns>
        public Movie Get(string title)
        {
            return MovieRepository.GetByTitle(title);
        }
    }
}
