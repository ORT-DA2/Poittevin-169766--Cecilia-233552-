namespace MSP.BetterCalm.DataAccess.DtoObjects
{
    public class AdministratorDto: UserDto
    {
        public int AdministratorDtoId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Token { get; set; }
    }
}