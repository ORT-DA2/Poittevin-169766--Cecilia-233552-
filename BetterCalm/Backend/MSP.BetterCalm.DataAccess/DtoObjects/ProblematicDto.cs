using System.Collections.Generic;

namespace MSP.BetterCalm.DataAccess.DtoObjects
{
    public class ProblematicDto
    {
        public int ProblematicDtoId { get; set; }
        
        public string Name { get; set; }
        
        public virtual ICollection<PsychologistProblematicDto> PsychologistProblematic { get; set; }
    }
}