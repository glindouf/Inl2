CREATE VIEW v1 as SELECT * FROM sp WHERE sport='Boule';

CREATE VIEW v2 as SELECT * FROM tf WHERE antal<45;

CREATE VIEW v3 as SELECT namn FROM f WHERE ford='Cykel';

CREATE VIEW v4 as SELECT namn, beer FROM pb left join b on b.sysnr = pb.sysnr WHERE b.land='Belgien';

CREATE VIEW v5 as SELECT uv.namn FROM uv, k, sp WHERE uv.kkod = (SELECT k.kkod WHERE k.nickname='SUP') AND uv.namn=(SELECT sp.namn WHERE sp.sport='Bowling');

CREATE VIEW v6 as SELECT sport FROM sp group by sport having count()=1;

CREATE VIEW v7 as select distinct k.knamn from (((((k join uv on k.kkod=uv.kkod) join pb on pb.namn = uv.namn) join b on b.sysnr=pb.sysnr) join sp on sp.namn=pb.namn) join f on f.namn=sp.namn) where b.bryggeri='Epic' and sp.sport='Pole dance' and f.ford='GL' order by k.knamn;

CREATE VIEW v8 as SELECT namn FROM uv group by namn having count(namn AND kkod)=1;

CREATE VIEW V9 as SELECT distinct uv.namn FROM (uv join k on uv.kkod=k.kkod) WHERE knamn = ‘Affarssystem’ except SELECT distinct namn FROM (pb join b on pb.sysnr=b.sysnr) WHERE land = ‘Finland’;

CREATE VIEW v10 as SELECT p.namn, px.namn, p.rum, p.tel, px.tel FROM p, p px WHERE p.rum = px.rum and p.tel != px.tel; 						-->		 // EJ FÄRDIG - SKRIVER UT DUBBELT

CREATE VIEW v11 as SELECT p.tel FROM ((p join pb on p.namn = pb.namn) join b on b.sysnr = pb.sysnr) group by tel having count(land) =1;  	-->		//	EJ FÄRDIG - SKRIVER UT FYRA/FEM

CREATE VIEW v12 as SELECT distinct knamn from (k join uv on k.kkod = uv.kkod) where uv.namn = ’Lennart’ and uv.kkod not in (select kkod from uv where namn = ‘Kjell’ or namn = ‘Marie’) order by knamn;

CREATE VIEW v13 as SELECT namn FROM sp WHERE sport = ‘Jogging’ and namn not in (SELECT namn FROM f WHERE ford = ‘Bil’) and namn in (SELECT namn FROM pb WHERE sysnr in (SELECT sysnr FROM b WHERE land=’Danmark’));


CREATE VIEW v15 as SELECT distinct uv.namn, k.knamn FROM ((uv join tf on uv.kkod = tf.kkod AND uv.termin = tf.termin) join k on k.kkod = tf.kkod) WHERE antal >= (SELECT max(antal) FROM tf);

CREATE VIEW v16 as SELECT distinct beer FROM b natural join pb natural join uv natural join (SELECT * FROM tf WHERE antal = (SELECT min (antal) ant FROM tf WHERE antal > (SELECT min (antal) FROM tf))) order by beer;

CREATE VIEW V17 as SELECT distinct rum FROM (p join uv on p.namn = uv.namn) WHERE p.namn not in(SELECT kansv FROM tf); 

CREATE VIEW v18 as SELECT distinct namn FROM uv WHERE namn not in(select namn from uv where termin>'ht2010' AND termin<'ht2012' or termin>'vt2010' AND termin<'vt2012');

CREATE VIEW v19 as SELECT rum from p where namn in(select namn from pb where sysnr in(select sysnr from b where land ='USA')) 
and namn in(select namn from sp where sport ='Fotboll') 
and namn in(select namn from f where ford = 'Cykel')
and namn in(select namn from uv where kkod in(select kkod from k where knamn = 'Affarssystem'));

CREATE VIEW v20 as select distinct uv.namn, k.knamn from k natural join uv natural join pb where namn=(select namn from pb where liter =(select max(liter) from pb)) order by k.knamn;
