--Exploring the dataset for better undersatnding of the data that we are working with
--

select * from dbo.Spotify_dataset

select count(distinct artist) from dbo.Spotify_dataset

select distinct Album_type from dbo.Spotify_dataset

select Duration_min from dbo.Spotify_dataset

select max(duration_min) from dbo.Spotify_dataset
select min(duration_min) from dbo.Spotify_dataset

select distinct channel from dbo.Spotify_dataset

select distinct most_playedon from dbo.Spotify_dataset


--Retrieve the names of all the tracks that have more than 1 billion streams.

select * from dbo.Spotify_dataset
where stream >= 1000000000
order by 22 
--orderd by the number of streams Asc to Desc


--List all albums along with their respective artists.

select album, Artist from Spotify_dataset

select distinct album, Artist from dbo.Spotify_dataset





--Get the total number of comments where the license is true

select distinct * from dbo.Spotify_dataset
where Licensed = 1

select sum(comments) as total_comments from dbo.Spotify_dataset
where Licensed = 1

select sum(comments) as total_comments from dbo.Spotify_dataset
where Licensed = 0





--Find all the tracks that belong to the album type single

select * from dbo.Spotify_dataset
where Album_type = 'single'
--order by 1

select COUNT(*) as count_for_single_album_type from dbo.Spotify_dataset
where Album_type = 'single'





--Count the total number tracks by every artist

select artist, count(*) as total_number_of_songs from dbo.Spotify_dataset
group by Artist
order by 2





--calculate the average danceability of tracks in each album

select Album, AVG(Danceability) as avg_danceability from dbo.Spotify_dataset
group by Album
order by avg_danceability




--Find the top 5 tracks with the highest energy values


select top 5
	track, Max(energy) as avg_eng from dbo.Spotify_dataset
group by Track
order by avg_eng





-- List all/top 5 the track along with their views and likes where offical_video is True


select Track, sum(Likes) as Sum_Likes, Sum(Views) as sum_views from dbo.Spotify_dataset
where official_video = 1
group by Track
order by Sum_Likes desc


select top 5
	Track, sum(Likes) as Total_Likes, sum(Views) Total_views from dbo.Spotify_dataset
where official_video = 1
group by Track
order by Total_Likes desc




-- For each album calculate total views for associated tracks 

select Album, track, sum(Views) as toatl_views from dbo.Spotify_dataset
group by Album, Track
order by toatl_views desc 





--Retrieve the track names that have streamed on spotify more than youtube 

select * from dbo.Spotify_dataset


select track ,
sum(case when most_playedon = 'spotify' then stream else 0 end) as Spotify_stream,
sum(case when most_playedon = 'youtube' then stream else 0 end) as youtube_stream
from dbo.Spotify_dataset
group by track
having
sum(case when most_playedon = 'spotify' then stream else 0 end) >
sum(case when most_playedon = 'youtube' then stream else 0 end) 





