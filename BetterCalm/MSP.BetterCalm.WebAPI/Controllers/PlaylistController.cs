﻿using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using MSP.BetterCalm.BusinessLogic;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.WebAPI.Controllers
{
    [ApiController]
    [Route("api/Playlist")]
    public class PlaylistController : ControllerBase
    {

        private IPlaylistLogic playlistLogic;

        public PlaylistController(IPlaylistLogic playlistLogic)
        {
            this.playlistLogic = playlistLogic;
        }
        
        [HttpGet]
        public IActionResult GetAll()
        {
            IEnumerable<Playlist> songs = this.playlistLogic.GetPlaylist();
            return Ok(songs);
        }
        
        [HttpGet("{Name}")]
        public IActionResult GetPlaylistByName([FromRoute]string Name)
        {
            List<Playlist> playlists = this.playlistLogic.GetPlaylistByName(Name);
            return Ok(playlists);
        }
        
        [HttpGet("{categoryName}")]
        public IActionResult GetPlaylistByCategoryName([FromRoute]string categoryName)
        {
            List<Playlist> playlists = this.playlistLogic.GetPlaylistByCategoryName(categoryName);
            return Ok(playlists);
        }
        
        [HttpGet("{categoryName}")]
        public IActionResult GetPlaylistBySongName([FromRoute]string songName)
        {
            List<Playlist> playlists = this.playlistLogic.GetPlaylistBySongName(songName);
            return Ok(playlists);
        }
        
        [HttpPost]
        public IActionResult CreatePlaylist([FromBody] Playlist playlist)
        {
            playlistLogic.AddPlaylist(playlist);
            return Ok();
        }
        
        [HttpDelete()]
        public IActionResult DeletePlaylist([FromBody] Playlist playlist)
        {
            playlistLogic.DeletePlaylist(playlist);
            return Ok("Element removed");
        }

        //TODO: hacerla por ID
       // [HttpDelete("{name}")]
        //public IActionResult DeletePlaylistByName([FromRoute] string name)
        //{
          //  playlistLogic.DeletePlaylistByName(name);
           // return Ok("Element removed");
        //}
        
        //[HttpPut]
        //public IActionResult UpdatePlaylist()
        //{
            //TODO: hacerla por ID
          //  return Ok("Element Updated");
        //}
    }
}