using System.Linq;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.DataAccess
{
    public class AdministratorMapper: IMapper<Administrator, AdministratorDto>
    {
        public AdministratorDto DomainToDto(Administrator obj, ContextDB context)
        {
            AdministratorDto administratorDto = context.Administrators.FirstOrDefault(x => x.Name == obj.Name);
            if (administratorDto is null)
                administratorDto = new AdministratorDto()
                {
                    AdministratorDtoId = obj.AdministratorId,
                    Name = obj.Name,
                    LastName = obj.LastName,
                    Email = obj.Email,
                    Password = obj.Password
                    
                };
            return administratorDto;
        }

        public Administrator DtoToDomain(AdministratorDto obj, ContextDB context)
        {
            return new Administrator()
            {
                AdministratorId = obj.AdministratorDtoId,
                Name = obj.Name,
                LastName = obj.LastName,
                Email = obj.Email,
                Password = obj.Password
            };
        }

        public Administrator GetById(ContextDB context, int id)
        {
            throw new System.NotImplementedException();
        }

        public AdministratorDto UpdateDtoObject(AdministratorDto objToUpdate, Administrator updatedObject, ContextDB context)
        {
            objToUpdate.Name = updatedObject.Name;
            objToUpdate.LastName = updatedObject.LastName;
            objToUpdate.Email = updatedObject.Email;
            objToUpdate.Password = updatedObject.Password;
            return objToUpdate;
        }
    }
}