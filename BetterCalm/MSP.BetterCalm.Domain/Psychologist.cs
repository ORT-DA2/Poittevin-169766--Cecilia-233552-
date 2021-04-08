namespace MSP.BetterCalm.Domain
{
    public class Psychologist: User
    {
        public string Address { get; set; }
        protected bool Equals(Psychologist other)
        {
            return
                Address == other.Address &&
                Name == other.Name &&
                LastName == other.LastName;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != this.GetType()) return false;
            return Equals((Psychologist) obj);
        }

        public override int GetHashCode()
        {
            return (Address != null ? Address.GetHashCode() : 0);
        }

    }
}