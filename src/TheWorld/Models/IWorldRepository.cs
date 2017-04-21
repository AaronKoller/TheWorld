using System.Collections.Generic;
using System.Threading.Tasks;

namespace TheWorld.Models
{
    public interface IWorldRepository
    {
        IEnumerable<Trip> GetAllTrips();

        void addTrip(Trip trip);

        Task<bool> saveChangesAsync();

        Trip GetTripByName(string tripName);
    }
}