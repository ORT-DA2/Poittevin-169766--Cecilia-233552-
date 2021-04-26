﻿using System.Collections.Generic;

namespace MSP.BetterCalm.DataAccess
{
    public class PlaylistDto
    {
        public int PlaylistDtoID { get; set; }
        
        public string Name {get; set; }
        
        public string UrlImage {get; set; }
        
        public string Description {get; set; }
        
        public ICollection<PlaylistCategoryDto> PlaylistCategoriesDto { get; set; }
        
        public ICollection<PlaylistSongDto> PlaylistSongsDto { get; set; }
    }
}