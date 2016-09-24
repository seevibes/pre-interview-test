using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using program.Model;
namespace program.Repositories
{
    public interface IRepository
    {
        Movie GetByTitle(string title);
    }
}
