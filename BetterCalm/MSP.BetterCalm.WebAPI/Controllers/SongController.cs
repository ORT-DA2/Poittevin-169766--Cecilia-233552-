﻿using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using MSP.BetterCalm.BusinessLogic;
using MSP.BetterCalm.BusinessLogic.Exceptions;
using MSP.BetterCalm.DataAccess;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.WebAPI.Controllers
{
    [ApiController]
    [Route("api/Song")]
    public class SongController : ControllerBase
    {

        private ISongService _songService;

        public SongController(ISongService songService)
        {
            this._songService = songService;
        }
        
        [HttpGet]
        public IActionResult GetAll()
        {
            List<Song> songs = _songService.GetSongs();
            return Ok(songs);
        }
        
        [HttpGet("songName/{name}")]
        public IActionResult GetSongsByName([FromRoute]string name)
        {
            try
            {
                List<Song> songs = _songService.GetSongsByName(name);
                return Ok(songs);
            }
            catch (ValueNotFound)
            {
                return NotFound("Not found songs by this name");
            }
        }
        
        [HttpGet("authorName/{author}")]
        public IActionResult GetSongsByAuthor([FromRoute]string author)
        {
            try
            {
                List<Song> songs = _songService.GetSongsByAuthor(author);
                return Ok(songs);
            }
            catch (ValueNotFound)
            {
                return NotFound("Not found songs by this author name");
            }
        }
        
        [HttpGet("authorName/{author}/songName/{name}")]
        public IActionResult GetSongByAuthorAndName([FromRoute]string name,string author)
        {
            try
            {
                Song song = _songService.GetSongByNameAndAuthor(name, author);
                return Ok(song);
            }
            catch (ValueNotFound)
            {
                return NotFound("Not found song by name and author name");
            }
        }
        
        [HttpGet("categoryName/{name}")]
        public IActionResult GetSongsByCategoryName([FromRoute]string name)
        {
            try
            {
                List<Song> songs = _songService.GetSongsByCategoryName(name);
                return Ok(songs);
            }
            catch (ValueNotFound)
            {
                return NotFound("Not found song by category name");
            }
        }
        
        [HttpPost]
        public IActionResult CreateSong([FromBody] Song song)
        {
            try
            {
                try
                {
                    _songService.SetSong(song);
                    return Ok("Song created");
                }
                catch (AlreadyExistThisSong)
                {
                    return Conflict("This song is already registered in the system");
                }
            }
            catch (InvalidNameLength)
            {
                return Conflict("Cannot add a song with an empty name ");
            }
        }
          
        [HttpDelete()]
        public IActionResult DeleteSong([FromBody] Song song)
        {
            try
            {
                
                _songService.DeleteSong(song);
                return Ok("Song removed");
            }
            catch (ValueNotFound)
            {
                return Conflict("This song not registered in the system");
            }
        }

        [HttpDelete("song/{name}/author/{author}")]
        public IActionResult DeleteSongByNameAndAuthor([FromRoute] string name,string author)
        {
            try
            {
                _songService.DeleteSongByNameAndAuthor(name, author);
                return Ok("Song removed");
            }
            catch (ValueNotFound)
            {
                return Conflict("This song not registered in the system");
            }
        }

        [HttpPut("songName/{name}/authorName/{author}")]
        public IActionResult UpdateSongByNameAndAuthor([FromRoute] string name,string author,[FromBody] Song songUpdated)
        {
            try
            {
                Song songToUpdate = _songService.GetSongByNameAndAuthor(name, author);
                _songService.UpdateSong(songToUpdate, songUpdated);
                return Ok("Song Updated");
            }
            catch (ValueNotFound)
            {
                return Conflict("This song not registered in the system");
            }
        }
    }
}