var snd_playfile = argument0;
var snd_playvolume = argument1;
var snd_playpitch = argument2;
var snd_playloop = argument3;
audio_play_sound(snd_playfile, 0, snd_playloop);
audio_sound_gain(snd_playfile, snd_playvolume, 0);
audio_sound_pitch(snd_playfile, snd_playpitch);
