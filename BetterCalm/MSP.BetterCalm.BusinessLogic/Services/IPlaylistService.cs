﻿using System.Collections.Generic;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.BusinessLogic
{
    public interface IPlaylistService
    {
        public List<Playlist> GetPlaylist();
        public void AddPlaylist(Playlist playlist);
        public List<Playlist> GetPlaylistByName(string playlistName);
        public List<Playlist> GetPlaylistByAudioName(string audioName); 
        public List<Playlist> GetPlaylistByCategoryName(string categoryName);
        public Playlist GetPlaylistById(int id);
        public void UpdatePlaylist(Playlist playlistToUpdate, Playlist newPlaylist);
        public void UpdatePlaylistById(int id, Playlist newPlaylist);
        public void DeletePlaylist(int id);
        void AddNewAudioToPlaylist(Audio audio, int idPlaylist);
        void AssociateAudioToPlaylist(int idAudio, int idPlaylist);
    }
}