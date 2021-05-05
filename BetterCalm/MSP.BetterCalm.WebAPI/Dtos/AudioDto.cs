﻿using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using MSP.BetterCalm.BusinessLogic.Exceptions;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.WebAPI.Dtos
{
    public class AudioDto
    {
        
        public int Id { get; set; }
       
        public List<Category> Categories {get; set; }

        private string name;
        public string Name { get;set; }
        
        public string Duration { get; set; }
        
        public string AuthorName {get; set; }
        
        public string UrlImage {get; set; }
        
        public string UrlAudio {get; set; }

        private bool IsDurationValid(string duration)
        {

            string pattern = @"^([0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9])[hms]$";
            Regex reg = new Regex(pattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
            return reg.IsMatch(duration);
        }
        private int SetDuration(string vDuration)
        {
            if (IsDurationValid(Duration))
            {
                if (vDuration.Contains('h'))
                    return Int32.Parse(vDuration.Split('h')[0]) * 60 * 60;
                else if (vDuration.Contains('m'))
                    return Int32.Parse(vDuration.Split('m')[0]) * 60;
                else if (vDuration.Contains('s'))
                    return Int32.Parse(vDuration.Split('s')[0]);
            }
            throw new InvalidDurationFormat();
        }

        public Audio CreateAudio()
        {
            Audio audio = new Audio()
            {
                Id=Id,Name = Name, Categories = Categories, Duration = SetDuration(Duration), AuthorName = AuthorName,
                UrlAudio = UrlAudio, UrlImage = UrlImage
            };
            return audio;
        }
        
        public AudioDto CreateAudioDto(Audio audio)
        {
            double duration = (audio.Duration / 60);
            string durationFormat = "";
            if (duration <= 60)
            {
              durationFormat = duration.ToString() + "m";
            }
            else
            {
                duration = (audio.Duration / 60)/60;
                durationFormat = duration.ToString() + "h";
            }

            AudioDto audioReturn = new AudioDto()
            {
                Name = audio.Name, Categories = audio.Categories, Duration = durationFormat, AuthorName = audio.AuthorName,
                UrlAudio = audio.UrlAudio, UrlImage = audio.UrlImage
            };
            return audioReturn;
        }
        
        public override bool Equals(object obj)
        {
            if (obj==null) return false;
            if (obj.GetType() != GetType()) return false;
            return Id == ((AudioDto) obj).Id;
        }
    }
}