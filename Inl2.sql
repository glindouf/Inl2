CREATE VIEW v1 as SELECT * from sp WHERE sport='Boule';

CREATE VIEW v2 as SELECT * from tf WHERE antal<45;

CREATE VIEW v3 as SELECT namn from f WHERE ford='Cykel';

CREATE VIEW v4 as SELECT namn, beer from pb left join b on b.sysnr = pb.sysnr WHERE b.land='Belgien';

CREATE VIEW v5 as SELECT uv.namn from uv, k, sp WHERE uv.kkod = (SELECT k.kkod WHERE k.nickname='SUP') AND uv.namn=(SELECT sp.namn WHERE sp.sport='Bowling');

CREATE VIEW v6 as SELECT sport from sp group by sport having count()=1;

CREATE VIEW v7 as SELECT distinct k.knamn from (((((k join uv on k.kkod=uv.kkod) join pb on pb.namn = uv.namn) join b on b.sysnr=pb.sysnr) join sp on sp.namn=pb.namn) join f on f.namn=sp.namn) WHERE b.bryggeri='Epic' and sp.sport='Pole dance' and f.ford='GL';

CREATE VIEW v8 as SELECT namn from uv group by namn having count(namn AND kkod)=1;

CREATE VIEW V9 as SELECT distinct uv.namn from (uv join k on uv.kkod=k.kkod) WHERE knamn = ‘Affarssystem’ except SELECT distinct namn from (pb join b on pb.sysnr=b.sysnr) WHERE land = ‘Finland’;

CREATE VIEW v10 as SELECT p.namn, px.namn, p.rum, p.tel, px.tel from p, p px WHERE p.rum = px.rum and p.tel != px.tel; 						-->		 // EJ FÄRDIG - SKRIVER UT DUBBELT

CREATE VIEW v11 as SELECT p.tel from ((p join pb on p.namn = pb.namn) join b on b.sysnr = pb.sysnr) group by tel having count(land) =1;  	-->		//	EJ FÄRDIG - SKRIVER UT FYRA/FEM


CREATE VIEW v12 as SELECT distinct knamn from (k join uv on k.kkod = uv.kkod) WHERE uv.namn = ’Lennart’ and uv.kkod not in (SELECT kkod from uv WHERE namn = ‘Kjell’ or namn = ‘Marie’);

CREATE VIEW v13 as SELECT namn from sp WHERE sport = ‘Jogging’ and namn not in (SELECT namn from f WHERE ford = ‘Bil’) and namn in (SELECT namn from pb WHERE sysnr in (SELECT sysnr from b WHERE land=’Danmark’));


CREATE VIEW v15 as SELECT distinct uv.namn, k.knamn from ((uv join tf on uv.kkod = tf.kkod AND uv.termin = tf.termin) join k on k.kkod = tf.kkod) WHERE antal >= (SELECT max(antal) from tf);

CREATE VIEW v16 as SELECT beer from b natural join pb natural join uv natural join (SELECT * from tf WHERE antal = (SELECT min (antal) ant from tf WHERE antal > (SELECT min (antal) from tf)));

CREATE VIEW V17 as SELECT distinct rum from (p join uv on p.namn = uv.namn) WHERE p.namn not in(SELECT kansv from tf); 
