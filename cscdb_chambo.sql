PGDMP     2        	            |            cscdb_chambo_local    15.5    15.5    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    58709    cscdb_chambo_local    DATABASE     �   CREATE DATABASE cscdb_chambo_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Latin America.1252';
 "   DROP DATABASE cscdb_chambo_local;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       1247    58711    booleano    DOMAIN     *   CREATE DOMAIN public.booleano AS boolean;
    DROP DOMAIN public.booleano;
       public          postgres    false    5                       1247    58713 	   domstring    DOMAIN     2   CREATE DOMAIN public.domstring AS character(150);
    DROP DOMAIN public.domstring;
       public          postgres    false    5            <           1255    58714 p  add_datos1vivienda(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, character varying, character varying)    FUNCTION     X  CREATE FUNCTION public.add_datos1vivienda(picsctbfamiliaid integer, picond_vivi character varying, piobcond_vi character varying, pitipo_vi character varying, piobtipo_vi character varying, piviacce character varying, piobviacce character varying, pitecho character varying, piobtecho character varying, pipiso character varying, piobpiso character varying, piparedes character varying, piobparedes character varying, piprovi character varying, piobprovi character varying, pinumcuartos integer, pidormitorios integer, piproceagua character varying, piobproceagua character varying, picanalagua character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbvivienda(csctbfamiliaid, con_vivienda, det_condicion, tipo_vivienda, det_tipovi, via_acceso, det_acceso, techo, det_techo, piso, det_piso, paredes, det_paredes, propiedad, det_propiedad, num_cuartos, dormitorios, prov_agua, det_provagua, canalizacionagua)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20);

  band=true;
  return band;
  end; $_$;
 e  DROP FUNCTION public.add_datos1vivienda(picsctbfamiliaid integer, picond_vivi character varying, piobcond_vi character varying, pitipo_vi character varying, piobtipo_vi character varying, piviacce character varying, piobviacce character varying, pitecho character varying, piobtecho character varying, pipiso character varying, piobpiso character varying, piparedes character varying, piobparedes character varying, piprovi character varying, piobprovi character varying, pinumcuartos integer, pidormitorios integer, piproceagua character varying, piobproceagua character varying, picanalagua character varying);
       public          postgres    false    5            =           1255    58715 �   add_datos2vivienda(integer, character varying, character varying, character varying, character varying, character varying, boolean, character varying, character varying, boolean)    FUNCTION       CREATE FUNCTION public.add_datos2vivienda(picsctbfamiliaid integer, pitratamiento character varying, pitiposh character varying, piubish character varying, piducha character varying, pieli_basura character varying, piservicio_inte boolean, pialumbrado character varying, picocina character varying, piubicocina boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbvivienda
	SET tratamientoagua=$2, servicio_higienico=$3, ubicacionsh=$4, ducha=$5, basura=$6, servicio_internet=$7, alumbrado=$8, cocina=$9, anidentro=$10
	WHERE csctbfamiliaid =$1;

  band=true;
  return band;
  end; $_$;
 ?  DROP FUNCTION public.add_datos2vivienda(picsctbfamiliaid integer, pitratamiento character varying, pitiposh character varying, piubish character varying, piducha character varying, pieli_basura character varying, piservicio_inte boolean, pialumbrado character varying, picocina character varying, piubicocina boolean);
       public          postgres    false    5            >           1255    58716 �   add_datos3vivivienda(integer, integer, integer, double precision, double precision, double precision, character varying, character varying, integer, character varying, character varying, character varying, integer, character varying)    FUNCTION     !  CREATE FUNCTION public.add_datos3vivivienda(picsctbfamiliaid integer, pinumcelular integer, piconvencional integer, pilongitud double precision, pilatitud double precision, pialtitud double precision, picanton character varying, piparroquia character varying, pibarrioid integer, pisector character varying, picprincipal character varying, picsecundaria character varying, pinumcasa integer, pireferencia character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbvivienda
	SET num_celular=$2, num_telefono=$3, longitud1=$4, latitud1=$5, altitud1=$6, canton=$7, parroquia=$8, csctbbarriochamboid=$9, sector=$10, cprincipal=$11, csecundaria=$12, num_casa=$13, referenciadom=$14
	WHERE csctbfamiliaid =$1;

  band=true;
  return band;
  end; $_$;
 �  DROP FUNCTION public.add_datos3vivivienda(picsctbfamiliaid integer, pinumcelular integer, piconvencional integer, pilongitud double precision, pilatitud double precision, pialtitud double precision, picanton character varying, piparroquia character varying, pibarrioid integer, pisector character varying, picprincipal character varying, picsecundaria character varying, pinumcasa integer, pireferencia character varying);
       public          postgres    false    5            O           1255    58717 �   add_datos4vivienda(boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, integer, boolean, boolean, boolean, boolean, integer, boolean, character varying, boolean)    FUNCTION     �  CREATE FUNCTION public.add_datos4vivienda(piagresividad boolean, piinsalubridad boolean, picantidad boolean, piconvani boolean, pidomestico boolean, pigranja boolean, pisilvestre boolean, piperro boolean, pigato boolean, pipeque boolean, pimedia boolean, pigrande boolean, pinumgato integer, piriesg1 boolean, piriesg2 boolean, piriesg3 boolean, piriesg4 boolean, picsctbviviendaid integer, pivectores boolean, piprovectores character varying, pivulnerable boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbriesgoavivienda(ries_agresividad, ries_insalubridad, ries_cantidad, conv_animales, tipo_domestico, tipo_granja, tipo_silvestre, dome_perro, dome_gato, perro_peque, perro_medio, perro_grande,
		num_gatos, ries_vi1, ries_vi2, ries_vi3, ries_vi4, csctbviviendaid, vectores, provectores, vulnerable)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21);

  band=true;
  return band;
  end; $_$;
 �  DROP FUNCTION public.add_datos4vivienda(piagresividad boolean, piinsalubridad boolean, picantidad boolean, piconvani boolean, pidomestico boolean, pigranja boolean, pisilvestre boolean, piperro boolean, pigato boolean, pipeque boolean, pimedia boolean, pigrande boolean, pinumgato integer, piriesg1 boolean, piriesg2 boolean, piriesg3 boolean, piriesg4 boolean, picsctbviviendaid integer, pivectores boolean, piprovectores character varying, pivulnerable boolean);
       public          postgres    false    5            P           1255    58718 u   add_embarazada(integer, date, date, integer, integer, integer, integer, integer, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.add_embarazada(picsctbfamiliaid integer, pifemenstruacion date, pifeparto date, picontrolme20 integer, picontrolma20 integer, pisegestacion integer, pigestas integer, pipartos integer, piabortos integer, picesarias integer, piantecentes character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbembarazadas(csctbfamiliaid,fecha_menstruacion, fecha_parto, control_menos20, control_mas20, semanas_gestacion, gestas, partos, abortos, cesarias, ante_patologicos)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);
  
  band=true;
  return band;
  end; $_$;
   DROP FUNCTION public.add_embarazada(picsctbfamiliaid integer, pifemenstruacion date, pifeparto date, picontrolme20 integer, picontrolma20 integer, pisegestacion integer, pigestas integer, pipartos integer, piabortos integer, picesarias integer, piantecentes character varying);
       public          postgres    false    5            Q           1255    58719 �  add_evaluacionfam(integer, character varying, integer, character varying, integer, character varying, integer, character varying, integer, character varying, integer, character varying, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, date, boolean)    FUNCTION     	  CREATE FUNCTION public.add_evaluacionfam(pivacuinconum integer, pivacuincotxt character varying, pipermalnunum integer, pipopermalnutxt character varying, pipersoenfernum integer, pipersoenfertxt character varying, pipersoenfecatanum integer, pipersoenfecatxt character varying, piembariesgonum integer, piembariesgotxt character varying, pipersodiscanum integer, pipersodiscatxt character varying, pipersopromennum integer, pipersopromentxt character varying, piconsuagua character varying, pitxtconsuagua character varying, pielibasura character varying, pitxtelibasura character varying, pieliquidos character varying, pitxteliquidos character varying, piimpactoindus character varying, pitxtimpactoinsdu character varying, pianidomicilio character varying, pitxtanidomicilio character varying, pidesempleo character varying, pitxtdesempleo character varying, pianalfabetismo character varying, pitxtanalfabetismo character varying, pidesectruc character varying, pitxtdesectruc character varying, piviolencia character varying, pitxtviolencia character varying, pimalacondicion character varying, pitxtmalacondicion character varying, pihaciamiento character varying, pitxthaciamiento character varying, pivulne_obs character varying, picsctbfamiliaid integer, pifecha_registro date, piestado_evolucion boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbevaluacionfamilia(vacuincomnum, vacuincomtxt, persomalnunum, persomalnutxt, persoenfermenum, persoenfermetxt, persoenfecatnum, persoenfecatxt, embariesgonum, embariesgotxt, persondiscanum, persondiscatxt, personpromennum, personpromentxt, consuagua, txtconsuagua,
										  elibasura, txtelibasura, eleliquidos, txteleliquidos, impactoindu, txtimpactoindu, anidomiciolio, txtanidomicilio, desempleo, txtdesempleo, analfabetismo, txtanalfabetismo, desestructuracion, txtdesestructuracion, violencia, txtviolencia, malascondi, txtmalascondi,
										 haciamiento, txthaciamiento, vulne_obser, csctbfamiliaid, fecha_registro, estado_evolucion)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20,
	    $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $40);

  band=true;
  return band;
  end; $_$;
 #  DROP FUNCTION public.add_evaluacionfam(pivacuinconum integer, pivacuincotxt character varying, pipermalnunum integer, pipopermalnutxt character varying, pipersoenfernum integer, pipersoenfertxt character varying, pipersoenfecatanum integer, pipersoenfecatxt character varying, piembariesgonum integer, piembariesgotxt character varying, pipersodiscanum integer, pipersodiscatxt character varying, pipersopromennum integer, pipersopromentxt character varying, piconsuagua character varying, pitxtconsuagua character varying, pielibasura character varying, pitxtelibasura character varying, pieliquidos character varying, pitxteliquidos character varying, piimpactoindus character varying, pitxtimpactoinsdu character varying, pianidomicilio character varying, pitxtanidomicilio character varying, pidesempleo character varying, pitxtdesempleo character varying, pianalfabetismo character varying, pitxtanalfabetismo character varying, pidesectruc character varying, pitxtdesectruc character varying, piviolencia character varying, pitxtviolencia character varying, pimalacondicion character varying, pitxtmalacondicion character varying, pihaciamiento character varying, pitxthaciamiento character varying, pivulne_obs character varying, picsctbfamiliaid integer, pifecha_registro date, piestado_evolucion boolean);
       public          postgres    false    5            R           1255    58720 V   add_evolucionfamilia(character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.add_evolucionfamilia(piriesgo character varying, picomprofamilia character varying, picompromisosalud character varying, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbevolucionfamilia(riesgo, comprofamilia, comprosalud, csctbfamiliaid)
VALUES ($1, $2, $3, $4);

  band=true;
  return band;
  end; $_$;
 �   DROP FUNCTION public.add_evolucionfamilia(piriesgo character varying, picomprofamilia character varying, picompromisosalud character varying, picsctbfamiliaid integer);
       public          postgres    false    5            S           1255    58721 z   add_mortalidad(integer, character varying, character varying, integer, date, integer, integer, integer, character varying)    FUNCTION     E  CREATE FUNCTION public.add_mortalidad(picsctbfamiliaid integer, piapellidos character varying, pinombres character varying, piparentesco integer, pifechamortalidad date, pianio integer, pimeses integer, pidia integer, picausanodefi character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbmortalidad(csctbjefefamid, apellidos_mortalidad, nombres_mortalidad, csctbparentescoid, fecha_fallecimiento, anios, meses, dias, causa_nodefi)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);

  band=true;
  return band;
  end; $_$;
 �   DROP FUNCTION public.add_mortalidad(picsctbfamiliaid integer, piapellidos character varying, pinombres character varying, piparentesco integer, pifechamortalidad date, pianio integer, pimeses integer, pidia integer, picausanodefi character varying);
       public          postgres    false    5            T           1255    58722 ?   add_profesionalres(integer, date, time with time zone, integer)    FUNCTION     �  CREATE FUNCTION public.add_profesionalres(picsctbpersonalid integer, pifecha_visita date, pihora_visita time with time zone, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbprofesionalresponsable(csctbpersonalid, fecha_visita, hora_visita, csctbfamiliaid)
VALUES ($1, $2, $3, $4);


  band=true;
  return band;
  end; $_$;
 �   DROP FUNCTION public.add_profesionalres(picsctbpersonalid integer, pifecha_visita date, pihora_visita time with time zone, picsctbfamiliaid integer);
       public          postgres    false    5            U           1255    58723 !   addenfermedades(integer, integer)    FUNCTION     c  CREATE FUNCTION public.addenfermedades(picsctbenfermedadid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbenferfam(
	csctbenfermedadid , csctbfamiliaid, fecha_add_enfer, estado_enfermedad)
VALUES ($1, $2, current_timestamp, true);

band=true;
	return band;
end;
$_$;
 ]   DROP FUNCTION public.addenfermedades(picsctbenfermedadid integer, picsctbfamiliaid integer);
       public          postgres    false    5            ;           1255    58724 +   addenfermedadesmortalidad(integer, integer)    FUNCTION     2  CREATE FUNCTION public.addenfermedadesmortalidad(pimortalidadid integer, pienfermedadid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbmortenfermedad(
	csctbmortalidadid , csctbenfermedadid)
VALUES ($1, $2);

band=true;
	return band;
end;
$_$;
 `   DROP FUNCTION public.addenfermedadesmortalidad(pimortalidadid integer, pienfermedadid integer);
       public          postgres    false    5            V           1255    58725 �   addfamilia(integer, integer, integer, character varying, character varying, character varying, date, integer, integer, integer, character varying, boolean, character varying, boolean, integer, character varying, integer, integer, integer)    FUNCTION     %  CREATE FUNCTION public.addfamilia(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam1 character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer, piestado_civil character varying, picsctbetniaid integer, picsctbnacionalidadid integer, picsctbpueblosid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbfamilia(
	csctbocupacionid, csctbinstruccionid, csctbparentescoid, cedula_fam, nom_fam, ape_fam, fecha_na_fam, anios, meses, dias, 
    genero, control_bucal, observacion, estado_fam, fecreacion_fam, id_jefe_hogar, estado_civil, csctbetniaid, csctbnacionalidadid, csctbpueblosid)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, current_timestamp, $15, $16, $17, $18, $19);

band=true;
	return band;
end;
$_$;
   DROP FUNCTION public.addfamilia(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam1 character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer, piestado_civil character varying, picsctbetniaid integer, picsctbnacionalidadid integer, picsctbpueblosid integer);
       public          postgres    false    5            W           1255    58726 �   addfamiliaid(integer, integer, integer, character varying, character varying, character varying, date, integer, smallint, smallint, character varying, boolean, character varying, boolean, integer)    FUNCTION     ~  CREATE FUNCTION public.addfamiliaid(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses smallint, pidias smallint, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
    last_id integer;
BEGIN
    INSERT INTO public.csctbfamilia(
        csctbocupacionid, csctbinstruccionid, csctbparentescoid, cedula_fam, nom_fam, ape_fam, fecha_na_fam, anios, meses, dias, 
        genero, control_bucal, observacion, estado_fam, id_jefe_hogar)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)
    
	RETURNING csctbfamiliaid INTO last_id;

    RETURN last_id;
END;
$_$;
 �  DROP FUNCTION public.addfamiliaid(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses smallint, pidias smallint, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer);
       public          postgres    false    5            X           1255    58727     addprioritario(integer, integer)    FUNCTION     |  CREATE FUNCTION public.addprioritario(picsctbprioritariofamiliaid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbprioritariofamilia(
	csctbprioritarioid , csctbfamiliaid, fecha_add_prioritario, estado_prioritario)
VALUES ($1, $2, CURRENT_TIMESTAMP, true);

band=true;
	return band;
end;
$_$;
 d   DROP FUNCTION public.addprioritario(picsctbprioritariofamiliaid integer, picsctbfamiliaid integer);
       public          postgres    false    5            Y           1255    58728    addrambiental(integer, integer)    FUNCTION     /  CREATE FUNCTION public.addrambiental(picsctbrambientalid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbrambientalfamilia(
	csctbrambientalesid , csctbfamiliaid)
VALUES ($1, $2);

band=true;
	return band;
end;
$_$;
 [   DROP FUNCTION public.addrambiental(picsctbrambientalid integer, picsctbfamiliaid integer);
       public          postgres    false    5            Z           1255    58729 $   addriesgobiologico(integer, integer)    FUNCTION     0  CREATE FUNCTION public.addriesgobiologico(picsctbriesgobioloid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbrbiolofamilia(
	csctbriesgobioloid , csctbfamiliaid)
VALUES ($1, $2);

band=true;
	return band;
end;
$_$;
 a   DROP FUNCTION public.addriesgobiologico(picsctbriesgobioloid integer, picsctbfamiliaid integer);
       public          postgres    false    5            [           1255    58730 $   addriesgobstetrico(integer, integer)    FUNCTION     V  CREATE FUNCTION public.addriesgobstetrico(picsctbriesgobsteid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbriesgoembarazada(
	csctbriesgobsteid , csctbfamiliaid, fecha_embarazada)
VALUES ($1, $2, CURRENT_TIMESTAMP);

band=true;
	return band;
end;
$_$;
 `   DROP FUNCTION public.addriesgobstetrico(picsctbriesgobsteid integer, picsctbfamiliaid integer);
       public          postgres    false    5            \           1255    58731 %   addriesgoevaluacion(integer, integer)    FUNCTION     h  CREATE FUNCTION public.addriesgoevaluacion(picsctbevaluacionid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbevaluariesgo(
	csctbevaluacionid , csctbfamiliaid, fecha_evaluacion, estado_riesgo)
VALUES ($1, $2, CURRENT_TIMESTAMP, true);

band=true;
	return band;
end;
$_$;
 a   DROP FUNCTION public.addriesgoevaluacion(picsctbevaluacionid integer, picsctbfamiliaid integer);
       public          postgres    false    5            ]           1255    58732 Y   addrioesgosfam(integer, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.addrioesgosfam(picsctbfamiliaid integer, piriesgos character varying, pigra_dispen character varying, pigru_dispen character varying, piporcentajedis integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

INSERT INTO public.csctbriesgos(
	csctbfamiliaid, riesgos, gra_discapacidad, gru_dispensa, porce_discapacidad)
VALUES ($1, $2, $3, $4, $5);

band=true;
	return band;
  end; $_$;
 �   DROP FUNCTION public.addrioesgosfam(picsctbfamiliaid integer, piriesgos character varying, pigra_dispen character varying, pigru_dispen character varying, piporcentajedis integer);
       public          postgres    false    5            ^           1255    58733 $   addrsocioeconomico(integer, integer)    FUNCTION     -  CREATE FUNCTION public.addrsocioeconomico(picsctbrsociofamiliaid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbrsociofamilia(
	csctbrsocioid , csctbfamiliaid)
VALUES ($1, $2);

band=true;
	return band;
end;
$_$;
 c   DROP FUNCTION public.addrsocioeconomico(picsctbrsociofamiliaid integer, picsctbfamiliaid integer);
       public          postgres    false    5            _           1255    58734    addvacunas(integer, integer)    FUNCTION     W  CREATE FUNCTION public.addvacunas(pcsctbvacunasid integer, pcsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbvacunafamilia(
	csctbvacunasid, csctbfamiliaid, fecha_cre_vacuna, estado_vacuna)
VALUES ($1, $2, current_timestamp, true);

band=true;
	return band;
end;
$_$;
 S   DROP FUNCTION public.addvacunas(pcsctbvacunasid integer, pcsctbfamiliaid integer);
       public          postgres    false    5            `           1255    58735    addvulnerable(integer, integer)    FUNCTION     4  CREATE FUNCTION public.addvulnerable(picsctbvulnerablefamiliaid integer, picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbvulnerablefamilia(
	csctbvulnerableid , csctbfamiliaid)
VALUES ($1, $2);

band=true;
	return band;
end;
$_$;
 b   DROP FUNCTION public.addvulnerable(picsctbvulnerablefamiliaid integer, picsctbfamiliaid integer);
       public          postgres    false    5            a           1255    58736 !   buscar_evoluacionfamilia(integer)    FUNCTION     Q  CREATE FUNCTION public.buscar_evoluacionfamilia(picsctbfamiliaid integer, OUT pvacunasincompletas integer, OUT ppersonasmal integer, OUT personasenferme integer, OUT personasenfercatas integer, OUT pembaradasconriesgo integer, OUT ppersonasdisca integer, OUT ppersonaspromental integer, OUT pconsumo_agua character varying, OUT pelibasura character varying, OUT peliliquidos character varying, OUT pimpacto_industrial character varying, OUT panimalesdentro character varying, OUT pdesempleo character varying, OUT panalfabetismo character varying, OUT pdesestructuracion character varying, OUT pviolencia character varying, OUT pmalascondiciones character varying, OUT phaciamiento character varying, OUT pvulnerable character varying, OUT pfecha_registro date) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbevaluacionfamilia.vacuincomnum, 
  csctbevaluacionfamilia.persomalnunum, 
  csctbevaluacionfamilia.persoenfermenum, 
  csctbevaluacionfamilia.persoenfecatnum, 
  csctbevaluacionfamilia.embariesgonum, 
  csctbevaluacionfamilia.persondiscanum, 
  csctbevaluacionfamilia.personpromennum, 
  csctbevaluacionfamilia.consuagua, 
  csctbevaluacionfamilia.elibasura, 
  csctbevaluacionfamilia.eleliquidos, 
  csctbevaluacionfamilia.impactoindu, 
  csctbevaluacionfamilia.anidomiciolio, 
  csctbevaluacionfamilia.desempleo, 
  csctbevaluacionfamilia.analfabetismo, 
  csctbevaluacionfamilia.desestructuracion, 
  csctbevaluacionfamilia.violencia, 
  csctbevaluacionfamilia.malascondi, 
  csctbevaluacionfamilia.haciamiento, 
  csctbevaluacionfamilia.vulne_obser, 
  csctbevaluacionfamilia.fecha_registro
FROM 
  public.csctbevaluacionfamilia, 
  public.csctbfamilia
WHERE 
  csctbfamilia.csctbfamiliaid = csctbevaluacionfamilia.csctbfamiliaid and 
  csctbfamilia.csctbfamiliaid = $1
  ORDER BY fecha_registro DESC LIMIT 1;

end;$_$;
 �  DROP FUNCTION public.buscar_evoluacionfamilia(picsctbfamiliaid integer, OUT pvacunasincompletas integer, OUT ppersonasmal integer, OUT personasenferme integer, OUT personasenfercatas integer, OUT pembaradasconriesgo integer, OUT ppersonasdisca integer, OUT ppersonaspromental integer, OUT pconsumo_agua character varying, OUT pelibasura character varying, OUT peliliquidos character varying, OUT pimpacto_industrial character varying, OUT panimalesdentro character varying, OUT pdesempleo character varying, OUT panalfabetismo character varying, OUT pdesestructuracion character varying, OUT pviolencia character varying, OUT pmalascondiciones character varying, OUT phaciamiento character varying, OUT pvulnerable character varying, OUT pfecha_registro date);
       public          postgres    false    5            ?           1255    58737 %   buscar_fichacedula(character varying)    FUNCTION     4  CREATE FUNCTION public.buscar_fichacedula(picedula_fam character varying, OUT pnum_ficha integer, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT panios integer, OUT pparentesco character varying, OUT pid_jefe integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  
  csctbficha.num_ficha, 
  csctbfamilia.nom_fam, 
  csctbfamilia.ape_fam, 
  csctbfamilia.genero, 
  csctbfamilia.anios, 
  csctbparentesco.nom_parentesco, 
  csctbfamilia.id_jefe_hogar
FROM 
  public.csctbficha,
  public.csctbfamilia, 
  public.csctbparentesco
WHERE 
  csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
  csctbficha.csctbfamiliaid = csctbfamilia.id_jefe_hogar AND 
  csctbfamilia.cedula_fam = $1
order by ape_fam asc;

end;$_$;
   DROP FUNCTION public.buscar_fichacedula(picedula_fam character varying, OUT pnum_ficha integer, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT panios integer, OUT pparentesco character varying, OUT pid_jefe integer);
       public          postgres    false    5            @           1255    58738 &   buscar_fichanombres(character varying)    FUNCTION     <  CREATE FUNCTION public.buscar_fichanombres(piapellido character varying, OUT pnum_ficha integer, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT panios integer, OUT pparentesco character varying, OUT pid_jefe integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbficha.num_ficha, 
  csctbfamilia.nom_fam, 
  csctbfamilia.ape_fam, 
  csctbfamilia.genero, 
  csctbfamilia.anios, 
  csctbparentesco.nom_parentesco, 
  csctbfamilia.id_jefe_hogar
FROM 
  public.csctbficha,
  public.csctbfamilia, 
  public.csctbparentesco
WHERE 
  csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
  csctbficha.csctbfamiliaid = csctbfamilia.id_jefe_hogar AND 
  csctbfamilia.ape_fam like '%'|| $1 ||'%'
order by ape_fam asc;

end;$_$;
   DROP FUNCTION public.buscar_fichanombres(piapellido character varying, OUT pnum_ficha integer, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT panios integer, OUT pparentesco character varying, OUT pid_jefe integer);
       public          postgres    false    5            b           1255    58739    buscar_fichanum(integer)    FUNCTION       CREATE FUNCTION public.buscar_fichanum(pinumficha integer, OUT pnum_ficha integer, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT panios integer, OUT pparentesco character varying, OUT pid_jefe integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbficha.num_ficha, 
  csctbfamilia.nom_fam, 
  csctbfamilia.ape_fam, 
  csctbfamilia.genero, 
  csctbfamilia.anios, 
  csctbparentesco.nom_parentesco, 
  csctbfamilia.id_jefe_hogar
FROM 
  public.csctbficha,
  public.csctbfamilia, 
  public.csctbparentesco
WHERE 
  csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
  csctbficha.csctbfamiliaid = csctbfamilia.id_jefe_hogar AND 
  csctbficha.num_ficha = $1
order by ape_fam asc;

end;$_$;
 �   DROP FUNCTION public.buscar_fichanum(pinumficha integer, OUT pnum_ficha integer, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT panios integer, OUT pparentesco character varying, OUT pid_jefe integer);
       public          postgres    false    5            c           1255    58740    buscar_individuo(integer)    FUNCTION     �  CREATE FUNCTION public.buscar_individuo(picod_fam integer, OUT pcedula_fam character varying, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT pparentesco character varying, OUT pocupacion character varying, OUT pinstruccion character varying, OUT pcontrol_bucal boolean, OUT pobservacionfam character varying, OUT pfechana_fam date, OUT panios integer, OUT pmeses integer, OUT pdisas integer, OUT pidpersona integer, OUT pestadocivil character varying, OUT petnia character varying, OUT pnacionalidad character varying, OUT ppueblos character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbfamilia.cedula_fam, 
  csctbfamilia.nom_fam, 
  csctbfamilia.ape_fam, 
  csctbfamilia.genero, 
  csctbparentesco.nom_parentesco, 
  csctbocupacion.nom_ocupacion, 
  csctbinstruccion.nom_instruccion, 
  csctbfamilia.control_bucal, 
  csctbfamilia.observacion, 
  csctbfamilia.fecha_na_fam, 
  csctbfamilia.anios, 
  csctbfamilia.meses, 
  csctbfamilia.dias, 
  csctbfamilia.csctbfamiliaid, 
  csctbfamilia.estado_civil, 
  csctbetnia.nom_etnia, 
  csctbnacionalidadetnica.nom_nacionalidadetnica, 
  csctbpueblos.nom_pueblos
FROM 
  public.csctbfamilia
  LEFT JOIN public.csctbparentesco ON csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid
  LEFT JOIN public.csctbocupacion ON csctbocupacion.csctbocupacionid = csctbfamilia.csctbocupacionid
  LEFT JOIN public.csctbinstruccion ON csctbinstruccion.csctbinstruccionid = csctbfamilia.csctbinstruccionid
  LEFT JOIN public.csctbetnia ON csctbetnia.csctbetniaid = csctbfamilia.csctbetniaid
  LEFT JOIN public.csctbnacionalidadetnica ON csctbnacionalidadetnica.csctbnacionalidadetnicaid = csctbfamilia.csctbnacionalidadid
  LEFT JOIN public.csctbpueblos ON csctbpueblos.csctbpueblosid = csctbfamilia.csctbpueblosid 
WHERE 
  csctbfamilia.csctbfamiliaid = $1
order by csctbfamiliaid asc;

end;$_$;
 Z  DROP FUNCTION public.buscar_individuo(picod_fam integer, OUT pcedula_fam character varying, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT pparentesco character varying, OUT pocupacion character varying, OUT pinstruccion character varying, OUT pcontrol_bucal boolean, OUT pobservacionfam character varying, OUT pfechana_fam date, OUT panios integer, OUT pmeses integer, OUT pdisas integer, OUT pidpersona integer, OUT pestadocivil character varying, OUT petnia character varying, OUT pnacionalidad character varying, OUT ppueblos character varying);
       public          postgres    false    5            d           1255    58741    buscar_integrantesfam(integer)    FUNCTION     �  CREATE FUNCTION public.buscar_integrantesfam(piid_jefe_hogar integer, OUT pcsctbfamiliaid integer, OUT pcedula_fam character varying, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT pparentesco character varying, OUT pocupacion character varying, OUT pinstruccion character varying, OUT pcontrol_bucal boolean, OUT pobservacionfam character varying, OUT pfechana_fam date) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbfamilia.csctbfamiliaid, 
  csctbfamilia.cedula_fam, 
  csctbfamilia.nom_fam, 
  csctbfamilia.ape_fam, 
  csctbfamilia.genero, 
  csctbparentesco.nom_parentesco, 
  csctbocupacion.nom_ocupacion, 
  csctbinstruccion.nom_instruccion, 
  csctbfamilia.control_bucal, 
  csctbfamilia.observacion, 
  csctbfamilia.fecha_na_fam
FROM 
  public.csctbfamilia, 
  public.csctbparentesco, 
  public.csctbocupacion, 
  public.csctbinstruccion
WHERE 
  csctbfamilia.csctbinstruccionid = csctbinstruccion.csctbinstruccionid AND
  csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
  csctbocupacion.csctbocupacionid = csctbfamilia.csctbocupacionid AND
  csctbfamilia.id_jefe_hogar = $1
order by csctbfamiliaid asc;

end;$_$;
 �  DROP FUNCTION public.buscar_integrantesfam(piid_jefe_hogar integer, OUT pcsctbfamiliaid integer, OUT pcedula_fam character varying, OUT pnom_fam character varying, OUT pape_fam character varying, OUT pgenero character varying, OUT pparentesco character varying, OUT pocupacion character varying, OUT pinstruccion character varying, OUT pcontrol_bucal boolean, OUT pobservacionfam character varying, OUT pfechana_fam date);
       public          postgres    false    5            e           1255    58742     buscar_inteidmortalidad(integer)    FUNCTION     C  CREATE FUNCTION public.buscar_inteidmortalidad(picsctbmortalidadid integer, OUT papellidos character varying, OUT pnombres character varying, OUT pnom_parentesco character varying, OUT pfecha_fallecimiento date, OUT panios integer, OUT pmeses integer, OUT pdias integer, OUT pcausa_nodefi character varying, OUT pnom_enfermedad character varying, OUT pcod_enfermedad character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbmortalidad.apellidos_mortalidad, 
  csctbmortalidad.nombres_mortalidad, 
  csctbparentesco.nom_parentesco, 
  csctbmortalidad.fecha_fallecimiento, 
  csctbmortalidad.anios, 
  csctbmortalidad.meses, 
  csctbmortalidad.dias, 
  csctbmortalidad.causa_nodefi, 
  csctbenfermedad.nom_enfermedad, 
  csctbenfermedad.cog_enfermedad
FROM 
  public.csctbmortalidad, 
  public.csctbparentesco, 
  public.csctbfamilia, 
  public.csctbmortenfermedad, 
  public.csctbenfermedad
WHERE 
  csctbmortalidad.csctbjefefamid = csctbfamilia.csctbfamiliaid AND
  csctbparentesco.csctbparentescoid = csctbmortalidad.csctbparentescoid AND
  csctbmortenfermedad.csctbmortalidadid = csctbmortalidad.csctbmortalidadid AND
  csctbenfermedad.csctbenfermedadid = csctbmortenfermedad.csctbenfermedadid and 
  csctbmortalidad.csctbmortalidadid = $1 and csctbmortalidad.estado_mortalidad = true;

end;$_$;
 �  DROP FUNCTION public.buscar_inteidmortalidad(picsctbmortalidadid integer, OUT papellidos character varying, OUT pnombres character varying, OUT pnom_parentesco character varying, OUT pfecha_fallecimiento date, OUT panios integer, OUT pmeses integer, OUT pdias integer, OUT pcausa_nodefi character varying, OUT pnom_enfermedad character varying, OUT pcod_enfermedad character varying);
       public          postgres    false    5            f           1255    58743    buscar_intemortalidad(integer)    FUNCTION     �  CREATE FUNCTION public.buscar_intemortalidad(piid_jefe_hogar integer, OUT papellidos character varying, OUT pnombres character varying, OUT pnom_parentesco character varying, OUT pfecha_fallecimiento date, OUT panios integer, OUT pmeses integer, OUT pdias integer, OUT pcausa_nodefi character varying, OUT pnom_enfermedad character varying, OUT pcod_enfermedad character varying, OUT pcsctbmortalidadid integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbmortalidad.apellidos_mortalidad, 
  csctbmortalidad.nombres_mortalidad, 
  csctbparentesco.nom_parentesco, 
  csctbmortalidad.fecha_fallecimiento, 
  csctbmortalidad.anios, 
  csctbmortalidad.meses, 
  csctbmortalidad.dias, 
  csctbmortalidad.causa_nodefi, 
  csctbenfermedad.nom_enfermedad, 
  csctbenfermedad.cog_enfermedad, 
  csctbmortalidad.csctbmortalidadid
FROM 
  public.csctbmortalidad, 
  public.csctbparentesco, 
  public.csctbfamilia, 
  public.csctbmortenfermedad, 
  public.csctbenfermedad
WHERE 
  csctbmortalidad.csctbjefefamid = csctbfamilia.csctbfamiliaid AND
  csctbparentesco.csctbparentescoid = csctbmortalidad.csctbparentescoid AND
  csctbmortenfermedad.csctbmortalidadid = csctbmortalidad.csctbmortalidadid AND
  csctbenfermedad.csctbenfermedadid = csctbmortenfermedad.csctbenfermedadid and 
  csctbfamilia.csctbfamiliaid = $1 and csctbmortalidad.estado_mortalidad = true
order by csctbmortalidadid asc;

end;$_$;
 �  DROP FUNCTION public.buscar_intemortalidad(piid_jefe_hogar integer, OUT papellidos character varying, OUT pnombres character varying, OUT pnom_parentesco character varying, OUT pfecha_fallecimiento date, OUT panios integer, OUT pmeses integer, OUT pdias integer, OUT pcausa_nodefi character varying, OUT pnom_enfermedad character varying, OUT pcod_enfermedad character varying, OUT pcsctbmortalidadid integer);
       public          postgres    false    5            g           1255    58744 "   buscar_opriesgobiologicos(integer)    FUNCTION     �  CREATE FUNCTION public.buscar_opriesgobiologicos(piedadesid integer, OUT pcsctbriesgobioloid integer, OUT pnomrbiolo character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbriesgobiolo.csctbriesgobioloid, 
  csctbriesgobiolo.nom_rbiolo
FROM 
  public.csctbedades, 
  public.csctbriesgobiolo
WHERE 
  csctbedades.csctbedadesid = csctbriesgobiolo.csctbedadesid and
  csctbriesgobiolo.csctbedadesid = $1;

end;$_$;
 �   DROP FUNCTION public.buscar_opriesgobiologicos(piedadesid integer, OUT pcsctbriesgobioloid integer, OUT pnomrbiolo character varying);
       public          postgres    false    5            h           1255    58745 !   buscar_opriesgosocioesco(integer)    FUNCTION     �  CREATE FUNCTION public.buscar_opriesgosocioesco(piedadesid integer, OUT pcsctbriesgosocioid integer, OUT pnomrsocio character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbriesgosocio.csctbrsocioid, 
  csctbriesgosocio.nom_rsocio
FROM 
  public.csctbedades, 
  public.csctbriesgosocio
WHERE 
  csctbedades.csctbedadesid = csctbriesgosocio.csctbedadesid and
  csctbriesgosocio.csctbedadesid = $1;


end;$_$;
 �   DROP FUNCTION public.buscar_opriesgosocioesco(piedadesid integer, OUT pcsctbriesgosocioid integer, OUT pnomrsocio character varying);
       public          postgres    false    5            i           1255    58746    buscar_personal()    FUNCTION     i  CREATE FUNCTION public.buscar_personal(OUT pcsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT ptelefono character varying, OUT pemail character varying, OUT pdireccion character varying, OUT peais_medico character varying, OUT pfecha_nacimiento date, OUT pfecha_ingreso date, OUT pfecha_salida date, OUT pobserp character varying, OUT pestadop boolean, OUT pprofesion character varying, OUT prealizaitinerancia boolean, OUT pareatrabajo character varying, OUT pmodalidad character varying, OUT phorastrabajo integer, OUT ptipocontrato character varying, OUT ppass character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbpersonalid, cedula, nombresp, apellido_pat, apellido_mat, telefeno, email, direccion, eais_medico,
  fecha_nacimiento, fecha_ingreso, fecha_salida, obserp, estadop, profesion, realizaitinerancia, areatrabajo, 
  modalidad, horastrabajo, tipocontrato, pass

FROM public.csctbpersonal


WHERE 
   estadop = true
order by apellido_pat asc;

end;$$;
 �  DROP FUNCTION public.buscar_personal(OUT pcsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT ptelefono character varying, OUT pemail character varying, OUT pdireccion character varying, OUT peais_medico character varying, OUT pfecha_nacimiento date, OUT pfecha_ingreso date, OUT pfecha_salida date, OUT pobserp character varying, OUT pestadop boolean, OUT pprofesion character varying, OUT prealizaitinerancia boolean, OUT pareatrabajo character varying, OUT pmodalidad character varying, OUT phorastrabajo integer, OUT ptipocontrato character varying, OUT ppass character varying);
       public          postgres    false    5            j           1255    58747    buscar_personal1()    FUNCTION     �  CREATE FUNCTION public.buscar_personal1(OUT pcsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT prutasrol character varying, OUT pestado_rol boolean) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT 
  csctbpersonal.csctbpersonalid,
  csctbpersonal.cedula, 
  csctbpersonal.nombresp, 
  csctbpersonal.apellido_pat, 
  csctbpersonal.apellido_mat, 
  csctbroles.nom_rol, 
  csctbroles.estado_rol
FROM 
  public.csctbpersonal, 
  public.csctbroles

WHERE 
   estadop = true and
   csctbpersonal.rolusu = csctbroles.csctbrolesid and csctbroles.estado_rol = false
order by apellido_pat asc;

end;$$;
 	  DROP FUNCTION public.buscar_personal1(OUT pcsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT prutasrol character varying, OUT pestado_rol boolean);
       public          postgres    false    5            k           1255    58748    buscar_personalid(integer)    FUNCTION     "  CREATE FUNCTION public.buscar_personalid(picsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT ptelefono character varying, OUT pemail character varying, OUT pdireccion character varying, OUT peais_medico character varying, OUT pfecha_nacimiento date, OUT pfecha_ingreso date, OUT pfecha_salida date, OUT pobserp character varying, OUT pestadop boolean, OUT pprofesion character varying, OUT prealizaitinerancia boolean, OUT pareatrabajo character varying, OUT pmodalidad character varying, OUT phorastrabajo integer, OUT ptipocontrato character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query

SELECT cedula, nombresp, apellido_pat, apellido_mat, telefeno, email, direccion, eais_medico,
  fecha_nacimiento, fecha_ingreso, fecha_salida, obserp, estadop, profesion, realizaitinerancia, areatrabajo, 
  modalidad, horastrabajo, tipocontrato

FROM public.csctbpersonal


WHERE 
   csctbpersonalid =$1;

end;$_$;
 �  DROP FUNCTION public.buscar_personalid(picsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT ptelefono character varying, OUT pemail character varying, OUT pdireccion character varying, OUT peais_medico character varying, OUT pfecha_nacimiento date, OUT pfecha_ingreso date, OUT pfecha_salida date, OUT pobserp character varying, OUT pestadop boolean, OUT pprofesion character varying, OUT prealizaitinerancia boolean, OUT pareatrabajo character varying, OUT pmodalidad character varying, OUT phorastrabajo integer, OUT ptipocontrato character varying);
       public          postgres    false    5            l           1255    58749    buscar_prioritarioid(integer)    FUNCTION     �  CREATE FUNCTION public.buscar_prioritarioid(piid_persona integer, OUT pcsctnprioritariofamiliaid integer, OUT pnom_prioritario character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbprioritariofamilia.csctbprioritariofamiliaid, 
  csctbprioritario.nom_prioritario
FROM 
  public.csctbprioritario, 
  public.csctbfamilia, 
  public.csctbprioritariofamilia
WHERE 
  csctbprioritario.csctbprioritarioid = csctbprioritariofamilia.csctbprioritarioid AND
  csctbprioritariofamilia.csctbfamiliaid = csctbfamilia.csctbfamiliaid and 
  csctbfamilia.csctbfamiliaid = $1 and csctbprioritariofamilia.estado_prioritario = true;

end;$_$;
 �   DROP FUNCTION public.buscar_prioritarioid(piid_persona integer, OUT pcsctnprioritariofamiliaid integer, OUT pnom_prioritario character varying);
       public          postgres    false    5            m           1255    58750 (   buscar_profesionalres(character varying)    FUNCTION     S  CREATE FUNCTION public.buscar_profesionalres(piapellidopat character varying, OUT pcsctbpersonalid integer, OUT pnom_pro character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT pcedula_pro character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbpersonal.csctbpersonalid, 
  csctbpersonal.nombresp, 
  csctbpersonal.apellido_pat, 
  csctbpersonal.apellido_mat, 
  csctbpersonal.cedula
FROM 
  public.csctbpersonal

where csctbpersonal.apellido_pat like '%'|| $1 ||'%'
order by apellido_pat asc;

end;$_$;
 �   DROP FUNCTION public.buscar_profesionalres(piapellidopat character varying, OUT pcsctbpersonalid integer, OUT pnom_pro character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT pcedula_pro character varying);
       public          postgres    false    5            n           1255    58751     buscar_profesionalrespo(integer)    FUNCTION     d  CREATE FUNCTION public.buscar_profesionalrespo(picsctbfamiliaid integer, OUT papellidos character varying, OUT pnombres character varying, OUT pcedula character varying, OUT pfecha_visita date, OUT phora_visita time with time zone, OUT pprofesionalid integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbpersonal.apellido_pat, 
  csctbpersonal.nombresp, 
  csctbpersonal.cedula, 
  csctbprofesionalresponsable.fecha_visita, 
  csctbprofesionalresponsable.hora_visita, 
  csctbprofesionalresponsable.csctbprofesionalid
FROM 
  public.csctbprofesionalresponsable, 
  public.csctbpersonal, 
  public.csctbfamilia
WHERE 
  csctbprofesionalresponsable.csctbfamiliaid = csctbfamilia.csctbfamiliaid AND
  csctbpersonal.csctbpersonalid = csctbprofesionalresponsable.csctbpersonalid and 
  csctbfamilia.csctbfamiliaid = $1;

end;$_$;
   DROP FUNCTION public.buscar_profesionalrespo(picsctbfamiliaid integer, OUT papellidos character varying, OUT pnombres character varying, OUT pcedula character varying, OUT pfecha_visita date, OUT phora_visita time with time zone, OUT pprofesionalid integer);
       public          postgres    false    5            o           1255    58752    buscar_rambientalfamid(integer)    FUNCTION     z  CREATE FUNCTION public.buscar_rambientalfamid(picsctbfamiliaid integer, OUT pcsctbrambientalfamiliaid integer, OUT pnomrambiental character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbrambientalfamilia.csctbrambientalfamiliaid, 
  csctbrambientales.nom_rambiental
FROM 
  public.csctbfamilia, 
  public.csctbrambientalfamilia, 
  public.csctbrambientales
WHERE 
  csctbfamilia.csctbfamiliaid = csctbrambientalfamilia.csctbfamiliaid AND
  csctbrambientales.csctbrambientalesid = csctbrambientalfamilia.csctbrambientalesid and 
  csctbrambientalfamilia.csctbfamiliaid = $1;

end;$_$;
 �   DROP FUNCTION public.buscar_rambientalfamid(picsctbfamiliaid integer, OUT pcsctbrambientalfamiliaid integer, OUT pnomrambiental character varying);
       public          postgres    false    5            p           1255    58753    buscar_rbioloid(integer)    FUNCTION     K  CREATE FUNCTION public.buscar_rbioloid(picsctbfamiliaid integer, OUT pcsctbrbiolofamiliaid integer, OUT pnomrbiolo character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbrbiolofamilia.csctbrbiolofamiliaid, 
  csctbriesgobiolo.nom_rbiolo
FROM 
  public.csctbrbiolofamilia, 
  public.csctbfamilia, 
  public.csctbriesgobiolo
WHERE 
  csctbfamilia.csctbfamiliaid = csctbrbiolofamilia.csctbfamiliaid AND
  csctbriesgobiolo.csctbriesgobioloid = csctbrbiolofamilia.csctbriesgobioloid and 
  csctbrbiolofamilia.csctbfamiliaid = $1;


end;$_$;
 �   DROP FUNCTION public.buscar_rbioloid(picsctbfamiliaid integer, OUT pcsctbrbiolofamiliaid integer, OUT pnomrbiolo character varying);
       public          postgres    false    5            q           1255    58754    buscar_robstetricoid(integer)    FUNCTION     �  CREATE FUNCTION public.buscar_robstetricoid(picsctbfamiliaid integer, OUT pcsctbriesgoembarazadaid integer, OUT ptiporiesgo character varying, OUT pnom_riesgobste character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  re.csctbriesembarazadaid, 
  tr.tipo_riesgoem, 
  ro.nom_rieobste
FROM 
  public.csctbriesgoembarazada re
JOIN 
  public.csctbriesgobste ro ON re.csctbriesgobsteid = ro.csctbriesgobsteid
JOIN 
  public.csctbtiporiesgo tr ON ro.csctbtiporiesgoid = tr.csctbtiporiesgoid
JOIN 
  public.csctbfamilia cf ON re.csctbfamiliaid = cf.csctbfamiliaid
WHERE 
  cf.csctbfamiliaid = $1;

end;$_$;
 �   DROP FUNCTION public.buscar_robstetricoid(picsctbfamiliaid integer, OUT pcsctbriesgoembarazadaid integer, OUT ptiporiesgo character varying, OUT pnom_riesgobste character varying);
       public          postgres    false    5            A           1255    58755 !   buscar_rsocioeconomicoid(integer)    FUNCTION     H  CREATE FUNCTION public.buscar_rsocioeconomicoid(picsctbfamiliaid integer, OUT pcsctbrsociofamiliaid integer, OUT pnomrsocio character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbrsociofamilia.csctbrsociofamiliaid, 
  csctbriesgosocio.nom_rsocio
FROM 
  public.csctbfamilia, 
  public.csctbriesgosocio, 
  public.csctbrsociofamilia
WHERE 
  csctbfamilia.csctbfamiliaid = csctbrsociofamilia.csctbfamiliaid AND
  csctbriesgosocio.csctbrsocioid = csctbrsociofamilia.csctbrsocioid and
  csctbrsociofamilia.csctbfamiliaid = $1; 
end;$_$;
 �   DROP FUNCTION public.buscar_rsocioeconomicoid(picsctbfamiliaid integer, OUT pcsctbrsociofamiliaid integer, OUT pnomrsocio character varying);
       public          postgres    false    5            r           1255    58756    buscar_vulnerableid(integer)    FUNCTION     d  CREATE FUNCTION public.buscar_vulnerableid(piid_persona integer, OUT pcsctbvulnerablefamid integer, OUT pnomvulnerable character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbvulnerablefamilia.csctbvulnerablefamiliaid, 
  csctbvulnerable.nom_vulnerable
FROM 
  public.csctbvulnerable, 
  public.csctbvulnerablefamilia, 
  public.csctbfamilia
WHERE 
  csctbvulnerable.csctbvulnerableid = csctbvulnerablefamilia.csctbvulnerableid AND
  csctbfamilia.csctbfamiliaid = csctbvulnerablefamilia.csctbfamiliaid and
  csctbvulnerablefamilia.csctbfamiliaid = $1;

end;$_$;
 �   DROP FUNCTION public.buscar_vulnerableid(piid_persona integer, OUT pcsctbvulnerablefamid integer, OUT pnomvulnerable character varying);
       public          postgres    false    5            s           1255    58757 %   buscarenfermedades(character varying)    FUNCTION     �  CREATE FUNCTION public.buscarenfermedades(pinombreenfe character varying, OUT pcsctbenfermedadid integer, OUT pnom_emfermedad character varying, OUT pcod_enfermedad character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbenfermedad.csctbenfermedadid, 
  csctbenfermedad.nom_enfermedad, 
  csctbenfermedad.cog_enfermedad
FROM 
  public.csctbenfermedad
where nom_enfermedad like '%'|| $1 ||'%'
order by nom_enfermedad asc ;
END; $_$;
 �   DROP FUNCTION public.buscarenfermedades(pinombreenfe character varying, OUT pcsctbenfermedadid integer, OUT pnom_emfermedad character varying, OUT pcod_enfermedad character varying);
       public          postgres    false    5            t           1255    58758 (   buscarenfermedadescod(character varying)    FUNCTION     �  CREATE FUNCTION public.buscarenfermedadescod(picodenfermedad character varying, OUT pcsctbenfermedadid integer, OUT pnom_emfermedad character varying, OUT pcod_enfermedad character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbenfermedad.csctbenfermedadid, 
  csctbenfermedad.nom_enfermedad, 
  csctbenfermedad.cog_enfermedad
FROM 
  public.csctbenfermedad
where cog_enfermedad like '%'|| $1 ||'%'
order by cog_enfermedad asc ;
END; $_$;
 �   DROP FUNCTION public.buscarenfermedadescod(picodenfermedad character varying, OUT pcsctbenfermedadid integer, OUT pnom_emfermedad character varying, OUT pcod_enfermedad character varying);
       public          postgres    false    5            u           1255    58759    buscarjefefam()    FUNCTION     O  CREATE FUNCTION public.buscarjefefam(OUT pcsctbfamiliaid integer, OUT pestado_fam boolean) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT 
  csctbfamilia.csctbfamiliaid, 
  csctbfamilia.estado_fam
FROM 
  public.csctbfamilia 

where csctbfamilia.estado_fam = false

order by csctbfamiliaid asc;

end;$$;
 Z   DROP FUNCTION public.buscarjefefam(OUT pcsctbfamiliaid integer, OUT pestado_fam boolean);
       public          postgres    false    5            v           1255    58760    buscarocupacion()    FUNCTION       CREATE FUNCTION public.buscarocupacion(OUT pcsctbocupacionid integer, OUT pnom_ocupacion character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbocupacionid, nom_ocupacion

FROM public.csctbocupacion

order by nom_ocupacion asc;

end;$$;
 k   DROP FUNCTION public.buscarocupacion(OUT pcsctbocupacionid integer, OUT pnom_ocupacion character varying);
       public          postgres    false    5            w           1255    58761    buscaroinstruccion()    FUNCTION     .  CREATE FUNCTION public.buscaroinstruccion(OUT pcsctbinstruccionid integer, OUT pnom_instruccion character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbinstruccionid, nom_instruccion

FROM public.csctbinstruccion

order by csctbinstruccionid asc;

end;$$;
 r   DROP FUNCTION public.buscaroinstruccion(OUT pcsctbinstruccionid integer, OUT pnom_instruccion character varying);
       public          postgres    false    5            x           1255    58762    buscaroles()    FUNCTION     &  CREATE FUNCTION public.buscaroles(OUT pcsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT prutasrol character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT 
  csctbpersonal.csctbpersonalid,
  csctbpersonal.cedula, 
  csctbpersonal.apellido_pat, 
  csctbpersonal.apellido_mat, 
  csctbpersonal.nombresp, 
  csctbroles.nom_rol
FROM 
  public.csctbpersonal, 
  public.csctbrutasroles, 
  public.csctbroles

WHERE 
  csctbpersonal.rolusu = csctbrutasroles.csctbrutasrolesid AND
  csctbrutasroles.csctbrolesid = csctbroles.csctbrolesid and csctbpersonal.estadop = true and
  csctbroles.estado_rol = true
order by csctbpersonal.apellido_pat asc;

end;$$;
 �   DROP FUNCTION public.buscaroles(OUT pcsctbpersonalid integer, OUT pcedula character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying, OUT prutasrol character varying);
       public          postgres    false    5            y           1255    58763    buscarparentesco()    FUNCTION     "  CREATE FUNCTION public.buscarparentesco(OUT pcsctbparentesoid integer, OUT pnom_parentesco character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbparentescoid, nom_parentesco

FROM public.csctbparentesco

order by nom_parentesco asc;

end;$$;
 m   DROP FUNCTION public.buscarparentesco(OUT pcsctbparentesoid integer, OUT pnom_parentesco character varying);
       public          postgres    false    5            z           1255    58764    buscarultid()    FUNCTION     �   CREATE FUNCTION public.buscarultid(OUT pcsctbfamiliaid integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
    SELECT csctbfamiliaid INTO pcsctbfamiliaid
    FROM csctbfamilia
    ORDER BY csctbfamiliaid DESC LIMIT 1;
END;
$$;
 ?   DROP FUNCTION public.buscarultid(OUT pcsctbfamiliaid integer);
       public          postgres    false    5            {           1255    58765    buscarultidmortalidad()    FUNCTION       CREATE FUNCTION public.buscarultidmortalidad(OUT pcsctbmortalidadid integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
    SELECT csctbmortalidad.csctbmortalidadid INTO pcsctbmortalidadid
    FROM csctbmortalidad
    ORDER BY csctbmortalidadid DESC LIMIT 1;
END;
$$;
 L   DROP FUNCTION public.buscarultidmortalidad(OUT pcsctbmortalidadid integer);
       public          postgres    false    5            |           1255    58766    buscarusuario()    FUNCTION     �  CREATE FUNCTION public.buscarusuario(OUT pcsctbloginid integer, OUT pnom_rol character varying, OUT pnom_ruta character varying, OUT ppass character varying, OUT pestado_login boolean, OUT pcedula character varying, OUT pemail character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT 
       csctbloginid, nom_rol, nom_ruta, pass, estado_login, cedula,
       email, nombresp, apellido_pat, apellido_mat
FROM 
  public.csctbroles, 
  public.csctbrutas, 
  public.csctbrutasroles, 
  public.csctblogin, 
  public.csctbpersonal
WHERE 
  csctbroles.csctbrolesid = csctbrutasroles.csctbrolesid AND
  csctbrutas.csctbrutasid = csctbrutasroles.csctbrutasid AND
  csctbrutasroles.csctbrutasrolesid = csctblogin.csctbrutasrolesid AND
  csctblogin.csctbpersonalid = csctbpersonal.csctbpersonalid;

end;$$;
 `  DROP FUNCTION public.buscarusuario(OUT pcsctbloginid integer, OUT pnom_rol character varying, OUT pnom_ruta character varying, OUT ppass character varying, OUT pestado_login boolean, OUT pcedula character varying, OUT pemail character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying);
       public          postgres    false    5            }           1255    58767 "   buscarusuarioid(character varying)    FUNCTION     �  CREATE FUNCTION public.buscarusuarioid(picedula character varying, OUT pnom_rol character varying, OUT pnom_ruta character varying, OUT ppass character varying, OUT pestado_login boolean, OUT pcedula character varying, OUT pemail character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
       nom_rol, nom_ruta, pass, estado_login, cedula,
       email, nombresp, apellido_pat, apellido_mat
FROM 
  public.csctbroles, 
  public.csctbrutas, 
  public.csctbrutasroles, 
  public.csctblogin, 
  public.csctbpersonal
WHERE 
  csctbroles.csctbrolesid = csctbrutasroles.csctbrolesid AND
  csctbrutas.csctbrutasid = csctbrutasroles.csctbrutasid AND
  csctbrutasroles.csctbrutasrolesid = csctblogin.csctbrutasrolesid AND
  csctblogin.csctbpersonalid = csctbpersonal.csctbpersonalid and cedula = $1;

end;$_$;
 c  DROP FUNCTION public.buscarusuarioid(picedula character varying, OUT pnom_rol character varying, OUT pnom_ruta character varying, OUT ppass character varying, OUT pestado_login boolean, OUT pcedula character varying, OUT pemail character varying, OUT pnombresp character varying, OUT papellido_pat character varying, OUT papellido_mat character varying);
       public          postgres    false    5            ~           1255    58768    buscarvacunas(integer)    FUNCTION       CREATE FUNCTION public.buscarvacunas(picsctbedadesid integer, OUT pcsctbvacunasid integer, OUT prango_edad character varying, OUT pnom_vacuna character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbvacunas.csctbvacunasid, 
  csctbedades.rango_edad, 
  csctbvacunas.nom_vacuna
FROM 
  public.csctbedades, 
  public.csctbvacunas
WHERE 
  csctbedades.csctbedadesid = csctbvacunas.csctbedadesid and
  csctbvacunas.csctbedadesid = $1

order by csctbvacunasid asc;

end;$_$;
 �   DROP FUNCTION public.buscarvacunas(picsctbedadesid integer, OUT pcsctbvacunasid integer, OUT prango_edad character varying, OUT pnom_vacuna character varying);
       public          postgres    false    5                       1255    58769    busdatosvivienda(integer)    FUNCTION     .  CREATE FUNCTION public.busdatosvivienda(picsctbfamiliaid integer, OUT pcsctbviviendaid integer, OUT platitud double precision, OUT plongitud double precision, OUT paltitutd double precision, OUT pcon_vivienda character varying, OUT pdet_condicion character varying, OUT ptipo_vivienda character varying, OUT pdet_tipovi character varying, OUT pvia_acceso character varying, OUT pdet_acceso character varying, OUT ptecho character varying, OUT pdet_techo character varying, OUT ppiso character varying, OUT pdet_piso character varying, OUT pparedes character varying, OUT pdet_paredes character varying, OUT ppropiedad character varying, OUT pnum_cuartos integer, OUT pdormitorios integer, OUT pprov_agua character varying, OUT pdet_provagua character varying, OUT pcanalizacionagua character varying, OUT ptratamiento character varying, OUT pservicio_higienico character varying, OUT pubicacionsh character varying, OUT pducha character varying, OUT pbasura character varying, OUT palumbrado character varying, OUT pcocina character varying, OUT pdet_cocina character varying, OUT panidentro boolean, OUT pnum_celular integer, OUT pnum_telefono integer, OUT pparroquia character varying, OUT pcanton character varying, OUT pcprincipal character varying, OUT psecundaria character varying, OUT pnum_casa integer, OUT preferenciadom character varying, OUT pdet_propiedad character varying, OUT pservicio_internet boolean, OUT pnom_barrio character varying, OUT pnom_sector character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbvivienda.csctbviviendaid, 
  csctbvivienda.latitud1, 
  csctbvivienda.longitud1, 
  csctbvivienda.altitud1, 
  csctbvivienda.con_vivienda, 
  csctbvivienda.det_condicion, 
  csctbvivienda.tipo_vivienda, 
  csctbvivienda.det_tipovi, 
  csctbvivienda.via_acceso, 
  csctbvivienda.det_acceso, 
  csctbvivienda.techo, 
  csctbvivienda.det_techo, 
  csctbvivienda.piso, 
  csctbvivienda.det_piso, 
  csctbvivienda.paredes, 
  csctbvivienda.det_paredes, 
  csctbvivienda.propiedad, 
  csctbvivienda.num_cuartos, 
  csctbvivienda.dormitorios, 
  csctbvivienda.prov_agua, 
  csctbvivienda.det_provagua, 
  csctbvivienda.canalizacionagua, 
  csctbvivienda.tratamientoagua, 
  csctbvivienda.servicio_higienico, 
  csctbvivienda.ubicacionsh, 
  csctbvivienda.ducha, 
  csctbvivienda.basura, 
  csctbvivienda.alumbrado, 
  csctbvivienda.cocina, 
  csctbvivienda.det_cocina, 
  csctbvivienda.anidentro, 
  csctbvivienda.num_celular, 
  csctbvivienda.num_telefono, 
  csctbvivienda.parroquia, 
  csctbvivienda.canton, 
  csctbvivienda.cprincipal, 
  csctbvivienda.csecundaria, 
  csctbvivienda.num_casa, 
  csctbvivienda.referenciadom, 
  csctbvivienda.det_propiedad, 
  csctbvivienda.servicio_internet, 
  csctbbarrioschambo.nom_barrio, 
  csctbvivienda.sector
FROM 
    public.csctbfamilia
    JOIN public.csctbvivienda ON csctbvivienda.csctbfamiliaid = csctbfamilia.csctbfamiliaid
    JOIN public.csctbbarrioschambo ON csctbbarrioschambo.csctbbarriosid = csctbvivienda.csctbbarriochamboid
    WHERE 
        csctbfamilia.csctbfamiliaid = $1;

end;$_$;
 �  DROP FUNCTION public.busdatosvivienda(picsctbfamiliaid integer, OUT pcsctbviviendaid integer, OUT platitud double precision, OUT plongitud double precision, OUT paltitutd double precision, OUT pcon_vivienda character varying, OUT pdet_condicion character varying, OUT ptipo_vivienda character varying, OUT pdet_tipovi character varying, OUT pvia_acceso character varying, OUT pdet_acceso character varying, OUT ptecho character varying, OUT pdet_techo character varying, OUT ppiso character varying, OUT pdet_piso character varying, OUT pparedes character varying, OUT pdet_paredes character varying, OUT ppropiedad character varying, OUT pnum_cuartos integer, OUT pdormitorios integer, OUT pprov_agua character varying, OUT pdet_provagua character varying, OUT pcanalizacionagua character varying, OUT ptratamiento character varying, OUT pservicio_higienico character varying, OUT pubicacionsh character varying, OUT pducha character varying, OUT pbasura character varying, OUT palumbrado character varying, OUT pcocina character varying, OUT pdet_cocina character varying, OUT panidentro boolean, OUT pnum_celular integer, OUT pnum_telefono integer, OUT pparroquia character varying, OUT pcanton character varying, OUT pcprincipal character varying, OUT psecundaria character varying, OUT pnum_casa integer, OUT preferenciadom character varying, OUT pdet_propiedad character varying, OUT pservicio_internet boolean, OUT pnom_barrio character varying, OUT pnom_sector character varying);
       public          postgres    false    5            �           1255    58770    busdatosvivienda1(integer)    FUNCTION       CREATE FUNCTION public.busdatosvivienda1(picsctbfamiliaid integer, OUT pcsctbfamiliaid integer, OUT platitud character varying, OUT plongitud character varying, OUT paltitutd character varying, OUT pcon_vivienda character varying, OUT pdet_condicion character varying, OUT ptipo_vivienda character varying, OUT pdet_tipovi character varying, OUT pvia_acceso character varying, OUT pdet_acceso character varying, OUT ptecho character varying, OUT pdet_techo character varying, OUT ppiso character varying, OUT pdet_piso character varying, OUT pparedes character varying, OUT pdet_paredes character varying, OUT ppropiedad character varying, OUT pnum_cuartos integer, OUT pdormitorios integer, OUT pprov_agua character varying, OUT pdet_provagua character varying, OUT pcanalizacionagua character varying, OUT ptratamiento character varying, OUT pservicio_higienico character varying, OUT pubicacionsh character varying, OUT pducha character varying, OUT pbasura character varying, OUT palumbrado character varying, OUT pcocina character varying, OUT pdet_cocina character varying, OUT panidentro boolean, OUT pvectores boolean, OUT pprovectores character varying, OUT pvulnerable boolean, OUT pnum_celular integer, OUT pnum_telefono integer, OUT pparroquia character varying, OUT pcanton character varying, OUT pbarrio character varying, OUT pcprincipal character varying, OUT psecundaria character varying, OUT pnum_casa integer, OUT preferenciadom character varying, OUT pdet_propiedad character varying, OUT pservicio_internet boolean) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query

SELECT 
  csctbvivienda.csctbfamiliaid, 
  csctbvivienda.latitud, 
  csctbvivienda.longitud, 
  csctbvivienda.altitud, 
  csctbvivienda.con_vivienda, 
  csctbvivienda.det_condicion, 
  csctbvivienda.tipo_vivienda, 
  csctbvivienda.det_tipovi, 
  csctbvivienda.via_acceso, 
  csctbvivienda.det_acceso, 
  csctbvivienda.techo, 
  csctbvivienda.det_techo, 
  csctbvivienda.piso, 
  csctbvivienda.det_piso, 
  csctbvivienda.paredes, 
  csctbvivienda.det_paredes, 
  csctbvivienda.propiedad, 
  csctbvivienda.num_cuartos, 
  csctbvivienda.dormitorios, 
  csctbvivienda.prov_agua, 
  csctbvivienda.det_provagua, 
  csctbvivienda.canalizacionagua, 
  csctbvivienda.tratamientoagua, 
  csctbvivienda.servicio_higienico, 
  csctbvivienda.ubicacionsh, 
  csctbvivienda.ducha, 
  csctbvivienda.basura, 
  csctbvivienda.alumbrado, 
  csctbvivienda.cocina, 
  csctbvivienda.det_cocina, 
  csctbvivienda.anidentro, 
  csctbvivienda.vectores, 
  csctbvivienda.provectores, 
  csctbvivienda.vulnerable, 
  csctbvivienda.num_celular, 
  csctbvivienda.num_telefono, 
  csctbvivienda.parroquia, 
  csctbvivienda.canton, 
  csctbvivienda.barrio, 
  csctbvivienda.cprincipal, 
  csctbvivienda.csecundaria, 
  csctbvivienda.num_casa, 
  csctbvivienda.referenciadom,
  csctbvivienda.det_propiedad,
  csctbvivienda.servicio_internet
FROM 
  public.csctbvivienda, 
  public.csctbfamilia
WHERE 
  csctbfamilia.csctbfamiliaid = csctbvivienda.csctbfamiliaid and csctbfamilia.csctbfamiliaid = $1;

end;$_$;
   DROP FUNCTION public.busdatosvivienda1(picsctbfamiliaid integer, OUT pcsctbfamiliaid integer, OUT platitud character varying, OUT plongitud character varying, OUT paltitutd character varying, OUT pcon_vivienda character varying, OUT pdet_condicion character varying, OUT ptipo_vivienda character varying, OUT pdet_tipovi character varying, OUT pvia_acceso character varying, OUT pdet_acceso character varying, OUT ptecho character varying, OUT pdet_techo character varying, OUT ppiso character varying, OUT pdet_piso character varying, OUT pparedes character varying, OUT pdet_paredes character varying, OUT ppropiedad character varying, OUT pnum_cuartos integer, OUT pdormitorios integer, OUT pprov_agua character varying, OUT pdet_provagua character varying, OUT pcanalizacionagua character varying, OUT ptratamiento character varying, OUT pservicio_higienico character varying, OUT pubicacionsh character varying, OUT pducha character varying, OUT pbasura character varying, OUT palumbrado character varying, OUT pcocina character varying, OUT pdet_cocina character varying, OUT panidentro boolean, OUT pvectores boolean, OUT pprovectores character varying, OUT pvulnerable boolean, OUT pnum_celular integer, OUT pnum_telefono integer, OUT pparroquia character varying, OUT pcanton character varying, OUT pbarrio character varying, OUT pcprincipal character varying, OUT psecundaria character varying, OUT pnum_casa integer, OUT preferenciadom character varying, OUT pdet_propiedad character varying, OUT pservicio_internet boolean);
       public          postgres    false    5            �           1255    58771    busembarazada(integer)    FUNCTION     $  CREATE FUNCTION public.busembarazada(picsctbfamiliaid integer, OUT pcscembarazadasid integer, OUT pfechamenstruacion date, OUT pfechaparto date, OUT pcontrolmenos20 integer, OUT pcontrolmas20 integer, OUT pesquemavacu boolean, OUT pante_patologicos character varying, OUT psemanas_gestacion integer, OUT pgestas integer, OUT ppartos integer, OUT pabortos integer, OUT pcesarias integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbembarazadas.csctbembarazadasid, 
  csctbembarazadas.fecha_menstruacion, 
  csctbembarazadas.fecha_parto, 
  csctbembarazadas.control_menos20, 
  csctbembarazadas.control_mas20, 
  csctbembarazadas.esquema_vacunacion, 
  csctbembarazadas.ante_patologicos, 
  csctbembarazadas.semanas_gestacion, 
  csctbembarazadas.gestas, 
  csctbembarazadas.partos, 
  csctbembarazadas.abortos, 
  csctbembarazadas.cesarias
FROM 
  public.csctbembarazadas, 
  public.csctbfamilia
WHERE 
  csctbembarazadas.csctbfamiliaid = csctbfamilia.csctbfamiliaid and
  csctbfamilia.csctbfamiliaid = $1;


end;$_$;
 �  DROP FUNCTION public.busembarazada(picsctbfamiliaid integer, OUT pcscembarazadasid integer, OUT pfechamenstruacion date, OUT pfechaparto date, OUT pcontrolmenos20 integer, OUT pcontrolmas20 integer, OUT pesquemavacu boolean, OUT pante_patologicos character varying, OUT psemanas_gestacion integer, OUT pgestas integer, OUT ppartos integer, OUT pabortos integer, OUT pcesarias integer);
       public          postgres    false    5            �           1255    58772    busenferpersona(integer)    FUNCTION     �  CREATE FUNCTION public.busenferpersona(picsctbfamiliaid integer, OUT pcsctbenfermedadid integer, OUT pnom_enfer character varying, OUT pcod_enfer character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbenferfam.csctbenfermeriesgoid,
  csctbenfermedad.nom_enfermedad, 
  csctbenfermedad.cog_enfermedad
FROM 
  public.csctbenferfam, 
  public.csctbenfermedad, 
  public.csctbfamilia
WHERE 
  csctbenferfam.csctbfamiliaid = csctbfamilia.csctbfamiliaid AND
  csctbenferfam.csctbenfermedadid = csctbenfermedad.csctbenfermedadid and 
  csctbenferfam.csctbfamiliaid = $1 and csctbenferfam.estado_enfermedad = true;

end;$_$;
 �   DROP FUNCTION public.busenferpersona(picsctbfamiliaid integer, OUT pcsctbenfermedadid integer, OUT pnom_enfer character varying, OUT pcod_enfer character varying);
       public          postgres    false    5            �           1255    58773    busevariesgosfam(integer)    FUNCTION     p  CREATE FUNCTION public.busevariesgosfam(picsctbfamiliaid integer, OUT pcsctbevaluacionriesgoid integer, OUT pnomevaluacion character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbevaluariesgo.csctbevaluariesgoid, 
  csctbevaluacion.nom_evaluacion
FROM 
  public.csctbfamilia, 
  public.csctbevaluariesgo, 
  public.csctbevaluacion
WHERE 
  csctbevaluariesgo.csctbfamiliaid = csctbfamilia.csctbfamiliaid AND
  csctbevaluacion.csctbevaluacionid = csctbevaluariesgo.csctbevaluacionid AND
  csctbfamilia.csctbfamiliaid = $1 and csctbevaluariesgo.estado_riesgo = true;

end;$_$;
 �   DROP FUNCTION public.busevariesgosfam(picsctbfamiliaid integer, OUT pcsctbevaluacionriesgoid integer, OUT pnomevaluacion character varying);
       public          postgres    false    5            �           1255    58774    busfamilia(integer)    FUNCTION     L  CREATE FUNCTION public.busfamilia(picsctbfamiliaid integer, OUT pcsctbfamiliaid integer, OUT pfecreacion_fam date) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query

SELECT 
  csctbfamilia.csctbfamiliaid,csctbfamilia.fecreacion_fam
FROM 
  public.csctbfamilia

 where csctbfamilia.csctbfamiliaid=$1;

end;$_$;
 r   DROP FUNCTION public.busfamilia(picsctbfamiliaid integer, OUT pcsctbfamiliaid integer, OUT pfecreacion_fam date);
       public          postgres    false    5            �           1255    58775    busidvivienda(integer)    FUNCTION     �  CREATE FUNCTION public.busidvivienda(picsctbfamiliaid integer, OUT pcsctbviviendaid integer, OUT pape_fam character varying, OUT pnom_fam character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT 
        cv.csctbviviendaid, 
        cf.ape_fam, 
        cf.nom_fam
    FROM 
        public.csctbfamilia cf
        INNER JOIN public.csctbvivienda cv ON cv.csctbfamiliaid = cf.csctbfamiliaid
    WHERE 
        cf.csctbfamiliaid = picsctbfamiliaid;
end;$$;
 �   DROP FUNCTION public.busidvivienda(picsctbfamiliaid integer, OUT pcsctbviviendaid integer, OUT pape_fam character varying, OUT pnom_fam character varying);
       public          postgres    false    5            �           1255    58776    busriesgosfam(integer)    FUNCTION     ~  CREATE FUNCTION public.busriesgosfam(picsctbfamiliaid integer, OUT priesgosid integer, OUT priesgos character varying, OUT pgrad_discapacidad character varying, OUT pgrupo_dispensarial character varying, OUT pporcentaje_dis integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbriesgos.csctbriesgosid, 
  csctbriesgos.riesgos, 
  csctbriesgos.gra_discapacidad, 
  csctbriesgos.gru_dispensa, 
  csctbriesgos.porce_discapacidad
FROM 
  public.csctbfamilia, 
  public.csctbriesgos
WHERE 
  csctbriesgos.csctbfamiliaid = csctbfamilia.csctbfamiliaid and
  csctbriesgos.csctbfamiliaid = $1;


end;$_$;
 �   DROP FUNCTION public.busriesgosfam(picsctbfamiliaid integer, OUT priesgosid integer, OUT priesgos character varying, OUT pgrad_discapacidad character varying, OUT pgrupo_dispensarial character varying, OUT pporcentaje_dis integer);
       public          postgres    false    5            �           1255    58777    busriesgosvivienda(integer)    FUNCTION       CREATE FUNCTION public.busriesgosvivienda(picsctbviviendaid integer, OUT pcsctbriesgoaviviendaid integer, OUT pagresividad boolean, OUT pinsalubridad boolean, OUT pcantidad boolean, OUT pconv_animales boolean, OUT padomestico boolean, OUT pagranja boolean, OUT psilvestre boolean, OUT pdom_perro boolean, OUT pdom_gato boolean, OUT ppeque boolean, OUT pmedio boolean, OUT pgrande boolean, OUT pnum_gatos integer, OUT pries_vi1 boolean, OUT pries_vi2 boolean, OUT pries_vi3 boolean, OUT pries_vi4 boolean, OUT pvectores boolean, OUT pprovectores character varying, OUT pvulnerable boolean) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbriesgoavivienda.csctbriesgoavivid, 
  csctbriesgoavivienda.ries_agresividad, 
  csctbriesgoavivienda.ries_insalubridad, 
  csctbriesgoavivienda.ries_cantidad, 
  csctbriesgoavivienda.conv_animales, 
  csctbriesgoavivienda.tipo_domestico, 
  csctbriesgoavivienda.tipo_granja, 
  csctbriesgoavivienda.tipo_silvestre, 
  csctbriesgoavivienda.dome_perro, 
  csctbriesgoavivienda.dome_gato, 
  csctbriesgoavivienda.perro_peque, 
  csctbriesgoavivienda.perro_medio, 
  csctbriesgoavivienda.perro_grande, 
  csctbriesgoavivienda.num_gatos, 
  csctbriesgoavivienda.ries_vi1, 
  csctbriesgoavivienda.ries_vi2, 
  csctbriesgoavivienda.ries_vi3, 
  csctbriesgoavivienda.ries_vi4,
  csctbriesgoavivienda.vectores,
  csctbriesgoavivienda.provectores,
  csctbriesgoavivienda.vulnerable
FROM 
  public.csctbriesgoavivienda

where csctbriesgoavivienda.csctbviviendaid = $1;

end;$_$;
 L  DROP FUNCTION public.busriesgosvivienda(picsctbviviendaid integer, OUT pcsctbriesgoaviviendaid integer, OUT pagresividad boolean, OUT pinsalubridad boolean, OUT pcantidad boolean, OUT pconv_animales boolean, OUT padomestico boolean, OUT pagranja boolean, OUT psilvestre boolean, OUT pdom_perro boolean, OUT pdom_gato boolean, OUT ppeque boolean, OUT pmedio boolean, OUT pgrande boolean, OUT pnum_gatos integer, OUT pries_vi1 boolean, OUT pries_vi2 boolean, OUT pries_vi3 boolean, OUT pries_vi4 boolean, OUT pvectores boolean, OUT pprovectores character varying, OUT pvulnerable boolean);
       public          postgres    false    5            �           1255    58778    crearfamilia(boolean)    FUNCTION       CREATE FUNCTION public.crearfamilia(piestadofam boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbfamilia(
	estado_fam, fecreacion_fam)
VALUES ($1, current_timestamp);

band=true;
	return band;
end;
$_$;
 8   DROP FUNCTION public.crearfamilia(piestadofam boolean);
       public          postgres    false    5            �           1255    58779    crearficha(integer)    FUNCTION       CREATE FUNCTION public.crearficha(picsctbfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctbficha(
	csctbfamiliaid, ficha_creacion)
VALUES ($1, current_timestamp);

band=true;
	return band;
end;
$_$;
 ;   DROP FUNCTION public.crearficha(picsctbfamiliaid integer);
       public          postgres    false    5            �           1255    58780 �   crearintegrante(integer, integer, integer, character varying, character varying, character varying, date, integer, integer, integer, character varying, boolean, character varying, boolean, integer)    FUNCTION     �  CREATE FUNCTION public.crearintegrante(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam1 character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$ declare last_id integer;
begin
INSERT INTO public.csctbfamilia(
	csctbocupacionid, csctbinstruccionid, csctbparentescoid, cedula_fam, nom_fam, ape_fam, fecha_na_fam, anios, meses, dias, 
    genero, control_bucal, observacion, estado_fam, id_jefe_hogar, fecreacion_fam)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, CURRENT_TIMESTAMP)

	RETURNING csctbfamiliaid INTO last_id;

    RETURN last_id;
end;
$_$;
 �  DROP FUNCTION public.crearintegrante(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam1 character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer);
       public          postgres    false    5            �           1255    58781 �   edit_fam(integer, integer, integer, character varying, character varying, character varying, date, integer, integer, integer, character varying, boolean, character varying, boolean, integer, character varying, integer, integer, integer)    FUNCTION        CREATE FUNCTION public.edit_fam(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer, piestado_civil character varying, picsctbetniaid integer, picsctbnacionalidadid integer, picsctbpueblosid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbfamilia
	SET csctbocupacionid=$1, csctbinstruccionid=$2, csctbparentescoid=$3, cedula_fam=$4, nom_fam=$5, ape_fam=$6, fecha_na_fam=$7, anios=$8, meses=$9, dias=$10, genero=$11, control_bucal=$12, observacion=$13, estado_fam=$14, fecreacion_fam=current_timestamp , id_jefe_hogar=$15, estado_civil=$16, csctbetniaid=$17, csctbnacionalidadid=$18, csctbpueblosid=$19
	WHERE csctbfamiliaid =$15;

  band=true;
  return band;
  end; $_$;
   DROP FUNCTION public.edit_fam(picsctbocupacionid integer, picsctbinstruccionid integer, picsctbparentescoid integer, picedula_fam character varying, pinom_fam character varying, piape_fam character varying, pifecha_na_fam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, picontrol_bucal boolean, piobservacion character varying, piestado_fam boolean, piid_jefe_hogar integer, piestado_civil character varying, picsctbetniaid integer, picsctbnacionalidadid integer, picsctbpueblosid integer);
       public          postgres    false    5            �           1255    58782 �   editar_datos1persona(integer, character varying, character varying, date, integer, integer, integer, character varying, integer, integer, integer, character varying, boolean, character varying, integer, integer, integer)    FUNCTION     �  CREATE FUNCTION public.editar_datos1persona(picsctbfamiliaid integer, pinom_fam character varying, piape_fam character varying, pifecha_nacimientofam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, piocupacionid integer, piinstruccionid integer, piparentescoid integer, piobsfam character varying, picontrol_bucal boolean, piestadocivil character varying, pietniaid integer, pinacionalidadid integer, pipueblosid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbfamilia
	SET nom_fam=$2, ape_fam=$3, fecha_na_fam=$4, anios=$5, meses=$6, dias=$7, genero=$8, csctbocupacionid=$9, csctbinstruccionid=$10, csctbparentescoid=$11, observacion=$12, control_bucal=$13,
		estado_civil=$14, csctbetniaid=$15, csctbnacionalidadid=$16, csctbpueblosid=$17
	WHERE csctbfamiliaid =$1;

  band=true;
  return band;
  end; $_$;
 �  DROP FUNCTION public.editar_datos1persona(picsctbfamiliaid integer, pinom_fam character varying, piape_fam character varying, pifecha_nacimientofam date, pianios integer, pimeses integer, pidias integer, pigenero character varying, piocupacionid integer, piinstruccionid integer, piparentescoid integer, piobsfam character varying, picontrol_bucal boolean, piestadocivil character varying, pietniaid integer, pinacionalidadid integer, pipueblosid integer);
       public          postgres    false    5            �           1255    58783 m  editar_datos1vi(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, character varying, character varying)    FUNCTION     A  CREATE FUNCTION public.editar_datos1vi(picsctbviviendaid integer, picond_vivi character varying, piobcond_vi character varying, pitipo_vi character varying, piobtipo_vi character varying, piviacce character varying, piobviacce character varying, pitecho character varying, piobtecho character varying, pipiso character varying, piobpiso character varying, piparedes character varying, piobparedes character varying, piprovi character varying, piobprovi character varying, pinumcuartos integer, pidormitorios integer, piproceagua character varying, piobproceagua character varying, picanalagua character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbvivienda
	SET con_vivienda=$2, det_condicion=$3, tipo_vivienda=$4, det_tipovi=$5, via_acceso=$6, det_acceso=$7, techo=$8, det_techo=$9, piso=$10, det_piso=$11, paredes=$12, det_paredes=$13, propiedad=$14, det_propiedad=$15, num_cuartos=$16, dormitorios=$17, prov_agua=$18, det_provagua=$19, canalizacionagua=$20
	WHERE csctbviviendaid =$1;

  band=true;
  return band;
  end; $_$;
 c  DROP FUNCTION public.editar_datos1vi(picsctbviviendaid integer, picond_vivi character varying, piobcond_vi character varying, pitipo_vi character varying, piobtipo_vi character varying, piviacce character varying, piobviacce character varying, pitecho character varying, piobtecho character varying, pipiso character varying, piobpiso character varying, piparedes character varying, piobparedes character varying, piprovi character varying, piobprovi character varying, pinumcuartos integer, pidormitorios integer, piproceagua character varying, piobproceagua character varying, picanalagua character varying);
       public          postgres    false    5            �           1255    58784 �   editar_datos2vi(integer, character varying, character varying, character varying, character varying, character varying, boolean, character varying, character varying, boolean)    FUNCTION     ~  CREATE FUNCTION public.editar_datos2vi(picsctbviviendaid integer, pitratamiento character varying, pitiposh character varying, piubish character varying, piducha character varying, pieli_basura character varying, piservicio_inte boolean, pialumbrado character varying, picocina character varying, piubicocina boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbvivienda
	SET tratamientoagua=$2, servicio_higienico=$3, ubicacionsh=$4, ducha=$5, basura=$6, servicio_internet=$7, alumbrado=$8, cocina=$9, anidentro=$10
	WHERE csctbviviendaid =$1;

  band=true;
  return band;
  end; $_$;
 =  DROP FUNCTION public.editar_datos2vi(picsctbviviendaid integer, pitratamiento character varying, pitiposh character varying, piubish character varying, piducha character varying, pieli_basura character varying, piservicio_inte boolean, pialumbrado character varying, picocina character varying, piubicocina boolean);
       public          postgres    false    5            �           1255    58785 �   editar_datos31vi(integer, integer, integer, double precision, double precision, double precision, character varying, character varying, integer, character varying, character varying, character varying, integer, character varying)    FUNCTION       CREATE FUNCTION public.editar_datos31vi(picsctbviviendaid integer, pinumcelular integer, piconvencional integer, pilongitud double precision, pilatitud double precision, pialtitud double precision, picanton character varying, piparroquia character varying, pibarrioid integer, pisector character varying, picprincipal character varying, picsecundaria character varying, pinumcasa integer, pireferencia character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbvivienda
	SET num_celular=$2, num_telefono=$3, longitud1=$4, latitud1=$5, altitud1=$6, canton=$7, parroquia=$8, csctbbarriochamboid=$9, sector=$10, cprincipal=$11, csecundaria=$12, num_casa=$13, referenciadom=$14
	WHERE csctbviviendaid =$1;

  band=true;
  return band;
  end; $_$;
 �  DROP FUNCTION public.editar_datos31vi(picsctbviviendaid integer, pinumcelular integer, piconvencional integer, pilongitud double precision, pilatitud double precision, pialtitud double precision, picanton character varying, piparroquia character varying, pibarrioid integer, pisector character varying, picprincipal character varying, picsecundaria character varying, pinumcasa integer, pireferencia character varying);
       public          postgres    false    5            �           1255    58786 �   editar_datos4vi(integer, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, boolean, integer, boolean, boolean, boolean, boolean, boolean, character varying, boolean)    FUNCTION     �  CREATE FUNCTION public.editar_datos4vi(picsctbriesgoaviviendaid integer, piagresividad boolean, piinsalubridad boolean, picantidad boolean, piconvani boolean, pidomestico boolean, pigranja boolean, pisilvestre boolean, piperro boolean, pigato boolean, pipeque boolean, pimedia boolean, pigrande boolean, pinumgato integer, piriesg1 boolean, piriesg2 boolean, piriesg3 boolean, piriesg4 boolean, pivectores boolean, piprovectores character varying, pivulnerable boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbriesgoavivienda
	SET ries_agresividad=$2, ries_insalubridad=$3, ries_cantidad=$4, conv_animales=$5, tipo_domestico=$6, tipo_granja=$7, tipo_silvestre=$8, dome_perro=$9, dome_gato=$10, perro_peque=$11, perro_medio=$12, perro_grande=$13,
		num_gatos=$14, ries_vi1=$15, ries_vi2=$16, ries_vi3=$17, ries_vi4=$18, vectores=$19, provectores=$20, vulnerable=$21
	WHERE csctbriesgoavivid =$1;

  band=true;
  return band;
  end; $_$;
 �  DROP FUNCTION public.editar_datos4vi(picsctbriesgoaviviendaid integer, piagresividad boolean, piinsalubridad boolean, picantidad boolean, piconvani boolean, pidomestico boolean, pigranja boolean, pisilvestre boolean, piperro boolean, pigato boolean, pipeque boolean, pimedia boolean, pigrande boolean, pinumgato integer, piriesg1 boolean, piriesg2 boolean, piriesg3 boolean, piriesg4 boolean, pivectores boolean, piprovectores character varying, pivulnerable boolean);
       public          postgres    false    5            �           1255    58787 x   editar_embarazada(integer, date, date, integer, integer, integer, integer, integer, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.editar_embarazada(picsctbembarazadaid integer, pifemenstruacion date, pifeparto date, picontrolme20 integer, picontrolma20 integer, pisegestacion integer, pigestas integer, pipartos integer, piabortos integer, picesarias integer, piantecentes character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbembarazadas
	SET fecha_menstruacion=$2, fecha_parto=$3, control_menos20=$4, control_mas20=$5, semanas_gestacion=$6, gestas=$7, partos=$8, abortos=$9, cesarias=$10, ante_patologicos=$11
		
	WHERE csctbembarazadasid =$1;

  band=true;
  return band;
  end; $_$;
   DROP FUNCTION public.editar_embarazada(picsctbembarazadaid integer, pifemenstruacion date, pifeparto date, picontrolme20 integer, picontrolma20 integer, pisegestacion integer, pigestas integer, pipartos integer, piabortos integer, picesarias integer, piantecentes character varying);
       public          postgres    false    5            �           1255    58788 }   editar_mortalidad(integer, character varying, character varying, integer, date, integer, integer, integer, character varying)    FUNCTION     I  CREATE FUNCTION public.editar_mortalidad(picsctbmortalidadid integer, piapellidosmor character varying, pinombremor character varying, piparentescoid integer, pifechamor date, pianios integer, pimeses integer, pidias integer, picausanodefinida character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbmortalidad
	SET apellidos_mortalidad=$2, nombres_mortalidad=$3, csctbparentescoid=$4, fecha_fallecimiento=$5, anios=$6, meses=$7, dias=$8, causa_nodefi=$9
	WHERE csctbmortalidadid =$1;

  band=true;
  return band;
  end; $_$;
   DROP FUNCTION public.editar_mortalidad(picsctbmortalidadid integer, piapellidosmor character varying, pinombremor character varying, piparentescoid integer, pifechamor date, pianios integer, pimeses integer, pidias integer, picausanodefinida character varying);
       public          postgres    false    5            �           1255    58789 >  editar_personalid(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, date, date, date, character varying, boolean, character varying, boolean, character varying, character varying, integer, character varying, integer)    FUNCTION     E  CREATE FUNCTION public.editar_personalid(picedula character varying, pinombresp character varying, piapellido_pat character varying, piapellido_mat character varying, pitelefono character varying, piemail character varying, pidireccion character varying, pieais_medico character varying, pifecha_nacimiento date, pifecha_ingreso date, pifecha_salida date, piobserp character varying, piestadop boolean, piprofesion character varying, pirealizaitinerancia boolean, piareatrabajo character varying, pimodalidad character varying, pihorastrabajo integer, pitipocontrato character varying, picsctbpersonalid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbpersonal
	SET cedula=$1, nombresp=$2, apellido_pat=$3, apellido_mat=$4, telefeno=$5, email=$6, direccion=$7, eais_medico=$8, fecha_nacimiento=$9, fecha_ingreso=$10, fecha_salida=$11, obserp=$12, estadop=$13, profesion=$14, realizaitinerancia=$15, areatrabajo=$16, modalidad=$17, horastrabajo=$18, tipocontrato=$19
	WHERE csctbpersonalid =$20;

  band=true;
  return band;
  end; $_$;
 d  DROP FUNCTION public.editar_personalid(picedula character varying, pinombresp character varying, piapellido_pat character varying, piapellido_mat character varying, pitelefono character varying, piemail character varying, pidireccion character varying, pieais_medico character varying, pifecha_nacimiento date, pifecha_ingreso date, pifecha_salida date, piobserp character varying, piestadop boolean, piprofesion character varying, pirealizaitinerancia boolean, piareatrabajo character varying, pimodalidad character varying, pihorastrabajo integer, pitipocontrato character varying, picsctbpersonalid integer);
       public          postgres    false    5            �           1255    58790    editarol(integer, integer)    FUNCTION     /  CREATE FUNCTION public.editarol(pirolusu integer, picsctbpersonalid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE 
public.csctbpersonal
	SET rolusu=$1, fechacreacion= current_timestamp 
	WHERE csctbpersonalid = $2;

  band=true;
  return band;
  end; $_$;
 L   DROP FUNCTION public.editarol(pirolusu integer, picsctbpersonalid integer);
       public          postgres    false    5            �           1255    58791 \   editarrioesgosfam(integer, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.editarrioesgosfam(picsctbriesgosid integer, piriesgos character varying, pigra_dispen character varying, pigru_dispen character varying, piporcentajedis integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin

UPDATE public.csctbriesgos
	SET riesgos=$2, gra_discapacidad=$3, gru_dispensa=$4, porce_discapacidad=$5
	WHERE csctbriesgosid=$1;

  band=true;
  return band;
  end; $_$;
 �   DROP FUNCTION public.editarrioesgosfam(picsctbriesgosid integer, piriesgos character varying, pigra_dispen character varying, pigru_dispen character varying, piporcentajedis integer);
       public          postgres    false    5            �           1255    58792    eliminar_enfermedad(integer)    FUNCTION     @  CREATE FUNCTION public.eliminar_enfermedad(picsctbenfermedadid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
UPDATE public.csctbenferfam
	SET estado_enfermedad= false, fecha_elimi_enfer= current_timestamp 
	WHERE csctbenfermeriesgoid = $1;

  band=true;
  return band;
  end; $_$;
 G   DROP FUNCTION public.eliminar_enfermedad(picsctbenfermedadid integer);
       public          postgres    false    5            �           1255    58793    eliminar_prioritario(integer)    FUNCTION     _  CREATE FUNCTION public.eliminar_prioritario(picsctbprioritariofamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
UPDATE public.csctbprioritariofamilia
	SET estado_prioritario= false, fecha_elimi_prioritario= current_timestamp 
	WHERE csctbprioritariofamiliaid = $1;

  band=true;
  return band;
  end; $_$;
 P   DROP FUNCTION public.eliminar_prioritario(picsctbprioritariofamiliaid integer);
       public          postgres    false    5            �           1255    58794    eliminar_rambientalid(integer)    FUNCTION       CREATE FUNCTION public.eliminar_rambientalid(picsctbrambientalfamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare band Boolean;
begin
DELETE FROM public.csctbrambientalfamilia
	WHERE csctbrambientalfamiliaid = $1;
band=true;
return band;
end;$_$;
 P   DROP FUNCTION public.eliminar_rambientalid(picsctbrambientalfamiliaid integer);
       public          postgres    false    5            �           1255    58795    eliminar_rbiologicoid(integer)    FUNCTION       CREATE FUNCTION public.eliminar_rbiologicoid(picsctbrbiolofamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare band Boolean;
begin
DELETE FROM public.csctbrbiolofamilia
	WHERE csctbrbiolofamiliaid = $1;
band=true;
return band;
end;$_$;
 L   DROP FUNCTION public.eliminar_rbiologicoid(picsctbrbiolofamiliaid integer);
       public          postgres    false    5            �           1255    58796    eliminar_robstetricoid(integer)    FUNCTION     
  CREATE FUNCTION public.eliminar_robstetricoid(picsctbriesgoembarazadaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare band Boolean;
begin
DELETE FROM public.csctbriesgoembarazada
	WHERE csctbriesembarazadaid = $1;
band=true;
return band;
end;$_$;
 P   DROP FUNCTION public.eliminar_robstetricoid(picsctbriesgoembarazadaid integer);
       public          postgres    false    5            �           1255    58797    eliminar_rsocioecoid(integer)    FUNCTION       CREATE FUNCTION public.eliminar_rsocioecoid(picsctbrsociofamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare band Boolean;
begin
DELETE FROM public.csctbrsociofamilia
	WHERE csctbrsociofamiliaid = $1;
band=true;
return band;
end;$_$;
 K   DROP FUNCTION public.eliminar_rsocioecoid(picsctbrsociofamiliaid integer);
       public          postgres    false    5            �           1255    58798    eliminar_vacuna(integer)    FUNCTION     @  CREATE FUNCTION public.eliminar_vacuna(picsctbvacunafamiliid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
UPDATE public.csctbvacunafamilia
	SET estado_vacuna= false, fecha_elimi_vacuna= current_timestamp 
	WHERE csctbvacunafamiliaid = $1;

  band=true;
  return band;
  end; $_$;
 E   DROP FUNCTION public.eliminar_vacuna(picsctbvacunafamiliid integer);
       public          postgres    false    5            �           1255    58799    eliminar_vulnerable(integer)    FUNCTION       CREATE FUNCTION public.eliminar_vulnerable(picsctbvulnerablefamiliaid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare band Boolean;
begin
DELETE FROM public.csctbvulnerablefamilia
	WHERE csctbvulnerablefamiliaid = $1;
band=true;
return band;
end;$_$;
 N   DROP FUNCTION public.eliminar_vulnerable(picsctbvulnerablefamiliaid integer);
       public          postgres    false    5            �           1255    58800    eliminarol(integer)    FUNCTION       CREATE FUNCTION public.eliminarol(picsctbloginid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare band Boolean;
begin
UPDATE csctbpersonal
SET rolusu = 3, fechaelipersonal= current_timestamp 
where csctbpersonalid =$1;
band=true;
return band;
end;$_$;
 9   DROP FUNCTION public.eliminarol(picsctbloginid integer);
       public          postgres    false    5            B           1255    58801    eliminarpersonal(integer)    FUNCTION       CREATE FUNCTION public.eliminarpersonal(picsctbpersonalid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare band Boolean;
begin
UPDATE csctbpersonal
SET estadop = false, fechaelipersonal= current_timestamp 
where csctbpersonalid =$1;
band=true;
return band;
end;$_$;
 B   DROP FUNCTION public.eliminarpersonal(picsctbpersonalid integer);
       public          postgres    false    5            C           1255    58802    enfermedades()    FUNCTION     �  CREATE FUNCTION public.enfermedades(OUT pcsctbenfermedadid integer, OUT pnom_emfermedad character varying, OUT pcod_enfermedad character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT 
  csctbenfermedad.csctbenfermedadid, 
  csctbenfermedad.nom_enfermedad, 
  csctbenfermedad.cog_enfermedad
FROM 
  public.csctbenfermedad

order by nom_enfermedad asc;

end;$$;
 �   DROP FUNCTION public.enfermedades(OUT pcsctbenfermedadid integer, OUT pnom_emfermedad character varying, OUT pcod_enfermedad character varying);
       public          postgres    false    5            �           1255    58803    evaluacion_busqueda(integer)    FUNCTION     �  CREATE FUNCTION public.evaluacion_busqueda(picsctbfamiliaid integer, OUT pnom_evaluacion character varying, OUT pfecha_evaluacion date, OUT pfamiliaid integer, OUT pevaluacionid integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbevaluacion.nom_evaluacion, 
  csctbevaluariesgo.fecha_evaluacion, 
  csctbfamilia.csctbfamiliaid, 
  csctbevaluariesgo.csctbevaluacionid
FROM 
  public.csctbfamilia, 
  public.csctbevaluacion, 
  public.csctbevaluariesgo
WHERE 
  csctbevaluacion.csctbevaluacionid = csctbevaluariesgo.csctbevaluacionid AND
  csctbevaluariesgo.csctbfamiliaid = csctbfamilia.csctbfamiliaid and 
  csctbfamilia.id_jefe_hogar=$1;
end;$_$;
 �   DROP FUNCTION public.evaluacion_busqueda(picsctbfamiliaid integer, OUT pnom_evaluacion character varying, OUT pfecha_evaluacion date, OUT pfamiliaid integer, OUT pevaluacionid integer);
       public          postgres    false    5            �           1255    58804 =   insertarusuario(character varying, boolean, integer, integer)    FUNCTION     �  CREATE FUNCTION public.insertarusuario(pipass character varying, piestado_login boolean, picsctbrolesid integer, csctbpersonalid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ declare band boolean;
begin
INSERT INTO public.csctblogin(
	pass, estado_login, csctbrutasrolesid, csctbpersonalid, fechacreacion)
VALUES ($1, $2, $3, $4, current_timestamp);

band=true;
	return band;
end;
$_$;
 �   DROP FUNCTION public.insertarusuario(pipass character varying, piestado_login boolean, picsctbrolesid integer, csctbpersonalid integer);
       public          postgres    false    5            �           1255    58805    opbarrios()    FUNCTION     +  CREATE FUNCTION public.opbarrios(OUT pcsctbbarriosid integer, OUT pnom_barrios character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbbarriosid, nom_barrio

FROM public.csctbbarrioschambo
where nom_barrio IS NOT null

order by nom_barrio asc;

end;$$;
 a   DROP FUNCTION public.opbarrios(OUT pcsctbbarriosid integer, OUT pnom_barrios character varying);
       public          postgres    false    5            �           1255    58806    opcionesvulnerable()    FUNCTION     (  CREATE FUNCTION public.opcionesvulnerable(OUT pcsctbvulnerableid integer, OUT pnom_vulnerable character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbvulnerableid, nom_vulnerable

FROM public.csctbvulnerable

order by csctbvulnerableid asc;

end;$$;
 p   DROP FUNCTION public.opcionesvulnerable(OUT pcsctbvulnerableid integer, OUT pnom_vulnerable character varying);
       public          postgres    false    5            �           1255    58807 	   opetnia()    FUNCTION     �   CREATE FUNCTION public.opetnia(OUT pcsctbetniaid integer, OUT pnometnia character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbetniaid, nom_etnia

FROM public.csctbetnia

order by nom_etnia asc;

end;$$;
 Z   DROP FUNCTION public.opetnia(OUT pcsctbetniaid integer, OUT pnometnia character varying);
       public          postgres    false    5            �           1255    58808    opnacioetnica()    FUNCTION     n  CREATE FUNCTION public.opnacioetnica(OUT pcsctbnacionalidadid integer, OUT pnom_nacionalidad character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbnacionalidadetnicaid, nom_nacionalidadetnica

FROM public.csctbnacionalidadetnica

where nom_nacionalidadetnica IS NOT null

order by nom_nacionalidadetnica asc;

end;$$;
 o   DROP FUNCTION public.opnacioetnica(OUT pcsctbnacionalidadid integer, OUT pnom_nacionalidad character varying);
       public          postgres    false    5            �           1255    58809    opprioritario()    FUNCTION     '  CREATE FUNCTION public.opprioritario(OUT pcsctbprioritario integer, OUT pnom_prioritario character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbprioritarioid, nom_prioritario

FROM public.csctbprioritario

order by csctbprioritarioid asc;

end;$$;
 k   DROP FUNCTION public.opprioritario(OUT pcsctbprioritario integer, OUT pnom_prioritario character varying);
       public          postgres    false    5            �           1255    58810    oppueblos()    FUNCTION     (  CREATE FUNCTION public.oppueblos(OUT pcsctbpueblosid integer, OUT pnompueblos character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbpueblosid, nom_pueblos

FROM public.csctbpueblos

WHERE nom_pueblos IS NOT null

order by nom_pueblos asc;

end;$$;
 `   DROP FUNCTION public.oppueblos(OUT pcsctbpueblosid integer, OUT pnompueblos character varying);
       public          postgres    false    5            �           1255    58811    oprambiental()    FUNCTION     ,  CREATE FUNCTION public.oprambiental(OUT pcsctbrambientalesid integer, OUT pnom_rambientales character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbrambientalesid, nom_rambiental

FROM public.csctbrambientales

order by csctbrambientalesid asc;

end;$$;
 n   DROP FUNCTION public.oprambiental(OUT pcsctbrambientalesid integer, OUT pnom_rambientales character varying);
       public          postgres    false    5            �           1255    58812    opriobstetrico(integer)    FUNCTION     �  CREATE FUNCTION public.opriobstetrico(picsctbtiporiesgoid integer, OUT pcsctbriobstetricoid integer, OUT pnom_riesgo character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbriesgobste.csctbriesgobsteid, 
  csctbriesgobste.nom_rieobste
FROM 
  public.csctbriesgobste, 
  public.csctbtiporiesgo
WHERE 
  csctbtiporiesgo.csctbtiporiesgoid = csctbriesgobste.csctbtiporiesgoid and
  csctbtiporiesgo.csctbtiporiesgoid = $1
order by csctbriesgobsteid asc;

end;$_$;
 �   DROP FUNCTION public.opriobstetrico(picsctbtiporiesgoid integer, OUT pcsctbriobstetricoid integer, OUT pnom_riesgo character varying);
       public          postgres    false    5            �           1255    58813    riesgosfam()    FUNCTION       CREATE FUNCTION public.riesgosfam(OUT pcsctbevaluacionid integer, OUT pnom_riesgo character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$ begin
return query
SELECT csctbevaluacionid, nom_evaluacion

FROM public.csctbevaluacion

order by csctbevaluacionid asc;

end;$$;
 d   DROP FUNCTION public.riesgosfam(OUT pcsctbevaluacionid integer, OUT pnom_riesgo character varying);
       public          postgres    false    5            �           1255    58814 "   riesgossocioeconomicosbus(integer)    FUNCTION     �  CREATE FUNCTION public.riesgossocioeconomicosbus(picsctbfamiliaid integer, OUT pcsctbfamiliaid integer, OUT pcsctbinstruccionid integer, OUT pnom_rsocio character varying, OUT pfecha_rsocioecomico date) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  cf.csctbfamiliaid, 
  cf.csctbinstruccionid,  
  crs.nom_rsocio, 
  rsf.fecha_rsocioeconomico
FROM 
  public.csctbfamilia AS cf
INNER JOIN 
  public.csctbrsociofamilia AS rsf ON cf.csctbfamiliaid = rsf.csctbfamiliaid
INNER JOIN 
  public.csctbriesgosocio AS crs ON rsf.csctbrsocioid = crs.csctbrsocioid
INNER JOIN 
  public.csctbinstruccion AS ci ON cf.csctbinstruccionid = ci.csctbinstruccionid
WHERE 
  cf.id_jefe_hogar = $1;

end;$_$;
 �   DROP FUNCTION public.riesgossocioeconomicosbus(picsctbfamiliaid integer, OUT pcsctbfamiliaid integer, OUT pcsctbinstruccionid integer, OUT pnom_rsocio character varying, OUT pfecha_rsocioecomico date);
       public          postgres    false    5            �           1255    58815 !   riesgosvivienda_busqueda(integer)    FUNCTION     J  CREATE FUNCTION public.riesgosvivienda_busqueda(picsctbfamiliaid integer, OUT nom_tratamiento character varying, OUT pcsctbfamiliaid integer, OUT peliminanbasura character varying, OUT pservicio_higienico character varying, OUT pconviveanimales boolean, OUT pfecharegistro date) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbvivienda.tratamientoagua, 
  csctbfamilia.csctbfamiliaid, 
  csctbvivienda.basura, 
  csctbvivienda.servicio_higienico, 
  csctbriesgoavivienda.conv_animales,
  csctbvivienda.fecha_registrovivienda
FROM 
  public.csctbvivienda, 
  public.csctbfamilia, 
  public.csctbriesgoavivienda
WHERE 
  csctbvivienda.csctbfamiliaid = csctbfamilia.csctbfamiliaid AND
  csctbriesgoavivienda.csctbviviendaid = csctbvivienda.csctbviviendaid AND
  csctbfamilia.csctbfamiliaid = $1;

end;$_$;
   DROP FUNCTION public.riesgosvivienda_busqueda(picsctbfamiliaid integer, OUT nom_tratamiento character varying, OUT pcsctbfamiliaid integer, OUT peliminanbasura character varying, OUT pservicio_higienico character varying, OUT pconviveanimales boolean, OUT pfecharegistro date);
       public          postgres    false    5            �           1255    58816    vacunasintegrante(integer)    FUNCTION     �  CREATE FUNCTION public.vacunasintegrante(picsctbfamiliaid integer, OUT pcsctbvacunasfamiliaid integer, OUT pcsctbvacunasid integer, OUT pnomvacuna character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$ begin
return query
SELECT 
  csctbvacunafamilia.csctbvacunafamiliaid,
  csctbvacunas.csctbvacunasid, 
  csctbvacunas.nom_vacuna
FROM 
  public.csctbfamilia, 
  public.csctbvacunafamilia, 
  public.csctbvacunas
WHERE 
  csctbfamilia.csctbfamiliaid = csctbvacunafamilia.csctbfamiliaid AND
  csctbvacunas.csctbvacunasid = csctbvacunafamilia.csctbvacunasid and
  csctbfamilia.csctbfamiliaid = $1 and csctbvacunafamilia.estado_vacuna = true

order by csctbvacunafamiliaid asc;

end;$_$;
 �   DROP FUNCTION public.vacunasintegrante(picsctbfamiliaid integer, OUT pcsctbvacunasfamiliaid integer, OUT pcsctbvacunasid integer, OUT pnomvacuna character varying);
       public          postgres    false    5            �            1259    58817    csctbgenogramas    TABLE     �   CREATE TABLE public.csctbgenogramas (
    csctbgenogramaid integer NOT NULL,
    imagen character varying(100),
    fecha_add_geno date,
    id_jefe_hogar integer
);
 #   DROP TABLE public.csctbgenogramas;
       public         heap    postgres    false    5            �            1259    58820 5   csctbHistorialGenograma_idcsctbHistorialGenograma_seq    SEQUENCE       ALTER TABLE public.csctbgenogramas ALTER COLUMN csctbgenogramaid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."csctbHistorialGenograma_idcsctbHistorialGenograma_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    214            �            1259    58821    csctbbarrioschambo    TABLE     �   CREATE TABLE public.csctbbarrioschambo (
    csctbbarriosid integer NOT NULL,
    nom_barrio character varying,
    nom_eaisbarrios character varying
);
 &   DROP TABLE public.csctbbarrioschambo;
       public         heap    postgres    false    5            �            1259    58826 %   csctbbarrioschambo_csctbbarriosid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbbarrioschambo_csctbbarriosid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbbarrioschambo_csctbbarriosid_seq;
       public          postgres    false    216    5            �           0    0 %   csctbbarrioschambo_csctbbarriosid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbbarrioschambo_csctbbarriosid_seq OWNED BY public.csctbbarrioschambo.csctbbarriosid;
          public          postgres    false    217            -           1259    59018    csctbdiagnosticofamiliar    TABLE     �  CREATE TABLE public.csctbdiagnosticofamiliar (
    csctbdiagnosticoid integer NOT NULL,
    tipo_familia character varying(100),
    ciclo_vital character varying(100),
    primer_hijo boolean,
    hijo_edad_preescolar boolean,
    hijo_edad_escolar boolean,
    hijo_edad_adolescente boolean,
    hijo_edad_adulta boolean,
    apgar_familiar character varying(100),
    id_jefe_hogar integer,
    observacion text
);
 ,   DROP TABLE public.csctbdiagnosticofamiliar;
       public         heap    postgres    false    5            �            1259    58827    csctbdiscapacidad    TABLE     �   CREATE TABLE public.csctbdiscapacidad (
    csctbdiscapacidadid integer NOT NULL,
    nom_discapacidad character varying(150)
);
 %   DROP TABLE public.csctbdiscapacidad;
       public         heap    postgres    false    5            �            1259    58830 )   csctbdiscapacidad_csctbdiscapacidadid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbdiscapacidad_csctbdiscapacidadid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.csctbdiscapacidad_csctbdiscapacidadid_seq;
       public          postgres    false    218    5            �           0    0 )   csctbdiscapacidad_csctbdiscapacidadid_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.csctbdiscapacidad_csctbdiscapacidadid_seq OWNED BY public.csctbdiscapacidad.csctbdiscapacidadid;
          public          postgres    false    219            �            1259    58831    csctbdiscariesgo    TABLE     �   CREATE TABLE public.csctbdiscariesgo (
    csctbdiscariesgoid integer NOT NULL,
    csctbdiscapacidadid integer,
    csctbriesgosid integer
);
 $   DROP TABLE public.csctbdiscariesgo;
       public         heap    postgres    false    5            �            1259    58834 '   csctbdiscariesgo_csctbdiscariesgoid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbdiscariesgo_csctbdiscariesgoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.csctbdiscariesgo_csctbdiscariesgoid_seq;
       public          postgres    false    220    5            �           0    0 '   csctbdiscariesgo_csctbdiscariesgoid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.csctbdiscariesgo_csctbdiscariesgoid_seq OWNED BY public.csctbdiscariesgo.csctbdiscariesgoid;
          public          postgres    false    221            �            1259    58835    csctbedades    TABLE     o   CREATE TABLE public.csctbedades (
    csctbedadesid integer NOT NULL,
    rango_edad character varying(150)
);
    DROP TABLE public.csctbedades;
       public         heap    postgres    false    5            �            1259    58838    csctbedades_csctbedadesid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbedades_csctbedadesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.csctbedades_csctbedadesid_seq;
       public          postgres    false    222    5            �           0    0    csctbedades_csctbedadesid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.csctbedades_csctbedadesid_seq OWNED BY public.csctbedades.csctbedadesid;
          public          postgres    false    223            �            1259    58839    csctbembarazadas    TABLE       CREATE TABLE public.csctbembarazadas (
    csctbembarazadasid integer NOT NULL,
    csctbfamiliaid integer,
    fecha_menstruacion date,
    fecha_parto date,
    control_menos20 integer,
    control_mas20 integer,
    esquema_vacunacion boolean,
    ante_gineco integer,
    ante_patologicos character varying(250),
    semanas_gestacion integer,
    gestas integer,
    partos integer,
    abortos integer,
    cesarias integer,
    tipo_aborto character varying(50),
    n_abortos_espontaneos integer,
    n_abortos_inducidos integer
);
 $   DROP TABLE public.csctbembarazadas;
       public         heap    postgres    false    5            �            1259    58842 '   csctbembarazadas_csctbembarazadasid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbembarazadas_csctbembarazadasid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.csctbembarazadas_csctbembarazadasid_seq;
       public          postgres    false    5    224            �           0    0 '   csctbembarazadas_csctbembarazadasid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.csctbembarazadas_csctbembarazadasid_seq OWNED BY public.csctbembarazadas.csctbembarazadasid;
          public          postgres    false    225            �            1259    58843    csctbenferfam    TABLE     �   CREATE TABLE public.csctbenferfam (
    csctbenfermeriesgoid integer NOT NULL,
    csctbenfermedadid integer,
    csctbfamiliaid integer,
    fecha_add_enfer date,
    fecha_elimi_enfer date,
    estado_enfermedad boolean
);
 !   DROP TABLE public.csctbenferfam;
       public         heap    postgres    false    5            �            1259    58846    csctbenfermedad    TABLE     �   CREATE TABLE public.csctbenfermedad (
    csctbenfermedadid integer NOT NULL,
    nom_enfermedad character varying(250),
    cog_enfermedad character varying(10)
);
 #   DROP TABLE public.csctbenfermedad;
       public         heap    postgres    false    5            �            1259    58849 %   csctbenfermedad_csctbenfermedadid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbenfermedad_csctbenfermedadid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbenfermedad_csctbenfermedadid_seq;
       public          postgres    false    5    227            �           0    0 %   csctbenfermedad_csctbenfermedadid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbenfermedad_csctbenfermedadid_seq OWNED BY public.csctbenfermedad.csctbenfermedadid;
          public          postgres    false    228            �            1259    58850 +   csctbenfermeriesgo_csctbenfermeriesgoid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbenfermeriesgo_csctbenfermeriesgoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.csctbenfermeriesgo_csctbenfermeriesgoid_seq;
       public          postgres    false    5    226            �           0    0 +   csctbenfermeriesgo_csctbenfermeriesgoid_seq    SEQUENCE OWNED BY     v   ALTER SEQUENCE public.csctbenfermeriesgo_csctbenfermeriesgoid_seq OWNED BY public.csctbenferfam.csctbenfermeriesgoid;
          public          postgres    false    229            �            1259    58851 
   csctbetnia    TABLE     g   CREATE TABLE public.csctbetnia (
    csctbetniaid integer NOT NULL,
    nom_etnia character varying
);
    DROP TABLE public.csctbetnia;
       public         heap    postgres    false    5            �            1259    58856    csctbetnia_csctbetniaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbetnia_csctbetniaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.csctbetnia_csctbetniaid_seq;
       public          postgres    false    230    5            �           0    0    csctbetnia_csctbetniaid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.csctbetnia_csctbetniaid_seq OWNED BY public.csctbetnia.csctbetniaid;
          public          postgres    false    231            �            1259    58857    csctbevaluacion    TABLE     {   CREATE TABLE public.csctbevaluacion (
    csctbevaluacionid integer NOT NULL,
    nom_evaluacion character varying(250)
);
 #   DROP TABLE public.csctbevaluacion;
       public         heap    postgres    false    5            �            1259    58860 %   csctbevaluacion_csctbevaluacionid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbevaluacion_csctbevaluacionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbevaluacion_csctbevaluacionid_seq;
       public          postgres    false    232    5            �           0    0 %   csctbevaluacion_csctbevaluacionid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbevaluacion_csctbevaluacionid_seq OWNED BY public.csctbevaluacion.csctbevaluacionid;
          public          postgres    false    233            �            1259    58861    csctbevaluacionfamilia    TABLE     �  CREATE TABLE public.csctbevaluacionfamilia (
    csctbevaluacionfamiliaid integer NOT NULL,
    vacuincomnum integer,
    vacuincomtxt character varying,
    persomalnunum integer,
    persomalnutxt character varying,
    persoenfermenum integer,
    persoenfermetxt character varying,
    persoenfecatnum integer,
    persoenfecatxt character varying,
    embariesgonum integer,
    embariesgotxt character varying,
    persondiscanum integer,
    persondiscatxt character varying,
    personpromennum integer,
    personpromentxt character varying,
    consuagua character varying,
    txtconsuagua character varying,
    elibasura character varying,
    txtelibasura character varying,
    eleliquidos character varying,
    txteleliquidos character varying,
    impactoindu character varying,
    txtimpactoindu character varying,
    anidomiciolio character varying,
    txtanidomicilio character varying,
    desempleo character varying,
    txtdesempleo character varying,
    analfabetismo character varying,
    txtanalfabetismo character varying,
    desestructuracion character varying,
    txtdesestructuracion character varying,
    violencia character varying,
    txtviolencia character varying,
    malascondi character varying,
    txtmalascondi character varying,
    haciamiento character varying,
    txthaciamiento character varying,
    vulne_obser character varying,
    csctbfamiliaid integer,
    fecha_registro date,
    estado_evolucion boolean
);
 *   DROP TABLE public.csctbevaluacionfamilia;
       public         heap    postgres    false    5            �            1259    58866 3   csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq;
       public          postgres    false    234    5            �           0    0 3   csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq OWNED BY public.csctbevaluacionfamilia.csctbevaluacionfamiliaid;
          public          postgres    false    235            �            1259    58867    csctbevaluariesgo    TABLE       CREATE TABLE public.csctbevaluariesgo (
    csctbevaluariesgoid integer NOT NULL,
    csctbevaluacionid integer,
    csctbfamiliaid integer,
    obser_evalua character varying(500),
    fecha_evaluacion date,
    fecha_elimi_riesgo date,
    estado_riesgo boolean
);
 %   DROP TABLE public.csctbevaluariesgo;
       public         heap    postgres    false    5            �            1259    58872 )   csctbevaluariesgo_csctbevaluariesgoid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbevaluariesgo_csctbevaluariesgoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.csctbevaluariesgo_csctbevaluariesgoid_seq;
       public          postgres    false    236    5            �           0    0 )   csctbevaluariesgo_csctbevaluariesgoid_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.csctbevaluariesgo_csctbevaluariesgoid_seq OWNED BY public.csctbevaluariesgo.csctbevaluariesgoid;
          public          postgres    false    237            �            1259    58873    csctbevolucionfamilia    TABLE     �  CREATE TABLE public.csctbevolucionfamilia (
    csctbevolucionfamiliaid integer NOT NULL,
    riesgo character varying,
    comprofamilia character varying,
    comprosalud character varying,
    fecha_evaluacion date,
    cumple boolean,
    no_cumple boolean,
    parcialmente boolean,
    causas_incumplimiento character varying,
    csctbresponsableid integer,
    csctbfamiliaid integer
);
 )   DROP TABLE public.csctbevolucionfamilia;
       public         heap    postgres    false    5            �            1259    58878 1   csctbevolucionfamilia_csctbevolucionfamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbevolucionfamilia_csctbevolucionfamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.csctbevolucionfamilia_csctbevolucionfamiliaid_seq;
       public          postgres    false    5    238            �           0    0 1   csctbevolucionfamilia_csctbevolucionfamiliaid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbevolucionfamilia_csctbevolucionfamiliaid_seq OWNED BY public.csctbevolucionfamilia.csctbevolucionfamiliaid;
          public          postgres    false    239            �            1259    58879    csctbfamilia    TABLE     #  CREATE TABLE public.csctbfamilia (
    csctbfamiliaid integer NOT NULL,
    csctbocupacionid integer,
    csctbinstruccionid integer,
    csctbparentescoid integer,
    cedula_fam character varying(10),
    nom_fam character varying(150),
    ape_fam character varying(150),
    fecha_na_fam date,
    anios integer,
    meses integer,
    dias integer,
    genero character varying(150),
    control_bucal boolean,
    observacion character varying(250),
    estado_fam boolean,
    id_jefe_hogar integer,
    fecreacion_fam date,
    feelimini_fam date,
    jefe_hogar boolean,
    estado_civil character varying,
    csctbetniaid integer,
    csctbnacionalidadid integer,
    csctbpueblosid integer,
    fallecido boolean,
    informante boolean,
    nucleo_familiar boolean,
    fecha_union date
);
     DROP TABLE public.csctbfamilia;
       public         heap    postgres    false    5            �            1259    58884    csctbfamilia_csctbfamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbfamilia_csctbfamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.csctbfamilia_csctbfamiliaid_seq;
       public          postgres    false    240    5            �           0    0    csctbfamilia_csctbfamiliaid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.csctbfamilia_csctbfamiliaid_seq OWNED BY public.csctbfamilia.csctbfamiliaid;
          public          postgres    false    241            �            1259    58885 
   csctbficha    TABLE     �   CREATE TABLE public.csctbficha (
    csctbfichaid integer NOT NULL,
    csctbfamiliaid integer,
    num_ficha integer NOT NULL,
    ficha_creacion date,
    ficha_eliminacion date
);
    DROP TABLE public.csctbficha;
       public         heap    postgres    false    5            �            1259    58888    csctbficha_csctbfichaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbficha_csctbfichaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.csctbficha_csctbfichaid_seq;
       public          postgres    false    242    5            �           0    0    csctbficha_csctbfichaid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.csctbficha_csctbfichaid_seq OWNED BY public.csctbficha.csctbfichaid;
          public          postgres    false    243            �            1259    58889    csctbficha_num_ficha_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbficha_num_ficha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.csctbficha_num_ficha_seq;
       public          postgres    false    5    242            �           0    0    csctbficha_num_ficha_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.csctbficha_num_ficha_seq OWNED BY public.csctbficha.num_ficha;
          public          postgres    false    244            �            1259    58890    csctbinstruccion    TABLE     ~   CREATE TABLE public.csctbinstruccion (
    csctbinstruccionid integer NOT NULL,
    nom_instruccion character varying(250)
);
 $   DROP TABLE public.csctbinstruccion;
       public         heap    postgres    false    5            �            1259    58893 '   csctbinstruccion_csctbinstruccionid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbinstruccion_csctbinstruccionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.csctbinstruccion_csctbinstruccionid_seq;
       public          postgres    false    245    5            �           0    0 '   csctbinstruccion_csctbinstruccionid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.csctbinstruccion_csctbinstruccionid_seq OWNED BY public.csctbinstruccion.csctbinstruccionid;
          public          postgres    false    246            �            1259    58894 
   csctblogin    TABLE     �   CREATE TABLE public.csctblogin (
    csctbloginid integer NOT NULL,
    pass character varying(50),
    estado_login boolean,
    csctbrutasrolesid integer,
    csctbpersonalid integer,
    fechaeliusuario date,
    fechacreacion date
);
    DROP TABLE public.csctblogin;
       public         heap    postgres    false    5            �            1259    58897    csctblogin_csctbloginid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctblogin_csctbloginid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.csctblogin_csctbloginid_seq;
       public          postgres    false    247    5            �           0    0    csctblogin_csctbloginid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.csctblogin_csctbloginid_seq OWNED BY public.csctblogin.csctbloginid;
          public          postgres    false    248            �            1259    58898    csctbmortalidad    TABLE     �  CREATE TABLE public.csctbmortalidad (
    csctbmortalidadid integer NOT NULL,
    csctbparentescoid integer,
    csctbjefefamid integer,
    nombres_mortalidad character varying(250),
    fecha_fallecimiento date,
    causa_nodefi character varying(250),
    apellidos_mortalidad character varying(250),
    anios integer,
    meses integer,
    dias integer,
    estado_mortalidad boolean
);
 #   DROP TABLE public.csctbmortalidad;
       public         heap    postgres    false    5            �            1259    58903 %   csctbmortalidad_csctbmortalidadid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbmortalidad_csctbmortalidadid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbmortalidad_csctbmortalidadid_seq;
       public          postgres    false    249    5            �           0    0 %   csctbmortalidad_csctbmortalidadid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbmortalidad_csctbmortalidadid_seq OWNED BY public.csctbmortalidad.csctbmortalidadid;
          public          postgres    false    250            �            1259    58904    csctbmortenfermedad    TABLE     �   CREATE TABLE public.csctbmortenfermedad (
    csctbmortenfermedadid integer NOT NULL,
    csctbmortalidadid integer,
    csctbenfermedadid integer,
    ob_mortenfer character varying(500)
);
 '   DROP TABLE public.csctbmortenfermedad;
       public         heap    postgres    false    5            �            1259    58909 -   csctbmortenfermedad_csctbmortenfermedadid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbmortenfermedad_csctbmortenfermedadid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.csctbmortenfermedad_csctbmortenfermedadid_seq;
       public          postgres    false    251    5            �           0    0 -   csctbmortenfermedad_csctbmortenfermedadid_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.csctbmortenfermedad_csctbmortenfermedadid_seq OWNED BY public.csctbmortenfermedad.csctbmortenfermedadid;
          public          postgres    false    252            �            1259    58910    csctbnacionalidadetnica    TABLE     �   CREATE TABLE public.csctbnacionalidadetnica (
    csctbnacionalidadetnicaid integer NOT NULL,
    nom_nacionalidadetnica character varying
);
 +   DROP TABLE public.csctbnacionalidadetnica;
       public         heap    postgres    false    5            �            1259    58915 5   csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE public.csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq;
       public          postgres    false    5    253            �           0    0 5   csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq OWNED BY public.csctbnacionalidadetnica.csctbnacionalidadetnicaid;
          public          postgres    false    254            �            1259    58916    csctbocupacion    TABLE     �   CREATE TABLE public.csctbocupacion (
    csctbocupacionid integer NOT NULL,
    cod_ocupacion integer,
    nom_ocupacion character varying(250)
);
 "   DROP TABLE public.csctbocupacion;
       public         heap    postgres    false    5                        1259    58919 #   csctbocupacion_csctbocupacionid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbocupacion_csctbocupacionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.csctbocupacion_csctbocupacionid_seq;
       public          postgres    false    5    255            �           0    0 #   csctbocupacion_csctbocupacionid_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.csctbocupacion_csctbocupacionid_seq OWNED BY public.csctbocupacion.csctbocupacionid;
          public          postgres    false    256                       1259    58920    csctbparentesco    TABLE     {   CREATE TABLE public.csctbparentesco (
    csctbparentescoid integer NOT NULL,
    nom_parentesco character varying(150)
);
 #   DROP TABLE public.csctbparentesco;
       public         heap    postgres    false    5                       1259    58923 %   csctbparentesco_csctbparentescoid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbparentesco_csctbparentescoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbparentesco_csctbparentescoid_seq;
       public          postgres    false    257    5            �           0    0 %   csctbparentesco_csctbparentescoid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbparentesco_csctbparentescoid_seq OWNED BY public.csctbparentesco.csctbparentescoid;
          public          postgres    false    258                       1259    58924    csctbpersonal    TABLE     O  CREATE TABLE public.csctbpersonal (
    csctbpersonalid integer NOT NULL,
    cedula character varying(10),
    nombresp character varying(150),
    apellido_pat character varying(150),
    apellido_mat character varying(150),
    telefeno character varying(10) DEFAULT 0,
    email character varying(150),
    direccion character varying(150),
    eais_medico character varying(10),
    fecha_nacimiento date,
    fecha_ingreso date,
    fecha_salida date,
    obserp character varying(500),
    estadop boolean DEFAULT true,
    fechaelipersonal date,
    profesion character varying(150),
    realizaitinerancia boolean,
    areatrabajo character varying(150),
    modalidad character varying(150),
    horastrabajo integer,
    tipocontrato character varying(150),
    pass character varying(50),
    rolusu integer,
    fechacreacion date
);
 !   DROP TABLE public.csctbpersonal;
       public         heap    postgres    false    5                       1259    58931 !   csctbpersonal_csctbpersonalid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbpersonal_csctbpersonalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.csctbpersonal_csctbpersonalid_seq;
       public          postgres    false    259    5            �           0    0 !   csctbpersonal_csctbpersonalid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.csctbpersonal_csctbpersonalid_seq OWNED BY public.csctbpersonal.csctbpersonalid;
          public          postgres    false    260                       1259    58932    csctbprioritario    TABLE     ~   CREATE TABLE public.csctbprioritario (
    csctbprioritarioid integer NOT NULL,
    nom_prioritario character varying(150)
);
 $   DROP TABLE public.csctbprioritario;
       public         heap    postgres    false    5                       1259    58935 '   csctbprioritario_csctbprioritarioid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbprioritario_csctbprioritarioid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.csctbprioritario_csctbprioritarioid_seq;
       public          postgres    false    5    261            �           0    0 '   csctbprioritario_csctbprioritarioid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.csctbprioritario_csctbprioritarioid_seq OWNED BY public.csctbprioritario.csctbprioritarioid;
          public          postgres    false    262                       1259    58936    csctbprioritariofamilia    TABLE     �   CREATE TABLE public.csctbprioritariofamilia (
    csctbprioritariofamiliaid integer NOT NULL,
    csctbprioritarioid integer,
    csctbfamiliaid integer,
    fecha_add_prioritario date,
    fecha_elimi_prioritario date,
    estado_prioritario boolean
);
 +   DROP TABLE public.csctbprioritariofamilia;
       public         heap    postgres    false    5                       1259    58939 5   csctbprioritariofamilia_csctbprioritariofamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbprioritariofamilia_csctbprioritariofamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE public.csctbprioritariofamilia_csctbprioritariofamiliaid_seq;
       public          postgres    false    263    5            �           0    0 5   csctbprioritariofamilia_csctbprioritariofamiliaid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbprioritariofamilia_csctbprioritariofamiliaid_seq OWNED BY public.csctbprioritariofamilia.csctbprioritariofamiliaid;
          public          postgres    false    264            	           1259    58940    csctbprofesionalresponsable    TABLE     �   CREATE TABLE public.csctbprofesionalresponsable (
    csctbprofesionalid integer NOT NULL,
    csctbpersonalid integer,
    fecha_visita date,
    hora_visita time with time zone,
    csctbfamiliaid integer
);
 /   DROP TABLE public.csctbprofesionalresponsable;
       public         heap    postgres    false    5            
           1259    58943 2   csctbprofesionalresponsable_csctbprofesionalid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbprofesionalresponsable_csctbprofesionalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.csctbprofesionalresponsable_csctbprofesionalid_seq;
       public          postgres    false    5    265            �           0    0 2   csctbprofesionalresponsable_csctbprofesionalid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbprofesionalresponsable_csctbprofesionalid_seq OWNED BY public.csctbprofesionalresponsable.csctbprofesionalid;
          public          postgres    false    266                       1259    58944    csctbpueblos    TABLE     m   CREATE TABLE public.csctbpueblos (
    csctbpueblosid integer NOT NULL,
    nom_pueblos character varying
);
     DROP TABLE public.csctbpueblos;
       public         heap    postgres    false    5                       1259    58949    csctbpueblos_csctbpueblosid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbpueblos_csctbpueblosid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.csctbpueblos_csctbpueblosid_seq;
       public          postgres    false    267    5            �           0    0    csctbpueblos_csctbpueblosid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.csctbpueblos_csctbpueblosid_seq OWNED BY public.csctbpueblos.csctbpueblosid;
          public          postgres    false    268                       1259    58950    csctbrambientales    TABLE     z   CREATE TABLE public.csctbrambientales (
    csctbrambientalesid integer NOT NULL,
    nom_rambiental character varying
);
 %   DROP TABLE public.csctbrambientales;
       public         heap    postgres    false    5                       1259    58955 )   csctbrambientales_csctbrambientalesid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbrambientales_csctbrambientalesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.csctbrambientales_csctbrambientalesid_seq;
       public          postgres    false    269    5            �           0    0 )   csctbrambientales_csctbrambientalesid_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.csctbrambientales_csctbrambientalesid_seq OWNED BY public.csctbrambientales.csctbrambientalesid;
          public          postgres    false    270                       1259    58956    csctbrambientalfamilia    TABLE     �   CREATE TABLE public.csctbrambientalfamilia (
    csctbrambientalfamiliaid integer NOT NULL,
    csctbrambientalesid integer,
    csctbfamiliaid integer,
    fecha_rambiental date,
    fecha_elimi_rambiental date,
    estado_rambiental boolean
);
 *   DROP TABLE public.csctbrambientalfamilia;
       public         heap    postgres    false    5                       1259    58959 3   csctbrambientalfamilia_csctbrambientalfamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbrambientalfamilia_csctbrambientalfamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.csctbrambientalfamilia_csctbrambientalfamiliaid_seq;
       public          postgres    false    271    5            �           0    0 3   csctbrambientalfamilia_csctbrambientalfamiliaid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbrambientalfamilia_csctbrambientalfamiliaid_seq OWNED BY public.csctbrambientalfamilia.csctbrambientalfamiliaid;
          public          postgres    false    272                       1259    58960    csctbrbiolofamilia    TABLE     �   CREATE TABLE public.csctbrbiolofamilia (
    csctbrbiolofamiliaid integer NOT NULL,
    csctbriesgobioloid integer NOT NULL,
    csctbfamiliaid integer,
    fecha_rbiologico date,
    fecha_elimi_rbiologico date,
    estado_rbiologico boolean
);
 &   DROP TABLE public.csctbrbiolofamilia;
       public         heap    postgres    false    5                       1259    58963 +   csctbrbiolofamilia_csctbrbiolofamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbrbiolofamilia_csctbrbiolofamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.csctbrbiolofamilia_csctbrbiolofamiliaid_seq;
       public          postgres    false    273    5            �           0    0 +   csctbrbiolofamilia_csctbrbiolofamiliaid_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.csctbrbiolofamilia_csctbrbiolofamiliaid_seq OWNED BY public.csctbrbiolofamilia.csctbrbiolofamiliaid;
          public          postgres    false    274                       1259    58964    csctbriesgoa    TABLE     n   CREATE TABLE public.csctbriesgoa (
    csctbriesgoaid integer NOT NULL,
    riesgoa character varying(250)
);
     DROP TABLE public.csctbriesgoa;
       public         heap    postgres    false    5                       1259    58967    csctbriesgoa_csctbriesgoaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgoa_csctbriesgoaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.csctbriesgoa_csctbriesgoaid_seq;
       public          postgres    false    5    275            �           0    0    csctbriesgoa_csctbriesgoaid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.csctbriesgoa_csctbriesgoaid_seq OWNED BY public.csctbriesgoa.csctbriesgoaid;
          public          postgres    false    276                       1259    58968    csctbriesgoavivienda    TABLE     v  CREATE TABLE public.csctbriesgoavivienda (
    csctbriesgoavivid integer NOT NULL,
    ries_agresividad boolean,
    ries_insalubridad boolean,
    ries_cantidad boolean,
    conv_animales boolean,
    tipo_domestico boolean,
    tipo_granja boolean,
    tipo_silvestre boolean,
    dome_perro boolean,
    dome_gato boolean,
    perro_peque boolean,
    perro_medio boolean,
    perro_grande boolean,
    num_gatos integer,
    ries_vi1 boolean,
    ries_vi2 boolean,
    ries_vi3 boolean,
    ries_vi4 boolean,
    csctbviviendaid integer,
    vectores boolean,
    provectores character varying(250),
    vulnerable boolean
);
 (   DROP TABLE public.csctbriesgoavivienda;
       public         heap    postgres    false    5                       1259    58971 *   csctbriesgoavivienda_csctbriesgoavivid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgoavivienda_csctbriesgoavivid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.csctbriesgoavivienda_csctbriesgoavivid_seq;
       public          postgres    false    277    5            �           0    0 *   csctbriesgoavivienda_csctbriesgoavivid_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.csctbriesgoavivienda_csctbriesgoavivid_seq OWNED BY public.csctbriesgoavivienda.csctbriesgoavivid;
          public          postgres    false    278                       1259    58972    csctbriesgobiolo    TABLE     �   CREATE TABLE public.csctbriesgobiolo (
    csctbriesgobioloid integer NOT NULL,
    csctbedadesid integer,
    nom_rbiolo character varying(250)
);
 $   DROP TABLE public.csctbriesgobiolo;
       public         heap    postgres    false    5                       1259    58975 '   csctbriesgobiolo_csctbriesgobioloid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgobiolo_csctbriesgobioloid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.csctbriesgobiolo_csctbriesgobioloid_seq;
       public          postgres    false    279    5            �           0    0 '   csctbriesgobiolo_csctbriesgobioloid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.csctbriesgobiolo_csctbriesgobioloid_seq OWNED BY public.csctbriesgobiolo.csctbriesgobioloid;
          public          postgres    false    280                       1259    58976    csctbriesgobste    TABLE     �   CREATE TABLE public.csctbriesgobste (
    csctbriesgobsteid integer NOT NULL,
    csctbtiporiesgoid integer,
    nom_rieobste character varying(250)
);
 #   DROP TABLE public.csctbriesgobste;
       public         heap    postgres    false    5                       1259    58979 %   csctbriesgobste_csctbriesgobsteid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgobste_csctbriesgobsteid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbriesgobste_csctbriesgobsteid_seq;
       public          postgres    false    281    5            �           0    0 %   csctbriesgobste_csctbriesgobsteid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbriesgobste_csctbriesgobsteid_seq OWNED BY public.csctbriesgobste.csctbriesgobsteid;
          public          postgres    false    282                       1259    58980    csctbriesgoembarazada    TABLE     �   CREATE TABLE public.csctbriesgoembarazada (
    csctbriesembarazadaid integer NOT NULL,
    csctbriesgobsteid integer,
    csctbfamiliaid integer,
    fecha_embarazada date,
    fecha_elimi_rembarazada date,
    estado_rembarazada boolean
);
 )   DROP TABLE public.csctbriesgoembarazada;
       public         heap    postgres    false    5                       1259    58983 /   csctbriesgoembarazada_csctbriesembarazadaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgoembarazada_csctbriesembarazadaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.csctbriesgoembarazada_csctbriesembarazadaid_seq;
       public          postgres    false    5    283            �           0    0 /   csctbriesgoembarazada_csctbriesembarazadaid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbriesgoembarazada_csctbriesembarazadaid_seq OWNED BY public.csctbriesgoembarazada.csctbriesembarazadaid;
          public          postgres    false    284                       1259    58984    csctbriesgos    TABLE        CREATE TABLE public.csctbriesgos (
    csctbriesgosid integer NOT NULL,
    csctbfamiliaid integer,
    riesgos character varying(250),
    gra_discapacidad character varying(150),
    gru_dispensa character varying(150),
    porce_discapacidad integer
);
     DROP TABLE public.csctbriesgos;
       public         heap    postgres    false    5                       1259    58989    csctbriesgos_csctbriesgosid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgos_csctbriesgosid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.csctbriesgos_csctbriesgosid_seq;
       public          postgres    false    5    285            �           0    0    csctbriesgos_csctbriesgosid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.csctbriesgos_csctbriesgosid_seq OWNED BY public.csctbriesgos.csctbriesgosid;
          public          postgres    false    286                       1259    58990    csctbriesgosocio    TABLE     �   CREATE TABLE public.csctbriesgosocio (
    csctbrsocioid integer NOT NULL,
    csctbedadesid integer,
    nom_rsocio character varying(250)
);
 $   DROP TABLE public.csctbriesgosocio;
       public         heap    postgres    false    5                        1259    58993 "   csctbriesgosocio_csctbrsocioid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgosocio_csctbrsocioid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.csctbriesgosocio_csctbrsocioid_seq;
       public          postgres    false    5    287            �           0    0 "   csctbriesgosocio_csctbrsocioid_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.csctbriesgosocio_csctbrsocioid_seq OWNED BY public.csctbriesgosocio.csctbrsocioid;
          public          postgres    false    288            !           1259    58994    csctbriesgovi    TABLE     t   CREATE TABLE public.csctbriesgovi (
    csctbriesgovid integer NOT NULL,
    nom_vivienda character varying(250)
);
 !   DROP TABLE public.csctbriesgovi;
       public         heap    postgres    false    5            "           1259    58997     csctbriesgovi_csctbriesgovid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgovi_csctbriesgovid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.csctbriesgovi_csctbriesgovid_seq;
       public          postgres    false    5    289            �           0    0     csctbriesgovi_csctbriesgovid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.csctbriesgovi_csctbriesgovid_seq OWNED BY public.csctbriesgovi.csctbriesgovid;
          public          postgres    false    290            #           1259    58998    csctbriesgovivienda    TABLE     �   CREATE TABLE public.csctbriesgovivienda (
    csctbriesgoviviendaid integer NOT NULL,
    csctbriesgovid integer,
    csctbviviendaid integer
);
 '   DROP TABLE public.csctbriesgovivienda;
       public         heap    postgres    false    5            $           1259    59001 -   csctbriesgovivienda_csctbriesgoviviendaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbriesgovivienda_csctbriesgoviviendaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.csctbriesgovivienda_csctbriesgoviviendaid_seq;
       public          postgres    false    5    291            �           0    0 -   csctbriesgovivienda_csctbriesgoviviendaid_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.csctbriesgovivienda_csctbriesgoviviendaid_seq OWNED BY public.csctbriesgovivienda.csctbriesgoviviendaid;
          public          postgres    false    292            %           1259    59002 
   csctbroles    TABLE     �   CREATE TABLE public.csctbroles (
    csctbrolesid integer NOT NULL,
    nom_rol character varying(50),
    estado_rol boolean
);
    DROP TABLE public.csctbroles;
       public         heap    postgres    false    5            &           1259    59005    csctbroles_csctbrolesid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbroles_csctbrolesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.csctbroles_csctbrolesid_seq;
       public          postgres    false    5    293            �           0    0    csctbroles_csctbrolesid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.csctbroles_csctbrolesid_seq OWNED BY public.csctbroles.csctbrolesid;
          public          postgres    false    294            '           1259    59006    csctbrsociofamilia    TABLE     �   CREATE TABLE public.csctbrsociofamilia (
    csctbrsociofamiliaid integer NOT NULL,
    csctbrsocioid integer,
    csctbfamiliaid integer,
    fecha_rsocioeconomico date,
    fecha_elimi_rsocieco date,
    estado_rsocioeconomico boolean
);
 &   DROP TABLE public.csctbrsociofamilia;
       public         heap    postgres    false    5            (           1259    59009 +   csctbrsociofamilia_csctbrsociofamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbrsociofamilia_csctbrsociofamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.csctbrsociofamilia_csctbrsociofamiliaid_seq;
       public          postgres    false    295    5            �           0    0 +   csctbrsociofamilia_csctbrsociofamiliaid_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.csctbrsociofamilia_csctbrsociofamiliaid_seq OWNED BY public.csctbrsociofamilia.csctbrsociofamiliaid;
          public          postgres    false    296            )           1259    59010 
   csctbrutas    TABLE     k   CREATE TABLE public.csctbrutas (
    csctbrutasid integer NOT NULL,
    nom_ruta character varying(250)
);
    DROP TABLE public.csctbrutas;
       public         heap    postgres    false    5            *           1259    59013    csctbrutas_csctbrutasid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbrutas_csctbrutasid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.csctbrutas_csctbrutasid_seq;
       public          postgres    false    297    5            �           0    0    csctbrutas_csctbrutasid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.csctbrutas_csctbrutasid_seq OWNED BY public.csctbrutas.csctbrutasid;
          public          postgres    false    298            +           1259    59014    csctbrutasroles    TABLE     �   CREATE TABLE public.csctbrutasroles (
    csctbrutasrolesid integer NOT NULL,
    csctbrolesid integer,
    csctbrutasid integer
);
 #   DROP TABLE public.csctbrutasroles;
       public         heap    postgres    false    5            ,           1259    59017 %   csctbrutasroles_csctbrutasrolesid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbrutasroles_csctbrutasrolesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbrutasroles_csctbrutasrolesid_seq;
       public          postgres    false    299    5            �           0    0 %   csctbrutasroles_csctbrutasrolesid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbrutasroles_csctbrutasrolesid_seq OWNED BY public.csctbrutasroles.csctbrutasrolesid;
          public          postgres    false    300            .           1259    59023 '   csctbtipofamilia_idcsctbtipofamilia_seq    SEQUENCE       ALTER TABLE public.csctbdiagnosticofamiliar ALTER COLUMN csctbdiagnosticoid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.csctbtipofamilia_idcsctbtipofamilia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    301    5            /           1259    59024    csctbtiporiesgo    TABLE     z   CREATE TABLE public.csctbtiporiesgo (
    csctbtiporiesgoid integer NOT NULL,
    tipo_riesgoem character varying(150)
);
 #   DROP TABLE public.csctbtiporiesgo;
       public         heap    postgres    false    5            0           1259    59027 %   csctbtiporiesgo_csctbtiporiesgoid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbtiporiesgo_csctbtiporiesgoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbtiporiesgo_csctbtiporiesgoid_seq;
       public          postgres    false    303    5            �           0    0 %   csctbtiporiesgo_csctbtiporiesgoid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbtiporiesgo_csctbtiporiesgoid_seq OWNED BY public.csctbtiporiesgo.csctbtiporiesgoid;
          public          postgres    false    304            1           1259    59028    csctbvacunafamilia    TABLE     �   CREATE TABLE public.csctbvacunafamilia (
    csctbvacunafamiliaid integer NOT NULL,
    csctbvacunasid integer,
    csctbfamiliaid integer,
    fecha_cre_vacuna date,
    fecha_elimi_vacuna date,
    estado_vacuna boolean
);
 &   DROP TABLE public.csctbvacunafamilia;
       public         heap    postgres    false    5            2           1259    59031 +   csctbvacunafamilia_csctbvacunafamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbvacunafamilia_csctbvacunafamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.csctbvacunafamilia_csctbvacunafamiliaid_seq;
       public          postgres    false    5    305            �           0    0 +   csctbvacunafamilia_csctbvacunafamiliaid_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.csctbvacunafamilia_csctbvacunafamiliaid_seq OWNED BY public.csctbvacunafamilia.csctbvacunafamiliaid;
          public          postgres    false    306            3           1259    59032    csctbvacunas    TABLE     �   CREATE TABLE public.csctbvacunas (
    csctbvacunasid integer NOT NULL,
    csctbedadesid integer,
    nom_vacuna character varying(500)
);
     DROP TABLE public.csctbvacunas;
       public         heap    postgres    false    5            4           1259    59037    csctbvacunas_csctbvacunasid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbvacunas_csctbvacunasid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.csctbvacunas_csctbvacunasid_seq;
       public          postgres    false    5    307            �           0    0    csctbvacunas_csctbvacunasid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.csctbvacunas_csctbvacunasid_seq OWNED BY public.csctbvacunas.csctbvacunasid;
          public          postgres    false    308            5           1259    59038    csctbvivienda    TABLE     �  CREATE TABLE public.csctbvivienda (
    csctbviviendaid integer NOT NULL,
    csctbfamiliaid integer,
    con_vivienda character varying(250),
    det_condicion character varying(250),
    tipo_vivienda character varying(250),
    det_tipovi character varying(250),
    via_acceso character varying(250),
    det_acceso character varying(250),
    techo character varying(250),
    det_techo character varying(250),
    piso character varying(250),
    det_piso character varying(250),
    paredes character varying(250),
    det_paredes character varying(250),
    propiedad character varying(250),
    num_cuartos integer,
    dormitorios integer,
    prov_agua character varying(250),
    det_provagua character varying(250),
    canalizacionagua character varying(250),
    tratamientoagua character varying(250),
    servicio_higienico character varying(250),
    ubicacionsh character varying(250),
    ducha character varying(250),
    basura character varying(250),
    alumbrado character varying(250),
    cocina character varying(250),
    det_cocina character varying(250),
    ubicacioncocina character varying(250),
    anidentro boolean,
    vectores boolean,
    provectores character varying(250),
    vulnerable boolean,
    num_celular integer,
    num_telefono integer,
    parroquia character varying(250),
    canton character varying(250),
    cprincipal character varying(250),
    csecundaria character varying(250),
    num_casa integer,
    referenciadom character varying(250),
    det_propiedad character varying(250),
    servicio_internet boolean,
    longitud1 double precision,
    latitud1 double precision,
    altitud1 double precision,
    csctbbarriochamboid integer,
    sector character varying,
    fecha_registrovivienda date
);
 !   DROP TABLE public.csctbvivienda;
       public         heap    postgres    false    5            6           1259    59043 !   csctbvivienda_csctbviviendaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbvivienda_csctbviviendaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.csctbvivienda_csctbviviendaid_seq;
       public          postgres    false    5    309            �           0    0 !   csctbvivienda_csctbviviendaid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.csctbvivienda_csctbviviendaid_seq OWNED BY public.csctbvivienda.csctbviviendaid;
          public          postgres    false    310            7           1259    59044    csctbvulnerable    TABLE     {   CREATE TABLE public.csctbvulnerable (
    csctbvulnerableid integer NOT NULL,
    nom_vulnerable character varying(150)
);
 #   DROP TABLE public.csctbvulnerable;
       public         heap    postgres    false    5            8           1259    59047 %   csctbvulnerable_csctbvulnerableid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbvulnerable_csctbvulnerableid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.csctbvulnerable_csctbvulnerableid_seq;
       public          postgres    false    5    311            �           0    0 %   csctbvulnerable_csctbvulnerableid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.csctbvulnerable_csctbvulnerableid_seq OWNED BY public.csctbvulnerable.csctbvulnerableid;
          public          postgres    false    312            9           1259    59048    csctbvulnerablefamilia    TABLE     �   CREATE TABLE public.csctbvulnerablefamilia (
    csctbvulnerablefamiliaid integer NOT NULL,
    csctbvulnerableid integer,
    csctbfamiliaid integer,
    fecha_add_vulnerable date,
    fecha_elimi_vulnerable date,
    estado_vulnerable boolean
);
 *   DROP TABLE public.csctbvulnerablefamilia;
       public         heap    postgres    false    5            :           1259    59051 3   csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq    SEQUENCE     �   CREATE SEQUENCE public.csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq;
       public          postgres    false    313    5            �           0    0 3   csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq OWNED BY public.csctbvulnerablefamilia.csctbvulnerablefamiliaid;
          public          postgres    false    314            �           2604    59052 !   csctbbarrioschambo csctbbarriosid    DEFAULT     �   ALTER TABLE ONLY public.csctbbarrioschambo ALTER COLUMN csctbbarriosid SET DEFAULT nextval('public.csctbbarrioschambo_csctbbarriosid_seq'::regclass);
 P   ALTER TABLE public.csctbbarrioschambo ALTER COLUMN csctbbarriosid DROP DEFAULT;
       public          postgres    false    217    216            �           2604    59053 %   csctbdiscapacidad csctbdiscapacidadid    DEFAULT     �   ALTER TABLE ONLY public.csctbdiscapacidad ALTER COLUMN csctbdiscapacidadid SET DEFAULT nextval('public.csctbdiscapacidad_csctbdiscapacidadid_seq'::regclass);
 T   ALTER TABLE public.csctbdiscapacidad ALTER COLUMN csctbdiscapacidadid DROP DEFAULT;
       public          postgres    false    219    218            �           2604    59054 #   csctbdiscariesgo csctbdiscariesgoid    DEFAULT     �   ALTER TABLE ONLY public.csctbdiscariesgo ALTER COLUMN csctbdiscariesgoid SET DEFAULT nextval('public.csctbdiscariesgo_csctbdiscariesgoid_seq'::regclass);
 R   ALTER TABLE public.csctbdiscariesgo ALTER COLUMN csctbdiscariesgoid DROP DEFAULT;
       public          postgres    false    221    220            �           2604    59055    csctbedades csctbedadesid    DEFAULT     �   ALTER TABLE ONLY public.csctbedades ALTER COLUMN csctbedadesid SET DEFAULT nextval('public.csctbedades_csctbedadesid_seq'::regclass);
 H   ALTER TABLE public.csctbedades ALTER COLUMN csctbedadesid DROP DEFAULT;
       public          postgres    false    223    222            �           2604    59056 #   csctbembarazadas csctbembarazadasid    DEFAULT     �   ALTER TABLE ONLY public.csctbembarazadas ALTER COLUMN csctbembarazadasid SET DEFAULT nextval('public.csctbembarazadas_csctbembarazadasid_seq'::regclass);
 R   ALTER TABLE public.csctbembarazadas ALTER COLUMN csctbembarazadasid DROP DEFAULT;
       public          postgres    false    225    224            �           2604    59057 "   csctbenferfam csctbenfermeriesgoid    DEFAULT     �   ALTER TABLE ONLY public.csctbenferfam ALTER COLUMN csctbenfermeriesgoid SET DEFAULT nextval('public.csctbenfermeriesgo_csctbenfermeriesgoid_seq'::regclass);
 Q   ALTER TABLE public.csctbenferfam ALTER COLUMN csctbenfermeriesgoid DROP DEFAULT;
       public          postgres    false    229    226            �           2604    59058 !   csctbenfermedad csctbenfermedadid    DEFAULT     �   ALTER TABLE ONLY public.csctbenfermedad ALTER COLUMN csctbenfermedadid SET DEFAULT nextval('public.csctbenfermedad_csctbenfermedadid_seq'::regclass);
 P   ALTER TABLE public.csctbenfermedad ALTER COLUMN csctbenfermedadid DROP DEFAULT;
       public          postgres    false    228    227            �           2604    59059    csctbetnia csctbetniaid    DEFAULT     �   ALTER TABLE ONLY public.csctbetnia ALTER COLUMN csctbetniaid SET DEFAULT nextval('public.csctbetnia_csctbetniaid_seq'::regclass);
 F   ALTER TABLE public.csctbetnia ALTER COLUMN csctbetniaid DROP DEFAULT;
       public          postgres    false    231    230            �           2604    59060 !   csctbevaluacion csctbevaluacionid    DEFAULT     �   ALTER TABLE ONLY public.csctbevaluacion ALTER COLUMN csctbevaluacionid SET DEFAULT nextval('public.csctbevaluacion_csctbevaluacionid_seq'::regclass);
 P   ALTER TABLE public.csctbevaluacion ALTER COLUMN csctbevaluacionid DROP DEFAULT;
       public          postgres    false    233    232            �           2604    59061 /   csctbevaluacionfamilia csctbevaluacionfamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbevaluacionfamilia ALTER COLUMN csctbevaluacionfamiliaid SET DEFAULT nextval('public.csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq'::regclass);
 ^   ALTER TABLE public.csctbevaluacionfamilia ALTER COLUMN csctbevaluacionfamiliaid DROP DEFAULT;
       public          postgres    false    235    234            �           2604    59062 %   csctbevaluariesgo csctbevaluariesgoid    DEFAULT     �   ALTER TABLE ONLY public.csctbevaluariesgo ALTER COLUMN csctbevaluariesgoid SET DEFAULT nextval('public.csctbevaluariesgo_csctbevaluariesgoid_seq'::regclass);
 T   ALTER TABLE public.csctbevaluariesgo ALTER COLUMN csctbevaluariesgoid DROP DEFAULT;
       public          postgres    false    237    236            �           2604    59063 -   csctbevolucionfamilia csctbevolucionfamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbevolucionfamilia ALTER COLUMN csctbevolucionfamiliaid SET DEFAULT nextval('public.csctbevolucionfamilia_csctbevolucionfamiliaid_seq'::regclass);
 \   ALTER TABLE public.csctbevolucionfamilia ALTER COLUMN csctbevolucionfamiliaid DROP DEFAULT;
       public          postgres    false    239    238            �           2604    59064    csctbfamilia csctbfamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbfamilia ALTER COLUMN csctbfamiliaid SET DEFAULT nextval('public.csctbfamilia_csctbfamiliaid_seq'::regclass);
 J   ALTER TABLE public.csctbfamilia ALTER COLUMN csctbfamiliaid DROP DEFAULT;
       public          postgres    false    241    240            �           2604    59065    csctbficha csctbfichaid    DEFAULT     �   ALTER TABLE ONLY public.csctbficha ALTER COLUMN csctbfichaid SET DEFAULT nextval('public.csctbficha_csctbfichaid_seq'::regclass);
 F   ALTER TABLE public.csctbficha ALTER COLUMN csctbfichaid DROP DEFAULT;
       public          postgres    false    243    242            �           2604    59066    csctbficha num_ficha    DEFAULT     |   ALTER TABLE ONLY public.csctbficha ALTER COLUMN num_ficha SET DEFAULT nextval('public.csctbficha_num_ficha_seq'::regclass);
 C   ALTER TABLE public.csctbficha ALTER COLUMN num_ficha DROP DEFAULT;
       public          postgres    false    244    242            �           2604    59067 #   csctbinstruccion csctbinstruccionid    DEFAULT     �   ALTER TABLE ONLY public.csctbinstruccion ALTER COLUMN csctbinstruccionid SET DEFAULT nextval('public.csctbinstruccion_csctbinstruccionid_seq'::regclass);
 R   ALTER TABLE public.csctbinstruccion ALTER COLUMN csctbinstruccionid DROP DEFAULT;
       public          postgres    false    246    245            �           2604    59068    csctblogin csctbloginid    DEFAULT     �   ALTER TABLE ONLY public.csctblogin ALTER COLUMN csctbloginid SET DEFAULT nextval('public.csctblogin_csctbloginid_seq'::regclass);
 F   ALTER TABLE public.csctblogin ALTER COLUMN csctbloginid DROP DEFAULT;
       public          postgres    false    248    247            �           2604    59069 !   csctbmortalidad csctbmortalidadid    DEFAULT     �   ALTER TABLE ONLY public.csctbmortalidad ALTER COLUMN csctbmortalidadid SET DEFAULT nextval('public.csctbmortalidad_csctbmortalidadid_seq'::regclass);
 P   ALTER TABLE public.csctbmortalidad ALTER COLUMN csctbmortalidadid DROP DEFAULT;
       public          postgres    false    250    249            �           2604    59070 )   csctbmortenfermedad csctbmortenfermedadid    DEFAULT     �   ALTER TABLE ONLY public.csctbmortenfermedad ALTER COLUMN csctbmortenfermedadid SET DEFAULT nextval('public.csctbmortenfermedad_csctbmortenfermedadid_seq'::regclass);
 X   ALTER TABLE public.csctbmortenfermedad ALTER COLUMN csctbmortenfermedadid DROP DEFAULT;
       public          postgres    false    252    251            �           2604    59071 1   csctbnacionalidadetnica csctbnacionalidadetnicaid    DEFAULT     �   ALTER TABLE ONLY public.csctbnacionalidadetnica ALTER COLUMN csctbnacionalidadetnicaid SET DEFAULT nextval('public.csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq'::regclass);
 `   ALTER TABLE public.csctbnacionalidadetnica ALTER COLUMN csctbnacionalidadetnicaid DROP DEFAULT;
       public          postgres    false    254    253            �           2604    59072    csctbocupacion csctbocupacionid    DEFAULT     �   ALTER TABLE ONLY public.csctbocupacion ALTER COLUMN csctbocupacionid SET DEFAULT nextval('public.csctbocupacion_csctbocupacionid_seq'::regclass);
 N   ALTER TABLE public.csctbocupacion ALTER COLUMN csctbocupacionid DROP DEFAULT;
       public          postgres    false    256    255            �           2604    59073 !   csctbparentesco csctbparentescoid    DEFAULT     �   ALTER TABLE ONLY public.csctbparentesco ALTER COLUMN csctbparentescoid SET DEFAULT nextval('public.csctbparentesco_csctbparentescoid_seq'::regclass);
 P   ALTER TABLE public.csctbparentesco ALTER COLUMN csctbparentescoid DROP DEFAULT;
       public          postgres    false    258    257            �           2604    59074    csctbpersonal csctbpersonalid    DEFAULT     �   ALTER TABLE ONLY public.csctbpersonal ALTER COLUMN csctbpersonalid SET DEFAULT nextval('public.csctbpersonal_csctbpersonalid_seq'::regclass);
 L   ALTER TABLE public.csctbpersonal ALTER COLUMN csctbpersonalid DROP DEFAULT;
       public          postgres    false    260    259            �           2604    59075 #   csctbprioritario csctbprioritarioid    DEFAULT     �   ALTER TABLE ONLY public.csctbprioritario ALTER COLUMN csctbprioritarioid SET DEFAULT nextval('public.csctbprioritario_csctbprioritarioid_seq'::regclass);
 R   ALTER TABLE public.csctbprioritario ALTER COLUMN csctbprioritarioid DROP DEFAULT;
       public          postgres    false    262    261            �           2604    59076 1   csctbprioritariofamilia csctbprioritariofamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbprioritariofamilia ALTER COLUMN csctbprioritariofamiliaid SET DEFAULT nextval('public.csctbprioritariofamilia_csctbprioritariofamiliaid_seq'::regclass);
 `   ALTER TABLE public.csctbprioritariofamilia ALTER COLUMN csctbprioritariofamiliaid DROP DEFAULT;
       public          postgres    false    264    263            �           2604    59077 .   csctbprofesionalresponsable csctbprofesionalid    DEFAULT     �   ALTER TABLE ONLY public.csctbprofesionalresponsable ALTER COLUMN csctbprofesionalid SET DEFAULT nextval('public.csctbprofesionalresponsable_csctbprofesionalid_seq'::regclass);
 ]   ALTER TABLE public.csctbprofesionalresponsable ALTER COLUMN csctbprofesionalid DROP DEFAULT;
       public          postgres    false    266    265            �           2604    59078    csctbpueblos csctbpueblosid    DEFAULT     �   ALTER TABLE ONLY public.csctbpueblos ALTER COLUMN csctbpueblosid SET DEFAULT nextval('public.csctbpueblos_csctbpueblosid_seq'::regclass);
 J   ALTER TABLE public.csctbpueblos ALTER COLUMN csctbpueblosid DROP DEFAULT;
       public          postgres    false    268    267            �           2604    59079 %   csctbrambientales csctbrambientalesid    DEFAULT     �   ALTER TABLE ONLY public.csctbrambientales ALTER COLUMN csctbrambientalesid SET DEFAULT nextval('public.csctbrambientales_csctbrambientalesid_seq'::regclass);
 T   ALTER TABLE public.csctbrambientales ALTER COLUMN csctbrambientalesid DROP DEFAULT;
       public          postgres    false    270    269            �           2604    59080 /   csctbrambientalfamilia csctbrambientalfamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbrambientalfamilia ALTER COLUMN csctbrambientalfamiliaid SET DEFAULT nextval('public.csctbrambientalfamilia_csctbrambientalfamiliaid_seq'::regclass);
 ^   ALTER TABLE public.csctbrambientalfamilia ALTER COLUMN csctbrambientalfamiliaid DROP DEFAULT;
       public          postgres    false    272    271            �           2604    59081 '   csctbrbiolofamilia csctbrbiolofamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbrbiolofamilia ALTER COLUMN csctbrbiolofamiliaid SET DEFAULT nextval('public.csctbrbiolofamilia_csctbrbiolofamiliaid_seq'::regclass);
 V   ALTER TABLE public.csctbrbiolofamilia ALTER COLUMN csctbrbiolofamiliaid DROP DEFAULT;
       public          postgres    false    274    273            �           2604    59082    csctbriesgoa csctbriesgoaid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgoa ALTER COLUMN csctbriesgoaid SET DEFAULT nextval('public.csctbriesgoa_csctbriesgoaid_seq'::regclass);
 J   ALTER TABLE public.csctbriesgoa ALTER COLUMN csctbriesgoaid DROP DEFAULT;
       public          postgres    false    276    275            �           2604    59083 &   csctbriesgoavivienda csctbriesgoavivid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgoavivienda ALTER COLUMN csctbriesgoavivid SET DEFAULT nextval('public.csctbriesgoavivienda_csctbriesgoavivid_seq'::regclass);
 U   ALTER TABLE public.csctbriesgoavivienda ALTER COLUMN csctbriesgoavivid DROP DEFAULT;
       public          postgres    false    278    277            �           2604    59084 #   csctbriesgobiolo csctbriesgobioloid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgobiolo ALTER COLUMN csctbriesgobioloid SET DEFAULT nextval('public.csctbriesgobiolo_csctbriesgobioloid_seq'::regclass);
 R   ALTER TABLE public.csctbriesgobiolo ALTER COLUMN csctbriesgobioloid DROP DEFAULT;
       public          postgres    false    280    279            �           2604    59085 !   csctbriesgobste csctbriesgobsteid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgobste ALTER COLUMN csctbriesgobsteid SET DEFAULT nextval('public.csctbriesgobste_csctbriesgobsteid_seq'::regclass);
 P   ALTER TABLE public.csctbriesgobste ALTER COLUMN csctbriesgobsteid DROP DEFAULT;
       public          postgres    false    282    281            �           2604    59086 +   csctbriesgoembarazada csctbriesembarazadaid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgoembarazada ALTER COLUMN csctbriesembarazadaid SET DEFAULT nextval('public.csctbriesgoembarazada_csctbriesembarazadaid_seq'::regclass);
 Z   ALTER TABLE public.csctbriesgoembarazada ALTER COLUMN csctbriesembarazadaid DROP DEFAULT;
       public          postgres    false    284    283            �           2604    59087    csctbriesgos csctbriesgosid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgos ALTER COLUMN csctbriesgosid SET DEFAULT nextval('public.csctbriesgos_csctbriesgosid_seq'::regclass);
 J   ALTER TABLE public.csctbriesgos ALTER COLUMN csctbriesgosid DROP DEFAULT;
       public          postgres    false    286    285            �           2604    59088    csctbriesgosocio csctbrsocioid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgosocio ALTER COLUMN csctbrsocioid SET DEFAULT nextval('public.csctbriesgosocio_csctbrsocioid_seq'::regclass);
 M   ALTER TABLE public.csctbriesgosocio ALTER COLUMN csctbrsocioid DROP DEFAULT;
       public          postgres    false    288    287            �           2604    59089    csctbriesgovi csctbriesgovid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgovi ALTER COLUMN csctbriesgovid SET DEFAULT nextval('public.csctbriesgovi_csctbriesgovid_seq'::regclass);
 K   ALTER TABLE public.csctbriesgovi ALTER COLUMN csctbriesgovid DROP DEFAULT;
       public          postgres    false    290    289            �           2604    59090 )   csctbriesgovivienda csctbriesgoviviendaid    DEFAULT     �   ALTER TABLE ONLY public.csctbriesgovivienda ALTER COLUMN csctbriesgoviviendaid SET DEFAULT nextval('public.csctbriesgovivienda_csctbriesgoviviendaid_seq'::regclass);
 X   ALTER TABLE public.csctbriesgovivienda ALTER COLUMN csctbriesgoviviendaid DROP DEFAULT;
       public          postgres    false    292    291            �           2604    59091    csctbroles csctbrolesid    DEFAULT     �   ALTER TABLE ONLY public.csctbroles ALTER COLUMN csctbrolesid SET DEFAULT nextval('public.csctbroles_csctbrolesid_seq'::regclass);
 F   ALTER TABLE public.csctbroles ALTER COLUMN csctbrolesid DROP DEFAULT;
       public          postgres    false    294    293            �           2604    59092 '   csctbrsociofamilia csctbrsociofamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbrsociofamilia ALTER COLUMN csctbrsociofamiliaid SET DEFAULT nextval('public.csctbrsociofamilia_csctbrsociofamiliaid_seq'::regclass);
 V   ALTER TABLE public.csctbrsociofamilia ALTER COLUMN csctbrsociofamiliaid DROP DEFAULT;
       public          postgres    false    296    295            �           2604    59093    csctbrutas csctbrutasid    DEFAULT     �   ALTER TABLE ONLY public.csctbrutas ALTER COLUMN csctbrutasid SET DEFAULT nextval('public.csctbrutas_csctbrutasid_seq'::regclass);
 F   ALTER TABLE public.csctbrutas ALTER COLUMN csctbrutasid DROP DEFAULT;
       public          postgres    false    298    297            �           2604    59094 !   csctbrutasroles csctbrutasrolesid    DEFAULT     �   ALTER TABLE ONLY public.csctbrutasroles ALTER COLUMN csctbrutasrolesid SET DEFAULT nextval('public.csctbrutasroles_csctbrutasrolesid_seq'::regclass);
 P   ALTER TABLE public.csctbrutasroles ALTER COLUMN csctbrutasrolesid DROP DEFAULT;
       public          postgres    false    300    299            �           2604    59095 !   csctbtiporiesgo csctbtiporiesgoid    DEFAULT     �   ALTER TABLE ONLY public.csctbtiporiesgo ALTER COLUMN csctbtiporiesgoid SET DEFAULT nextval('public.csctbtiporiesgo_csctbtiporiesgoid_seq'::regclass);
 P   ALTER TABLE public.csctbtiporiesgo ALTER COLUMN csctbtiporiesgoid DROP DEFAULT;
       public          postgres    false    304    303            �           2604    59096 '   csctbvacunafamilia csctbvacunafamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbvacunafamilia ALTER COLUMN csctbvacunafamiliaid SET DEFAULT nextval('public.csctbvacunafamilia_csctbvacunafamiliaid_seq'::regclass);
 V   ALTER TABLE public.csctbvacunafamilia ALTER COLUMN csctbvacunafamiliaid DROP DEFAULT;
       public          postgres    false    306    305            �           2604    59097    csctbvacunas csctbvacunasid    DEFAULT     �   ALTER TABLE ONLY public.csctbvacunas ALTER COLUMN csctbvacunasid SET DEFAULT nextval('public.csctbvacunas_csctbvacunasid_seq'::regclass);
 J   ALTER TABLE public.csctbvacunas ALTER COLUMN csctbvacunasid DROP DEFAULT;
       public          postgres    false    308    307            �           2604    59098    csctbvivienda csctbviviendaid    DEFAULT     �   ALTER TABLE ONLY public.csctbvivienda ALTER COLUMN csctbviviendaid SET DEFAULT nextval('public.csctbvivienda_csctbviviendaid_seq'::regclass);
 L   ALTER TABLE public.csctbvivienda ALTER COLUMN csctbviviendaid DROP DEFAULT;
       public          postgres    false    310    309            �           2604    59099 !   csctbvulnerable csctbvulnerableid    DEFAULT     �   ALTER TABLE ONLY public.csctbvulnerable ALTER COLUMN csctbvulnerableid SET DEFAULT nextval('public.csctbvulnerable_csctbvulnerableid_seq'::regclass);
 P   ALTER TABLE public.csctbvulnerable ALTER COLUMN csctbvulnerableid DROP DEFAULT;
       public          postgres    false    312    311            �           2604    59100 /   csctbvulnerablefamilia csctbvulnerablefamiliaid    DEFAULT     �   ALTER TABLE ONLY public.csctbvulnerablefamilia ALTER COLUMN csctbvulnerablefamiliaid SET DEFAULT nextval('public.csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq'::regclass);
 ^   ALTER TABLE public.csctbvulnerablefamilia ALTER COLUMN csctbvulnerablefamiliaid DROP DEFAULT;
       public          postgres    false    314    313            $          0    58821    csctbbarrioschambo 
   TABLE DATA           Y   COPY public.csctbbarrioschambo (csctbbarriosid, nom_barrio, nom_eaisbarrios) FROM stdin;
    public          postgres    false    216   )      y          0    59018    csctbdiagnosticofamiliar 
   TABLE DATA           �   COPY public.csctbdiagnosticofamiliar (csctbdiagnosticoid, tipo_familia, ciclo_vital, primer_hijo, hijo_edad_preescolar, hijo_edad_escolar, hijo_edad_adolescente, hijo_edad_adulta, apgar_familiar, id_jefe_hogar, observacion) FROM stdin;
    public          postgres    false    301   �      &          0    58827    csctbdiscapacidad 
   TABLE DATA           R   COPY public.csctbdiscapacidad (csctbdiscapacidadid, nom_discapacidad) FROM stdin;
    public          postgres    false    218   U      (          0    58831    csctbdiscariesgo 
   TABLE DATA           c   COPY public.csctbdiscariesgo (csctbdiscariesgoid, csctbdiscapacidadid, csctbriesgosid) FROM stdin;
    public          postgres    false    220   �      *          0    58835    csctbedades 
   TABLE DATA           @   COPY public.csctbedades (csctbedadesid, rango_edad) FROM stdin;
    public          postgres    false    222   �      ,          0    58839    csctbembarazadas 
   TABLE DATA           1  COPY public.csctbembarazadas (csctbembarazadasid, csctbfamiliaid, fecha_menstruacion, fecha_parto, control_menos20, control_mas20, esquema_vacunacion, ante_gineco, ante_patologicos, semanas_gestacion, gestas, partos, abortos, cesarias, tipo_aborto, n_abortos_espontaneos, n_abortos_inducidos) FROM stdin;
    public          postgres    false    224   l      .          0    58843    csctbenferfam 
   TABLE DATA           �   COPY public.csctbenferfam (csctbenfermeriesgoid, csctbenfermedadid, csctbfamiliaid, fecha_add_enfer, fecha_elimi_enfer, estado_enfermedad) FROM stdin;
    public          postgres    false    226   �      /          0    58846    csctbenfermedad 
   TABLE DATA           \   COPY public.csctbenfermedad (csctbenfermedadid, nom_enfermedad, cog_enfermedad) FROM stdin;
    public          postgres    false    227   ~      2          0    58851 
   csctbetnia 
   TABLE DATA           =   COPY public.csctbetnia (csctbetniaid, nom_etnia) FROM stdin;
    public          postgres    false    230   2      4          0    58857    csctbevaluacion 
   TABLE DATA           L   COPY public.csctbevaluacion (csctbevaluacionid, nom_evaluacion) FROM stdin;
    public          postgres    false    232   �      6          0    58861    csctbevaluacionfamilia 
   TABLE DATA           �  COPY public.csctbevaluacionfamilia (csctbevaluacionfamiliaid, vacuincomnum, vacuincomtxt, persomalnunum, persomalnutxt, persoenfermenum, persoenfermetxt, persoenfecatnum, persoenfecatxt, embariesgonum, embariesgotxt, persondiscanum, persondiscatxt, personpromennum, personpromentxt, consuagua, txtconsuagua, elibasura, txtelibasura, eleliquidos, txteleliquidos, impactoindu, txtimpactoindu, anidomiciolio, txtanidomicilio, desempleo, txtdesempleo, analfabetismo, txtanalfabetismo, desestructuracion, txtdesestructuracion, violencia, txtviolencia, malascondi, txtmalascondi, haciamiento, txthaciamiento, vulne_obser, csctbfamiliaid, fecha_registro, estado_evolucion) FROM stdin;
    public          postgres    false    234   c      8          0    58867    csctbevaluariesgo 
   TABLE DATA           �   COPY public.csctbevaluariesgo (csctbevaluariesgoid, csctbevaluacionid, csctbfamiliaid, obser_evalua, fecha_evaluacion, fecha_elimi_riesgo, estado_riesgo) FROM stdin;
    public          postgres    false    236   �      :          0    58873    csctbevolucionfamilia 
   TABLE DATA           �   COPY public.csctbevolucionfamilia (csctbevolucionfamiliaid, riesgo, comprofamilia, comprosalud, fecha_evaluacion, cumple, no_cumple, parcialmente, causas_incumplimiento, csctbresponsableid, csctbfamiliaid) FROM stdin;
    public          postgres    false    238   �      <          0    58879    csctbfamilia 
   TABLE DATA           �  COPY public.csctbfamilia (csctbfamiliaid, csctbocupacionid, csctbinstruccionid, csctbparentescoid, cedula_fam, nom_fam, ape_fam, fecha_na_fam, anios, meses, dias, genero, control_bucal, observacion, estado_fam, id_jefe_hogar, fecreacion_fam, feelimini_fam, jefe_hogar, estado_civil, csctbetniaid, csctbnacionalidadid, csctbpueblosid, fallecido, informante, nucleo_familiar, fecha_union) FROM stdin;
    public          postgres    false    240   �      >          0    58885 
   csctbficha 
   TABLE DATA           p   COPY public.csctbficha (csctbfichaid, csctbfamiliaid, num_ficha, ficha_creacion, ficha_eliminacion) FROM stdin;
    public          postgres    false    242   �      "          0    58817    csctbgenogramas 
   TABLE DATA           b   COPY public.csctbgenogramas (csctbgenogramaid, imagen, fecha_add_geno, id_jefe_hogar) FROM stdin;
    public          postgres    false    214   �      A          0    58890    csctbinstruccion 
   TABLE DATA           O   COPY public.csctbinstruccion (csctbinstruccionid, nom_instruccion) FROM stdin;
    public          postgres    false    245         C          0    58894 
   csctblogin 
   TABLE DATA           �   COPY public.csctblogin (csctbloginid, pass, estado_login, csctbrutasrolesid, csctbpersonalid, fechaeliusuario, fechacreacion) FROM stdin;
    public          postgres    false    247   �      E          0    58898    csctbmortalidad 
   TABLE DATA           �   COPY public.csctbmortalidad (csctbmortalidadid, csctbparentescoid, csctbjefefamid, nombres_mortalidad, fecha_fallecimiento, causa_nodefi, apellidos_mortalidad, anios, meses, dias, estado_mortalidad) FROM stdin;
    public          postgres    false    249          G          0    58904    csctbmortenfermedad 
   TABLE DATA           x   COPY public.csctbmortenfermedad (csctbmortenfermedadid, csctbmortalidadid, csctbenfermedadid, ob_mortenfer) FROM stdin;
    public          postgres    false    251         I          0    58910    csctbnacionalidadetnica 
   TABLE DATA           d   COPY public.csctbnacionalidadetnica (csctbnacionalidadetnicaid, nom_nacionalidadetnica) FROM stdin;
    public          postgres    false    253   :      K          0    58916    csctbocupacion 
   TABLE DATA           X   COPY public.csctbocupacion (csctbocupacionid, cod_ocupacion, nom_ocupacion) FROM stdin;
    public          postgres    false    255   �      M          0    58920    csctbparentesco 
   TABLE DATA           L   COPY public.csctbparentesco (csctbparentescoid, nom_parentesco) FROM stdin;
    public          postgres    false    257   t%      O          0    58924    csctbpersonal 
   TABLE DATA           Q  COPY public.csctbpersonal (csctbpersonalid, cedula, nombresp, apellido_pat, apellido_mat, telefeno, email, direccion, eais_medico, fecha_nacimiento, fecha_ingreso, fecha_salida, obserp, estadop, fechaelipersonal, profesion, realizaitinerancia, areatrabajo, modalidad, horastrabajo, tipocontrato, pass, rolusu, fechacreacion) FROM stdin;
    public          postgres    false    259   3&      Q          0    58932    csctbprioritario 
   TABLE DATA           O   COPY public.csctbprioritario (csctbprioritarioid, nom_prioritario) FROM stdin;
    public          postgres    false    261   �,      S          0    58936    csctbprioritariofamilia 
   TABLE DATA           �   COPY public.csctbprioritariofamilia (csctbprioritariofamiliaid, csctbprioritarioid, csctbfamiliaid, fecha_add_prioritario, fecha_elimi_prioritario, estado_prioritario) FROM stdin;
    public          postgres    false    263   �-      U          0    58940    csctbprofesionalresponsable 
   TABLE DATA           �   COPY public.csctbprofesionalresponsable (csctbprofesionalid, csctbpersonalid, fecha_visita, hora_visita, csctbfamiliaid) FROM stdin;
    public          postgres    false    265   �-      W          0    58944    csctbpueblos 
   TABLE DATA           C   COPY public.csctbpueblos (csctbpueblosid, nom_pueblos) FROM stdin;
    public          postgres    false    267   �-      Y          0    58950    csctbrambientales 
   TABLE DATA           P   COPY public.csctbrambientales (csctbrambientalesid, nom_rambiental) FROM stdin;
    public          postgres    false    269   �.      [          0    58956    csctbrambientalfamilia 
   TABLE DATA           �   COPY public.csctbrambientalfamilia (csctbrambientalfamiliaid, csctbrambientalesid, csctbfamiliaid, fecha_rambiental, fecha_elimi_rambiental, estado_rambiental) FROM stdin;
    public          postgres    false    271   =/      ]          0    58960    csctbrbiolofamilia 
   TABLE DATA           �   COPY public.csctbrbiolofamilia (csctbrbiolofamiliaid, csctbriesgobioloid, csctbfamiliaid, fecha_rbiologico, fecha_elimi_rbiologico, estado_rbiologico) FROM stdin;
    public          postgres    false    273   Z/      _          0    58964    csctbriesgoa 
   TABLE DATA           ?   COPY public.csctbriesgoa (csctbriesgoaid, riesgoa) FROM stdin;
    public          postgres    false    275   w/      a          0    58968    csctbriesgoavivienda 
   TABLE DATA           W  COPY public.csctbriesgoavivienda (csctbriesgoavivid, ries_agresividad, ries_insalubridad, ries_cantidad, conv_animales, tipo_domestico, tipo_granja, tipo_silvestre, dome_perro, dome_gato, perro_peque, perro_medio, perro_grande, num_gatos, ries_vi1, ries_vi2, ries_vi3, ries_vi4, csctbviviendaid, vectores, provectores, vulnerable) FROM stdin;
    public          postgres    false    277   �/      c          0    58972    csctbriesgobiolo 
   TABLE DATA           Y   COPY public.csctbriesgobiolo (csctbriesgobioloid, csctbedadesid, nom_rbiolo) FROM stdin;
    public          postgres    false    279   �/      e          0    58976    csctbriesgobste 
   TABLE DATA           ]   COPY public.csctbriesgobste (csctbriesgobsteid, csctbtiporiesgoid, nom_rieobste) FROM stdin;
    public          postgres    false    281   �2      g          0    58980    csctbriesgoembarazada 
   TABLE DATA           �   COPY public.csctbriesgoembarazada (csctbriesembarazadaid, csctbriesgobsteid, csctbfamiliaid, fecha_embarazada, fecha_elimi_rembarazada, estado_rembarazada) FROM stdin;
    public          postgres    false    283   x6      i          0    58984    csctbriesgos 
   TABLE DATA           �   COPY public.csctbriesgos (csctbriesgosid, csctbfamiliaid, riesgos, gra_discapacidad, gru_dispensa, porce_discapacidad) FROM stdin;
    public          postgres    false    285   �6      k          0    58990    csctbriesgosocio 
   TABLE DATA           T   COPY public.csctbriesgosocio (csctbrsocioid, csctbedadesid, nom_rsocio) FROM stdin;
    public          postgres    false    287   �6      m          0    58994    csctbriesgovi 
   TABLE DATA           E   COPY public.csctbriesgovi (csctbriesgovid, nom_vivienda) FROM stdin;
    public          postgres    false    289   _:      o          0    58998    csctbriesgovivienda 
   TABLE DATA           e   COPY public.csctbriesgovivienda (csctbriesgoviviendaid, csctbriesgovid, csctbviviendaid) FROM stdin;
    public          postgres    false    291   �:      q          0    59002 
   csctbroles 
   TABLE DATA           G   COPY public.csctbroles (csctbrolesid, nom_rol, estado_rol) FROM stdin;
    public          postgres    false    293   ;      s          0    59006    csctbrsociofamilia 
   TABLE DATA           �   COPY public.csctbrsociofamilia (csctbrsociofamiliaid, csctbrsocioid, csctbfamiliaid, fecha_rsocioeconomico, fecha_elimi_rsocieco, estado_rsocioeconomico) FROM stdin;
    public          postgres    false    295   W;      u          0    59010 
   csctbrutas 
   TABLE DATA           <   COPY public.csctbrutas (csctbrutasid, nom_ruta) FROM stdin;
    public          postgres    false    297   t;      w          0    59014    csctbrutasroles 
   TABLE DATA           X   COPY public.csctbrutasroles (csctbrutasrolesid, csctbrolesid, csctbrutasid) FROM stdin;
    public          postgres    false    299   �;      {          0    59024    csctbtiporiesgo 
   TABLE DATA           K   COPY public.csctbtiporiesgo (csctbtiporiesgoid, tipo_riesgoem) FROM stdin;
    public          postgres    false    303   	<      }          0    59028    csctbvacunafamilia 
   TABLE DATA           �   COPY public.csctbvacunafamilia (csctbvacunafamiliaid, csctbvacunasid, csctbfamiliaid, fecha_cre_vacuna, fecha_elimi_vacuna, estado_vacuna) FROM stdin;
    public          postgres    false    305   H<                0    59032    csctbvacunas 
   TABLE DATA           Q   COPY public.csctbvacunas (csctbvacunasid, csctbedadesid, nom_vacuna) FROM stdin;
    public          postgres    false    307   "=      �          0    59038    csctbvivienda 
   TABLE DATA           �  COPY public.csctbvivienda (csctbviviendaid, csctbfamiliaid, con_vivienda, det_condicion, tipo_vivienda, det_tipovi, via_acceso, det_acceso, techo, det_techo, piso, det_piso, paredes, det_paredes, propiedad, num_cuartos, dormitorios, prov_agua, det_provagua, canalizacionagua, tratamientoagua, servicio_higienico, ubicacionsh, ducha, basura, alumbrado, cocina, det_cocina, ubicacioncocina, anidentro, vectores, provectores, vulnerable, num_celular, num_telefono, parroquia, canton, cprincipal, csecundaria, num_casa, referenciadom, det_propiedad, servicio_internet, longitud1, latitud1, altitud1, csctbbarriochamboid, sector, fecha_registrovivienda) FROM stdin;
    public          postgres    false    309   R>      �          0    59044    csctbvulnerable 
   TABLE DATA           L   COPY public.csctbvulnerable (csctbvulnerableid, nom_vulnerable) FROM stdin;
    public          postgres    false    311   o>      �          0    59048    csctbvulnerablefamilia 
   TABLE DATA           �   COPY public.csctbvulnerablefamilia (csctbvulnerablefamiliaid, csctbvulnerableid, csctbfamiliaid, fecha_add_vulnerable, fecha_elimi_vulnerable, estado_vulnerable) FROM stdin;
    public          postgres    false    313   m?      �           0    0 5   csctbHistorialGenograma_idcsctbHistorialGenograma_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public."csctbHistorialGenograma_idcsctbHistorialGenograma_seq"', 17, true);
          public          postgres    false    215            �           0    0 %   csctbbarrioschambo_csctbbarriosid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.csctbbarrioschambo_csctbbarriosid_seq', 38, true);
          public          postgres    false    217            �           0    0 )   csctbdiscapacidad_csctbdiscapacidadid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.csctbdiscapacidad_csctbdiscapacidadid_seq', 6, true);
          public          postgres    false    219            �           0    0 '   csctbdiscariesgo_csctbdiscariesgoid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.csctbdiscariesgo_csctbdiscariesgoid_seq', 1, false);
          public          postgres    false    221            �           0    0    csctbedades_csctbedadesid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.csctbedades_csctbedadesid_seq', 15, true);
          public          postgres    false    223            �           0    0 '   csctbembarazadas_csctbembarazadasid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.csctbembarazadas_csctbembarazadasid_seq', 61, true);
          public          postgres    false    225            �           0    0 %   csctbenfermedad_csctbenfermedadid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.csctbenfermedad_csctbenfermedadid_seq', 14418, true);
          public          postgres    false    228            �           0    0 +   csctbenfermeriesgo_csctbenfermeriesgoid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.csctbenfermeriesgo_csctbenfermeriesgoid_seq', 258, true);
          public          postgres    false    229            �           0    0    csctbetnia_csctbetniaid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.csctbetnia_csctbetniaid_seq', 10, true);
          public          postgres    false    231            �           0    0 %   csctbevaluacion_csctbevaluacionid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.csctbevaluacion_csctbevaluacionid_seq', 8, true);
          public          postgres    false    233            �           0    0 3   csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.csctbevaluacionfamilia_csctbevaluacionfamiliaid_seq', 16, true);
          public          postgres    false    235            �           0    0 )   csctbevaluariesgo_csctbevaluariesgoid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.csctbevaluariesgo_csctbevaluariesgoid_seq', 116, true);
          public          postgres    false    237            �           0    0 1   csctbevolucionfamilia_csctbevolucionfamiliaid_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.csctbevolucionfamilia_csctbevolucionfamiliaid_seq', 1, true);
          public          postgres    false    239            �           0    0    csctbfamilia_csctbfamiliaid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.csctbfamilia_csctbfamiliaid_seq', 313, true);
          public          postgres    false    241            �           0    0    csctbficha_csctbfichaid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.csctbficha_csctbfichaid_seq', 233, true);
          public          postgres    false    243            �           0    0    csctbficha_num_ficha_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.csctbficha_num_ficha_seq', 231, true);
          public          postgres    false    244            �           0    0 '   csctbinstruccion_csctbinstruccionid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.csctbinstruccion_csctbinstruccionid_seq', 8, true);
          public          postgres    false    246            �           0    0    csctblogin_csctbloginid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.csctblogin_csctbloginid_seq', 3, true);
          public          postgres    false    248            �           0    0 %   csctbmortalidad_csctbmortalidadid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.csctbmortalidad_csctbmortalidadid_seq', 30, true);
          public          postgres    false    250            �           0    0 -   csctbmortenfermedad_csctbmortenfermedadid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.csctbmortenfermedad_csctbmortenfermedadid_seq', 11, true);
          public          postgres    false    252            �           0    0 5   csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.csctbnacionalidadetnica_csctbnacionalidadetnicaid_seq', 17, true);
          public          postgres    false    254            �           0    0 #   csctbocupacion_csctbocupacionid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.csctbocupacion_csctbocupacionid_seq', 438, true);
          public          postgres    false    256            �           0    0 %   csctbparentesco_csctbparentescoid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.csctbparentesco_csctbparentescoid_seq', 30, true);
          public          postgres    false    258            �           0    0 !   csctbpersonal_csctbpersonalid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.csctbpersonal_csctbpersonalid_seq', 53, true);
          public          postgres    false    260            �           0    0 '   csctbprioritario_csctbprioritarioid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.csctbprioritario_csctbprioritarioid_seq', 12, true);
          public          postgres    false    262            �           0    0 5   csctbprioritariofamilia_csctbprioritariofamiliaid_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.csctbprioritariofamilia_csctbprioritariofamiliaid_seq', 100, true);
          public          postgres    false    264            �           0    0 2   csctbprofesionalresponsable_csctbprofesionalid_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.csctbprofesionalresponsable_csctbprofesionalid_seq', 14, true);
          public          postgres    false    266            �           0    0    csctbpueblos_csctbpueblosid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.csctbpueblos_csctbpueblosid_seq', 18, true);
          public          postgres    false    268            �           0    0 )   csctbrambientales_csctbrambientalesid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.csctbrambientales_csctbrambientalesid_seq', 5, true);
          public          postgres    false    270            �           0    0 3   csctbrambientalfamilia_csctbrambientalfamiliaid_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.csctbrambientalfamilia_csctbrambientalfamiliaid_seq', 79, true);
          public          postgres    false    272            �           0    0 +   csctbrbiolofamilia_csctbrbiolofamiliaid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.csctbrbiolofamilia_csctbrbiolofamiliaid_seq', 96, true);
          public          postgres    false    274            �           0    0    csctbriesgoa_csctbriesgoaid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.csctbriesgoa_csctbriesgoaid_seq', 3, true);
          public          postgres    false    276            �           0    0 *   csctbriesgoavivienda_csctbriesgoavivid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.csctbriesgoavivienda_csctbriesgoavivid_seq', 14, true);
          public          postgres    false    278            �           0    0 '   csctbriesgobiolo_csctbriesgobioloid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.csctbriesgobiolo_csctbriesgobioloid_seq', 53, true);
          public          postgres    false    280            �           0    0 %   csctbriesgobste_csctbriesgobsteid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.csctbriesgobste_csctbriesgobsteid_seq', 29, true);
          public          postgres    false    282            �           0    0 /   csctbriesgoembarazada_csctbriesembarazadaid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.csctbriesgoembarazada_csctbriesembarazadaid_seq', 24, true);
          public          postgres    false    284            �           0    0    csctbriesgos_csctbriesgosid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.csctbriesgos_csctbriesgosid_seq', 81, true);
          public          postgres    false    286            �           0    0 "   csctbriesgosocio_csctbrsocioid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.csctbriesgosocio_csctbrsocioid_seq', 100, true);
          public          postgres    false    288            �           0    0     csctbriesgovi_csctbriesgovid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.csctbriesgovi_csctbriesgovid_seq', 4, true);
          public          postgres    false    290            �           0    0 -   csctbriesgovivienda_csctbriesgoviviendaid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.csctbriesgovivienda_csctbriesgoviviendaid_seq', 1, false);
          public          postgres    false    292            �           0    0    csctbroles_csctbrolesid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.csctbroles_csctbrolesid_seq', 4, true);
          public          postgres    false    294            �           0    0 +   csctbrsociofamilia_csctbrsociofamiliaid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.csctbrsociofamilia_csctbrsociofamiliaid_seq', 102, true);
          public          postgres    false    296            �           0    0    csctbrutas_csctbrutasid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.csctbrutas_csctbrutasid_seq', 3, true);
          public          postgres    false    298            �           0    0 %   csctbrutasroles_csctbrutasrolesid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.csctbrutasroles_csctbrutasrolesid_seq', 3, true);
          public          postgres    false    300            �           0    0 '   csctbtipofamilia_idcsctbtipofamilia_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.csctbtipofamilia_idcsctbtipofamilia_seq', 41, true);
          public          postgres    false    302            �           0    0 %   csctbtiporiesgo_csctbtiporiesgoid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.csctbtiporiesgo_csctbtiporiesgoid_seq', 3, true);
          public          postgres    false    304            �           0    0 +   csctbvacunafamilia_csctbvacunafamiliaid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.csctbvacunafamilia_csctbvacunafamiliaid_seq', 343, true);
          public          postgres    false    306            �           0    0    csctbvacunas_csctbvacunasid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.csctbvacunas_csctbvacunasid_seq', 24, true);
          public          postgres    false    308            �           0    0 !   csctbvivienda_csctbviviendaid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.csctbvivienda_csctbviviendaid_seq', 19, true);
          public          postgres    false    310            �           0    0 %   csctbvulnerable_csctbvulnerableid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.csctbvulnerable_csctbvulnerableid_seq', 6, true);
          public          postgres    false    312            �           0    0 3   csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.csctbvulnerablefamilia_csctbvulnerablefamiliaid_seq', 97, true);
          public          postgres    false    314            �           2606    59102 ,   csctbgenogramas csctbHistorialGenograma_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.csctbgenogramas
    ADD CONSTRAINT "csctbHistorialGenograma_pkey" PRIMARY KEY (csctbgenogramaid);
 X   ALTER TABLE ONLY public.csctbgenogramas DROP CONSTRAINT "csctbHistorialGenograma_pkey";
       public            postgres    false    214            �           2606    59104 *   csctbbarrioschambo csctbbarrioschambo_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.csctbbarrioschambo
    ADD CONSTRAINT csctbbarrioschambo_pkey PRIMARY KEY (csctbbarriosid);
 T   ALTER TABLE ONLY public.csctbbarrioschambo DROP CONSTRAINT csctbbarrioschambo_pkey;
       public            postgres    false    216                       2606    59106    csctbetnia csctbetnia_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.csctbetnia
    ADD CONSTRAINT csctbetnia_pkey PRIMARY KEY (csctbetniaid);
 D   ALTER TABLE ONLY public.csctbetnia DROP CONSTRAINT csctbetnia_pkey;
       public            postgres    false    230                       2606    59108 2   csctbevaluacionfamilia csctbevaluacionfamilia_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.csctbevaluacionfamilia
    ADD CONSTRAINT csctbevaluacionfamilia_pkey PRIMARY KEY (csctbevaluacionfamiliaid);
 \   ALTER TABLE ONLY public.csctbevaluacionfamilia DROP CONSTRAINT csctbevaluacionfamilia_pkey;
       public            postgres    false    234                       2606    59110 0   csctbevolucionfamilia csctbevolucionfamilia_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.csctbevolucionfamilia
    ADD CONSTRAINT csctbevolucionfamilia_pkey PRIMARY KEY (csctbevolucionfamiliaid);
 Z   ALTER TABLE ONLY public.csctbevolucionfamilia DROP CONSTRAINT csctbevolucionfamilia_pkey;
       public            postgres    false    238                       2606    59112    csctbficha csctbficha_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.csctbficha
    ADD CONSTRAINT csctbficha_pkey PRIMARY KEY (csctbfichaid);
 D   ALTER TABLE ONLY public.csctbficha DROP CONSTRAINT csctbficha_pkey;
       public            postgres    false    242                       2606    59114    csctblogin csctblogin_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.csctblogin
    ADD CONSTRAINT csctblogin_pkey PRIMARY KEY (csctbloginid);
 D   ALTER TABLE ONLY public.csctblogin DROP CONSTRAINT csctblogin_pkey;
       public            postgres    false    247            "           2606    59116 4   csctbnacionalidadetnica csctbnacionalidadetnica_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.csctbnacionalidadetnica
    ADD CONSTRAINT csctbnacionalidadetnica_pkey PRIMARY KEY (csctbnacionalidadetnicaid);
 ^   ALTER TABLE ONLY public.csctbnacionalidadetnica DROP CONSTRAINT csctbnacionalidadetnica_pkey;
       public            postgres    false    253            .           2606    59118 <   csctbprofesionalresponsable csctbprofesionalresponsable_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.csctbprofesionalresponsable
    ADD CONSTRAINT csctbprofesionalresponsable_pkey PRIMARY KEY (csctbprofesionalid);
 f   ALTER TABLE ONLY public.csctbprofesionalresponsable DROP CONSTRAINT csctbprofesionalresponsable_pkey;
       public            postgres    false    265            0           2606    59120    csctbpueblos csctbpueblos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.csctbpueblos
    ADD CONSTRAINT csctbpueblos_pkey PRIMARY KEY (csctbpueblosid);
 H   ALTER TABLE ONLY public.csctbpueblos DROP CONSTRAINT csctbpueblos_pkey;
       public            postgres    false    267            2           2606    59122 (   csctbrambientales csctbrambientales_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.csctbrambientales
    ADD CONSTRAINT csctbrambientales_pkey PRIMARY KEY (csctbrambientalesid);
 R   ALTER TABLE ONLY public.csctbrambientales DROP CONSTRAINT csctbrambientales_pkey;
       public            postgres    false    269            4           2606    59124 2   csctbrambientalfamilia csctbrambientalfamilia_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.csctbrambientalfamilia
    ADD CONSTRAINT csctbrambientalfamilia_pkey PRIMARY KEY (csctbrambientalfamiliaid);
 \   ALTER TABLE ONLY public.csctbrambientalfamilia DROP CONSTRAINT csctbrambientalfamilia_pkey;
       public            postgres    false    271            J           2606    59126    csctbroles csctbroles_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.csctbroles
    ADD CONSTRAINT csctbroles_pkey PRIMARY KEY (csctbrolesid);
 D   ALTER TABLE ONLY public.csctbroles DROP CONSTRAINT csctbroles_pkey;
       public            postgres    false    293            N           2606    59128    csctbrutas csctbrutas_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.csctbrutas
    ADD CONSTRAINT csctbrutas_pkey PRIMARY KEY (csctbrutasid);
 D   ALTER TABLE ONLY public.csctbrutas DROP CONSTRAINT csctbrutas_pkey;
       public            postgres    false    297            P           2606    59130 $   csctbrutasroles csctbrutasroles_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.csctbrutasroles
    ADD CONSTRAINT csctbrutasroles_pkey PRIMARY KEY (csctbrutasrolesid);
 N   ALTER TABLE ONLY public.csctbrutasroles DROP CONSTRAINT csctbrutasroles_pkey;
       public            postgres    false    299            R           2606    59132 .   csctbdiagnosticofamiliar csctbtipofamilia_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.csctbdiagnosticofamiliar
    ADD CONSTRAINT csctbtipofamilia_pkey PRIMARY KEY (csctbdiagnosticoid);
 X   ALTER TABLE ONLY public.csctbdiagnosticofamiliar DROP CONSTRAINT csctbtipofamilia_pkey;
       public            postgres    false    301                        2606    59134 &   csctbdiscapacidad pk_csctbdiscapacidad 
   CONSTRAINT     u   ALTER TABLE ONLY public.csctbdiscapacidad
    ADD CONSTRAINT pk_csctbdiscapacidad PRIMARY KEY (csctbdiscapacidadid);
 P   ALTER TABLE ONLY public.csctbdiscapacidad DROP CONSTRAINT pk_csctbdiscapacidad;
       public            postgres    false    218                       2606    59136 $   csctbdiscariesgo pk_csctbdiscariesgo 
   CONSTRAINT     r   ALTER TABLE ONLY public.csctbdiscariesgo
    ADD CONSTRAINT pk_csctbdiscariesgo PRIMARY KEY (csctbdiscariesgoid);
 N   ALTER TABLE ONLY public.csctbdiscariesgo DROP CONSTRAINT pk_csctbdiscariesgo;
       public            postgres    false    220                       2606    59138    csctbedades pk_csctbedades 
   CONSTRAINT     c   ALTER TABLE ONLY public.csctbedades
    ADD CONSTRAINT pk_csctbedades PRIMARY KEY (csctbedadesid);
 D   ALTER TABLE ONLY public.csctbedades DROP CONSTRAINT pk_csctbedades;
       public            postgres    false    222                       2606    59140 $   csctbembarazadas pk_csctbembarazadas 
   CONSTRAINT     r   ALTER TABLE ONLY public.csctbembarazadas
    ADD CONSTRAINT pk_csctbembarazadas PRIMARY KEY (csctbembarazadasid);
 N   ALTER TABLE ONLY public.csctbembarazadas DROP CONSTRAINT pk_csctbembarazadas;
       public            postgres    false    224            
           2606    59142 "   csctbenfermedad pk_csctbenfermedad 
   CONSTRAINT     o   ALTER TABLE ONLY public.csctbenfermedad
    ADD CONSTRAINT pk_csctbenfermedad PRIMARY KEY (csctbenfermedadid);
 L   ALTER TABLE ONLY public.csctbenfermedad DROP CONSTRAINT pk_csctbenfermedad;
       public            postgres    false    227                       2606    59144 #   csctbenferfam pk_csctbenfermeriesgo 
   CONSTRAINT     s   ALTER TABLE ONLY public.csctbenferfam
    ADD CONSTRAINT pk_csctbenfermeriesgo PRIMARY KEY (csctbenfermeriesgoid);
 M   ALTER TABLE ONLY public.csctbenferfam DROP CONSTRAINT pk_csctbenfermeriesgo;
       public            postgres    false    226                       2606    59146 "   csctbevaluacion pk_csctbevaluacion 
   CONSTRAINT     o   ALTER TABLE ONLY public.csctbevaluacion
    ADD CONSTRAINT pk_csctbevaluacion PRIMARY KEY (csctbevaluacionid);
 L   ALTER TABLE ONLY public.csctbevaluacion DROP CONSTRAINT pk_csctbevaluacion;
       public            postgres    false    232                       2606    59148 &   csctbevaluariesgo pk_csctbevaluariesgo 
   CONSTRAINT     u   ALTER TABLE ONLY public.csctbevaluariesgo
    ADD CONSTRAINT pk_csctbevaluariesgo PRIMARY KEY (csctbevaluariesgoid);
 P   ALTER TABLE ONLY public.csctbevaluariesgo DROP CONSTRAINT pk_csctbevaluariesgo;
       public            postgres    false    236                       2606    59150    csctbfamilia pk_csctbfamilia 
   CONSTRAINT     f   ALTER TABLE ONLY public.csctbfamilia
    ADD CONSTRAINT pk_csctbfamilia PRIMARY KEY (csctbfamiliaid);
 F   ALTER TABLE ONLY public.csctbfamilia DROP CONSTRAINT pk_csctbfamilia;
       public            postgres    false    240                       2606    59152 $   csctbinstruccion pk_csctbinstruccion 
   CONSTRAINT     r   ALTER TABLE ONLY public.csctbinstruccion
    ADD CONSTRAINT pk_csctbinstruccion PRIMARY KEY (csctbinstruccionid);
 N   ALTER TABLE ONLY public.csctbinstruccion DROP CONSTRAINT pk_csctbinstruccion;
       public            postgres    false    245                       2606    59154 "   csctbmortalidad pk_csctbmortalidad 
   CONSTRAINT     o   ALTER TABLE ONLY public.csctbmortalidad
    ADD CONSTRAINT pk_csctbmortalidad PRIMARY KEY (csctbmortalidadid);
 L   ALTER TABLE ONLY public.csctbmortalidad DROP CONSTRAINT pk_csctbmortalidad;
       public            postgres    false    249                        2606    59156 *   csctbmortenfermedad pk_csctbmortenfermedad 
   CONSTRAINT     {   ALTER TABLE ONLY public.csctbmortenfermedad
    ADD CONSTRAINT pk_csctbmortenfermedad PRIMARY KEY (csctbmortenfermedadid);
 T   ALTER TABLE ONLY public.csctbmortenfermedad DROP CONSTRAINT pk_csctbmortenfermedad;
       public            postgres    false    251            $           2606    59158     csctbocupacion pk_csctbocupacion 
   CONSTRAINT     l   ALTER TABLE ONLY public.csctbocupacion
    ADD CONSTRAINT pk_csctbocupacion PRIMARY KEY (csctbocupacionid);
 J   ALTER TABLE ONLY public.csctbocupacion DROP CONSTRAINT pk_csctbocupacion;
       public            postgres    false    255            &           2606    59160 "   csctbparentesco pk_csctbparentesco 
   CONSTRAINT     o   ALTER TABLE ONLY public.csctbparentesco
    ADD CONSTRAINT pk_csctbparentesco PRIMARY KEY (csctbparentescoid);
 L   ALTER TABLE ONLY public.csctbparentesco DROP CONSTRAINT pk_csctbparentesco;
       public            postgres    false    257            (           2606    59162    csctbpersonal pk_csctbpersonal 
   CONSTRAINT     i   ALTER TABLE ONLY public.csctbpersonal
    ADD CONSTRAINT pk_csctbpersonal PRIMARY KEY (csctbpersonalid);
 H   ALTER TABLE ONLY public.csctbpersonal DROP CONSTRAINT pk_csctbpersonal;
       public            postgres    false    259            *           2606    59164 $   csctbprioritario pk_csctbprioritario 
   CONSTRAINT     r   ALTER TABLE ONLY public.csctbprioritario
    ADD CONSTRAINT pk_csctbprioritario PRIMARY KEY (csctbprioritarioid);
 N   ALTER TABLE ONLY public.csctbprioritario DROP CONSTRAINT pk_csctbprioritario;
       public            postgres    false    261            ,           2606    59166 2   csctbprioritariofamilia pk_csctbprioritariofamilia 
   CONSTRAINT     �   ALTER TABLE ONLY public.csctbprioritariofamilia
    ADD CONSTRAINT pk_csctbprioritariofamilia PRIMARY KEY (csctbprioritariofamiliaid);
 \   ALTER TABLE ONLY public.csctbprioritariofamilia DROP CONSTRAINT pk_csctbprioritariofamilia;
       public            postgres    false    263            6           2606    59168 (   csctbrbiolofamilia pk_csctbrbiolofamilia 
   CONSTRAINT     x   ALTER TABLE ONLY public.csctbrbiolofamilia
    ADD CONSTRAINT pk_csctbrbiolofamilia PRIMARY KEY (csctbrbiolofamiliaid);
 R   ALTER TABLE ONLY public.csctbrbiolofamilia DROP CONSTRAINT pk_csctbrbiolofamilia;
       public            postgres    false    273            8           2606    59170    csctbriesgoa pk_csctbriesgoa 
   CONSTRAINT     f   ALTER TABLE ONLY public.csctbriesgoa
    ADD CONSTRAINT pk_csctbriesgoa PRIMARY KEY (csctbriesgoaid);
 F   ALTER TABLE ONLY public.csctbriesgoa DROP CONSTRAINT pk_csctbriesgoa;
       public            postgres    false    275            :           2606    59172 ,   csctbriesgoavivienda pk_csctbriesgoavivienda 
   CONSTRAINT     y   ALTER TABLE ONLY public.csctbriesgoavivienda
    ADD CONSTRAINT pk_csctbriesgoavivienda PRIMARY KEY (csctbriesgoavivid);
 V   ALTER TABLE ONLY public.csctbriesgoavivienda DROP CONSTRAINT pk_csctbriesgoavivienda;
       public            postgres    false    277            <           2606    59174 $   csctbriesgobiolo pk_csctbriesgobiolo 
   CONSTRAINT     r   ALTER TABLE ONLY public.csctbriesgobiolo
    ADD CONSTRAINT pk_csctbriesgobiolo PRIMARY KEY (csctbriesgobioloid);
 N   ALTER TABLE ONLY public.csctbriesgobiolo DROP CONSTRAINT pk_csctbriesgobiolo;
       public            postgres    false    279            >           2606    59176 "   csctbriesgobste pk_csctbriesgobste 
   CONSTRAINT     o   ALTER TABLE ONLY public.csctbriesgobste
    ADD CONSTRAINT pk_csctbriesgobste PRIMARY KEY (csctbriesgobsteid);
 L   ALTER TABLE ONLY public.csctbriesgobste DROP CONSTRAINT pk_csctbriesgobste;
       public            postgres    false    281            @           2606    59178 .   csctbriesgoembarazada pk_csctbriesgoembarazada 
   CONSTRAINT        ALTER TABLE ONLY public.csctbriesgoembarazada
    ADD CONSTRAINT pk_csctbriesgoembarazada PRIMARY KEY (csctbriesembarazadaid);
 X   ALTER TABLE ONLY public.csctbriesgoembarazada DROP CONSTRAINT pk_csctbriesgoembarazada;
       public            postgres    false    283            B           2606    59180    csctbriesgos pk_csctbriesgos 
   CONSTRAINT     f   ALTER TABLE ONLY public.csctbriesgos
    ADD CONSTRAINT pk_csctbriesgos PRIMARY KEY (csctbriesgosid);
 F   ALTER TABLE ONLY public.csctbriesgos DROP CONSTRAINT pk_csctbriesgos;
       public            postgres    false    285            D           2606    59182 $   csctbriesgosocio pk_csctbriesgosocio 
   CONSTRAINT     m   ALTER TABLE ONLY public.csctbriesgosocio
    ADD CONSTRAINT pk_csctbriesgosocio PRIMARY KEY (csctbrsocioid);
 N   ALTER TABLE ONLY public.csctbriesgosocio DROP CONSTRAINT pk_csctbriesgosocio;
       public            postgres    false    287            F           2606    59184    csctbriesgovi pk_csctbriesgovi 
   CONSTRAINT     h   ALTER TABLE ONLY public.csctbriesgovi
    ADD CONSTRAINT pk_csctbriesgovi PRIMARY KEY (csctbriesgovid);
 H   ALTER TABLE ONLY public.csctbriesgovi DROP CONSTRAINT pk_csctbriesgovi;
       public            postgres    false    289            H           2606    59186 *   csctbriesgovivienda pk_csctbriesgovivienda 
   CONSTRAINT     {   ALTER TABLE ONLY public.csctbriesgovivienda
    ADD CONSTRAINT pk_csctbriesgovivienda PRIMARY KEY (csctbriesgoviviendaid);
 T   ALTER TABLE ONLY public.csctbriesgovivienda DROP CONSTRAINT pk_csctbriesgovivienda;
       public            postgres    false    291            L           2606    59188 (   csctbrsociofamilia pk_csctbrsociofamilia 
   CONSTRAINT     x   ALTER TABLE ONLY public.csctbrsociofamilia
    ADD CONSTRAINT pk_csctbrsociofamilia PRIMARY KEY (csctbrsociofamiliaid);
 R   ALTER TABLE ONLY public.csctbrsociofamilia DROP CONSTRAINT pk_csctbrsociofamilia;
       public            postgres    false    295            T           2606    59190 "   csctbtiporiesgo pk_csctbtiporiesgo 
   CONSTRAINT     o   ALTER TABLE ONLY public.csctbtiporiesgo
    ADD CONSTRAINT pk_csctbtiporiesgo PRIMARY KEY (csctbtiporiesgoid);
 L   ALTER TABLE ONLY public.csctbtiporiesgo DROP CONSTRAINT pk_csctbtiporiesgo;
       public            postgres    false    303            V           2606    59192 (   csctbvacunafamilia pk_csctbvacunafamilia 
   CONSTRAINT     x   ALTER TABLE ONLY public.csctbvacunafamilia
    ADD CONSTRAINT pk_csctbvacunafamilia PRIMARY KEY (csctbvacunafamiliaid);
 R   ALTER TABLE ONLY public.csctbvacunafamilia DROP CONSTRAINT pk_csctbvacunafamilia;
       public            postgres    false    305            X           2606    59194    csctbvacunas pk_csctbvacunas 
   CONSTRAINT     f   ALTER TABLE ONLY public.csctbvacunas
    ADD CONSTRAINT pk_csctbvacunas PRIMARY KEY (csctbvacunasid);
 F   ALTER TABLE ONLY public.csctbvacunas DROP CONSTRAINT pk_csctbvacunas;
       public            postgres    false    307            Z           2606    59196    csctbvivienda pk_csctbvivienda 
   CONSTRAINT     i   ALTER TABLE ONLY public.csctbvivienda
    ADD CONSTRAINT pk_csctbvivienda PRIMARY KEY (csctbviviendaid);
 H   ALTER TABLE ONLY public.csctbvivienda DROP CONSTRAINT pk_csctbvivienda;
       public            postgres    false    309            \           2606    59198 "   csctbvulnerable pk_csctbvulnerable 
   CONSTRAINT     o   ALTER TABLE ONLY public.csctbvulnerable
    ADD CONSTRAINT pk_csctbvulnerable PRIMARY KEY (csctbvulnerableid);
 L   ALTER TABLE ONLY public.csctbvulnerable DROP CONSTRAINT pk_csctbvulnerable;
       public            postgres    false    311            ^           2606    59200 0   csctbvulnerablefamilia pk_csctbvulnerablefamilia 
   CONSTRAINT     �   ALTER TABLE ONLY public.csctbvulnerablefamilia
    ADD CONSTRAINT pk_csctbvulnerablefamilia PRIMARY KEY (csctbvulnerablefamiliaid);
 Z   ALTER TABLE ONLY public.csctbvulnerablefamilia DROP CONSTRAINT pk_csctbvulnerablefamilia;
       public            postgres    false    313            g           2606    59201 5   csctbevolucionfamilia csctbevoluacion_rf_csctbfamilia    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbevolucionfamilia
    ADD CONSTRAINT csctbevoluacion_rf_csctbfamilia FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) NOT VALID;
 _   ALTER TABLE ONLY public.csctbevolucionfamilia DROP CONSTRAINT csctbevoluacion_rf_csctbfamilia;
       public          postgres    false    240    238    3606            h           2606    59206 5   csctbevolucionfamilia csctbevolucion_rf_csctbpersonal    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbevolucionfamilia
    ADD CONSTRAINT csctbevolucion_rf_csctbpersonal FOREIGN KEY (csctbresponsableid) REFERENCES public.csctbpersonal(csctbpersonalid) NOT VALID;
 _   ALTER TABLE ONLY public.csctbevolucionfamilia DROP CONSTRAINT csctbevolucion_rf_csctbpersonal;
       public          postgres    false    3624    259    238            {           2606    59211 :   csctbrambientalfamilia csctbfamilia-csctbrambientalfamilia    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrambientalfamilia
    ADD CONSTRAINT "csctbfamilia-csctbrambientalfamilia" FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) NOT VALID;
 f   ALTER TABLE ONLY public.csctbrambientalfamilia DROP CONSTRAINT "csctbfamilia-csctbrambientalfamilia";
       public          postgres    false    271    3606    240            o           2606    59216    csctbficha csctbfamiliaid    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbficha
    ADD CONSTRAINT csctbfamiliaid FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid);
 C   ALTER TABLE ONLY public.csctbficha DROP CONSTRAINT csctbfamiliaid;
       public          postgres    false    3606    242    240            p           2606    59221    csctblogin csctbpersonalid    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctblogin
    ADD CONSTRAINT csctbpersonalid FOREIGN KEY (csctbpersonalid) REFERENCES public.csctbpersonal(csctbpersonalid) NOT VALID;
 D   ALTER TABLE ONLY public.csctblogin DROP CONSTRAINT csctbpersonalid;
       public          postgres    false    259    247    3624            y           2606    59226 <   csctbprofesionalresponsable csctbprofesional_rf_csctbfamilia    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbprofesionalresponsable
    ADD CONSTRAINT csctbprofesional_rf_csctbfamilia FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) NOT VALID;
 f   ALTER TABLE ONLY public.csctbprofesionalresponsable DROP CONSTRAINT csctbprofesional_rf_csctbfamilia;
       public          postgres    false    3606    240    265            z           2606    59231 =   csctbprofesionalresponsable csctbprofesional_rf_csctbpersonal    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbprofesionalresponsable
    ADD CONSTRAINT csctbprofesional_rf_csctbpersonal FOREIGN KEY (csctbpersonalid) REFERENCES public.csctbpersonal(csctbpersonalid) NOT VALID;
 g   ALTER TABLE ONLY public.csctbprofesionalresponsable DROP CONSTRAINT csctbprofesional_rf_csctbpersonal;
       public          postgres    false    265    3624    259            |           2606    59236 ?   csctbrambientalfamilia csctbrambientales-csctbrambientalfamilia    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrambientalfamilia
    ADD CONSTRAINT "csctbrambientales-csctbrambientalfamilia" FOREIGN KEY (csctbrambientalesid) REFERENCES public.csctbrambientales(csctbrambientalesid) NOT VALID;
 k   ALTER TABLE ONLY public.csctbrambientalfamilia DROP CONSTRAINT "csctbrambientales-csctbrambientalfamilia";
       public          postgres    false    271    3634    269            �           2606    59241    csctbrutasroles csctbrolesid    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrutasroles
    ADD CONSTRAINT csctbrolesid FOREIGN KEY (csctbrolesid) REFERENCES public.csctbroles(csctbrolesid) NOT VALID;
 F   ALTER TABLE ONLY public.csctbrutasroles DROP CONSTRAINT csctbrolesid;
       public          postgres    false    3658    299    293            �           2606    59246    csctbrutasroles csctbrutasid    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrutasroles
    ADD CONSTRAINT csctbrutasid FOREIGN KEY (csctbrutasid) REFERENCES public.csctbrutas(csctbrutasid) NOT VALID;
 F   ALTER TABLE ONLY public.csctbrutasroles DROP CONSTRAINT csctbrutasid;
       public          postgres    false    299    3662    297            q           2606    59251    csctblogin csctbrutasrolesid    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctblogin
    ADD CONSTRAINT csctbrutasrolesid FOREIGN KEY (csctbrutasrolesid) REFERENCES public.csctbrutasroles(csctbrutasrolesid) NOT VALID;
 F   ALTER TABLE ONLY public.csctblogin DROP CONSTRAINT csctbrutasrolesid;
       public          postgres    false    247    3664    299                       2606    59256 1   csctbriesgoavivienda csctbviviendaid_csctbriesgoa    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgoavivienda
    ADD CONSTRAINT csctbviviendaid_csctbriesgoa FOREIGN KEY (csctbviviendaid) REFERENCES public.csctbvivienda(csctbviviendaid) NOT VALID;
 [   ALTER TABLE ONLY public.csctbriesgoavivienda DROP CONSTRAINT csctbviviendaid_csctbriesgoa;
       public          postgres    false    3674    277    309            `           2606    59261 /   csctbdiscariesgo fk_csctbdis_reference_csctbdis    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbdiscariesgo
    ADD CONSTRAINT fk_csctbdis_reference_csctbdis FOREIGN KEY (csctbdiscapacidadid) REFERENCES public.csctbdiscapacidad(csctbdiscapacidadid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.csctbdiscariesgo DROP CONSTRAINT fk_csctbdis_reference_csctbdis;
       public          postgres    false    220    3584    218            a           2606    59266 /   csctbdiscariesgo fk_csctbdis_reference_csctbrie    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbdiscariesgo
    ADD CONSTRAINT fk_csctbdis_reference_csctbrie FOREIGN KEY (csctbriesgosid) REFERENCES public.csctbriesgos(csctbriesgosid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.csctbdiscariesgo DROP CONSTRAINT fk_csctbdis_reference_csctbrie;
       public          postgres    false    3650    285    220            b           2606    59271 /   csctbembarazadas fk_csctbemb_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbembarazadas
    ADD CONSTRAINT fk_csctbemb_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.csctbembarazadas DROP CONSTRAINT fk_csctbemb_reference_csctbfam;
       public          postgres    false    3606    224    240            c           2606    59276 ,   csctbenferfam fk_csctbenf_reference_csctbenf    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbenferfam
    ADD CONSTRAINT fk_csctbenf_reference_csctbenf FOREIGN KEY (csctbenfermedadid) REFERENCES public.csctbenfermedad(csctbenfermedadid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.csctbenferfam DROP CONSTRAINT fk_csctbenf_reference_csctbenf;
       public          postgres    false    227    226    3594            d           2606    59281 2   csctbenferfam fk_csctbenf_reference_csctbfamiliaid    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbenferfam
    ADD CONSTRAINT fk_csctbenf_reference_csctbfamiliaid FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) NOT VALID;
 \   ALTER TABLE ONLY public.csctbenferfam DROP CONSTRAINT fk_csctbenf_reference_csctbfamiliaid;
       public          postgres    false    240    226    3606            e           2606    59286 0   csctbevaluariesgo fk_csctbeva_reference_csctbeva    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbevaluariesgo
    ADD CONSTRAINT fk_csctbeva_reference_csctbeva FOREIGN KEY (csctbevaluacionid) REFERENCES public.csctbevaluacion(csctbevaluacionid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public.csctbevaluariesgo DROP CONSTRAINT fk_csctbeva_reference_csctbeva;
       public          postgres    false    236    3598    232            f           2606    59291 4   csctbevaluariesgo fk_csctbeva_reference_csctbfamilia    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbevaluariesgo
    ADD CONSTRAINT fk_csctbeva_reference_csctbfamilia FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) NOT VALID;
 ^   ALTER TABLE ONLY public.csctbevaluariesgo DROP CONSTRAINT fk_csctbeva_reference_csctbfamilia;
       public          postgres    false    236    3606    240            i           2606    59296 -   csctbfamilia fk_csctbfam_reference_csctbetnia    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbfamilia
    ADD CONSTRAINT fk_csctbfam_reference_csctbetnia FOREIGN KEY (csctbetniaid) REFERENCES public.csctbetnia(csctbetniaid) NOT VALID;
 W   ALTER TABLE ONLY public.csctbfamilia DROP CONSTRAINT fk_csctbfam_reference_csctbetnia;
       public          postgres    false    240    3596    230            j           2606    59301 +   csctbfamilia fk_csctbfam_reference_csctbins    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbfamilia
    ADD CONSTRAINT fk_csctbfam_reference_csctbins FOREIGN KEY (csctbinstruccionid) REFERENCES public.csctbinstruccion(csctbinstruccionid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.csctbfamilia DROP CONSTRAINT fk_csctbfam_reference_csctbins;
       public          postgres    false    240    3610    245            k           2606    59306 4   csctbfamilia fk_csctbfam_reference_csctbnacionalidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbfamilia
    ADD CONSTRAINT fk_csctbfam_reference_csctbnacionalidad FOREIGN KEY (csctbnacionalidadid) REFERENCES public.csctbnacionalidadetnica(csctbnacionalidadetnicaid) NOT VALID;
 ^   ALTER TABLE ONLY public.csctbfamilia DROP CONSTRAINT fk_csctbfam_reference_csctbnacionalidad;
       public          postgres    false    240    3618    253            l           2606    59311 +   csctbfamilia fk_csctbfam_reference_csctbocu    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbfamilia
    ADD CONSTRAINT fk_csctbfam_reference_csctbocu FOREIGN KEY (csctbocupacionid) REFERENCES public.csctbocupacion(csctbocupacionid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.csctbfamilia DROP CONSTRAINT fk_csctbfam_reference_csctbocu;
       public          postgres    false    240    3620    255            m           2606    59316 +   csctbfamilia fk_csctbfam_reference_csctbpar    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbfamilia
    ADD CONSTRAINT fk_csctbfam_reference_csctbpar FOREIGN KEY (csctbparentescoid) REFERENCES public.csctbparentesco(csctbparentescoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.csctbfamilia DROP CONSTRAINT fk_csctbfam_reference_csctbpar;
       public          postgres    false    240    3622    257            n           2606    59321 3   csctbfamilia fk_csctbfamilia_reference_csctbpueblos    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbfamilia
    ADD CONSTRAINT fk_csctbfamilia_reference_csctbpueblos FOREIGN KEY (csctbpueblosid) REFERENCES public.csctbpueblos(csctbpueblosid) NOT VALID;
 ]   ALTER TABLE ONLY public.csctbfamilia DROP CONSTRAINT fk_csctbfamilia_reference_csctbpueblos;
       public          postgres    false    3632    240    267            �           2606    59326 F   csctbriesgoembarazada fk_csctbfamilia_reference_csctbriesgoeembarazada    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgoembarazada
    ADD CONSTRAINT fk_csctbfamilia_reference_csctbriesgoeembarazada FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) NOT VALID;
 p   ALTER TABLE ONLY public.csctbriesgoembarazada DROP CONSTRAINT fk_csctbfamilia_reference_csctbriesgoeembarazada;
       public          postgres    false    283    3606    240            t           2606    59331 2   csctbmortenfermedad fk_csctbmor_reference_csctbenf    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbmortenfermedad
    ADD CONSTRAINT fk_csctbmor_reference_csctbenf FOREIGN KEY (csctbenfermedadid) REFERENCES public.csctbenfermedad(csctbenfermedadid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.csctbmortenfermedad DROP CONSTRAINT fk_csctbmor_reference_csctbenf;
       public          postgres    false    251    3594    227            r           2606    59336 .   csctbmortalidad fk_csctbmor_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbmortalidad
    ADD CONSTRAINT fk_csctbmor_reference_csctbfam FOREIGN KEY (csctbjefefamid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.csctbmortalidad DROP CONSTRAINT fk_csctbmor_reference_csctbfam;
       public          postgres    false    249    3606    240            u           2606    59341 2   csctbmortenfermedad fk_csctbmor_reference_csctbmor    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbmortenfermedad
    ADD CONSTRAINT fk_csctbmor_reference_csctbmor FOREIGN KEY (csctbmortalidadid) REFERENCES public.csctbmortalidad(csctbmortalidadid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.csctbmortenfermedad DROP CONSTRAINT fk_csctbmor_reference_csctbmor;
       public          postgres    false    251    3614    249            s           2606    59346 .   csctbmortalidad fk_csctbmor_reference_csctbpar    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbmortalidad
    ADD CONSTRAINT fk_csctbmor_reference_csctbpar FOREIGN KEY (csctbparentescoid) REFERENCES public.csctbparentesco(csctbparentescoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.csctbmortalidad DROP CONSTRAINT fk_csctbmor_reference_csctbpar;
       public          postgres    false    249    3622    257            w           2606    59351 6   csctbprioritariofamilia fk_csctbpri_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbprioritariofamilia
    ADD CONSTRAINT fk_csctbpri_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 `   ALTER TABLE ONLY public.csctbprioritariofamilia DROP CONSTRAINT fk_csctbpri_reference_csctbfam;
       public          postgres    false    263    3606    240            x           2606    59356 6   csctbprioritariofamilia fk_csctbpri_reference_csctbpri    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbprioritariofamilia
    ADD CONSTRAINT fk_csctbpri_reference_csctbpri FOREIGN KEY (csctbprioritarioid) REFERENCES public.csctbprioritario(csctbprioritarioid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 `   ALTER TABLE ONLY public.csctbprioritariofamilia DROP CONSTRAINT fk_csctbpri_reference_csctbpri;
       public          postgres    false    263    3626    261            }           2606    59361 1   csctbrbiolofamilia fk_csctbrbi_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrbiolofamilia
    ADD CONSTRAINT fk_csctbrbi_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public.csctbrbiolofamilia DROP CONSTRAINT fk_csctbrbi_reference_csctbfam;
       public          postgres    false    273    3606    240            ~           2606    59366 1   csctbrbiolofamilia fk_csctbrbi_reference_csctbrie    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrbiolofamilia
    ADD CONSTRAINT fk_csctbrbi_reference_csctbrie FOREIGN KEY (csctbriesgobioloid) REFERENCES public.csctbriesgobiolo(csctbriesgobioloid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public.csctbrbiolofamilia DROP CONSTRAINT fk_csctbrbi_reference_csctbrie;
       public          postgres    false    279    3644    273            �           2606    59371 /   csctbriesgobiolo fk_csctbrie_reference_csctbeda    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgobiolo
    ADD CONSTRAINT fk_csctbrie_reference_csctbeda FOREIGN KEY (csctbedadesid) REFERENCES public.csctbedades(csctbedadesid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.csctbriesgobiolo DROP CONSTRAINT fk_csctbrie_reference_csctbeda;
       public          postgres    false    279    3588    222            �           2606    59376 /   csctbriesgosocio fk_csctbrie_reference_csctbeda    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgosocio
    ADD CONSTRAINT fk_csctbrie_reference_csctbeda FOREIGN KEY (csctbedadesid) REFERENCES public.csctbedades(csctbedadesid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.csctbriesgosocio DROP CONSTRAINT fk_csctbrie_reference_csctbeda;
       public          postgres    false    287    3588    222            �           2606    59381 +   csctbriesgos fk_csctbrie_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgos
    ADD CONSTRAINT fk_csctbrie_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.csctbriesgos DROP CONSTRAINT fk_csctbrie_reference_csctbfam;
       public          postgres    false    285    3606    240            �           2606    59386 4   csctbriesgoembarazada fk_csctbrie_reference_csctbrie    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgoembarazada
    ADD CONSTRAINT fk_csctbrie_reference_csctbrie FOREIGN KEY (csctbriesgobsteid) REFERENCES public.csctbriesgobste(csctbriesgobsteid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ^   ALTER TABLE ONLY public.csctbriesgoembarazada DROP CONSTRAINT fk_csctbrie_reference_csctbrie;
       public          postgres    false    283    3646    281            �           2606    59391 2   csctbriesgovivienda fk_csctbrie_reference_csctbrie    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgovivienda
    ADD CONSTRAINT fk_csctbrie_reference_csctbrie FOREIGN KEY (csctbriesgovid) REFERENCES public.csctbriesgovi(csctbriesgovid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.csctbriesgovivienda DROP CONSTRAINT fk_csctbrie_reference_csctbrie;
       public          postgres    false    291    3654    289            �           2606    59396 .   csctbriesgobste fk_csctbrie_reference_csctbtip    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgobste
    ADD CONSTRAINT fk_csctbrie_reference_csctbtip FOREIGN KEY (csctbtiporiesgoid) REFERENCES public.csctbtiporiesgo(csctbtiporiesgoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.csctbriesgobste DROP CONSTRAINT fk_csctbrie_reference_csctbtip;
       public          postgres    false    281    3668    303            �           2606    59401 2   csctbriesgovivienda fk_csctbrie_reference_csctbviv    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbriesgovivienda
    ADD CONSTRAINT fk_csctbrie_reference_csctbviv FOREIGN KEY (csctbviviendaid) REFERENCES public.csctbvivienda(csctbviviendaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.csctbriesgovivienda DROP CONSTRAINT fk_csctbrie_reference_csctbviv;
       public          postgres    false    291    3674    309            �           2606    59406 1   csctbrsociofamilia fk_csctbrso_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrsociofamilia
    ADD CONSTRAINT fk_csctbrso_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public.csctbrsociofamilia DROP CONSTRAINT fk_csctbrso_reference_csctbfam;
       public          postgres    false    295    3606    240            �           2606    59411 1   csctbrsociofamilia fk_csctbrso_reference_csctbrie    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbrsociofamilia
    ADD CONSTRAINT fk_csctbrso_reference_csctbrie FOREIGN KEY (csctbrsocioid) REFERENCES public.csctbriesgosocio(csctbrsocioid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public.csctbrsociofamilia DROP CONSTRAINT fk_csctbrso_reference_csctbrie;
       public          postgres    false    295    3652    287            �           2606    59416 +   csctbvacunas fk_csctbvac_reference_csctbeda    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbvacunas
    ADD CONSTRAINT fk_csctbvac_reference_csctbeda FOREIGN KEY (csctbedadesid) REFERENCES public.csctbedades(csctbedadesid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.csctbvacunas DROP CONSTRAINT fk_csctbvac_reference_csctbeda;
       public          postgres    false    307    3588    222            �           2606    59421 1   csctbvacunafamilia fk_csctbvac_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbvacunafamilia
    ADD CONSTRAINT fk_csctbvac_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public.csctbvacunafamilia DROP CONSTRAINT fk_csctbvac_reference_csctbfam;
       public          postgres    false    305    3606    240            �           2606    59426 1   csctbvacunafamilia fk_csctbvac_reference_csctbvac    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbvacunafamilia
    ADD CONSTRAINT fk_csctbvac_reference_csctbvac FOREIGN KEY (csctbvacunasid) REFERENCES public.csctbvacunas(csctbvacunasid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public.csctbvacunafamilia DROP CONSTRAINT fk_csctbvac_reference_csctbvac;
       public          postgres    false    305    3672    307            �           2606    59431 /   csctbvivienda fk_csctbviv_reference_csctbbarios    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbvivienda
    ADD CONSTRAINT fk_csctbviv_reference_csctbbarios FOREIGN KEY (csctbbarriochamboid) REFERENCES public.csctbbarrioschambo(csctbbarriosid) NOT VALID;
 Y   ALTER TABLE ONLY public.csctbvivienda DROP CONSTRAINT fk_csctbviv_reference_csctbbarios;
       public          postgres    false    309    3582    216            �           2606    59436 ,   csctbvivienda fk_csctbviv_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbvivienda
    ADD CONSTRAINT fk_csctbviv_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.csctbvivienda DROP CONSTRAINT fk_csctbviv_reference_csctbfam;
       public          postgres    false    309    3606    240            �           2606    59441 5   csctbvulnerablefamilia fk_csctbvul_reference_csctbfam    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbvulnerablefamilia
    ADD CONSTRAINT fk_csctbvul_reference_csctbfam FOREIGN KEY (csctbfamiliaid) REFERENCES public.csctbfamilia(csctbfamiliaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 _   ALTER TABLE ONLY public.csctbvulnerablefamilia DROP CONSTRAINT fk_csctbvul_reference_csctbfam;
       public          postgres    false    313    3606    240            �           2606    59446 5   csctbvulnerablefamilia fk_csctbvul_reference_csctbvul    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbvulnerablefamilia
    ADD CONSTRAINT fk_csctbvul_reference_csctbvul FOREIGN KEY (csctbvulnerableid) REFERENCES public.csctbvulnerable(csctbvulnerableid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 _   ALTER TABLE ONLY public.csctbvulnerablefamilia DROP CONSTRAINT fk_csctbvul_reference_csctbvul;
       public          postgres    false    313    3676    311            _           2606    59451 *   csctbgenogramas fk_familia_jefe_de_familia    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbgenogramas
    ADD CONSTRAINT fk_familia_jefe_de_familia FOREIGN KEY (id_jefe_hogar) REFERENCES public.csctbfamilia(csctbfamiliaid);
 T   ALTER TABLE ONLY public.csctbgenogramas DROP CONSTRAINT fk_familia_jefe_de_familia;
       public          postgres    false    240    214    3606            �           2606    59456 0   csctbdiagnosticofamiliar idjefe_hogar_familia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbdiagnosticofamiliar
    ADD CONSTRAINT idjefe_hogar_familia_fk FOREIGN KEY (id_jefe_hogar) REFERENCES public.csctbfamilia(csctbfamiliaid);
 Z   ALTER TABLE ONLY public.csctbdiagnosticofamiliar DROP CONSTRAINT idjefe_hogar_familia_fk;
       public          postgres    false    240    3606    301            v           2606    59461    csctbpersonal rol    FK CONSTRAINT     �   ALTER TABLE ONLY public.csctbpersonal
    ADD CONSTRAINT rol FOREIGN KEY (rolusu) REFERENCES public.csctbrutasroles(csctbrutasrolesid) NOT VALID;
 ;   ALTER TABLE ONLY public.csctbpersonal DROP CONSTRAINT rol;
       public          postgres    false    299    259    3664            $   Z  x�M�Mr�0���� ���,�q1���'[�J*�ʙr�� �[�g�ղ]�C�,�m���ZH�ӕC��iU�?_�l��{�-"���/�����!o��ȱ��/gʎ�d�8���g�����lPWp���������Y�2OV���%%���1��	�`wط�Zb���t1��2P�	翆LVL�GEwH.����y���h*1aPU�y�,+����uF&-,�eĩ;Xq��ۀJz`��,�tѭ�_Hbڐ�"������U<`��v�Zm��AZmPR�g tqS� YC����N�g}��hG��]�ߩ!��9@���$\��L~�/����(�_�K�h      y   �   x�31�tK����LT�+M�IM,�ts����tTp�Sp��ut�<<ُ3a���R2��J�3o�S��OI-JLI�460A(J,�W0�2���8� )�2${\#�����@1.{rR�R9�,�P�0�21��W�VX�Za�el��
�� נ`v���K��ݘ�7S!"����� �P{|      &   J   x��K
�0�u�a���<	���+�u7�(�Z0Ij;+{�,��ܴ��X�3~��ϖ.�&w(�(� /o��      (      x������ � �      *   �   x�=�K�0D��S�����,#5$�H] q)���H��ݼ'�c��֙�{���p��D8��*HC���)�,\�p���}졝���!�W�ػS��i-[��$���R�h��2Am�!0�	�P��b0��B��!.�����JD?b�6E      ,   T   x��л !��.��6��U@�u�%�Ҥ/�r�=���i�$M�,�I3�L��a�4�H�`���֖t�@y��<p>U�oB      .   �   x�U���0C��0�(��,�	���`�(BO�얝��i��y%rX�E��i�����|ŁMa�;��<ɡ�8�7��
���P������ҿM�t�|-���ĉ�㍪�cS�b=��n�h�P-�պ���n�`	��xZ!Zק�r�[      /      x�Ľϒ۸�����ˤ*�}�D��R��n�ȖG��������,��*Uw1������CQ��vN�[u�L�@ AAo��~�y����v�wm����W�t�V���d�~�7[��fWT��<���:�r^n.UTo�:�/�}i�yV�Y���=Y���"��y��/U�������i�'�y먅�ؿn׺��F��Go�w���c�����J_�p3j�y��R�ͦ8��YVT'��~K7MZ駲����U~��uq):�	�v��&?7� ��S+����Ҳ���ѹƩ�P�=�f�U�j�B������ϓ�;�K~����y-yYѨ�'brl�bQ��JҴ��p��0 �$�/e��D�����vzW����׾��T�Sΰ���[����`Ld�Sa��A��� ���\�SZ��4㡟RPWk?ٞ7�+�e��nU�XuN/�����+����f�/��ۏ���?�\��Ҧxc\�k����X����q
�����Eu���Z[i�e���^V�� ׁ'��uS����!�^��E렝���6}ҁK]��q�/^H�E	%Vz�xj�@�������J��0�I���m��Ƒ��u&��$��6�(�*^0bT���YĨ��� �t�������ծ�\ˢ9b6��:�h�<=��K]�HI��w�������u�<B�]�`�_SR��D|��`���� �ey%�׹AUk�=��A;�O��k�/tcY�a�V�*=RC��U�Z�վ0�����O�Õq��Z���eYM�aF��G�N�{"�C��O��k��\uL-b�D,�W����h`�)7�d��Ō���t��G���u��� �]͔�u�Yˮ���'�&"�}{j�"Sn٭�F���ס�[��y8��ωx}���~ތ�a��U$�
-P���.-�Ӆ4��ޮ�hu(�����^��]����ko�UV�K՜+̍v���:��֘�;r�:L�vq�%�w8^G��[w��b�HL��:�V����Y��Tͦ��	ve�[��Jt��#)�v�CJ֤�����qJ������OZ�d�Q��q�T�M��(�Y���W�߃u��w�������a�
l�����ŵ.q����;w�}3,m�]rnN=a�d�wC�K��d�跫G�9Yk��ZZ׼�p��W���ց�u�������j�8?�/�+_����>�:�[��fQ6��h.ݟ�̴<z�Zc���ѣٸyM���v�6�"#m�E�\dƀ��RmR�b���R1�M�zA�.�[����걶o���>s?,"�Z����u����\�$\�6 ��v	�|O�%���7-��:���w����Z�x�X����eC����~ъr��Z<��F�:���T&fh�)E���v^uI�c���u�92��X�<J9^���]��{�����v�h%%VߙX��+�zո��3�)&4��x2����)oOfݘ��vd����, u?;��`tb�j�j�O�_%���&��6���#Sx�Љ�ɇ&��;Y'��I��䴏8���Y�=�ZQK�	��[b���:�&���i�z�$��3�qa2���[�[�L5�����p^�P���J��B����i�oB<r[��vڣ�c�Ն��R]i����G�
s����˥Mu�b�l�k���t�U�k��3_����{�p���#����lޜ���!��w����ݦq�!
������UpY�ۏ=����:J"�'�6�ڹ�y2�kZ���&K�#�cA;��>&�-�������i�Nݥp]l��d��.`D���/9sg3����y�x��&$zϗ���4�i�^ ^ڮx�{�Z�I�haE���_��uׅ�->D�,/��a��o1(�~=��〇�ǶY��ٷF
�%-^��iR��9��$s���"�e�����{U��O{ ��t��)?��:��/�k����@�zh]��,�
�A�HhA`M�N�"���ء���ar2V���c��dԣa`��@B=�;خ���]O�|'Iɯ�7�e���i��?|�����IVHs�e�4�>�9��*�zd������5�"�>q3����h �Vb��mk~j�1�d!�U����8��.C7WC���e�q�R�U7���!.���"�6 >(Zi�y}��� +�цYf��'XE+�5O��.��j_a�zG&�⍾�@;u�Ƹ���}E=��=�9�z��|����P���ފ���m�i;K?^j2�ُ����a�HT��Mh�����)���b^�����I�Qw2�����@^^��+@H�C=Qw�v�ڑ���ɪ�9�X�툩�h;�uSd��/ڎL:3��SELP��O�	��ߪ�t�����`�y&�@dQ��w"�G�v��V���Uf�s�@�IEѪ=%bF�_���8�{��r�t{�{`Elww <:�_���eQ���)��鉜7��0az��}N�1�!� ˴�ڏ�+��`�־��6���2�/F��A6�B�[���?y�,.�oN���f��$U��3�Pk�)�^�%]�+���5H���g8��!'#�6T���@��v�ss�� �b)�@��ţ�J5��䁭M�!`�����u�`�C���"�?*��/�����q0�ު�?���������=�Ƃ%������N�D��&h|]{؉w��]���@
_�������C������~!�M����KZ�&�?!{A�h�W���ڣ��K�q�v��7��M���O�����V��Ib�;��4*��4�7��oڣ�]K�c�뵏�� 3�X�.�\Ц��#2���Š�����՚M�;�:�0c�,Li��p��g����v�~��ҏ##�*jZ�D�md+��ի���'k�gB�I��յ�{���!'��'�1�nGReU�nx{��V������	�`M�@o�г�F��?�;���'!��S�a�;�z��͂�=#�Җ���;��D�
��ԧ��{~���j�� ���؏4��� G^P<��ꡳ+[l9��(�-ԝ~�cl F�Cv� pM��C��]��FC��i����{��/���E���O��`ֆ<�*s�>�C3Jbڀ2�0)ڏ��T��_q~-�*AkQy�Oߘs򪦒�U����,+��ڟ�or�{�ӣ[W�v���>:UD���%�RH;�-�ũºid@ä��Wk�h9���=������}�'s 2�3Z�� ��^=�q�𝬴�ŝ�)jѸ�%�P��^�*X�v�ERm{����o2�:�V
IyjVq�S/i7k�(��s��Վ<`d��� ��Z?rX���(�ھ� z��kfE�&����m��F4�+tX�;.���ogG���la��d�@+�������*��оu5���-�CQ�ڄE{?���Љ!����nv�N�"�>��)����Dz�ל���_ٝR1)��]���ۿr��2����b��Bv�����%�>(*X+�M8ʺp�g	\�P;�c����Ǯc.��eB�~"y�gҞ�^�P��������@b���3f�4�D�*�傝���S��K�|�@�����#�TG>gd`�E����m'���w��0*�O@~�Ͷ�&��%�A������ͯ�P	Ͷ���c�߯o�N��͆h�] 6�-���_D���}���k`�K� iOB_F#�ЖVy�$![�Zi���T@+�|�Q�;H��wcM��=0(�XGh�g�Ӿ���N�����f�&eD���6c:Ð$u��f=��L!��$��5�2�m9���6�9R�ľ�����E�&u�Вr�&�>�Eq貨��ep�MMf�NM��q�)v���ρF��%���	as_�HiSY��/�R�z/&��CuvC!)K��|�Օ��MNxـ�k֙.!'�� �}�I�" �D�����&�_�����p���oE{���m����ty��7����I�4>5��A�ם�W���x�'\�D�^8	��2��lN�%��Q~��
]�7d|��=Z���`���    -�� ���m�N&�-3���l����șƄ~%_��p.H�#��h�ɿ^�߆��2Q	�A��o�%�R������q�i�H�N�w���0t�����#��~�����u�g0p�Źw3#���7CJ��������f��h(�&��A��CW��c|�V@���B�>�����]�@�E���%���k�CIڞ����'�w��u�	�|� ��$�����x.s�t�ɱ~o�Y��`>F�"�a�Ɖ��4Z�9:!j�����zuI}�-8)^p5��A۠��$]��������[^�W���F)m>[#�1ID�j�Þ썳�G��;{`i�L�,R���D�w�
��K�wy�6½1�Q5]n~�0�����sz.��@�N��qz�ƫ�9m*�‐ ����\Ӂ"��,%^�\p���/?^����V)e��AA��� S��ey�N��6[Vp�"�B�����^��8D����l&	pXt��1=/ؿ�V|�����dSX��J�T�ՙUڰeH��9�����������&����N�$�� ���	'H�c��2"٨��4(M�R^����3�.\3|�fǥh����R�@cT����S�D��i�JM�����t�9K�[N��T�X� p"$p`
���9X�#i��K��d�DX��t����V�2���������EI>����Obx�u�8���u�ua�Z�_i1�#[�P̊U��d�B,�)-��e0WiZ�Ԛ��X�t��[�@�H�����^F��	�r?4��d�N�_O�d��7�A��8�����,n�Y�9ڮ.�NQ4.�z�M~.�Zn]7E ���ri8}��O�-��(,ͯFsE�:l��H��+u;����`��D,H�l�(R����+�����Zl���CJ��@f"
�$>8pQ_�ᘚ�����$���';�	��6�л����f?�G�B�JF�����b����Uo�"���έ���}�SkI;l �ӾKWR9�c��?�8Ժ����M����Hr�O��-Ú�h5ә��0�?R�Q�0q}HkL�q�4얎ǭH����է�,�7�ۻ��KG���q�@e��!�,�񯉑'F�w�ư�|K�7�W���<���RJ�ځ�V�I�2�]ƚ@��)�Ǣ�-iW��.�*�`�fơ����p��h�v�5l`���fa�3�`���"fu~�|{������?�� �xuNOvV��2��^ʮz�
h���sͺ,�.�~�]�\ˆ�%w�Ԟ�=\��4�)v��
c��E1�Wu���߁����[a�}bY��/�z�	R�O�IB��b3>�!��b7�'���c��y5[혴.�#���38���K����ϫ��)7�ɕ�t0������nG@8�Hi/�)�q�B��3���" ߥ���/U}b�!�nR��T]e�v�p��0+-o͔_1a�a�̂��="3ۓ��	�p��M��7��x���1��F�v�'ͬrC�BbXLN�ڎ����	�9O���#��16��fo�!�,�|<�y���I������L ߉[�*eq��g��ɱS�z`T�f}�y�����"�Oy��{�Ơʈ'h�����W��vf\7RMFwnƌ�`Db�$��)K�M�� ̡�_��WS}(��L�tP:şttQȣR�T��cܒ���+�Q��Ϳrp�Xy�W4ͧԤ<Ҿ�1�H�Wo��Kq��M>�k�B���� 5�t�4=�;|GYR?<TP8���i������/�8���4��#�`��ۏiڙ��������J���S �����:~�� �;��vY{�O����e)�јr7�C�WI�ש(1,�� ��OF�4����@������^��7��b����|I|���zݙ+	��Ȳ"y�jV��+mt J�R����K��n?/Ց�NN��^�(TeU#����$pS��S�5lP"�1���dV%�&�0Kn���"���|�ˑ�&0�W�`)R��.�ťT?���?��SW^'A٩D%	�~ōl@���v��ͯ�3f
�O��I���&(6�R��4B�HCR��0'BD���\����C�2����7�ՀX�h�:6 �r�f�b��?�Sr��5 ��؝ty9̻#nJְ��CP�d�ڰ��b��[ubu�S�!m��^�49rC*cDq������ecJ��e*
F�<�����=��m��(��}�:�CV��O�jO<iC�o�/��$ Q@���7y����{{�[���oݱ1.�)�`��$�h쟏�C�(�m����Gɣ3Pޭ��E�����%?��H8��wv����ɩ�v��t�z#eȤ݁�Z�N�DRѡ�1�@,Z��~�EBA;�w�T`bd�G���(F�\�i�!%�VǾ!ˤ������w��.(�.�DL@i��?n�AeF@�5�DWб��P�����~��ګ��ġ���pU�ȁ	_$&��I4����;R$�V �"�$��N�g��;(>Ҷ���F��)�3�����[ $hb}�/@�j`�r, W��RҾ`x�{���.�F����ʊ��3#���e � ѫ����C���B�fi�s��$w �(���Mؖ�a�I2F��*
3n���Q�f�zC����G�6���'��I����&��[n�꘴�I��=`���m�u񴾐��x1;�/�d���d�"���NYZ�C���Mes�wG�=	'�zI�c3��\����`X�F�wlr��������ٛڶ8wx��b;{n�f�X���NTE�˯m���t<�Lf7�\[�~��G6��rЄ���4�ߣ�{���/�쁱?��[@!}��Y�vN884'<%���;꧆3�M7��%�ɧ���y���=OTʠ��	�ϵ�t���d=���Z-�����?L��.���4z ��9 "8ԥ)�抴�����*vè�8�BN����:����e�NFßQ�߉}�ln�s�C�зU�L��8k�]x�N����;�	��G7U$`��>�+S��9����z.�˹�k`p���Pv��Kl
<w���i����	1.�⊊��]5�)����j��p:�����K\�ߊ׿���ܕ� q@��5��Ŋ�Sq4����j�ӓ�Dҥ�P'�ɀN� ��U D:�9-�����m�|�bWa0ٵ?ԥ.Z�CM�P��M�d�iߕ�&4Z���ᶻ��H��b��a7��3�g��\̝��T�Fk����I�
��P�+T���@f�����k%h����cz�1
��J��&�q!����8�V�6��zD����	O����I�����Qs>�i�<����l4��j�D�J�!F�z���?���<Q��xK�a��`�2}����#-�\��r�9]&O���P�-�)�vGz
� |d�ȃ R��2�Ȥ<���p�d�{.�.Ǉ�I��c��N"�b����u�O�i��&����w(L�͉>���^o�df!�y3�#���D�p��U�����&��ɸ��}�`T6�
�.xd
��I�j��Og��j8u�3��(�GfDzB��,:�t!��f&w?�ݣ��^=2�\�M4:���$�w�|E��h4_��֡��]ͤ�9
W����.�=x�K#,��Q�j1��}b�	��#�`�h3��zK=E���;:�����D�k���i, �5ڟ�!����i~�D�j�3��g��2CM�PG6�1l�����+�PO׬�M�?�'dxt� ��h��Cz<2��8(���Miܝ��u�i@�πH��V3��|s����ኃU{f"%��P/���!P*l#a�L�x�%r����+%��O�(�g!��+�	���p.�ذdeP$/��{b&R��D�]i}=�r~?8|"n&N��rS�~Trr�m,	אݏ#�+9����U{�{�w螲ֻO�F��N[���>*��ޜ_�����P��R.��]���]�L5��!?�6�ܢ X=�t[ͽG�HDY    UW��Ӊ������������ND���p���"�b2ؼ�R0�`x��j�����bv�AH?�J�����إ�.m�gd�He�]^�Wn������fs�3-���1r���/%�՛KO�{<*E@`fb��s���T�%��@9��]m�A-d��%eP!�
��qO��v#��0�1��Il�T��ѕ��h�K{�����]
7޼���!|%{�O��]Z�#!/�=i.I�ɢ;�������}�NL�@��`'���K+u�޶�	4���j���b���6��ڡVc������r�����Y'��_�5	�X�G.|{mu���uٚ��I�|-�jL���ǎh_���F����\����PGf�ʔQ0b���x�u�+�{�]݇��O�jcnH$^.S��C@:�SeA���Ux��ҧ�}�4"I3��J�b���l��|2I6�I��V )�!&9(o�/�p���~����rk{Lhʙ�~��z��
D�L����H��,��?-۳��^��U�p��:Dz�d�Ŧ���ww�\���$��LVd�a�:5!_'
��_'�F�Л��j�F�?�4r�����f��F�r�ۓCmir�B�Bw�4/�hLH���F!���;�_
#�g>[*�Fa28�G#���7f�@C���Ҙ<�5x���"�������|(c sa�O,A��1�h�>F8�C>�F�R҈|��'�Gz����^�R(9z���dku�vX��P5���7��Qj�{��y-sc�{�`�B�����vG Ec���{_��I�j�ү��}�a7]����ٿI�CШ//B�LC�cr]&��`@�`$gEr�Ӆ��5�8ގ�H2�� ��]Qq�`��N�����ā�*�� ����8t��~6�#����#���v�d`A<&$� �{L�[,�!G�+m>�W=�Ɵ��TY<���c���2F�H�1��)x�x���<�EDꙄ#�ŵ "����9C&~����Q�<��D?�~!i����	��Z5���=��둧� $!���?!m״.��5��P+��~�x��������sk�/�2�i�{�mkIަ��(���&��z���
y0�����j���}
�j��wI�ƣ�V ڀ�����1œ��_C�����/i��xOx�����2��!�i2�ʠj��qp^��=�[�O�����;�a��{���(ꩱ�~�Aod��	o~-��a�-��|���K�+�����i�a��/�G���rT��xh�A�i���\{����~���N�Ծ���/��{�����)ڟ(�����>�a���o ��t�z�� X=\���RMq�{H~�6�'�.��c�*����E�O�j��5�>�+
Y��ǂ�d�+�\��E%>�h���}X�BL&.�e;'R����.�eX\���dșZ���\�0" 58��]���$B�	H�Z��B��نmN�NN�P��u�Kt��m2�==
����WRh�N��X0��Q*1MƦ)�{����B~^h�D��B�������W��e���r��=Jh�jZ`��R��+s���"m���Q�	5
|Y���(@
]���c�18��*�>���ǽ���J����nx�y^Ï�civŤ��g��34;�d�3uX�s�3m�o�8��a"֐�Нie(uH���WG������puJ�CٻaіX$��r�K�D�)	��������-o<��}W��i����� I�p;х�J�^��i��R���|��tU�?�*1
,�%[�T�b�}>l0���e$�<D���|��;��ˆ|l��Y�|a���s�w��6�_$���GR�A̗��șa�v�Am�P���0%juY?�x�*�i����b�zIjm���e3�q�����:����H�t�7����t &8�gX�4�7g�}oD��ݒ�����C��V���{˧-��\�x�'5��g�"@��n�Y���6�D�U�G��?��=B��ώg�����T�����Ti�4q����m�S�4Ub�R���I��`�x��%eդ屣�_L8ٓ0H�cr���[�D���k���	�Zl��x�r���sAܶ@}P�=U��X<9B�M��D�_���W�^k_�d���:���ߡ�F����9 D%O�c0��	z�o�\�S�w���S��K�T8��Tk8�|9��\δ�c��`6t0	�S�[����]��n:I��sQ���(�o�:k.i7�B�j�u��X�PG4�Ғ��?^2]�ү�̝PӸ���+�d�������iл���Hͯ,���˥ 0"cW_���=�;��!z	�R��A}��^���de|�~�#y{C�{$�BϳZ�إ�]��:�j�_�`��跲⃠V�NyF�Y�DDpj��9�cp�'���l-b�F!��#Pip�@|6pE�O����{�(0�[G����g�{��1���ɳ��b�äz0�2��1z��a�N���|&KP�J�u�^cs|�w�L��-)�u�ow_�.?�݇���SѤ�ׇZ�1�I��9cs��}8�D�M���o�G�M� ��Λ�� ���?�7;Rה�Fdp�,���K�t���n-c�o�Sm��ME5$}#6���FF���e��P�1V��pB����c�|Qv�^j>��]3�3iB�Z���ׇt��ސЊ��/Nwj�P�1V��\�$0���b�p��/�:/������LKD<��g~�6&-�Gx6I٨���a�6����pk#.J�6���r�L\��a�E�I�:�Y�k�(�G��z��1	��O���_F���������ݧ�N���a��<~����I�5����mW����P�/����������/�G w�tXPPt/F)�+i��4�)������\.�/���G�e�Y�~5�*�
1)l�Ͽv*��i����<�Ac ��|�n�p�PBHH�4\����yt�{Н�E�s���f ������<���' ��:�|{����L�ƻq�㘥{�-������K���G�'N�$�?g�r&2�#��.���Ow.��/Iw�"�"Ի�������o$�x��B� #Y�c�pn��d��0�I�IDq�t�1RH>�q̺W��fmx�1����������+�S���ᨅ���/�J��Dڻ_��j����iC)H�g��U�dW��#K�	ӤI�#���~��)
PI�~�*i��%�����~����F���e}�9����r�U|�����D>�{�֮��ߏ�c��ׯ�D�7�V������7���)�ͨ�� $Rd���F������2}��4�Oo������/�E�;!���.���*�E��m��/>�jjM������=��!h�#�C��2���{+���^����m�������Q+>f�`�R��&�� m�g�c��˭ij-��j��ԘZu���w~�(��[u�JnK���u��W	zD�'�7�~��O��pi�W�D/Y�O���<=e9Ϳ�>Ҏ1����Nir�_w��W�ф�@���$)��Ϊ������Eu��ߝ�hU�ʾ���LN]`m0�jJA>���М�"��t��Z���I��H����8�Gv(H�x�+�t�Wx�\":�ʶ�y2��\,��T'��'�v�{�w�G��9�1�B�*C�����x��P�8�G;n�	�՝�������B�%���TФm,��n��l����a>�:\�bB�0I�Q�p��C��2TCN������M[}S��{�T�Ti�67b=��j�K�L5���ž�sU}�D�Hz������>i]0U������%]��
�6`�Hؘ�g�������'%����x��+").h�O��w�`�sR$>
���B0�!��Y��P ���`!)AY�n���de0�����J҈s���\e %v*Y�N�s�4"%�E�    ��`�GNt�Qݝ�"	UM-�t�G
<��E�Te���:)ɂ������	�i]���G�3��N�,�ۿ�T�_!M�p{�%C/��(l2ς�X
����jB�9���������g52�NBiy˛��ǎ}�b^(���w��uG�U�<���{k�s��e���o�-�Cy�����9�;~��ie	gW��_J�Sb\T�-��X�,�?���Ѝ�;�_�K8t�T�&������m��(@���j�`���
� �Gw��숼@y������`�ͧ�z~�|:s�}�$�!��*6�#�!kP6�	�(��͚BI�*�hpZ���ퟌ���W�J�^��l��u.e��B����%'�[Kƴs4���r��Y3jx�Mk��u�5GU	��($�d��:�G��q3$'-;ܬ�<袖-L{�۶>��`x�922(���I��e5��� �cYy��=6I1~���h$�XVp^,�%�֫&���/cђO�;���kq�����zR燶Xrsɐ�S�std,�$e��U�O�*�o�x�k[n����=����C��Bp�H��6���&���Y��Wq���;��t������VnvW<w���:K�?����~�-N��uz"����'-��{^������?�ypZ�����%=�;��H�X�WLRF�Ă��"��D�A�Rշ�3\%<ҸDr��t��'��#�e̖�6s��kZ���L��w^�<Q�����ۡMC ޳Kc�(��X,��0��	W�Gp�M�$-�rM��X�Hj�r%�|����
��$��x٤>$��'�Z��ꈳ�$I�o?ʪf�Ǜ	�\뷔�-#պ�e)�E��7��T�c~�*��=�����}�s:A'<I'�DF�wZXҍ���@������Հ@#<I#Hfy>h�x�oyM�������s^C�{��̸�B1;��g�+��,��aT܊t�h%F?b0O����?�nf��1�'S��M�d���/_����1qx���D_��!�d�cb��Ҏt_��1c�0iG{����� DI;�8�� j܏�b���'C�K8��g���]��M߀�|�$R]e��!$qvW��Ѧ����',p>4 ��J(��� �&Kס��;�oՉL\Y�Yuh=d��O�]p�&-���8�Ez7��h����?�P6ӵN;��Z�_�@��J|j�5�n��@C�;��ާN����-����۴��E�~ �lS�a^Ӹ@�e&ǚO��ι}�����x�HPo!z�yr/`sӖ@o� �bd��.�W�fNĝuš �P^���*��o�j��G�N�~BK�X�z~J*�\�������)XN!�i��]�-�b0D7n�F�	yk�U���[kZS۔I���k!�i��p]P"<4a>��*��TN/1�b�6+�/-�y��������c���W�@�� 
�M�G��{�BL����o�5{�����|�i��t�q?0Pf�h����M���u���ط{�U�P�0fp(�2=�F�oB�9��|�K����pا���a�0�����r,1[ȗ�L2 &���H6/���(���ʹQB�R���:��:x��L����d���ą^�gB�]<���u�F�R���3q�ggc�+B�Ĵ)i���s��u��x�5\�s&�Xމ�r�F _���^��b�aF�Ў���kg��2�3,�es��6vf��X8G��nH.�	Tvs, 1�%�3s��%���C��L �K��XiJQ�1Ze�͋��!�X�Ef��<�j���)6��.�w.�k�F���-��?C��.x�R�Z�}���)��ĻW!^8'�9q��f�a��<!h�p����5ʸ���5��]te��a9e���ŧn�-��(�M$�[.�_v�����lیo ��xĒ����Y��`����Y�c�F� ��)�����sI�T�V�ԡ�kK�J�A�j�(9��/G�S�@AZ#�0���5Q�&�bl
(�?��5�C7����d�B�(�MΘ��"O��ߎǃQB���U�d�S��͝��1��Nb���Tvn�-?�[��6V��x¾��%xh��5�d�J$��'��;2p�LX �P!�;$�μ|�[�iVc���g�_AC�ƽ,�n��֋�X�$7��A�r����y��LQ���R ���!S�>��	ȓ�h�Y�9<CUyťf;��<�s'-l3<ߟ�����I���7ު6E��������,d;��0�<>絜�����@�~(�lA�P!�"ʵ�='+���Z�#hD���i��H�>7#ՠ�����;=�n��6���{F��5?ض�@���ӨV+`��� FZ�k�Lh���v���{z�Rx��L�oG�C�y����a�QZ�g9r���WAyg"�=�J���3��L�AEVP���ԌN���3��������`����J=: �(���q�QH�@��U�%L@!LO)�< h�
ݶF���z#������3Idȃԫ�;��L��OcG<�D�?�r�QA����t������4^�B��P�xU��m1~��{�/�-r.��@ƴ*���h3�'%��q!COw�:
������.Y�N�I��z�PaWͳB���Ѵ#�m��`'p2�y���6�U`�ۿK��}Ь7R�m�81�N���d����9�'�Ǯa`�t�eA7`_���r��d/�%4fs<�CzZ	1�l�g������%^���lRKܱm/�R
�L!1���ݥ��G<�b�Ԣ�^��9"����Jg�_�>=߿�����tC7�r�5���I�����P�x���O��Gk�	J 9�`�fzc��iI�#4��fI8 y\t��J`����Gw�T%0Uz9Ac�E��ࠞp��@��'��͜�S�����1���	L��ퟪE@��,�\<��RV틌]k�p�d[�t_���}B������+&��Q��V8���n�
�V�G�LJ*�0kdN�6ׄ���п�^��� �r:��e,��L�8?zJ0��p>��c�M�Akē�Y��cz�����$HPЃ�Yۣn�	K3��X	g/�Z?����W �$皬�rs��0J(�c#k���7�B�p����W�x�oHۓzW<�u���b�p��S2�4��U`1�����X'�R̴>a���qF���qZaA�����n� �~ U3UL�t���N1G%���I}�$�ēB���^�菤�W�7/9�8b����y��}1<����x�]�KZVg�vr����D8�^2��:�W���}�=pr�z���ʟ��'�fM����!x>�	6}1�j|�'0���������B������#ͫ68���mBM)���P31�����U��/&r���|� #��B@���1膜�m%�MB3�{�:8�&&r`�Cі94���~6��E�H�����|�N�>b��_8���3'��!�1�G1�{�u"���R�{֜S�uϜ \�)�����~�9i#
x�3{�t�c�?�)f}3�^`�q)�Ԅ>�M;^�ƌ��@~��S
\�S�ǚ�X^��d��gp�_3T~��6(\��&�ŲǠ�B�E2�����∗���o�	:��CF�
�0����8T��q�/�E�ꨙ��ۿ�I�,B���붦o@�	��WmL��L��|At@�:$����1|x1w��j�k~�s�i��I�[�S�W�G���.@���oW�����T��@f���`�(x���D��V��a�8�o����������9A7��f:f&I�Q���Bs�fXy��$������u
�3<3CP�*q�7QbS�^F�5nq�0=��v��ڛ"K�L�����pbZ���8��B0ɟ�LA���#�G�kcI,�,�.��:;����l̻��?�9��� f���iv��
J��y�ŗs�5�^r5�ev,��$1��:K�    `�@P܆(p�}5�Lmn*�7�2>:�����C���g�% ������Um���b����yK�+(;�*ˊs�BC������:!@e�X"军�X!0�v��4!
�߳�Ġ�B�Ђ�W
D\��������g�A������_i{k�qNW�?��z&��i�P��J�5�(�|��ٱ�����|�3���t���<OV#A�S�[Д���6I�@�FJ�H�{T���nK�D�C����Q�9��͹���L9�a��
���AV@��ҹN�֧e�KH�n׮��[�H 5����h�L�Rę��}��
X�E���q(Ok��y)N�P֗
p��B�쁼��ϗot ;�M��:�t_���+�LηեS���YJG��L\z�CI���4���䫎�B�qu�\��ǡ��K�{w���KM�=�n)�Z�×rωJ"�f����iO�$�H\��,	f�Tt'���@��JI��/!�)e{k����}vi`-iLp �I�O�������O�ub�S�4wc& *��)��@���қ�z�p�!�����%�J1�z�00>�kOn��V=��d�r��W�u��1�{-���A�E�?�4䖁N�:���E�&HT\�f����_�y]r5]Z���v���!��������r��	��1�$�;�w¢���E&t���j��}�0��e�`�E<�Vj[MB��H0������Q�$�Ċ*����J>WB�p�k/^d��J�|��MB�凮�����Q���(��w	&�^�ڗ~7d^��ͻ��օ޸ט
����T��[�hN0�M;��w��	}�Itz"�;[�����`�����զ�5��l�҈�ض3�� V#zL����y�	4~�^�ˉ"B�'�����G*���Z϶��[)Lg��L���UV �)mn?����0�qhL:o�Â���@IVX����j��������|��v�8�&��]�����S�7���V,�$�2�wC������������@��_XG�B�6l��f	;x {���fґ��0L�P�hIl�I�'%*_&�Zؕ�!���:�P#���D�;��&�}P�8R���*�[m�J���-}Xx
����y���P!�!� �R0
� ��v�F�89*RY�������A�&��<h���y�Ƃ�.{!�(�v|)P��|	kةefĶ��T;Z�����)�˾������^�Axzk���&�1N=f��~<&��O>�B7qbhOl��~�c8ڗ/N���A��hح@�z�4�W������������H8j���]�?��!T=����hY�}��Ӂ��ߌ|���$�=�����w36�/�����f�����Ms��[Z��;t"����� b���\�]��<���9��Q��+��q��1�]Q���$�KO�3Ē6����B����C��C?�Aƽ%��ܱ�Șbyjۃ��r�P�8��uXW�h��iIkڻR�j�ȳy����L%�w�&E�2Y�ɻ
$1�%���96�#H�i�K� _�e��l��$��p	9rO�Q���)cL���'���P�rL�4�L�QC޼4G��˧���φ �U^Z��{���6�]��A�i���J1X\�q�
��5�d�.1m�|U��I��p���lS{��]�I�d�`;Lk��r�dIv��Σ^��t�ݎN���f�juD�CY�\�f,��>5�����l�X\�H9�>6����/�up��6��sQ �Zۄ�~��D� 9���c}�%��~�q{�q���6�2�i��J�������/"f�H�W�T�����k��h���<<,��l����`s�\� <ۗ�D By��>�7��f�V̒��=��y��Y���9��c��~� Ӌ�;��7n@;���H�w��~/��/ s�c������OTj�d����P2�J&�[ ��o@�+R�}O������+��=���&���-}��o�y�u
�<�)�G�g��4�_���!7�(�w�cN�mI��ә��?� �@��x�4=�P���YW�R�b��T)���
*?��@���lvY����0���v	�ֹ�F~�W]���� ��?���l���'G�Zlx@B%��PDd��c;[�y��T '*СC�7TA�H{_4���HjZ����y�Ѓ@��`_�[�Ð�331��/��h0�����N� ���'ҷ�6�J�D���>T�ݣR���8x�-�RJl{�e�m)5$�>��6�丕��*e�v��= �;Z��,^)�-)���T������Ǚ  ��9v�J��^�� �������>4�	���ˀ���G�)!�4Z��}^:��A��u�p*I'>�`w�B%��N,G?�~[����!L*�����1lH2�fj��aC�a,��#�̪A3���l�T4[ h�l��]���=�|͏��9W�.}-���z���࿊��� �6j[L�X��!�_�Scl!��|^���������T1ǁ7���.�������O�� ;0��qí������h~aO��PbK��t��5\[܈Kx��v-k��}�Z�ͧ��4��2'O	o��h���'�M �)釉�!\Y<�5)����n[1���P�f�Y|�2($�>���:�<p����C��mD���!�U��8��3����D
�U��Wû ���\7]����)ڽ��&���y���؇�k�o)5C�3h�坊g��af�H�3G�{Ӷ�iۼ�A@<�x������ԓ�&��0�x;5���a���,7�6fm�A!���z��;?����}����4ĲVݹ�%�`'��ȱ�[�
H�����n�������U2�Qɡ66 �D��j��~�[�X�7������~�;�XV��S�Q����>���s�5wyO�Xe$[*��'_0+	d����P�tZ�o���A�$���#2`j�d>^ҏ���#yd������eܶ�Aa�%��P���9I�i,��!4I��v�s}�@c�N�e.Ob���	c~��l�=�����3�3���߄0cX�Z��:�}W��m�S�&������r�D; �y�Pr��Q�,�_+ݒ��c�l}��$�#��&ѻ���!���:;��\F����e}��v�Ņ޼sM�=*�����|��K1v��'i$'�e�-���=w'�h����:�i^{�����r;aϭy�"+�-�yι�K���2��s.�U�e�7�	��j�I��W�9�J(3� lBމ��{�K�/�l�A*�$�oގ�z@�̛7Nma��gte4�l��cuS��3N���`��/+A��a��iY����/�@ġ����	�D*В`�δ���x� S�G�w��<Q�ӧ�w(��`^��������(P����}�YF�gz8o��p��#)�`vU�N���:�`�nޞ��>IvL��O�k
 �O��ɜ���`��>�"�!��#����ޥG��Ӓ�0���׹F;w����i�'����<'H̑>�ui��M��l��:�������Y�D���������.Ki*�ɥ<��č�z���'J?iΉf-�:�ꈓ�l�*q�=��'zS=��"���f��[�éu�� �a�=����SU�%`nt�-�s�-�
#��J���p�!��_	�J��=WB��G�U�	9y8#�H��&g}a$�tVxP�H� �9�nԥ�`C�!��w$�{�z���$n+.�a�F�����	�	���H٦Kw!�<I��N	��6����S5�_�$((�W��J���ha��nR�����imEɜ���"�������ƜM��pWv�����hyM�roе��9�7�ZZL��g���%ݐx1�rx��ւ�8~�s�s�[CH6�%��I��Œ>���K�ĺ�G``_,����O����    ��3& p�w��dO�>ٳGNKV�~����3wF�x��(0�%�z�.��B���bl
P�DZ����F:�:�4l�XC_�\��cQa%�����E5��E�Z"�58�K�7h���("�u6yF��� �R�X�T�v�p��<ᮻ�5�`���ϭ�\�E+�<'����ջ�B�W?����6"G*m]���G7����U�qc�$	�R�#a��'!h��>�1S��p#�:>ni�졮A�uu| �PI�� G+�#��E�	{��𚖴�浡BX1����en@��|�d2�T��������N�!�[섉Ny�ɓP��%����VlvQn{D��Mh-�0aVH����;W��>�F��SH�V�3L;I%�t��xιOa�}&'9s3T�om�tl��񰤍�[x���G�"�T��-.���D��x�Ŷzф%�fƈ�<���Q�a���C�z!Dv�_�*v��[�̺/ͤ��Z��>@?Z��7X
�v9T{�嫅o+���d��9��_�#J�L��>�<��z�8�GD)
��A.���0E�?���P>�KQ��=h	k�u�ʝٍ�S��Y��Gl)
�y3=���1]�(�G�(�����H�E��ϝ���GE3!�_8�����S�;��#�C�*�N��{�h�x��g�>�X�t���s{�h�Ta��GT+�9e0��>�rG
y��Y�O9v��<'9߾�J���V9pPRN�� ��?^�� �~(�a�lP��%	��Z�Ӟ-.��D���/��@Lr4z�#�����3��v��}  ��Q�;G�~��� ��2{ٶ����'>��G��u���f�8�;X�y3#��M@�y+d�Q�=�1<�bP%�`as1ٲJ�fe�H:P�4cn���e$�#<P��k�x�`�|ް	'Nb�ϛ3�t�l%�W�If�����_ 0�q��`xM�``����GR�!GK��I�w��q�L��=/���A[� 3��u����������� �ݑ����3�����-L�%�	������{�S���ql���
�{lK���W���<��R`��J�x+F��%�	b���P��*6Ot��������r�>J��/�'4�OUb#P�M��l#M��Q�Z�	ʡ����	�"�*s���޳�*�Gu̹&��R]$�x<`�S�`��%w�n�tBf	���Iio ���]�[����}_g��df�$��4k���z�v�I���� ^����T���X=p�����'�,V�>B�G�E3U�	���W��b�@9�ĭ�]pQl�	�#�IQlW SK&E�	�Y$f�L�b��P�(���B\{Qx�A�&�qqm�� �Zڄ�����<��Q��L(P,!@��gQ(��^��sYШ��1�:�B��K��X���.��*}��>�0��W�W��%�Y��>v�0�9��#�j��
p ��p���@ u��9+�-�Ѣ���"�^Yp���p�H��bNuF��'/
8��}鏨���Ow���R���?҆@}~������q�ԩ�����X�������t��������R�:xb��Ǫ�:xj��yJJW��yg��������~�r��i�
{:xbz�42�ʨI��gf��H����q�	+�sS���	+�s�fx���@�3�~ ��x%䃤(rx-�2���~]��ޢ�C��3���[�\y{��Sk��|��	��X�VOL�GBv����9��Ԗ	=�BZo�h�zf>�S�i����Me��,�gVŹ �b�<5+���XH�N�Q�P!��ç\�>�����V?T���2�*�d:|f*̇)�u��
v?����3se8S,��V��ȚBdM�Ò�Л�Y��v=�S>����8x�RB����j�G��y:zj��S���)_�~<P!���V9`���3�M�(*Du��j�\�Q�?zb6>�T�0F�Nә����dxD��*vS�'��Ц�%U?�+��}*6���%m�j�I���,�}]��BL�I�oiU�<��S.��U(<��S�<`H�`���7..��g��1	�*Ԩ�����P�V������
��/|�\���NV�zOc��$;'`p�]��&v����P�8弖�@]�]�bz�������ؓ����F=��a���S�yQ����?G�%�����������9�cf��T�E���p�F�J ��٣p�F��\�bU��0?�h��D(���PԪ���ډiє������i����{���B����'��[��NU�=O��)�]5V��Mn׵]�u�MJ��+���`	Z���Cz<v���~mY�e���8�%�︝3y���������"����/�0�2Q��V�j\�_�~�U,5�/�����,����1�bB��V�Ŕ����+:I@��E�,_���S�&/Rp�0	�g|�G�x�H�څtW���
a�x���c.�}|3mxh�)���s?��u�}�Ar��(����Sa�2O�DL��BP:�>��oSk�����C ��T!�0�~ԻY���zo�v]%%`���`��W�� uȚ�tK�,��H -��`Z�^A7Mz:���Sg.?�(�z�-�/�� 81g~�% ����#����?���u7D01��o�N^⎚ڇ�K� <��OR�ܼ�WS�|"F+	q�Gᇉ�GC��5Um��&/�w6/��Q�Ä�%/N�Q��(Z9AY�#[ �!0�Ԗ$T�6�"�0�����]<��N�K�V��^�oH�T� O4��͂�FjaA���^��$~�?B�SW���!?��$�I��_R�v�5>�&t>]/�VU{�)B�-4�
FZ̓	��Ҡ����F��wC#:̔΀!���w�/�x,�d��n�0�A��Z<A�7A��ܳk�Oߊc���l�8�'�%?�[��KE���&���2�(��~�^��8���9��_�y��Ѭ��̅�k#g6b�ZK��!q0�zYv�J�;�)��0^�5+s.(e�m
"Gp�^��^�~T ���p��${��8���,N�B4��!�]�hl���Ȓ�����g�L�+��������c��`E>�b�����f�k�lj����K�s�����(�ͱ�^����P�!Ʃ_������8�����@�e��pIT���/)Ym�i�f����c^%3��@q^���kz��0} �m��}�����!�vq�&�	�1?�*�v
n�����{e��` ���j����2�A��y���l�%�;f�6�i1w���h�-���X"����5���&"��b��g�7$A��፹A4��<��S�@{`j�[���B�L�i��,q�.�����c�x�Z�c�e��z�Ѵ��.ך&��cZg�E�����m��W�L_<�G�K�7j���g���C3��+^�35�Ha��E��e��P�HT�nQY�?G�,mT��ʿf�i�P���-����x���2D�خFIOjx�����	pL��Ӷ�i@�t�	1�l�Y��H ���"�7&��E�k�
��e|��L��\�;H�M(��S&�]��x��H��Gw[�q1ݴ���U[-p�m��X#t�[Ļ �L)/�h�l9��Ŏ�<�#�+�z+C��}�N�E?�W�!�>"�9�U�T !�!��j�k��՘��;��M��:y���Hq�9��n߰��(��1�����r�Y��M�՜nF8�cW)jȌ�uO�Q�<	�.\xp�D�9��!<'��/�/E�Щ�_eiOٞRqz�g.���cL�ʳ���������L)N��&|�����{�(b�J|E���~	��q����2"��7r��S�%�PN8{<�~�_�c�~�x�5))��$�<Ǎ5�+�[x�5=augT6PYQg��A��'�nG��M5o��;����/�	�兲!��l����a�-·���f���,r�@�g�	+V�:����W������f]���a�h@I�    �?��X-8o�V��@����>M��i���J������Iv��Cdx�����YF�%^7������dCb��i�`� �ᾏ4]��m%^�D��sbd�t%!2�/��o�9����F���Y5�y�x��ZO��R#Ձ�sk�+������S��{���6�:��Q���zcZg�^�j� ������6Ż�c�`n��S}%h�F+���K����C_�`�܄Y�p�#����je�F_x���Xq��H�����F(*A|l״'�C�ܴ^���M��4ӏW� W_�H�G_|2چ����h���FiD�� ��\�a�a"8M_�6ZR5��$��
*�hI�RܫP*���`az��=r$b`[�GF��Kzl/�萻�G)�!Ј�%
�� ��d� X�����|����r��!"�iO�w��|L���Źun��_�Wy{�ٞ!�۟��{\�J���d�^��..?�
���
��c��5����%`HS)'0�T��(ד��F�.Q��d�������OT$���n��X��5\�D�y��h�iO�58��������$������Ϙ-#2.�?�St�k�o6��%�3-Ʀ:	������������‘@�:I�ͣ�$*�]R�:0)'����GF�E�(Y�i�P�E
�{�f��%7"�0OSlL���1�5�4�;ƳI�Ǝ�t{I����N|����>�������)�I�xJ�<�x߅.��%bZ(Rd����Y�W�eF�N�馷r����$��ip#/4�w ��E���]�;m�[�`�um4�6fM仚�Cb<1�@/�9� ��~"�D�j�Y=�ߐ"�Ϙ�D}qչB�_Q��W*�����f�������Q(����R{$��ʜ�#���.��r��5�y49��}�T?�K�o+�:�o �t��$���]z̼pv��s-��&z;�����r�--�u��
Z��1ؾ ｪqa6f�\�3�2?���":Mش2cm�ޕ�ޘ:��������ذ����'�혮U3��8����[Q_���9
����A5�D��HD`ns��U��q�Mɉy/��{�&t�)h1�O�dq�3ݕ��s��|ShI�P��Z����(�����1���B׮-�62"�Ғ��o�r}:y��R���ʸ�ڃZƒu���!��r�߿�6��Ӄz��������6�91o�bin8���7o��`�E�N�n�^���~��S����=�6�˗�7��;�8��XO��V�]@3c�u'@�-T4�ِ����q���]rŉ��ft�>f�=�:5Mbv�o���V��C�b����.�BA`�����-p0Q.��优n}p֚<^��O�c����rv1���R5�$p0�Llc���ͩ�9�UV�s���$�!#���dl��|8�2�s>�x���ۻѢ�"_b4hǘڛ�iG�Ib�As0�|\�Yy�+��!A��K�׺*o?�&�,�β�FoB��k���; �P�D��Ѕ)��}���O"���vܳ�V�T�)�%��&U� +$[�%�`���+�u�C�˵�6���ޤ|���n]$�1Ǔ��H!{�1�'��O޶%�A|�{��	�0F��W+-���13��Gor�$&���~Ӑ����r�>�G!E�����aȘ��xʥm��k8�. ᬘ� �\�\��	%L����{{�٠��%mWϯ4��j�r�RÑsR23,��ū����4���ԟC}�d��Pٙ�AH��к�=����p9A{N�$�	0����2sʜ��~~��4ߢW~0�?  _�N��4!�~�n��d�߅��P�Jc8p؏f�6��a�� )\���:�#����,�� ��((c6�8��c����E�hCp5�f���B�Pdh��i�i��h���<�XPJ�a� �@|�  u���Y|��\�Rw�[b�g8p����+�=��S�!�3��W-�/�����M���p6}J�Od������_�#��8�&.ة�Q�}��qʷ�KY5��b���P��,1's��2�$i��Nm�����{2"/�	5qs��M�����+	������?r�'�2'
���9,�L��"�L{���Ǽ�ys�.��ϴd�/q��:���}F�檈Uփz4���Tm��m��G�\�jV�'��[w.9�$?���DR�l���mT�J I A��iͅa�[���ȚX 3������l}ꈾ�J�l�eό%��T�:����i����_��֭��Rг|NM*��(��N6�r�&�ɠ�{ț�H�w�[G�#�x�ۇ����}1r�LS�#|��
Q̘�F��p�z�`�]Gt��М8������BÙH��Yh�"�sI� ��Wz�N􈳐��AΝQfT��;H��*¤�BZ��ya^e!��kᦩaje��pG��av塉p���[���q}�E�cyh�xQ⳹m�Ѡ�yh�Lc9s-�\�C��*w�Řoyh��Г�9�����;�b̻<4E�$�Ͻs/͌;	�ο�/M�k��4c��"4c��3c��"4_���x.Ƙ��}3��|�1������(U�E}ܙ�:�.Lw�1�G�om;<��(�h����>)�#��YưFQ>@qvz12�g{�D��y�`^���v&T�	UƏ�u<��)o���S���2��v��[�	��u�CE��r�G儯l3<gX*'<��t���b��.�UZ�\I���j���Jmv��
�'<�1��H���Į�jw���� 5�������@00ZM�'\���b��=ՁY&[�W�1��EO"���y�Ch��OG}�����e�8y���h�\��S�k8�! ���6*�F�Z:$CS�/��-�N�ߪ]}�e�jx��LA$L6m6p5d)I�^O�8E���v�x�-��`��ƽ���9V�{����J�L
��sG���f�O ��˹�l�0)�b��o^t�ðih77�WA�C�^7��*̔_��;��F���f�6���A��O�n��Y�`��{�B%��'
`(������	�1^zoX�g��OL�6m�����]���˙([Y�q����e�#|_��_�i���P[csp�rk���S�:�r��蝉S	�K�g���ad��W�1N3��S�j�8f04��V'��X*��+4�IdO�%w:�H��Yx4�u.����O��m�7x�򅚣���aW2*c1���<���W�"���x;W(L\��^i���i�X�OS֗�ss��g̃ѥ�yiRL�N���3�g���-&*�<qтO �xb.����}��U����}�Կ�W�u�����*�@M�
�f��8M�"uR��x�m_z_�`5�b�:���Q����/�
hcAu�^���pp�)3����O��L-h��C�u���J�`ú@(�J�KǸmF���B�@\��L��!��DJ��MGp�@�!mYH׃�`��y��<>�p�Tp8�;��6b^d$Ց1��~�`Й�s̓lȦ���T�3sLCNx�c�dq��wU�=f@ѳ��e�#A�z�����C��d�Ӄ�h�o�Nz�|����gܽD*'F]@�Yn}��X�!��p�~��y(�6.eAY��,���*Q@l�9�q���yF��C-�X�8� �'��U��Kq�x"v!��<uWk�U��R��g�	�d��~���T�^�g�tP!� �Huڐ|B�?/��/Hy��/THpt�$U��_��*���/\�@y���5��"�t�r���E��rD�d��r@!�$�в�nD��j)_��{V5]���pu񕾜��l�ArD�sC���a��ɦ���q�5�sΆ2��5�a �J'�:����}.S۵6z�\����^�ӫuBשT��܀�{O調�ЛbQ�jXg�o	�RąG�t��Qa�??x��+��L�P��RPܔ��~
X�+^��J�Dp�b;%�%~���a��s���>��>�+�;�W#���>��}�{���E�Q��w%p{�    W+&$]}ï�B֮
>�U�Q�F���8K�EZҘ �0b�r��v-{��>�ku���&�P^��`�	Zh75�!ގP��1��^�`�(�vEWQ� �(^��F[/AI�����z��PBXR�s�1*#��2`_�U`����� �ɷ���4����@%��v��{���g~x�.VNP#��{r�����wٯ�~xgp���J*�*����=JmTL�TH�]����w@�+�F'��!�$!r����p|a,�Zd/C���C*�y��M�H���]e�A%��r�"�Ѷ����� ���!� @+�l!�T��������yq �,�,@�������G��69��2��0����Hd[�����{�������%��-��qK{2���]>	�3����}���g7N�i�,�0/	�J��G2m$�B,IȒ�u����|g�����%�S_md+�I��kh���rotڰdzpt��8��\�0zN$fV:=S�mz��H<=̿ Χ#�x� ��NΣ�`2��S����`V^��(�-	[6����׋:�S�!��3fn9�E�k͒����ө�WpU�&��,_g4j$�C�CU B�
��\��*�!f������3���A�AO����ώ�Xmt/�Aj4�C�9�"��Ԙe��Zg�gj�D�HOc��6Seh��}G�����?�%;�C����.x��~et�j��{���Iu{�漣�\��&4!��vΏre�l�+���Fd)vj��/��9r߇�=�*hW��i��h��'��i�ߊ�i��d�h׀�_�u��e�`{��닅wy���Ҟ�݃A���Ns.
�T���I�J��e_�r��	������ ��f4au`���nx��/��k�՞��ou�PL��8����a2)�I����?/&�����c��$7��F�t�A��0��|��;w����������)�1yq�H�wsd��w�G�u�P�f8X۞=�Q����y���-�������;��j�@��9;�l�]=5�"ˊk}�q�3������O�9�ȹ))�aȻG>�n��.�5!��^���3M�Jlɡe���uBZ3�d1*���U@Y��NՓ>8<�k`@Je aࣽMv#p��4okI+Ђ2���c6QY�g�W;(�lx���b�G��)4���{���lOf̈�&v�/�6����/'lzsd2$n0<�P��X�*|��[��D�*1��'Nr9[E�$���U���o6�f0���
s^۽U�%�PZ����?���( h�AW�uM�"�K����0�;ZM�6�D��� /�Y&��S%�=5�A�(^x���P�eB���6��}P$0��t)��t�F-��+B����CK��UZ��M��y����+vg�P����|�����koІ���<%�v�&Eu�"/�k��R��zp��B���o,��X��t��������]�S]fw���w��.>C�P^י�e ��c�t�|
i?GI�.�<�=��S��y������qo<�'���r��'�i��teI��阧�`�`]+���D/��3�s%�`�Κ'`��r�P`��$�¼Jc`C�$����F���$�gB =�ql�$�j�A빰:ρ�W��v�v3�m����6UKhu�w��z{nz3���Nt��.w��qx�׵������	��<�pC��Ы���h���9��=z�v2Y���u�.'�rU��dk19���{ �'5[��8���3�85����,&h�}9�R�V��%�����i����q�㍵��a��sL���R�0C�D�L��"IҬ��l�Csj�F�r���r�n���Y��������"�,�݊G��8��6���ߏߟ�#@ uu���a`��fv��	1�$sn�?��n���AO��}kN�N���#vQ�E�<�ח��_���6��L����_0kt,��V늯�Al"h�\l�⢘��z���f�� |�ʼR��S����c��� �@�迎8�Y��W}J+ +�2W������a�ɮx�E���+�}�/�Ȯ����u&���_n��A�\8���G-ȄC��N쭓�"�l���},S 	%�o�8|��o���H!s��ǋ���.��h�$�;�w�WQ�Q�|���
�魸n^T�MQ����ǻ@#K� ��M��{<�u�հ��������(mW=ܤ'ݽw"8u9��a`�x k�wu-��kX��x��y)A`��x�ʂ݋�~���R�����+�;��"��vX�?}��%��˷v9�`6�S�b⾝�O��p��m�P��'�t�7гN�t���'Fk1
X�"��o+�`'1z��+�����:/q��p�����Z r��"�=��o`u��XtQOg��|\ׁ���q�p���5,ͅ�n~�uGS�Pف�*���|X0����K�J�mA��������V^���e��OF���
qCO��w����w-����\��b	����#���u\?ɷ�e��P�u|6.���n�2d�ᾦnt�J���b9TG��^���7�7p�M�j?vDG4�����i*�t�X��hв�e�kRB��V�5<�̿�ѧ�_�o
�r*y�*�L�4Z�����ʁ��W1��J8�&:���V�Y-I�hd�h��*�,�CʌmB�FR�#}O��Iq-���2A��ݶ�7�5U��us�O�-�)�%�<�u���hE���,�ە��}�w)$�	���� S��&�Ux�b�)�(o���[N�Cy誱�W�z�<Ɏ���54ԁDgp��2;r�ȫy˩C�ei�4�CH�sk� 1�8	26�u�ϯ�>*B�מ������ �ӐW�ƙ���{3j����kj r�`��kr^����m�߼��G���	��oy����k{
z�����:�K,�� ��h��k�'(�Ǆ�+/�#��?ߚ�?Av8�]�{�k�r2N,
�y�ib�Z������-����ױ[�C�W�����U����}��m)����y���bI�degO��z����"d
�̋��Q�<�ŧ5��'eF��s`AÒ.���Wdw��Y'��C���4�D��O���.K˺۴����	I_� m)�V��أmMIS�m�/�AJ'G~ŠS{D`�Ec�Ͻ����^T�9������,���v+�y�E��?=d̪tXy����ɪ�X�m,0�i�@@ݚ�EN�1�s�Ӱ�{���
�����=��5�������C�ځ�u��躡���*p�����G�&�aC�Ժ)_���e���Uf�xj�����摕ߗݫ!��j�0�_�����H�`��}�9��B�9U��7��|�|���S�zP��/g}EH`��*�%���F�}>�µ5�o���GV��	��L	���Ǌ6t���_�d���C�v��e?3�y�_^�UgS5aK�K��@�+�9����������l�)-��k�ز�s�E�B�{��1�JŒ�iJ3\n�OO�|�m�^�A��m�Ԛ����`��x���T���?�>�Pt���?A:�W������:�z�\h̓�2V�Nݓ��`z�QB�0k�gX{���d�	س�!�Ѿ48���m]����M�#��!�a��$���,�Ez�$qW�?d.����7��CF�Z+�Y��4�fX-N&��I��FPJ�i�5�4�0\�u��Di��}��p�ybh$�����b̥xȤ���Q69G]]n��W<d@�S��ћ�!k��+�x��l�G~�`18T<dJ�Ʀ��J�C&䖖<�ŰS�M�Z�0^H-O��ˤ�l�
`i��a@׍�t��CV���݆����,��)�i���9�F��*��HyԂ�Y��)27=m���}CPZ>d��t����!�3�Ό�CRZ>d��Z�2}	%����I�"*-2MS�OC$R��CF�dm��j�i��5�g�S�Ѳ����V���m(���V�c���s��dҬ���cnT����"    �R{�i2Ħ�"r���1W�o�1�ȯS��\�����E%�z��ۙ2v�ŤV�9B�x�-����'j���c�N@B�	�c *z̛��u����T߅���EU�)��O٧*z,��낈���_XM������(Umkc��V�c�����\c�U��N�U�Xh��>8f'�*��=��]D���0Yud�p"5XEwر��gY�����"E7wh���^���<@Glˌk�*~,0��[n��m����nӎ�����&��H_Q�o�J�jUo#�΃gm�)�Y/�<:<(�~��E������c��A��q��I��#�F���9�gL9�rT��ٛ�ؔ�F&��<��ޒg������V'�.R�T�����l��#�<x�u@�-(R�T��A��o.^5�HuR��Y�!r�T��z��*
�|}ȸhRS�IQ*yȼt8fiT*yȒttg��T��Z�2T��҇L�l����)�>d8��&L.b��!�1��m�p�K�ق�!�#�B̙�!Kе����<�~���� O�����Q�OP��=R��sqxY�0�)�p*}ȌL5�+ܙS�C�d���[wJ=d[�Z�2g�§�C��&=�[�J=d|���0w����C�h��	��2 J=d��u����z�(Mu�n���J�/�&n�*��U�
!뺪��l��n�Dl�!#�@�S�7\�c�w���c�qqV=�m����؈�vws�c�un����z,������a�K���n.��2�ӷ�҂k������syu}�)��<��>f�=ݾ{��Up�X��'��+n���X���� �Re��3�
֯~m�v��W�s�ToO�I�-_�Vy�	S����f[�8�7�e�q���d��2V�5�	��N� ���+�������k�����-.�<w�a������;Z�:�0?��Q*��%��g��846��(>2��5E)���:���g�ܔٛ���k�ZF�8|j�О��ml�4�<��q��&���֐yr�U;suLnc��J�$��.�6z�����F��K��t�l9��0���"����l;��*;�s�;��!�1��P{Z�p�Z���f��-[��$*�vw0=�F@.���Nt�D2���X���8ݔ.��|9T (4L;W�
q�W����,��>5����oZ
zA�p>�Y���b�_dO�il�b>d+]:E����c��?x���-@#���;a<����]_�}gS &�4�P��9��{�>�pXN#a����}W��x���P����Ζ�#2"0˿��+>Jz���]�F��;m\'_O����,Z�Kqw���m�H�B�`�\Qh!����&d�Nf�ſ������DA4�@ρ(m���L;b6Ds
���gQ��I>B'�<��T�c�YT� ,M���,*CPZsB�W�ūi�9����hdEz��8�B�apL��-1�u�T�/(E���
��>�A������v�s�6�ޫ!>K�C��珷�;Q^3diq���)���,T�¢�6�����Ɗ_(K��j"���&��r �K,�3��i��Ol2���F8*Ǳ�^��H�a�+M� lu�u��J՜�:�<)ȁ@6��+Ă�
�=���'g�j^�A���ܣ���?O]5��L�bK��ڵ�j�>A�)]�4Y�oٛ��e7|��Ҵ��V�����/�o��7 bj�Gu��m0�iJ�*\hܦ�~�Sx�b�q���h�uia5����?��t)����+�W&�hέ5�E�F��6�@�Tp�;�誣��I
W�=uJ�R{��gy�E�>�Y�Ogڠ����z���j���^��لgp��t94����
�)�r��v��"�rh��yj`^lN�k����s��z�390$Y���CL�B����Zw��!�+[�Yv���T/��g[�zȲ(�o*�\��B�=�~��ҽ�-�`�_��o�ɺRx�q
��=`��L�1��K�0y��2T"a�L�oX�&��E)C�f��,pУ�ʊ���}��{���}��|�Ps�*�ֵ��
��Iy��$�n�$ڷ�����u.K��j��(���-�,Ox�����������➜��H���bNOLM�&��rN}�|M�u>Q;l��\��B	g�e�
� 3<�L���~"�E��TE��dNP�f���d�
)b)Y-�2N�a�t��>T
9�Y�͸M���}�S@�*%N3 Lv�@���dE@��B�{��]�-�c�ru�OS�/��W�2L�T8�5G���m�#��h�V�x��y�w5w1�j(����h����D�Spv����fI�����S�h�JUF2�S���K��%��-�ˮjV&��J���P�2}rСT�yve[���'�Ʈ�_�_�ؽ.Ə�����|.������Z��op����_���+̃|Jo�NcD���3���'���|������|���dvu9K+����+��Iس�+�7�6kv�����S� �������g��x��T�^��<��7���J
q��s�i�{
�|��̱� N>7�<|�o�Y��\��%��j���V�]��.H�Ƞr�eCE�~	C?�tk���V��[8�@�W>�A|Q�]��-H.�@~_����"����UáQ쌋�<��Cl&��E���x����B8Q�x���w[}��@���n���3IV�P��y�-��ݰ����@J^�Q�M�U�Nl���p�?L��}D��T.�����s��5N�]�w��j�ufj�o� ��\�B`����&����ע��h���8���_d-��	.��vC#�`A�q*SR6_'weio꥽�*��.���X-������=��K����Z�C����2U�������w�Y<��̜n�2c��_��c�fx��+�]�t�ͨ{���')L��v��y�44�	2��'�aZ��⨴j_!XBlp�'�d�vr�����iltE�6a��g��HZ���4Lt���qxc_jّɦ�L���(��'j��֬FG�3ԉ�CA��ٗ�j.{�{G�/��{�J�0��i�e�i�I�X�K��	�����Su�}�D`O�� �U�ة�<T��-�<]�����1�v�c��`�L���c6[.�]�4����JI[�ύL��_x���1+������A�irS�B��Z��{=�￞�|�g!�w�T-���;X�����Y�-^�Sl�quI������ ,���˫�����K>��Aɞ[�o�1�V���b����GE�ݞX�W�OK�d|<�ζ?jOH{�������oظ��N��A:��I�[�PS慃c��?�������%���Zq'%w�1w���%�s���*�Z���"_J�/�+Ԁ�l���=7O|¥�Ř�h��~�{�#�&�e߳i�zW�!@�g���^d�h��%/��J#�
Lw6��0����=����͐���[�J���=6A��o����w�d�x�}�`rlh�B����1���Dn�����ܟ��h�Gd!�|�Kk,:���s��0x�׸N�灀Z���^�ͥ˞ݙt!�{jOC�k8�:����\��'�iy��x����G�Pj���@^g�����t��
�4�	��u�\���Ȑ&+��Z�ݔb=��F�S��52!q�/΋ũ�~ס�<r2�}Di�WlmNm���e��atk��5.ŚZa�M�=ָ�dD�L,VhO s`:�ې^��!>S�E" �!�:�^D���wSL���
H@6E��.ca��H09]�"��59;�N�+ ��
�Ar�=c�E6��m�g��?��0BW�&�9��u��s�v��K�#�����XO���i�6���.GzK�g�N/�)����Hx1�H�;�{YO�)���>�}nʑ�m�& ���H�o����ٗ�a�p�?�#pl���WX͋��!��
��bxPt���d��X�׈}XD8j+V�4	,�9��|k�1��?m�%�1A��    ?}m�&����ѽC��UI3�G�g�Y����C����K��,9zn�ƞN�ej�8p����^E��uD���~8CE4�/��u�2<9mw(F���r(��O=�=�K��_���}u�T������[�1�	��������tz33�;R��pk'����s����l5��]R6mI��J
oC�n�Q>	�1�E;�v�ST�E��Q��b�!��թy=����7OED�*�'����0O��T��Ʈ��V��,']���x� �i~���$��`==>P��xN��JKa�@P��c;n�@`����s�_�+�M*b/�D�+�A�q�_���+ޝ��b��j��+}����pZ{��w+��E��x���铗�XE�=�]!�e���I �q�uP�,�F�E=������#I���UE2crl����$��rž�2iC\\�l!?��xrr(�~��_�����}1��
Ұ.k�K��P�u�Wd�HGz��pK��4�du=HǫN�D���WXuE�a�����c����Ş �UDyV�bzO�:�6,�R��ߊ#�k����wdK��P��x��a:�tv !Ҩy��:���{g/� ll�!��N�z���GA�h#�^�ㆆ��`�1��:����kHQy��_�쓴�q��g��
�L�l��j��O+z$s���@N�;�<5oݩ�Q���s}:TGNƄ�
E-��mP4���?'k��$�P�³��Cߟ^_��h��S�K_�&C %8
U.ݚ�׷,��ȼณ�|h&�z�r�E3�\q��#C2Y0�j�>�=�^'�5$�[�S��5��i�\������ [�W��Q������ό�5���3+��qLGF|$<z�|k����3@���(g�äb��A�0�9r���-�k{�#S�	��H��5d2������<�ڳ&G�޴B�rZ��:wͮj5:�j�l��U��PmT�8�ۗ0���-+��$z����ps�2+Gze�#J�y�xl�$���X�9�s�J:��Y����F��S$QɄ�և;��Њ<_l��������y@����|�4X�����N|}���b�BvH��G�B D0q��("@Q+/���vt��FƤy�H���0���o���?k褀@'���%$1X@P�By@����gEW%8&�	b*�A;���@�N�G7��j�f����[E�x��2�\l�2�j\�93A��X^���L��r5�շ��m�w�>\yt��Che��0l._�DV:j�E���Qs�����zBD����f�K��Ȑ1]��Q0�0�+���_�+�O���X-d�&���O�P���g�ϣ�r�������
m���5���������O�"�T�v6�.���e1�GM�l�������U�ֹz���ZX�= qmd�)Ak��n�_߼=C|�2�7��R����ۇX 1��+#ΒH	"�f"�)6;6��ǉ�lj����,��w��ash��r�4�SVP'�px�����������!;D�{�g�[�y:U�����?d���2����B |
ԥ�GI]�!�v�<���^��(��h��Z����v/O�A�����mF� �l�|�zo
by���p��*�K2��w�oh���v��-I3�Oz�حw��q��V)�k��u�N�F+�|$���lt��'_M����B��Dm�G�2S���De)=}������$
�Z��.��^\E���2N�,�7v�qw�X�x�a� �<AzĽ��ŗ�K��E+�~����>�9j52���CLh��Ocq��ڈ��V�����i#K����v{����%T��!�sO�G$W�SP���C���T��&��Z�0��D�#�5�8�� �/ЖI����x����3n1�.M5��0�'�]F�:�$��*Ʒ}��6����ūu��գ�ŧf�$��6���{����(�sv�o���3{�(�|G~���yP{��T@�AY"\�)��3���/ĹE�bZĤ\��1��|�T� �8!R�T��ݿ���c���ǻ#!�T��,��5��KǴ�i<��V�ګn�Ҳp��{p��4��#���=x��5j���[e& `�(}��1�%	� ��:��Ls�	� �L�E@o6�>�b�.s|��z_�����*�G鯜�~/ڞ6����L��dv�ػ�k�?���r�`��i�߰X.
��}���Y?��&C��ݟ��}�W�'��Nz�����3���V]ݱ�e�+��r��CZ*qG<P�A,u,iY�|"e��:Y�K��D��Z&*�]��~@Xx��UM��n���e�BO���i/
.�ʸ~��#��K��_�ޏ�g���Ј�9�G�tC_d�p�M�ݲ�j�b��kև'�\@�.t_�=:�Oa[��F�Ex���0�#�<����lv��*��C��u{��*(r�4�?c ȬGH����B�lbӗ��lB9�7q2rR�]�NȺ �]�nnµ��3>����Q�<�͡��Z��q�9�1�r,�e���z�;V-�ܷ�3�#��ձ��V-��s;^�FDh�U�OtW���$��y}?`�O�[�Z�[���e�в�=�-V����~�>�{�c��=&y3�P�$��΄��e4T`��I;�}��}^>t��ݜKa|2�6}�����8��垹Ų�e��aʿ0��)
�b���ĺ���|ƥ��&��c���:4]�$e4qG��	la��	&F����ǟ���Y�	0����Z�;;��\����.՘h����?�/��+	@��x�w�GN'��`��Fe��66����t�vf	n?�e� e:��$%eKd�l/g�~N�e��v{
�=�2�P�NϷ�|	���	A(ܠ����I
� u'�W}��t����]������}5ȝ|���,
+����~��ȋ��/O����  ����u�y�������d�g�.v�
?��On� ?����r۳����k�{����e�O��"3]׈��\^�^+ٮ��HT��@�I钺�K�l�ا��y�E�P���C8ѕ�O�.��R~�؜�EJ@���u��3�F$8Y���V����%b,������W�X~a�*����ߺr�@�BE�������H �x4r|�ԋ�yb�#�F�nt/����hO�,��>�e�{@{l>0���w�ӫ��5Q�àQ]a��/g(o�)vD`G�+c|���W��P���s��'����,���imn��뫁ᚃ���-�i	#�)L�Ku���O0�8����*�s���1Kz8nH1/��M/6_YZ���,���E���I��� g���c����kQ�P�R`�Ʃ�YY��)e�z�2�Y����rp}�r�^���E
Nj���,�:�[�!�
�SX�DYlE�Ps����������$=��	;Ԇ�̕�[4�8)�(C���[�!J����6l]S0�H�ѝ���4�R@z�;d��S,��h2}	T%��/D��0���'� ��.��1켴�&���")T��,��L��
�͍NOks���k�-���`[� .�`��dZ,]��ِA�iz��BL�um;$�+u�@U/��ds:]��l�1�L�{8=B-��0����m�K����a|5=-`}���T��l4����I�u�CneWx�Z<�����!	C���RW�p�b�U���x�&Pa�X�]>���x�2�C7�_ �^W�0��0ɇ�gL�:���\EBͻ�ku��{Hs(���˱���@�*_��m,�؀o�_n)B5�]B�Y��NUjxL�l��^o��f��!�h�H�{ݣ�(ف H�ЕkM���ٳS�CA�1%#� ��(�R�Hf(�7�>���h����o@��U��g��C�G(%nE�)���C�����}$��fl��ưB<�S�Ci�d���AY�ӡ��T��h��Q�*�+�Y�_�[�h6�K�����+=4�ξޡ��@N	a&M���	v���[�    #[�'�Pzy�#�o
���o�d�;�?'7��'A1�d�=0�u�`�C Ũ�T��;�p��ؚ�X��Qh���U
@�R�ؓ�g����`r���]����դ�a!q���:E�P ��:�'U21��4k�<W�&�"Z����^�V�2�C�T;؈btc���'�,i���A�?�h���Óo@q��o���������k�>�DRJ�iB���/dF�@	b(�)J}�o!~��8�Mk�*X���~�-�⦠t�C�N��J���cn��my��聖�
<����P,G�!�Ca�q�$͍1J��0;%���#�7��}��-��t�oj��V�����Msf|�[͝�Y�%D��#������])���*�1s.Њé��H/��
�ir�2<�Z2,�R�8���ʐ:;�~������ �ψ���ӯN/�KUF!v���a���M���$�EW�Z_�X�[���"t�6�f�ʑ^�\񛘅(��7�\�"�+A���J��ًU�4�<	��1���FA� `;�ʧ�1f�W�H��.ܩ(�T�(�ki�-�߯uۥ4<����q�i<ʡ�R����ב�"NK��5��%����MR�����R��g��-U�� 29���Bl�V�"��i�m�u��
h�|�G���-f���IU����w�~�(Ɯl�']�0c99��������Q+K�/7YIH4?I4	��e���١ � y�i�S�=_��Y��Bu^�ep��`�������+��p�N	vG{"ٓ�ƞ9�FQh��/��)�������Ȼ�h��?U���_�"CK�cU�Ͱю���ip��hp�1�����(�'� H9�#���,ԍ�t�4�ZS�1��FP�ݱ�$����{�+�G�I���������	�z�,�����Q}Ү��H���	ըG-8c��-*QP"���]��c�o��
!�,Ǿ1Rce�K2.Sm�xA o�	k����zX���:5�	�>}�`iTc���p���C�?��f⥼��0/((��xs�m 7��n���ߨ��R,������k�|P^�C�|rÜfb�@m��"d]��� ������G9-�S<����r�`�v�ЀI�'qB���^��7�É�ag�ÓD&6ST;c0�� s1 ,�B�Z(lN�����/G 4��X�!t�4q|�o�-0̩!݁k?̀N��4�yԟ���.o[�	���&>O,8Ǹ�4�yj}w��p��?�m'��i��W�kFy���[��X����h����s��-�����.Xߗn�uj���w-(�L+��::B,3p!�"�O�O������_֫�������\����uW��I��u�N[�sE)lm���4粃���]~bu)�pw-̹���p���)
{b�G���IE�j]\_*1I8��r*���kx�QF�pp�ccA#�8�����.FPH�L��¿_��V�Od[�|�.U�蜟_p�)��o�ȯdAn�������+�Z8�� ����/(s�ī�s�{/Į/1��j V_`��U<q�  ������l&]8�;% P��T
��	6� �	B'�]0�Y���k]s�:���>�T��(����0�VS�C ����M lf@0^q��'P�i>�SE��1��@2�=t�{*�hƑ����S���8N�|��O���$�)���;w�+�y�6�(V(x�a�g_�5�\�Z�t�[6�������������'w劬/G�A��ԡV%�W�Ʃ�2��~�`}<q�<��?����QA	E��,����/�D����8u~E���g�J�C]DQ.H�$��E�Tۡ��d.l�y]�s:`�R�����C�s�%TS��U:��xB��Q:���"D������"����{�Z�f�J�d�$[�O��k>eIc���9�.��-�`�� �M�4�m�����4+z �����,KI{���	H
vs��ĸ��>Çү/����#NC5�F�V�� �ԯ��C��L[�NT��1�r�Kp%u'�g��(P(���7�����Fw��(Q(tB� �|2G>�q���G�2
��(A�j!��9�ń/�?]�O��a���"���NqCi�$V+G�������,2�n�8ƪ�(�4�84VMdoM_�)1����]�-F	�,�s��L��|����lS�n�����q���7<W4�q2+���Mܗ�XȲQ�Ƙ��� �p�Ȅ�7]	��Å�R�mf4㥫>h�gq����5jެg�}�/�'D�J����b��u�ύb(���y�yJG�J�_�J��1� ���o�	�ּJ"����y]t����r7܌��k���s�\���;Tm���v�%���֐n��}�����
�f�9l*R ������A�Po���R��*��Z<��G���d��u��\�2�٘#i�;�Pc�D������Y��S�O|���*�KӣD��T[�pWt�s%[�"�����h�Hln|Y�F$��E�ҹi�x�$�m�Lj��dp1H:GV�u���c���E;}�+F
q��=��[��h��v�V�@E�ի�Dp�Q>�W-�������`^a7��ݦ�Oj���=��|,��D��x�e2��ZoT[mj�֋�M���� i��N��e �������r�0j�������I˕}��Ii�ĳ;���lwz�0ԫ�o&<O�(GWP�������"�{hc�.6�7�>#@w����?�H�Ц�!�������Y@���xw�}?ںu��=�t�Q��K��s6���a}�1å��e8n���y���qu�1��g��HM��(
`��04������l}a��?'��	G���0�D}���_[�Im_`6�H�lQi���M��l�X 1@rY\P�6� �b��,�)��_��B�P�`����Jz�K�����h����L/bT_m�Z���> �x(�@�䃝Q�.*�������<t/�:��	]�R۪֓V��P�:�����~`�9��k>���L%G�Y�Z�@��
 �]�?/�u�r9]�(L B���������� `Z�n��"��őOKW�yA��$�=��
� `�Ľ�1��/�9�
��K=�(v<)���B�x�^o���sD>ǅ����<xy�����"4��&$\�N`X@��d��UV�]cwe �/!��#~_�h�<x������ �M������@�QA�o:hwi���g����ԯ�n���$I�)���Q�R��c����Q�R1��f���\�(���	y�^x�u]p�-�L�3��;$1j@8?���#�>av )�R)�H�2��tO��l�����wkĮa#.}t��'�LY��Ƞк��՜�h�hÅ����R������E�Ɲ�\�#��p�[�~[0D�-�WбO�M��\|�r�����X I�HE@t,Q]�E���X��s���QZ���w����ң��_�{�s��g��R.^�_��e}��B�U���	ͼ�禛�HH�����%�2fq�؆����O���Ǐ�.Y2>�t��'Yje���#hL�LYoa�� }����		�I( \"4�=+��C'��LFB~���S=�{���}V-�+�z!�gY�;�AO�ȶߗ�ǘ̳,���k%:��7`߾>}��ahd���佋�`�<.�d!B�rY�e#Ԋ��OO<ǔF��<�H8���q�ts��p�$ݝ����>.�6��]�pi�i���+���{�=-&���Ȕ��%m��K�x��lQ�9��Z�d�]�F�4C!���Bu���1�����C����R�z�ryi�	�sLg��Vu���u�Q��������]5
|�Q�\��Sc�T����I�5��M����;��+ԡce<&�E�����1�'q�*���ur]�U>@J��.<Y7/���b��e�ØR� `�s�dl�~nW�Mu$%ҕ������M���=ZcS�8]�|Z�%Çh 1�����}�Δ!�    x�).�v�C�ځ'��nn��*&_c|M���9�� ��3R6�����v��t�	��C��ȝ��2��X�Mt����#Z-��o��sq��覰����G~�t 	Yx�id�?pqĥr��`�,Z7��#ya������]�ڿQt�'�jv��y��h�\��,"��H>b˧S��`r��
���,"Z�3�ǫ�w�Q�gT��h��ӡ�|���{�|G?��o!0?PE[@'�8��p��C�^9#'�6.�܅BQ�Z rk7�}t.�>��� v$���tyy�|�s�+1�G�bю��.�#�ܐ�づI�k��(�-8N��e�}�\��I2�~��B�ki,��|T#A.�a,�"@�I6!Y�_aҺv=_�c{���QQ��dR�Z8���;5m�]]ť�!]͏�l3tXH�Դ[[<�� ��$����Կ��A�lb�5"_���>X���_.�+q�����r�tF7�d|t���αv/���Ad�@ߘ=�L����M'�L}����h�]~a�7:aF�=E�Eg2U+��iD�|�D��$x��	�_N�^�z��?��15~J@'B�BW��ҚLp�����?��8�L�������F�� � �)e�u{�D��T�:�I5����K5���Ѝܐ9��&j�� !SN'[bUf��e1����m%�ĳ����mb�Y���+ƀϜ�Y�8��3%e��G���.�w�Y=5�	&����L̓�k�����,����ƣ�/�w!,ǝ��a�Y�fVL�}CN��N�r��ΰ�v�?L����G=��R�Bv�2�K���y2��)�xJ7 O�f���S���ʉf�����? �<[��U/&���ʞ��� ��9����w���j�|,Ǉ����]3,B1�¿2ႅ��&�b�k����4�Fx-kc��9��Y1;-��.,8|���X��/��3�q[6��/�(�������;]��5�'z|z����6���wj��C�ӗN�l�-Ww:N��rSN�e�@J�o����8�����۴��m�NL�;IA��$������N�k~��)�|��2O�ȧ�>M��L).�"�H��E���:C3��2Ju�\ˢf�f�;�xp�!�AJ���K�A��ZM\>`���/ N <R>f*0��ס-Θ
��k/�I��?��[sf0Ey3��|�̧� *x��*��*��t�@����;iP�堏b�N�gu�f#j��i�#>|��1��!��~�s��, %��n=�"빛)����x�|��D�6�濌H�zr ��AS�o��mh3%R�s�������*,8�T��s��>��b��aȁS��w$3�	f�4�${�1��3l��W61��Ԋmf���V�v�\���UMBo<�c�E�6�z�Kϲ֞б���P�H�}������G�
��µh�oY�M~�m�3�;�zm^~��0(q����g�eW��� �Y�]��X��z��^��:�3�8�����]���ݧ7'�fY�]%"�o���P�� K��9,殐��ꨮK�X���JBO��v��������eb*¤*	���`�1�鎉O�v�) �w���"�N�坛�_���g����?�B���͹�)Hk��-:t(m*�?!��A%�@=h�〃��/DF�Mǉ�T��8�Ri����C6�Ɣ����Ԣ:<��_���|�왵�U��4��D�����3�йJs���8�������n� ��T���y|��q
�J!x�~Gq}j�cJ�МRI?I+p����R*�����h�嗧F�� ��y�߲(vM���аS*[�k����9�`��C�J5,�� n�"���K\V<��zh�*�.���7'[�u���h��T[?w|h�
���e3��:D;�βȸb�ܨE�:Η~п-�	9g��x�������Q�,ڲ9��=�uS߀;q����e��Y��R<;)�uT�&0�1n���&��P�,7ϊ�;�ݔ�j�8�Q|�����'\H��]�"�]2��L��*���3V�Nz`|~Â��qm�`��Ȉ�ݘV��rY�Ȇb������l���o�5�us���Đb�Z�*�ؚ�Uj���3�+���ѫ�W��rИ/:��=��s�����t�E��o���Ϭ~,z$q�'�A((������<�ޱ*�#y�9�,lp���=����̵�Q�0��9�wk���=.T���3�g�;cUd~�x�[��P��2��I��(�p�3s����E<��lV>zf�dQJ���r�o/����+�7[F�}�j#�~�u#��#R�^۞��%����bL`4`k���ֆ
�Z�gV���xw���W���$��_8k=^����*���N|{�[_��F��!j������"8s�`fCFW�,ole��L�l5�`> �t{s�7#�C��˥������=F�?3s� +��z
�1��1��K���<Ѝ�&�p۰�`�qd}J�=$`��N@ٚ��ja�V��>��oZ�rˤ�gXT2��,��˓�}xa��A��3X�,�&[�X!�S�b=�fG�&�D�eƲ���fه<�,ru �wʐZ�E�ܥ�9d�n�W9��Sc=��ݢ���{�q��n���������!��/g<�R+8�+�8W����V�|f�D�7C�Û)bd�d$"�1�	�;�*H���T q,��1A�#W�H :����q�8 �٘{/��1�=��B��� ��쬮�����0�YN=�K�y0X}�ʚ�Y�?�rk'0�$�[
L:I��@q�w��
���8c�g��e��`��}N]x7�kJ��h�U����ɇ��9T�]s��N�`�� �Y<r���7s��ó�˹��a�S��y�fu�m�eid��1�,FM���1�@p18����-�҉
a���������~�P�5*8<�R��p��Ĵ��d@f�ý>3V�a.�������ˤ�q��oזd��ϗZ���~owD�Eiw�ҕSM
H�8_�B��P�?{��t�V7$��I�S��&7�$�8�xwI�. ���&:��R�sz�ꆕhjh�c#�p��:�5����_q'�K�+��| &c�f���ӾA���g,�1��F
:foR[��֜	���xн���Cb)����*�*���OF�pߛ�^͓�w�+��ҝ��Y��c�ģ]��fǓ�����g �b�-�HǼ9��T��`h} ��v�j� Ȳlh��fW�+"�0��ug�I���NЁ�����u;����u���;�J-g��^N���g\T�x����UGS��س<^l!��^���hHNױ�B�Ӆ}tb}�s�t���ް;���Լ�P!�U�1T��\�r�܆WuY�rc?I��T{�����>�S��^�r�3��gy����F�~j��iL
�	O��;�@+�`{���9�ϰ�llLwh_��C�n<	��`r�ݹA`I)R��|{��7.�
u'��{�"�����e����=P�yZRe��]f�����h[C�g�������BU�� Ϭ1���B:�i8ǻRc��e�2��O�`i���U!4zZF�����S=X㧕�����('�4��;׿T�x���}�`�䐽|@;���'��3̬lD�_>ʢvW`X�U4l}�����������D��0�-6�QC������m'`]�
���W\[����j�8U�L�XȐa���!�.0�{<�+�Q7��P��QQmMi��~��E�s�l�d�\N,�%Uo�^�z^��V%®�|�	���y(��o$}�����Н�Xq����s��a���g4U��Ŷ��ʜ��:=���]�ܥ7���f�umV�o��h`���#�>���Mni��CK&�Q���Y8�cB�,�L��������T�T���ݰ�r��>�o�A��,��ru]Y��	]c�B��>b��Y��C�]�1��,&�a2���.L �&��#�ǩu�9|a�P��ԟ�Qs:�I�����<�y0"�G����d���l)gF\�̒������fy��Oy�7w�8�ɓ���,x���4�    ��L�$��}f4`_���D���牺���D��s~�]�3Ol��>����F��+f
{�dZy��yx�U�?��q
�M9�:GB�ݵ��T�bc�(�q�[�g�w[����鸢q�� ��6{84��E�*y:.�i��+Ϩp?u�m�t=���t_��D��c�/i��X:����!� pH��xu��"�+���j57���~�߶W�q����<���ۇ��P����#��v�db弶f�,W��W���_�U��E�Q�����@ jJ�Ae�Aǖ����y{c�T}��@��Dɀ�e^��DI��`����{���?�w��nf�?vV���ҍ�NB�#nG��t��p���۽�£i�9�.�m�����k�2o����o-�=��ׂ�WL�	�Jg�$��n������|�'57�[�C�wx�oz<0*y4�Z�M�됐{�	.@m�v�P����Q��i_�?�>�.�+\ꑁ\X�uCZ�C�U
�#���a�\��"�䖻s�Ŭ �~=�+
�.|npo��tכ��a��y^~�J��i�2�y��:l�Qњ��(K6�Etc7P�Q�B<�6�Eܓ:_����u=�LDr�d��3q߆%�"�[�����Ǫ��NɌ�\dw��E�)��x�BC^�q)$y�դ@5z����ڿ�'��~���T������K]���}��i�m�;��#jW���e�]�w�"?/�ŵ�5ٔq��i�OhjX&���֕a����/��J��ϼr��zSG� �'5�)^*�A���:�PW_ �����8��M;\�=y������_2�u����1a>��Z�]\�f�@�5�_��:L��bʡ���:vG��r�&̋X��"^�V�s�A<�k�8���)�P�������{ Q����΢��r��d����ӲR�=����u+��B�,>�+V��s�H�Vɲa]1�GF��7W�r�dp������_�+ܡ�T['i � D�Y��eY}_h����H<����6�f\TQ���n��$�!�hJ�A�����H]oؾ\��[>����N7������ �����8(<I���M4C;x���[D�ޢ��m�Ȟ9[Ya����3�r��Q9�Ś�m�;a9���h��ޙn��E��c��\+BxE���=����qAb{ɐ���B��he5�fƩ;��r��N1v�P�F������o�C�)Ș܍8�c���(�o�!�1�ؔ	������,T[0��F��5�R[���Ìw�K�@�aa�"��~h�E<��7m�:�¹�Ѱ m�(�C��H�#҆�h�!=���a�������/����$x�xZ��T�z`Ä��]���8|n��(p0G�����i4��i׸�	2�oi"D�<���=�#��Y.���ޖa�*@9$B���4���8n;y��H�3�/.�o8�U��f@�d��	دN_1$V���[�8������g�4,�Z(�����4��������`�J�1�� ?>�N?t����E�������(�tb%�(���yV:gM����GI�c����l��>�wf�	���#�s��-�����}ǩ&dDO2<�����df��(ٟ-BU����u~�vP��P�j^�4H6�Ӛ����FGoCY�y�H/�{�E������N�|��˞�O�}�x'QH/��;��w҅��2S�z'i��_'6�A���ʝ;k���&��߀��"�oԠ�w����i�q+�|��A�핳tsQ�\�漯46Xt���3@�x��-�b\�|�P�b�,��~gq�j��w��{���>�M��(�Z�'CY~G���8��A���tT��@t���G1�v1+Sv��a�]T��Z��	�`�`�z�$Kn-�ű��9���	3�D��ө����L+��L�2��J�t�+�׎O<������Y��\>��q�~B���w_?���Э)������^�[ ��ʑ�B��4E9�]L�Y��R��kvs�|gj��]th��hN�r���KBx�����U�xڷ���mw
�ڇ<L �-�l~����d�����PHA@�@8����r���+t���ֹ�]�D�F��h<Z�_	N>����X��lhТ
�}���68ݡh���D��pj� ( DS������Dܷ9)��CdV�.��G������NC���'�s���e��F��R#�}�&v�e4(�S34�ϐz4(����IFE����myʩ�0Kg�+��x��r���2���^Nu�mݼ�L��A���Z@��q<�XP�?ž��Y]���N�Dq�����ϗ��b��� L4v�e,.��s��Vߖ��ؔ�q�5�f�n�޽bѶ
�X�_A���$�q8�g���릲��ˮ�����Q ����� �exk�_���2���7���X����:D�$.�p@�1�2I'��ә�KD4����t�P��P�.e�yi�,H}-�|R���I�k�����Yy�dwZ�]$���~Tz��4� �
��2��bUk?cnq�<S!`SX�����m�c��2MǠ�rh���Ȁ�45i;�c+�̱F�m��\p T܆*�����ϳX��L�9�ۀ�<()�r1�ϸh�b(?�5ؕ!����9ؼ��?@CN*�"�.K^�
�
����Ơ��5[�a�m�]��P���c�`j�e	��-08B'gD'��)W�6,�]�l.��:(.�]��N�y�����҇�4�R���[�~	0�Q7���N�ږ�~z�����O��w�$��8xR�p>Uf��;��5��*�;C��(���Y ����` ����rW[�'K)9�h�xJ���l� �xB�yn�R!���d�pke�3T@&_͒�
<�O�g���1x$߂�.X�����,�Z���$�WU�e-��&O�t����Z��MX����S8W�x�D��ޜ�c����yvS�6�x~f�V�}����٥�V�T��R�?ɖ��f�,@�/"���/.V#�^aj&B6gf�~E�xB�Y��\'��fl��7����šH��"��^?��iׄ"��G�z��V�9���]�oE6��M�%����n݈˸�!�)jR�p�R�S������r����0���׿1S���XЛ����]x�CWʀ����#�ze9d�[
}(���o#Z���i����+��.um�
ǚ�PZ� �S^��l�Z~��]"d[q�p]�We��cuP���V�[*�ס@=z���+�H2��b&���d�x�d Ԑ%%`���p��g�3��"���̓�S����퐵	��7�������J�p�p�BN"64�YC֪i�X�Y��]G�zٽJ~E|#$[r���*H�Ro`�D��E%�VNw��F�P	��61`���ڛ�y�,��Q<Gyړ� �(��r#38���1��Cfvt]���~�ҕA�є2^SG�Y
R3J�i��L��R֐?֍���ޯ�ڡБ���P#�*z����+��=bd����̓�T�x1$��L�A�r�-N���ni�}w�ԛA�a7���P��v��f9d+/���~�� `�b��Jel�>
`����ޢ�=`c���Bs��ӵ`D�����##!�/�d�"���zr�����v��1 *k�:g'�aV�=��7(�-pq�M�u����D2�ĝ����:&�`Ƀ�"�Ԃ���8�K](�́�	%��s>��d[�`|��/ɯ�!XYJ��t倅ݝ��dN��K�;:%�|�te��orz3�UH.�Mآ�Lߴ��Jv�`�N �n�壤� � ��j��	���[�B��q#Dw�(G���:މ��f⑆��վ��r���ar��!���d�e}�������%��cģ{D����kM�#4������bP�:������VOH��R���x�nr�](�Joo�n�ֱj)5=j~�X�ܸ�@���ש{�y=Ry�h�݁r�.e������T(8�P2
��RG�cv������b��o�q��    ��x�(�/�t3;F_���fo�k�z�%wvs���в,�!0�a�c�Z�n聵��c(ựY���#B �!0��1�(zV��jN�9��t�$N��cu��+�%_/Qܝ�����˟O<{��Ѝ<����3t�;i{�#< �����|�y��
l~k�B5�47e�RrBM���ԟRTwyLɭl��Ԓ�OF=L.$�I��*�� /�%2i���Z�TO1ъ�<k�E<��ѵ���B?���A9�z���iv�ܮSW8�cЧOT�l"r��=a|����4���x�Ւ駇Kw�����ܝ�8!����9,�;"w�ޛ䢜_�c�>9����r�A��7|��H��}�$����a�@�0��I���ݮ�i:eƦ�ū���C��`��<�S��;, @r%
��i��X�/��_g��97Ye�����:���N�Æ]p�y��^ǫ����q��-ܵK�<.&���(���S8�7/?��,Z����e��$�X����R��>�l�@��b�����:�O�����i����zd���Mq<�!T�y����0���x�C��<�枹~j����2>�ҝ0z`f���[��,³!�S��L�SxKD��Q!��E��E�M����^��Κ��
t�"�x?]6���ύX"@@�������N��&�GQ��1�7��MP�8���x�<�(�����!o�/�FѤ#�f���E�B�|���O�`'�;p�B������h4!��{	�/�
D�>�t�ANqt=l&;z�fD����b�jSS��1�4o�T�NbF�pw�8�b(��B�#cT]vJ�#����b�O�}��A���aa�`��.��*�6����c���ֆ�q��K���Ӓ5���\�9P"��:;:̽$�B 8L�H�׍~��1��n�{�`B���?C��ЗD���:b4[���&'��|�-�qw�;�"c{�ݞx���WhaR__��ڿ�q�,JWN��=M&Ģ4>��|=u�Х4��=:=�3D�ԵcPj���Ҁ�=�k�`9��"J����I _1�Կ3m
�|���[~��߀Gn�����x@9d?%�!^{�2J��1�M}47F�b/�#�ra,Lfܽ�"��W�����կd����;�a�n%3]�hpޣлoG���۸|_����CyИ��/�HL���>�y��R1EI�d���G�����-Kn�ʶcݯ�ЎpG� Đ�b�Y��ڢTۏ����3��я]��HP�r�=��3@"$�ਯVy_ɥ"�'0���8���h�֥r	�V��n$7��A5�Zs�I��7�82a&� â�����%^���⪹��It��º���3���S�5v)'AO���tb�Ȫ!Ҡ9VC�R�K�!�^g ������9��k�;��D���n�Pf�`���ҥ�GL�<�M(����--�ˬʘY�P1&J�$�J�ڧ�����= 0�a��f8��%wq�-T-h�9�X!jA�Ս;�A�����+�`�n�?e���fZCJ�f���h?�a���3�Of���������T�1ze���y�^x�/6އ]��9O HR�xO�v�S0�4R�:�`��鞪��Q �q�'ԫ��&�; ����q���� �U�)��'����dk����o>��lx/�}<.��j�x�s���n�/:����ĺ��NV����}�t|�w��[��	��댽��b��eSMe"�����?Ӈ���t����=C4|���Gk� �R�}�^��h����p,{����V}��"�lP?��� <Yy4�^@�H���Pm}H�ۗ7�D�ֽA��s��afz-�T�xrɎ�$�.�ۺ���^��pC�D/h7t.E��Im��T��{2�L�-���}m���l��F�A�o��zIȼ£�3h_�v�3�C��fB�1Soa��/���I�}��L�P��������ZK6ck���{_��$�M���E!Da��e�/�a���=�[$ɾ䷐�@�,�a6����i"=��s���l`�����3rk��uنQ�c)GW,cB�vI��[�?[��'Þvs`��&��?&�q�MieS�E��Mc4�Q�n����K�3�~�f1��%��~��S7�2pr����yuq��"�ޗ�z��AF1��<T�蜿v��E�10��D�t���'�-A1iit���[��lN�v� 4�[t����@0�z�E'�궟�$�3���`N�,�/�XYsL!W�/ χr���K�R�P��Ea�m��}7e��+�7 �� �4f&~"��ܧYt�㚖gd�vu}I8̨X�]�X��<鳨P\��T�Hx�g���qzI�e}��XhC	��7HݐO͐��ɓ�\f��j>c���V��1�>�,D�����sO�>�����^x��b�@�g.���KL�>ļ�(�KY�X� ������Xl�^]�?���p��9��,�;�̾\]�(�d0��K�@J5IdP'�a��e*���ܶ_�r��f+)!��L��שTȫxK�@ʫ�P����)�����OplB_ ��*�R��s����g�AH��
M�G���7s����.ӈ�D@f��ȷ1�[�1R1�$䋜��"A�K�7��%M�I�m�9�<бʺ��P�޴��_� ~�G!⸁�����U�(����`�/�p,9�Λ�p/�:S�����侭�?ܕ������p�{�(GJL�{>��j�+��<;���ߊ��χat������p���Ph/�zf?</������lf��9��B�G��8�
�zE�G�������Ǡ�� j��ȣAA�a�O��	��C�9?�����n��B�2H�]���� I��<0m�QX���k
�q��Vx�}:��왊��N�!8�L����1��ww's�UM5k��sv�T39�[]nG��>�� Ү�}���([3�
iN�a`�t$O,g�-l�'s�������ҋ��u��/��O�
쥞h�~���#�t�o�0�잗��W�+�2����ρ�²�cͤ�$b������ԱGj&� M�;���(��jo�p��62fk��@��;r9�{CB�1���U5��.�X I#���+�����pg�	J�e����i��$d/���2����&L����P���[5_ο�'L.\��$�������eɢSv0:Ly��Ս�n�Y�A<TXT�����w�bd��e�\Ϟ��i��BEz�O7�CU��@\���
�_��ǝ^_��޴��H(�-��8����=O|C��]fP6N�*���ds<�ÿF�SW#yq���'��f'p ��NehF�U��z��򱈢�8��-���,:�&6�$�ݕۦj��Ȓ���i�h�����k:~�"�S�@8��ǌ�<�������s�e�%�Uu�^炍~�Y�]e����m�c���W���Mk�֪�H��PzF�<��e�H��|�x�bd�����ab��
��'��<YYSˡ�Qr�c�c<�p�$���q���7�!��F�Ǐ�-Bƻ��P#�YG�����O��a!�a?����e����y��#
��)�`�v�H�y1Cq�Ҳ{0=������*{r�ؓ	��"�J���X��%pM5��U�#J ��|V���X����o�M4��ux>�����<e3��7�]=Ԕj(]�����s������)�_$w���Jkjk���]��J�ٜ�����7܏��/H�e~+(:��q?B���-j�aʫLN�.����*��I+�v[��k�>���q1�}Ĉ��TiVUU�~wNV����t]e�=��Uwv��fK��5#��顲+Ū�L[�I��؛;�@�%gp��r�B��bg���w�	w�Y�Y0AC��4�����ܿ!�W2@����{?��j���f}D���X�JV(6�d��J,<���E{�6�x�ff*���5W����<�E:�    �����fs:pe#f3S"dW�t�p{{R�ۂ�������r} e�Q��Dt�X�`����t:����~2U����%<�Ǯ����ȇ�s�A�4����[����(���6
�?��U7(�*�o[G9��@(mj�r��!��o�!/����"
�6(����F�W��LD��Uq*{O�����v��"[#�@�/5���ȯ�_k\�~�����7f�b}��^�[<Zw��/����J��Q��cJ�����Ho�wV�]�(n��V���G�ȖO�L���>ha`��ܲ3��O/<�t���5yׂ�:8�����$�^"0
��/�%�����=�D�����>�����/����6R}�/P�Z��6j3�%�X�Z�6�*$�Se0"_�8�5�eƪLOB3x������v���Y0o?ZO��7�|c�"[7��K�_s�*R"GMK��a�r`�>S��j]�2�Gk���C� '��%*��	h��јܽ��oD����F�	��7r09zW�����G�Ⱅ��B�"���l]&��dN�x\�L�QXD{�f���&�{� Y�֭Q��W��O�����>�
���I��Y \J�<zS���ˡr/�'b�f�<A���h��Ŕ�O|�O��5�����Њ)��q����3m�{W���{�Wȏ��#H�+�Q���tV��#��Ӟ�D9��!�Λ����h���4���+�巁��N����ߴ��W6�{��҉z��/��r�S}z�,Dͅ���v|��U{A�c�%+�g�ֶfͩ�d�[�J�]S����<���	�
���G�Y_�g��t<��S�41CٴV�X�ٳ�F��u$,���LB�B�ၚ��;����s���)�I�A&�#[��v�'d QYqc��O���(�Ə��x�@���v�jl����Sp��>R�n>-����*����um���g�b��@�4�#v/�t��,�r|�w�P�/���Iߔ�xU�7�:�S�!̹�B��k���<ZM�;�5��\O�柘7��+f�!�t(�a��<`E$B5����0�\��C�������"��'M��E�I,��M�Voh"����L
q���L�O���ձz�C�9�� A2 �5��8�j��P�����ph��Xɮ��1�'�KU�e��"?W�زx����!׬��L�?��C�5d 0��lweC������>4��ve/> LȺL��ԭ(��=��q3fG�`o��;�y�^6��+�eS�Z�k���:@��yo|n������eX8><���laʥ
�]��/*C�@���mCc2�^����α���$Dm�o+��܀�h~�̫��ܘ���a$�:ح�u�*q�BF@�������s���Kـڵ�Ps�#����!l�������g�R�>����ոSc�p�	���`|�<{�J�#�V_���%�����0���r�qɪd1�3+�n��?
�fY�)1�P5/�_��m��O�CBR���]F!zv�X!�(�;Y?I�{�/�v�l�T��e������|=�ݡ(��G�=Tv���6�eǂ񻇚���8�Z����m�G��~�,A+����̕�������1��=���$��P G-ő�#�k���l�|-z�%��s���K�@�!:�8�N` Z���[Pѝ|B�Wxm.�0�c�Yi��y��g�̭��r *��� �E���C� 	��:X�Bx�ƹ��2i�d�O>E-O���7h
c���A7�#z�MLE��D d>�U��0�\lĔu�k���9�Ç3 x��W0�Fbw%����E��c�#"�D�薌���A��nT�u�x���'���
�tΫ����eD$�ݘ�Ը���Q<��m����qD=�� ��H���k�աA�q�FxY"C���S�?��lƫ�*�|4�Xp[q�7[v"T�3��8(2��E��=��ue�
'D_B�ߘm�<l����6��t�n����(�xd)C�Ask�#�L��C�@5�%Fz�� ��f�L��˝�����_[�DZ�2=Z� $c|��Z�˶H����YQ�N��M�l����7�ز��~}B���uó�'d	�邵FJ�Wh��nk{B��
'��Q�_��ڿ֍{�� 	ڐ"��u�a=���Y�?�h�g�r�mV����{<�E�钸��,��Hx��,sZ/��R����G�,�)v����L�=����3+�I��A��u��u�ڂ+��Ā�{�<՝�ס����ĳ����-2'�>��>�9y*x��9�S�4�5id�}�4�dܢ3v�oܫD>7��X�)Y���ԴΑ�jd����^?�϶����y����hO��F�P�Ur�����zء\ID}ڊ.��8X�O�P��+�L�2�!��6���yW68��G��]`tp�"Gg�5QPRD�[ٸ������UL�X`	��H�
�_v�'"[�TQ|bb̰��U�^��m��/�� ����S/�Y�b��pR!�-��>�Ʃa�e8r��ʧ#2��q�{�3��n��b��G<@a��fe�wj�&�9{h�3U��	�l�ub�d<|\�/=ߋsS���2�+�&b�����y@�%��'ף5i5��H��*�yI��	[	��u���D$�:V���oj� �U�G*�M�D��IfȀ�+����1(o/򦰫L����O�)����K��a
��:P��á>�Gg��P��2���UmJ�BEo�w0e.o���S�P d�\�χ�_L;k>b�T>���ؙ��i��W"���z�ڧ16��%�Mn��U�o�M�l#��B�W�X�k�H^�+��m��L7t[���� Kg�U�f�K�uQ����zjN/-������F��z.�[���o�[��L 'H��X�:a�<�m��U�*�`��Jp,��+�+;�V.��5Wpl1^d|���O?��9'���h,5
�Y��)���5�ο��Ìk�����J�����ڡC�4��,}��F���u�?@a5��p8�M-�3<f&�)̵B˩Z6��g�/��ʓs�3�q���jg֢�o��r�~.��/��Z_��}OK��a��l��o����O�S���� l������Q�$@�nm��)��&ye���B
"Fap/�Z��w��sБ�3�9�~�GVI�-.���-":F�B0��3F�]o�,C��B�xjYg�v�$�/�"	#�Lҋ��a�Ivcs6�(�|���%!p�<�ڀL�;�L�qL�o�'�&Neq��uNA���"�2e����զ�z\*��'�L�;p�vT���$5,�2�~�_�Ʉ�U��;(_� �ie*�"}�:�eW��_m`:��T��!2X[i��0#W����"ς��:Vd�	���[��d�h4Y����`��Yzk���e����|�`��Y~��Յ;������<�d&�Kk�3��~�g�Aҳ�*��܃Lgz�пv��D/������e���^���ݶ�ן�5w&�	0�@0�̧�l�ψ-� sy�}y5V �*1��x@����e,vт���մ���	͋�N��"���E��v�% .��ES�WMu�w�/�R,��p�:�����e�mS����L��Pmʣ��!D �O��i^���7+���ٵZ�iݤ^�X�̑�V!"�i_�'�� >&V�>__�Ͽ��0u�=\ȁP�u�i��$@D,0�B�f���,ȍ���"4�Bޔ|�"�����"�2$��Z1$�sŀAS��p��m������9M������ģ���!PQ�y�F1�ۂ����UD>�m<H�PB|�m��亞�c0�jpq!)�BB��b��"��Z/�nt� tQe�1z�i��b���\�N�+�eI%�v��&�� ��J�&�"�QL| �q���ҫ��a������_`���f�a��-Bes�{[�=#]�(�D�L    �j>X��0�P�oD�$�)��E6�p��^PF.sR�� ��>
�ʻ�\0&����+��%'+���)�/�gYQ\!�#�M}��`x��͔�oN8��Oէ����}4��S�Y=�ςU9��Ͼ\+�qLS���J����A�ެ���`x�7�tSGĂ���Q�;�R�!e��E�#�h�P�Mp6�v�[1�  H�g�������%� 4h��C 
 ����9�/����y	��=�2
d�d�Z�� j.~����%'3����R��Mm�t��l��,���!5�c�c�]�|��Ұ�0�Izx���B��*��OݧE�L��FZW��Q%�>MH�:������IV�I���Kq�&HJ����������d�}�l���\}����g{�]q�#�_ϴi�q�p�'s
F8D��y� ��L���F*�Ш��u�]t�G�+�+|�ٯgPK��j��%]�����eHi�:�tiW?#��e�{7pԃ?��f���0^�d���w�+<p�p�V���|�$>gi�q���5T�q��ܻ� e{��/�'�q���|0����B��z�)*�������������E�v]�i�^�Wv�1bИ�!�歌�$�0d8�B�C�5@"��Ѝ�+�ڻ��<��o��CJ�f"OcH.yN� 7ҽ�t`e�\_g1���</aB\�E�+h�9Z2ˮt*U2soa�	6WG�W���l�qd�ju�5��'r��JxK;������͛���'�Zl�����WC tk��
< +��й����^y�HW�#bm¬��?��Ts5��E
p�(�+"�ÉqO�J�^8�{ԑi3������i��0:w�"&G�;Ib�����hbbEq#M{ ^�%�B�G�J'!Frs���=��J!k2���k}�N�������e����{��~��+���"�����z�Շ�2p슸�ј��p������&e��8螇��DҒ��Md#!J˥��u��4�Gt8���$oLJ!3���}u:�@�k/
OPJ%t��x�c@�U:�_�}? �*�įG?��3���q#���68<%)%V6��|<�V�ľ�{�1�<4`ᵈ��?H*�J�F3��b�
�sDG�2�{n���0S�b3�>v	�,�=�_�Xa>8�_ zY��7�֩q�W��^x�^�Ԩ�1��X���Xc��Q�Ꞙ��F	-��E�Yi߻����m�1�P3����j�:����q��m����^��ċt=��oxZ^ �i�w,�SA��E���~K�0)}��¼�'=dcBK�V_���S�J�&��k�/6��5zܳ��H^k���Xi���M�l��[�.7�׾���L"^lD�٫��%^l�eF��*����^ԅ�d�
Z� O��ê�J��AK��EmP�u`��x=Ի�4�f��MX �U�'ė�p�p�L�H!����mO�@��I�ڕ�-7��~<�]�f����I>�aP	v�K��$��s�0}Ŕ�(hV��/�D�<$6�T5�����q8��V���/6�8�4�������%�,�f�d2�{�fo���Mo��4��Iқ"r�J���<���˾'���{K�3cokC��/��^��D=��v{�{kjEF� Mګ#! �Y0ia� ��ٵ������Y��{�Bl�����rę�p��h�����������GL�[db��B��mS�	G{����d�\m��KX�Bo]� �gj�Zn�@VQ��jb��",��ۥ&�Ø��8{���Xw���
�R�'W���	[�φ�[���ۍ��U��}ȃ�#����
Z$仇��d�`�� �;�[kqU��AP�d.fJ44�e����[{a���`ʋ[�Ͷ' -%<�&�1�ѷ�ԏ�t]���{������V_h����]LsB�(�%HA�.�4�hع�xR��ߘ'�KC��
����:O���~���b$�l_��i)�fJ�jLC"%�#'l��)7�~?�(�X�2����%LE�Q|_d��?�X�����a���~��%��L@�uu���s9�q���t7�#ͭ
��`��|���0��|Ufv��!���9�#�s~�o�QH��i�°_�����U>�GX��n<�NǶ��N{~�U4t��f�����S�Ǿ�3R�VE!}�b�Դ��G7o�O�i+��q�;3-_Ԉ�4�)�+O)=Ƚ�!f��~����+��]���
�a7�R��Jo��A$�ޙ�*=ĭ�g������{� �c<�z~[��ŬrzW�0Ѽ`�ܫn������VR�oK�v.���V *�,J�k�� a���^[cR�����+�otti-�>�4��߫?�^tz�ǧ|H�ή��>E���<@E����N�]��_�[����2����w�o�!%"X/�9n:��b5�!{�*�{�*���|L���(��x���T�(�4H`	��DB�	��{y8��������
��QH�,Z�"�h�x9Kb�9�o�0� �'��S�ؤ@��K,�:z��8�$�	�{vh�`�h����O�5
�'"4�F�أ0N��̩F��X�N�K�5��U�"S�g`�R5�M �]3\���B]��N��������Ǻ�K��ܤY��$&%�#��D��y�m���齦z�c�/b�5YtꔠyK�'aG�}��N�w�/4����:�;�BA��0����6�>�Հؗ%c2�I��U������.��;Ytw��("X��R� 1�AMљ�盜oQA�_e�6�Rl;�3y�q��j��}�q
g*�{�Ι.��Ky=����h�l�
)7��jh1����p����'���Ot�L^��o��yz��vk()�;#]V�-{�uZ��J��l�y����Z�ѻv���S���5/����E�EU�^�����6y�y�y��b8_4y�V}?���XO�`(ԇr��٬hK㕩���-�	�R%�����U��Ъ�f��zxb��S `�m+=ze��}e�J���*�$L���l"kzM�����8U��LDI�7V��6;�~c�Bږ�F�N��J�$���r[Z�ծj�s��l����JUL��u��tÅށO��h�q0C&�m������si����Fᙣe��_���6��g�o�d�Aa�C������ڭYyL�l����uǴ�o^�y�`9��kP��>���(ޝay,�GLA�Ad��rU�^��ܚ��m5����=����d�D�����Ř�|�OP!�
���H�[
�R����nX�C{6A��X�����dv�=o����#j�5<���F����8`�\=Ž��	NUӀ;\h*����~K\�9�������cՂA����d���l��w�Z1�t�q��w��"jX�D��K|j~��
/���\�	�w����b qu��胟�ٲ�a�ͤ�A.x,��7}��E�Q\�E�,�7�"_5�o��!�SC���o�dL�?��>T���7H'�$t!�X�Pr2B-��,�d��)�a�H�0�.�0�	�੢�fx��pW�z�!,��7���ξ��	 ~�l�#�q&~g��!3��Q��6�Ӄ[+�)P��{~a�
珡m����Xk����f�	�D��-��ӻanw���s�ē�l�b�����N�sy�~I�/�suDF^|L�1?"����mE�)>f�Gj*�y��Ԛ��y+��ݟ�� ���`k�C��r|�gW�7#00����K�/j 0� j���Dj���?6H�8nmd�j4lxy��'6-�%��x^�XAs��Ex'��|hߪ�����NؓP� F���5Bl�	�ʶ��zvM������~2�;V{:N4Ȕm � 7%���F�l��x��&H0v�k�7� �U�Z�i��詁S��"����F�d��:{�����1^_I-�I?���>WhGH�e`H���'�%�i,GC�"g    2p&�y��m�f6À���|���-��3Τ����&ɿ����E��UCi`0��P��w�noK|�Gg���w ��t�|dK�P��ޡ0ǡ����d��%���jR.�,�cZ9<� I#�w{'=t<���b]�r˄�@Ũ<��#M��,d��7�{�%����B�6�]_��I)�Yq.\7;\v�M��;��^�c�����7w��R9|�6�~ 	f��]]jڃ-oa�q��������`��]��t��s��)�g�p��m��KC����A��1パ��^�-ͥ}Sب�W��s��K �.����{����E��e16�C�F(��r����?yr��ۡ�9VA��Rn��Vա�IaI������y:��!�����+�Z��}���rp]dw��Vr���?7��+F��i߲nr�!�ɋq��X=�F����r,!��&>��u�x���E���({KJ.���Ԯʠ�B�KK��z۾�z�K+�:�K�-�
��b�N�X�ri�\o�A����n��(�/����-.�$ 9��������I%T(9Y}o:���6 ��?Wn7(X�R����������+�lK;Q��W�!/��u2r�DGP�^{�vR,H�J�XV�]=�De73,6+
��`3�����w��?vI���ˁekb��D9\'����v"E��ₑ��h����B����>� ׭�����ڣ��pI�?���76�A�H=R�3�\��9nt�w�Ύư�ܑ��Ӄ'�8���z,��ig����uG�&ܗ���'\���	��X�����$^˝Q�I(�8��,]��C�bk��3��h�5��!��@2#�D����]j"D�����*��ONv�mg�P��y��4�rr�ç�bd+mr�I�Ui���%��z"����$@�lvtG��)�$������x,��`�� �U�^�%��نw����5����.d�/�H7��g4@��9�>r��sv�������Ok�p�l�c4Hbi�h��� &��=[`��6Jȳh T�+�l�k[F��
̞f�-a�N+r$H=�<�v�<3��Gg�04IB�SqkO��g�Yg�n�	����b`���$Ƀ_�|̄�6�4 Uԝ�w���Ap�9Q!�>(�]��}���3�5�_�G1f`�y�J�MI�D��YY���������p`)8#}� C��5��ْ�P|Ӂ��Z]��qgJҁч��]��}�2��@}�pY�f�:����s]����X�?�c�'���H������}�z�E�/s�2p�5s��.�T�N�P��
z�mƟ��:>�k�}���Ӑ��w'��Cf4k�Ki�O�����,�i���N�{0o��sN1���Lx���j�u+<� ck3�Q� ��d��0GY1�F־��
����3��6��ȷ�t%n�����N I4e����nƼ�Aq���V5͟� �s�t�t^,7;M�ڏ�������zo���nw����k6�-��=��4p�C0b���Fr��tz&y�1�<�����ъ�t�O���@�K�臈�\��;UD7?���b���cB�]PdC�Y���%"���wRy���Ce�5�Wςۥ~��d��S֮dqЮ�b�u%���z����E��5 �*t��� HL�t� �Y
4n��L��bӃ;c"]�H����*����Y&\�ur(ߌvTA��N̽����_sc=�nM�G12��|8�F}P�%�cc�p��^��CӚ�c�K����JH�T�}��잻��TZ?���`�@Y��3M�p�8Gzeiz��$.$�4�1���:�[���E�g^u��V�=dGl���Gm�@4��v�Ͽ���p�s���	��a�;�W��ܥً�2��R�?Y�/sW~m��R7TJl��m�Vm/0sJX:M�U��x�B�4�Ez�r���l�+��L&�}�=��Wq~�
����7��ɇa_�!1w�����"`JH̭~�<
t����^u�@�L�S��S#5ܖ�q�/���
�z�ֹ���\(��-�7�h�J+����%����F=3���lmL��H���^)��~Ŕ�5&����Xn,F���O��_�%�Om.fUe���'|�2�ٴ&-��.эzٍ���#	j�cOu���ы(`�j紀�H�.��V����U:�	,�qc�8x[��M?�ť��T5��ː�+sO�HK��Q�T
�������>Z��o�d9�x��|4��S�GR-�{�wH]�"!
@���D�?2\P��8����Gg�������N[5�܀I(v���w2g'�;8��h��_��4��n(�Ԧ	�,䖥�f7�РإI2*��x��c7wf�{�%t�tH��L}��>�𬾗`���4�K��T���~�c��5�����6<��f�-ə��e0c i��\�z��^g3�7{�JI��dN>P/���ړVG�	���>��u��k�4�IW�c���ieKL��l�)�0て����B����5��d��á�J�����Ri*V�=��S`�xo8N��;�����s0��M���|�NG���7�*ۄ�f�ܟ��0|6	5$͒)��V�J������_!�Ҭ_��f���f�M��6�?�\5��L�?:�p��U�3G4��)$�2�
��Y��]���!��AR-�����v��Y�C���n[����jwz1Wė���{X�.u���3Ǝ|��!r�"ϖ0��;����:�`e>�loa�Is�:��{�wD ���Ii���)�̗b�~�pɐ�v�ˣ��M���>�b�G����b������o1"P7�����X�6���䝺k�x���zL+����5�K:R/�5����	'�f�n�S��*!�����z(x�RT*�U?����z�-4�J���Z���,��wȍ���c�J�#��L��_F���=0{i�[a*�Վq�f;�i�c�}rFg6�zϯ��ǯ�FCF."|�����$������?�/���K]'O<]���b̡�#�"s��vh{�ڬ�&������o'?�+�cfO	#�R���4�$���� c���Y�~�g�b��E$ܲz�C�[,<_��+�����)0�a.�Mk
�s�
^=�6\?�ͩ�|����3���
��D�(�u��î���,�@��kyS�����]�x5H�܅�������O�A����[$P�
�QcxO���?���:�HP�6���'���o�1��H<:
囧|����O�������.Yd�
s���e�X]�|��w�g�0��3�;m0lx�ཹ\�ۣ���i7�Cy�����mm^Ξ�C|Hc|���~�����)�G @6�e��� !�^$R��+���2�+���Ć�Dq��a�(Pw]��ɘ_��US�\iA�=D�^�N��ƿ_�}u�C�Ȭ��/�LNH� 2[e.\v
lr���m�L ���Z�\b��.r�����vuxг�ڹ��"h�}"���+a�(�⫟�w��?p��+��/D�E����M��.�O��X���z|r\E	����dyq�R%��e�7Kլ�,��9��jP���%I�>��I�튀��UC��.�":S��Ȟa�r��TGϤ�m?��ho�]�����{P0&��˰k?��0�>s��n�~@�w��q`=�%c7Kw_ӳ����$��D�*�rd���d�NN-">75+w3��@��Ws�e1w�E�b5�~���,��0��.����4[�#�'�w�_,��E��oU��� ���_�6+��I��"ӿ�#ۃ�T�ԉu��z��X_M�� 5���᧒��/����h���ne���Tx5��jB(�������1B�c����1�[�*dn�#�'W�,3[���ua)��,�����wC�0@"4�i8g*@cz2���p<;��q>"�"��Q�_N{f�h4v����݄F����V埀������,ǛiC;m=YP��e�    R�q�7�h\�����q�x���������Ms�	�t�|d�٩����?`��#��ϙy��(� X~R �KQ���f�!���M�4�n>�(��/�Y�Dު�^֠g��K�To��3�x��)8�"қn��1x�\���mECk�D���� W��p����\2��ݧ�a��i5�+0k��fa��䗑ź /���W'+��V8v���#�쮙��]x[-���kt���XbT�&��7�J��#��=��Jܲ29�ͤ�p��yhn�{�6���~�1L����[7g�N���^E�T��gW�$8g6�Mٍ����y�����\��o;j�R����ug�3�Db�F�w>8��t��.4s@dP���Bm����?��m�����#��gʈ��� cU���k<�,����K���{�J:�9�@��;�+<�R�E��_�!Q��,�ϱ$Tͷ�"�e yp�z��ؤ�
�N��b���Tq���ږW��6+�Z��i�|��Sl����9�$�_1f�G��+
�y�c�7#|0���(�m��Y��vG�?�dc`%��"��1뼋�{"&�a->�3&�������UAk�{l�PC.��?�)�c���=ڎ��y��*�za���v�_8h1F��:��b���z��i�w�;�zm�mpٵ!00��pH��l�;��|�9~�7�'�_�O��
D-}�o��wQE�d��^M���rM2ܵ. &��L��b�Wv� ���:�z _�IwH�$��f�e4%�,�~_=�=�ốo�ɺ3b��M�p������.\>��c�h���t��|�CG��WF=|DB��c��b�I'k���&/�s�nP
�D�7��%99]�c��g�:���m(�襀5�T6F����<�9�6���a���Gp3�5��?�Vr�88�&it�{]$���s4����_���r�e�'���I!2/opp�ݜ���;�_Not��A�ɓ�����"dV��=��ރ%c���@���G�6n:9Ҍ�j����/�����d��ki./N���KM��S���lq}��lF,&��!�i>o��M�DD�HSz�lO��v�l����j�RT�4'����{0irY��ۣ!-5�]���w��-���+���Ew���gi�qk�1�[�e�Kcp��

C�a[�e��oy�R���*"�4)$�&n˳��D���x��%GPV���^�#�}�6c�Z�,�a��c�x����z ���uj
	 �'�\�㴾ЎI��<��Kʜ%0m�yt�$$�+�N�_s�v,c;4~�d�mO�|�'���_�*����Pm� �������/������M�#����b�G^�k����yǴoy��c:�ն��aW����_�ؿs}�?���i.S��|@7El����6��t�3,	���E;&��E6�Y����o�m�"��ܻs���12�bVk���.��jk�|�w}QA<{Ŋ�G������A�4L�����c� ڃ�6
F��g(/����ً����%g�(��X%/�y<������ N�$��1n�ػ}
zk�?�i�V�IȲ�1��t�6vX�s9S�"��Ч+�������!�;b���"U�qX��^�v��c�t�����ãi������&�KO.U��О����c�כ�z�w�x���s�g=�7����SC>�ɸ���-9^h��|��1���klD��.��SY �8�	e/J�8Gy������I�c��&[�ҺM�b�M��C�:��<����^�ʄ0�jo��e$@B���C�s:!�H�C%��9RH������&�_��C��� ��ft|�x]*F-h�N��T�����5X���HsV���(�<�^���2�0m��;�.\rrg�,�8��u����ވ�j`	�d5�t�"2��/�R����I�bo(�L�o�>�^���{��bJ֛�ww�bī���}�������E�E*�M4���' �q���f�n#\b��$K�	0�<P
���N5E��f�����Ù��7�}���yK��]��
��u{l?t=@T�>�Ms��~+��S����k?�P�P?׏�8�1��a����ΓZ$��o�������8��Ո�������˧}� ���a��f�� ���3'7TY��&�̟3h��ZY�3+�$��n@e�b���T_�zKqG�\�N����(G��������^"Q��c�~����NݟS`��v���sy8غG��_q��'�i.���o����C�E�8��*���}�ǐ3+ P�D�Y���s}<aut��O �͕'V�^r�|�,�f-��|��}�Պ��Ll-�l�ln��h@0���t�Z:ж~��z��	0�)���p#�(t�;������J��Im��Ꮩ�깉u2�:�Jrm-��� X�mf~=��# ����I+ǈj�L��f�
/mݶe��Hk	3}�,�9g7ޓ���\�(�,�7 �,�aX���z���g$$��l�o��5LC��U��ԴLp�_������Z�{�; k!K�68_��"�������O��M�lSn�g�G
+1�Ll?�3�o�MWl�a�y�܃��W�Y�,g�t�A�����"_��f��m�9�C9hFVӜo[�յD>�P�k]=`I1����@� H�;�~��іr���`��Rw�gL~�졦c�nH����=�-0�r�VQ�3v�!�����Mi$�(����\������9k�j,�8��u}���"���S��ڐ&$D8e>X�!� �ɶ���.�_[2Z3��ϦY��zEů�>��%C'�:z�j
62���_�lNG�%�3����I��G�̙���"F ��Sp4s-m��|�<��k ���������^3��O�cN�����L+���v�m;8�1٧����R����/5	cz�pS�o�j�08�ةT��a0�ӱ�h�	�O�ӌ���^&c�o�,|S�jW*��݃9�isʨ����:En*����ag�W*[�����ߊ�O��-*��sݖ��X��=���c���ڝ�Lj���r�v���gCw�g�G���d���(��F�YF�Ty�� �u�����dW���(�U�0CS�3�ʩ�*@
p"�fFe��D���r�i�����E�O�JR��@�����LFմp�5�?��Õ�7E,d�����"�Y8���
]n�+���S�u�U�Mg0N���*VS�d����K*?H*��u��ᆇ�z��?#\�1ho�D�_�v{�P}�����l�L�EW�HbC	�,l�d.��w���Cx�[[X닗'x���_�o�]e�t/��E`#6�������b 3r�<���n�C��(A�l� 7���F��]n�ՓY�v���������'�oqy�p��M�G�L��"���a��!_����/���~ƫ�٩8R	���O�]�68��&Z�7�S4Y��F��s;VDgȠ3�M�'m$�	s�OLFF��	����a?(���u�<@� SO���P�$|$E��^ �J�?��C�c�.� mI:E�Y���x5� �pr�dw��Χ�N|2�Wf��@P�������d"�o0�h�gb{�oq=@`�eF{��	�7�q����^&E�b��zV��v��U���+�Sdocr{�r7o��GD'�����J�혏^���pr1�L�g�p*|�f��mK����e*}���N]Oaz��yk�d${;8<^@R�5c#����k����ۗ���׃���!�����g�qM8��Z�D��w��,����=��n�#�Q�WLa#��\"]�s��L_���~c��D��h����oEh�,��bm�(�ZGfs�̅��*�]]9E$�S�\B�XR�<R�.�jpQ�^V3,�Y��� �.@��+���l���;�)`�(q7���fj���ؒ��A�z�g��A�Q�_��������u=�N�Q��oZ��    �i ��Vl1��~�v�ii��k�$�����f��u\,�G�AP'��ZQ�S<w���1.�p c�Ez�f�ȓY�C� +�C̥�߻�I	��}_�i�D��:�,�("k֭'g%�g[�p����o*���!�ZF���z	x̟("��H��`x16�YA9ʧ�7 �#&[ۻgWL�ç@��&f�Ӯ�>�?�jB�*xPƦ�0�daA�0�(Ռ�. up
�2�!�59����'g1�e�&$/��3A!�R���H�ڱ�ו��wy)gSx_z2Z��Ŵ��(8z
z_Tn_RmVc��Ń��RM��m�$
O�R�s(+����R��W��rdC�j.��`��	���|'S1�J�8�ˤ j�6�n�[��ּ1
�K�g�@�m��O��W���	���h�1m���]*�?�s1>�Z���2G���Is`0��.$r�d�Y,$�n;K���p�:�/b�2_�e�@k�7{���M,�"�i�k;�bϦ�w�B-L�,�=zv�穈�Sh!X�"�;x�v�ϻ���Xe:�?ȿ<�t�Lޘ�Qb�����W_�h�	2�[Qk����Gv��"����t�m	�y�b�滸���S�3�nϿ����+��H�b���<bi�_�E,#�&�c�73�
&3φ��S�W�c�U.i]�|Ckd�࠱[� wܢ�&]���7��Wd]r{���Im`U6��7b{��K1|��O�F��r����H��(�B-R�bdM�8��F�F�2�y�l�_�҄;�PI�5��1�G��`O�^O�ԛt���q��N��Ԑ���,���o��W0� Nh��c[�?�ws���#���8{�=��z�L�����2!��J7�[4�Am�Y��}u���3�nך�q�ձ�(BF��g{�;,�yH���4�������H�.�*�h`��47���_f7s9)�.�¢R1St���L�ㄶ�����iK%��F͡���䙖}HvB�f�z?X��K�P�6�/�#0��"�^2%ǵ͈W�ܦL����A��{ �|�2^����2#��
��XƱ�0�/�.��F�<	���f�k��ޣ�⎯�q�ϐoM���*%?�	�0����[�J�+ ��Pq.����d@����rW!c�
�u�a;>Ɍl)���;�͹�^|᷵�n���ͣ��}�}+�=p��XŎ�.T�v� �q�]X�B�F���Wnh��c
�ʞ��n��$)�W�]�V�#��`�C���і�ኾ�	T���:vq��I.�y���̤r��������h��gf�(d���m�|�#��8;*p��x�}�6���b��4ku��4Z�����U$8;̄H�Pz1����R}u���B�K������p�s{tH����xų��c�ְ�w~??p	�W�Xwt7s׬9R��'jGdޭ��R��z�ԺMݏ��e3�% [dd�ό?J۷aa��SY�C�4��b�m��];;�-/���0*�$7����NZ���;�����Y��w�j��ff�f��G�(�-_���;J������z����īw��?��
$��4,~���(Y�_�uk\A[� �:8�p���4 �C�� �,��'�<R��9��-�UJ�J�.��ۚ�����5���l(���e�̿7G�ԝ,�Z��A���%�M�ܛ��l<�Q��m�q��bp@X�ڬ٢�Pue�.t���pL��}(����x��{�"J���1K��p��JP7h��Uy�1*�Iׯ[�2���Mt�&���W�#�ԨШG�8t�;��BZ��ױa����`���x<����+kը�s	Y򘴢�J��  ;�G���/�09z�bj����0%zt]�v*^dt���/�;V���U�����߇0��q��e��<�ɭ�q=��1���(�m� ��󦗵�����W��=�p��$��LF���k�[����4vL�6 L&N��$y>a�	�(A�
?`ο��+�
������06�x�V><��K2k6u���K�����v��c
��U3<Ǻ��Տ�@�)����z1�l������dCʫb��{n����p(���k�W�P������x{`!e$ݡ�A�/�t2����w��9���D�G"c/�۱~����G&#j�i�gd��/���W�I�w}P�3��3�t��I�����x�A�/��w�Ӝ���<�u<��wW���K7+��m�w���]A�+��|B���"MY�pH�2��p�i6N<��M6l>b��|�@m��;ú�H�"�,_�1e���-�E������E�޼�]5�Yz�K�;�
]d��;��ŹȒNH�������?����������Ȳ��X��l��G�j����AaƽT�1������M�1�S�;p0g��z�',��i��!��,�Q��d:���Ί�#Zl�Ӏɂ�\�^���2�Tx�q��sE�	����x�?u��D��9��������Z�H@P�tJ[fG��.d&���}0��Xi���?��#�|�yH2��$������y"���9a$qr���~���s� ����9�X���k�s� �GD�o"<�H�b&��\����]�K$!<"�Ax.������s	�#&�7�s]�h*�Qv����d����^B��k2x� dPLd�ռ���v�+��r�������q�� ����N/���B��7F������+d����L���y�Y�"c7����;�@)�#��y�zD�WM�upp}6�ڥU6��Q:9<����7�������q�������@�Ym��Q1
�N*�g��)�ޟz��� `$L�fT}<h�W\�U��=jx�c�Tfn�3��g����A���ؘY�O[;���h�I�a>��T	6���k�������r��L�D4�+��M���T䜿Ŝ(kN"�s��p��;��U�/�W��a���ZA��<��ц�~$f�HVOͩu�	�WG�ߊ"��{1q�����_,X7�(�b�!�����ZkG�P��lט~�� x]������/����ĐH`�~q��z+1��|.�#�&��B����wt[o�e.It|_�`/�:	vOR�t�tB�/�E*�,�M �p��%��8�O`���c��C�b-
	,���lq\#!���e)�#�T_1cz}�%yQ��d���gv�ԛ����.���WH�Jq��xR�����7�U\��C��5����d�@� 2���^o�$��*¶c,�]Yo��|-����,�1.�1j�;������cd\�Ԗ]¶5@�nL�p>��MV�1�$�\��ڄIVH�E�8|jx;�7�5AZ�c�]�����>�]���v����16=Ik�}�ƀ�iO���)&;	��ڄ�����a6ЉՈ�0���8U�ڸ�iL��.�t��LwX����DO�,~0�t���>���z�~�A�\Y�T�&4T>�}��B�i0�wIB�|�Y̲�o�	���(��T,m8~n�s+p����S9o�λ+��T�b�ĥ�f_�i1�kv�_D�~����ː�y@�$��o�Ù�Z5oX\�ׂCG`��<"t��C��.�����逋����t~;��+�suZ'lܦ7v!����Wj��d�{|�{Ǭc��p�+�^]J��b�:SW�f 9�b�y�.�
6N���Π�+3�/��lͯȃu�`�X�'י:� 0W��XV�W�aȃ���YPp·��#�@Ųt��83�(�!a!:`Խ!�04��801����v&�BDCa}Z��'��9��t0~_�;_�LM�)�y�z!Ȏ�L�3����~	��,e����9;�qj�@,_��H�y�g���_�`��M4.�:�$��3� ?��y��|m�% �?�uu����q�����az�D C^�0�#~'����&º�ZD��s�"�#7�b�h�K���<���>��/z��l�����\��	�v��`!c��gB̟n�jk�    _��xF 	|�b9��$X-�b/1�p�����C�H�.m8�������m����Ec�wo�6�Q,��y��2���c��z����T�U�
^�҈O}.��&�~�i4��Z���0�7f�ڏ��i4n�e�D'�v�+n�Z�@�` JH�� �4� ��
ۂ(DBS�'��qz�U�#E��wtA27���ܲ>�W�_�k��
��RfG��Z��;�]�B6?xuNbz��Nb�DkΡ��ܧ*<�׷$��m�pu7�}�*[���];�+��.RfKj�zAލC��7j�E����mo�S�����������sP�s.��m��͔gT!��ƃE5��B��8ɂ�[4���̚��P�5]A?.#Ň�n/��S1$�J
� �z3x��c;eG��Y���@����v��}8��6���6J��k��\�^�Eh6�}�+A�$��$�1�K c#=��HӜ�gieD��I:J->�n4F�.����J%��wR2�؜�})9CY���:��hk�[d�*W����H�$��m��a�V�..�[������r>����W}�:<^��iݜ�����Eb\	�- {I�炿G}k�� ԇ�_�Fy��ya�X
	��x���0�}CtA��޹\�|A��m%)hO%������dhgA���Pt�%9�ZXw�ka�%,,��nY��4����sG��f���,,�E�n�&X��}�.�|,�Ħ�6�c�'C�fu�ҏ��~��*�ե�b�&�&Rw.�4�7��q]��z/ɫ�1�zL��~t�X��~?SV_�՗nn�{ÚK��ZE�m�N\J�O2�/M�;����b}��mTݲL�,�[�Sl1�X���ֿ����x� vu	fX��Z5R�s�eX}���2R�m�eXw���q���gEf�Ը�rt�eXk�¹q��,�*������+�����K}[X$I��Ǎ���Ȱ<�+[VF6���vA��3Q��x�:ȱ�����w���f��M�sH}6��EW�=���3���`T�sp<�I�q.�v��g��A�sHt>��Ş,rA�g�ٓq�C~���6���{��`�ߐ{���X�u��wΈ�)�b�/l�3ⷉ��؋�m��W���2���D������M|YX&�!�������;�=]XF�H,�&3�nY	,+q�2a#XUB��QU�f�u��=��Yz�ݮ=<��&48���$��?��'��p碔X�r�;-޶R%V�L~����_��+���f��ZbU�ҿ�؅�.��Q<�7�y� �P����® �+�`���r[��V!c�ǎi�E+^5�B3.�ˮ�{�X�^�6n�׫���~�6רܹ'(�	*�F��u���Uz��{ֶ��V�o���_����w_\�
�T�k$oX�
�P�wtna�)��RW	����Ԣ�;���QX5�n �w�����Pln���LҦ��"�����*����ft��K �?��	U��f�%�����i��k�f����R�F *�g쪦��'����/�E<7] �m�V��w��=���gV�re�@���J9Pĺ
�(����SNѲ��&N8�(��q���'���-F�����[P�Q��[�C�*4?�Pz��Dm��9����ԛ%" ��!&�*?����	:���o�¢��%B��U�"jT{�K�n��N������̑Q�f-V�Q��FG�rm�8�?���������6J���:+������b�+Qk��C]�����j�}:�f}���c��⯾� ����%��lVZ�٠LJ�'�{�Q���� �����W�_S��1]��c�:� O�ʜF�Jo�����i�/���F��✔�>A{t!ĢB�&��ё��_�'dtx1�p�y>��ɀo ���{�>�'��'��v����8ԇک�$��l�L�.��GX��^n!���v����ip��d(��ވhk��&f0!�I�t�~Aec�K�iH�!�i����? �&��}���$���m��$,�~��;�(�Y'�z7�w�U�$��w��Y��L�w���]�r�ҕ�ʑ��w�!ԕX/�4��!E5�Ɖ$Mc��N�E`YWP��RK�{Hݩ�%��'i�������6�ͮ���|I�2��!b����d��������B�Ru+��k�������}İ�&�r3�=w-��̷O��,��5Ӷ��&���2�)�[�|-�	���,���>d�u��XYd�B� ��g�:� i�ܴ0!�z\�w�%��9)8'�Ck��ma���KZ �c�
��W~N��2&-��-�~��/�G�n�f3��v`>~#t�x�*�c�ݐ��tʎ��Y��]���g�KM�C�<�;�﹯O��4f8�w�76j�~��q��=G6���j�B�/K.82��1�B�!g>�x�����;���`�Ho�ҝ�u
g�D@�p��JU�-d[���ѝ��_�qp��wl��5�X`���(qو���u���T�\���ο���?�"�� %"���]]"���<��S�長(�]����ܕ��ЯHʄTtL�{bƘn�t�5������.�.���;e{��L�E���������]��S��� e�%�vD�-����.���L���.�<�7�,YޚyT�b�<�	�xh�h��*�m& ����T7u�������#��R�2%����;B��|-	w��{7-��ah��8��gr>�����������ʾ��{O��x|��_���]�PrT16��u��o�6JOh��Rl�����,��M��׮�0g5ne��������k�4�N�-�(Xy��h�/y�Ɠ�+no�&�p!��I4\���dT
yc'SCe!� i��h����/�6&g�����C�zo���!�I�Q�B�ps�Pѐ(�M��J����N'UQ��^q/	�e������/q�8>O-�P��I3Q�+wLq��qS�Ӻ�ASw�\M��XQ��Kq�1V����z0uyL����#�X�Ӏ3�b�I�m�/)���K=��a	L7�{�[�m/>��O}��'���c��"+8����%g���
�A�K7j�\l�BEK7���;	���.4]j�g1�����'�W��챷x܄*M��R�yw��iރÌĲ Ŗ��4X�̗���<\%�$��,�}KL�����>l�6���~'=2#:�c軻xrbZT}r��[Ʊ��zfP���-pd��A�J���
����z��@~����fD�F����w4�(�É��%C�x�s�E4��Z�#����F=�	����&��S/�9�b�!e�j��Q7M�4iմ����� ~���<�����h�ˡ���fR&��9�G�U���i�ƞ(��lmu>�#",94�4[����!L�?!ؔI$ y�nb�{��2��st�R�N�#l��RmF`��R����|3�y�	<��`���7����:��H��E�R�*����[��
��nN4�4#b�g-�OX��_��C�R"Ǻ���`:kՑ�~��q�J+�z$��>����o0?��9rz�N O�0_$Lp�˃V|�y+��rXOR��z=��ѡzD2G�O��-��Ľ͒㸮.:�~
�#j�m�P��J[�R/�rIv���q��ְ=8Q��w��'�������qV􊨴�@A �X���4�S�Z]@@ˢ��[����+M�E/eS^�kkW8\	˧���:�l�p纼�
���LD����lA	z®֝(Q5�Y=�iU����n};S7WW�����7�6 @�h��Q�D�ܻwc��ٝJ
�pE���\� �L۫~��z�{�)}��֗%m�~��)�mG\�
S)�>�nҖߤ�Sw���t?��Jjh��6�==ϗ{�zh�h;9�&Ӂc|�h�Flr}Y.��� �#m�a�֖�6�{G��
����w��Vz��-���!/T���*6P�����͈@;����5ȧ,\:&��nw�'q3�h��iW���o���'��`�R�    O�X�<E�T%(��,�L����K	:��-�grq��\y�F�*���u�r�ɒ��=�I�EQ�q9<�+Ǡ��E��K��Tݸv�:܌e��{�V�:\ߙ�]o�כ��h"(wY�KQ]9I����y�S��Y�qU��AB
��#�KE�7WI�V�!Pa���e�9�cW��&A�������G#�sE��,\��+��$~r]E�����!�?�\,�T�"4Vc^����#��s��^�ZNװ����X^Lӵ�s`{�iFb���֗�1�P�E�F8ЧHVn``��*�ų��J�ʦ�\�@m�*|J���T�Ca8�C�Ы����;Lы�0���Y<*�d���q�κP�Q�i��C�fJh�=�VX��s�	��X_����-��#���4�σ�S�Lt	D�òg�4�o�p���S���T��*�U��[{	�ꓝ�cFqn>�� �0�i��i�"���kF#�T��e�G�`��ga\ |^J���G	�ԼJpi1=�s"��s��0{K�;M�ۧ�<gN�s �����SH�U-@��IT鴥pd�=!M�uW��)��b�cI����F�Zǭ'n;8v�4a�WN�����G�M��?K{I�xt�&�%�bcb��|sb^P��A�L�r	K��?F��*�Nl{��N�6��۽���#K�8���v	�3M�)OB5���=D��� �i6|��������D*ͣ;� �gj*h֦<��L��7Y]4��)n��f���Q5�ßhښc�S��K��~n�+�����9�����yw�<5}�SHG�<C�gU.`�����~�����f�Ϟ�df,�D��N3�,A�AGM(�{מ��VٴW�B�� J�ٶV�9�?���F�9�(�A�@H	_���>��eBY��V�j-I*��&7���J�6<��f��*����,n �/Ȩ��e���S.l�#��T���>2YY> �ii���'�ս8��=�����a�p���"���r�z�As�߁f� ����]g����Γy
NK���<�7˓w7�{r˳q��0#�̤�9�x������ce%�|`�Tn��,$��&�а��SG�l$Xj3��#��?0�OnP�@J�{7�8��+����1 
<���e�K)'W�6�FnZW�}�Sh���'�VlW^�1N��ƤzE����N:}�l0�ȈFYd�� ��E�i��Q�����#k��n��QAG-�[���s^�*̐���w4��K�dE��0K�ku�6,� �c�U����B��������e����\
���/?�>�{БO��1��veՀ"�kA�{:�	6n7>�	:���i���t�|�YY���RB���� {eM��o��'R�p��!�dP��QĲ��A��q� ��C���H�u]+wy:-�/1��"���Y�{ �_���;�Aʯ���/��m�C����@^N�di���5��x��V9���w� �����j��"�țE������g%��*-Z&LoB�ޥ d��E4�g���|�8"/�~�}@��4^@�q��/Pb���R��4���U\S����Y#��hqn��A
.�V,Ԫ�x�ըS�_���x�(�(A���R	�8$&W���D�"j��T^n�� ��{'��}\�!��q������ϴN�Z��������uwX � u� �A| �R�U�*06f��)v�seɜ�P�Z?�y��#�qMm�XLb���$#�.K�#A��v%�'K�p�BM�&Qy�u ���\�4�p���NW���JY��Ϸ�����0�%��L�2s]��Ŗb�Q��B�N<n�gJK�T��b�}ԝ�m�i�m��"�y� ,Q@EI	�DA�'( )[$��D��O�{���O3ߛj?B�-K/�f�!���a
��~�,�i<�0��ޫ�٪?����u%�rZͩ�`����kW�5�A���8T��g�f���ҁ� eki�K��֢�����E�A�IHL��ȲlD��}�z���,*���QuRO�I5el7��ׇ�s������c�Y���ە[yD{/�g&z�r���zhCd-�6.B)I���#U|E�����|w��g̜��1)��4j<J�x4b�g�.�0�~g�Q)�z�Aր*�R�'m,�i�������}�ᄁ�`˞�g2G3��n'��e�C�0óݶi;�Ϳ�@@��K�R8��s�ۦw	��P���'��y_�(J�K��)d寅v�S|%�'�Y�&#F�(�Eh@���/��q�����[�����m�$2]g�\�CA��Ä�l&f��`{��Y�J���  y`�wWi�s�x�I`��	����,��b�I��Ǿ��	H�F^��j��w�#H�ێ4�ZE j,��Z��|�g�������`�J+��ݸ[�} Ehc�'G.�귕����)v���gt�.g�b���29�C�^��]5NN�� ��o��Y���*�=�t��b�cBl*���[���	��/�)@w��ै��C�����$!$�lG�W��{���J"����޴PB��!HpMd�܄��l��Z�)h@Ga��cT1��׺~04�qxK5��Z3����I��l���[}�9����?�2�*{䢜��ա6���-�+��-L��_�<�^8���ƣ�E���H�qt�yT�]��u5�b��V�ip����z���NfEx �1*?�E�lՅ�% y(��C����l��$���W�e<+�[/�`E�%�ʙ@�T� KE�5w�M�S>[�Wٿ���+�}E`��(��b�j��oA�Mr"w��<�}k��|��B��t/��[�rl�#�5/s���ߢz��ͅ�%�fB�M�~�G#�Fi`Xӽ��j���B��X�\s����'�|�kG�C�I>i�i��ƉU.,Z�-d{ ���*�1�b�JJ�w0�ȷ�CuU�m�h����`4:P.���+E���}��8d���qd�^8'JT5��<�c
�F��h�����C��)�S36�U��!��)�e�oN�'��U潝�;���w�X^���������l���ڼ--��bq�$V)�-.oZ*��b�o�v���g�ϔbk����Z7p�x[@3�!P��_z�;Rk�d��l�V�^�_�����y|��M,�$�x�r�0�k��j���z�F�����!�%�F�[�	K�������k\���%�R!��-����7�5�5X��M��:K�_����X�>��9������k���;�K�J���eU���TJ�5t[�
SѼ[�\������a�_c	�1,�����,�=�߸�����#�7�k(K?��a��T��/�
�'c���K'����~$��￲���2�$�-E?ˊ`x�����p��l��xKW!�qc��o\�x��X��=m� ��e��'��X��}�/r��-���,RP1o�r⽖MS���v�Ɋ�̽77P�U���Q ­	�Ԍ��Ú�����/�00�n����a�,�� gy�L'!��M�r����.��g"�]2��x��m���Wy����أ�kȾ�O��Y�nӒ|�Ϡ$`��b���]��0��n��Cx��;X�DM��^�N%�wB��	�%X��-A[p�B~J(�D���ݻ���������ps�858��2~(
�"Sd��K����G̿�W(�!����E:�o�`G�|�2�t�e��n�~�$@s�)E�9a�W�_q�DZ�cW8>�*`��(	���CkՓ7�=��ޏ��8���ӷ�7tu!U@~s7P!"Ϩn���ޠ^�%���j�z��lI�F���c�@~�pEb���+�F�;�]�\�;X�v#=<����{߹�B�����[�26�0����9]H��M�;���d�/w=j�+�Sh�78�EO�͊����^�2w�Y}X�x�?�y    t�1��r�m��+��)�_in���U�\w�D�������]WH�8C�Ƃ�Qۡ�S0�BV�4A�>�줇E/�_tRفZ*v���t��38�r\��u#%'�*]��_�(�IicD�{?h���7i������ؖ�J�,G�n�=�2��~��"��Wz]��m��M������
�j���tFt�ɨ�s�?�!��A����VX^��5[z ��x?l�	hn�[��]4+�����0O�B��-����tl�CĤxm��q��"�?"Pt (���\#��u��P��1��E�N��s�J����^tII,��1��[ثBӯ�H ) Lt���34*���B̪�.8��d�l�M���$Y��@2�4�K��ݬ����'@�$�����`f�M�3y��bH>$X��)���� _�|0z�9[��GE��.�1e7��\$"t��%�0�BL&��������ʨ���)�Ɓ��-�s��յ�k�0c�"�&k���&|�4]��ĝ����V���P�)Z�O�����TB(!F)����Uj}���\P�@ ���n��<�f<mưw�Ɍ���]唶饫��C}-���}`9�(�򮞑�M���
�&9��h���!��i�[���v���y�D�E�0[��Ǚ��t�A�?��š���������y��O�ߎ�,��"��8������v�HpӐg9^`7��^�"���F��ĺ����Ϡ�@=�M��Ԛ�`G��n���]�[�dz<�w���BS�_a}b5_ʛ�/#q���[�z2�*,1i�0A�Y<�z�[�y=?��͒ѡ���<�g����ċ#��ހ�t�|�>�L(����b��9���\*m���$��=~ܞƊ�d��XDHF�063���&d�W6q~�F�z}�T�3-�:�9���|Q1Ft�7g�x�����k޸�>����)!���h��?T
?V/Tٽ|�7�v@�J�(R�2�jZ��#�<�'��l��N�K�a�A�-eȾw�.��> ��؊p|����鋼���覊+Э���b6�0
�+����#�������Gcu�NT���Os���\�t6ɝ��c��~��F�w"̝p��������W����>{4�TyQ �����(n�_U�/�H�͏+����ky������~_��a��V_���#	���ݫ��??�c*��|U�
>%/7K+QQ,�'�M�m+Z�R#����a��ݏR��=&�ﲩĉQ��JJ\�_%
�u�OI�3D�i0�rA�p�Je�r�l�Q��\�t�MȔC��a�[;�
���P�T�bG|�%N^3���l�AU��NG9����x~y�ۼ���� ��S���<��yUD�i�.r�*M�8�F����5�� dO��do��tP bN��ĺV���'$�`Z1'�#j��ax�Q�n����g_I�ɖ�b�y1'�s=�¤QWu�BR-@1� f^�RМTS&��
�m7�k��[#��c���~�s�g��o#����+T�ĩ�V?�cUs�jn�tpa��3�Η#q���[D��t������^ �x,�sk�X!��ġ��[^lޣۖjp����4P}�/×��s�J��Z'�ի�w��P�f�S�A-�ͭ���crz��cq��kj�h(��-���ܪd��<|-U����as����ݡ��'J���_T}���D6�y��RER��o��38��sB��.x��!�����zK�������FU� ��� ` ώ�eN��Ә5`�+��9d���Q!�aa��j�;gCk{����9���4�S��@Y��B�=T���`q���9!w:p��x%�:��xN�tN�^U��2,�xN�d%�-v����w��(<���ܒtP6f�P]��Ash?�P�x'��u�>Z�o(˗���ɆQ���]<�`��e_�����c.d2��Ԃ�����;uK�$�K�D�}���*����&NR�z̓��d�)�-��Ǭ��ٿh� k2�p꾭/����n�>KHÂK�V��10������@F��Jk)��ϓ9�֥���k��aM$sb8����Z%�����mI�Z��.!�ɜ�N �=
@��tN�hUH��BEI�Õ��>�#��s�6'�����0��*��?|�V��r��P�S��i'�L��@5O���65�^�/H=�R`.n�줉��Gh��yS����􌠄�b[�x����<�p��t|�,U�K��倷ܵA��xC�g�
%��Q�m�_��iu���А��:�����~�2H�;B��?��ŀ%��s۩@�,�-]��(��7�:��@��<�@.y��>~�o�GՌy�nB>�D%�y��"?����dgl�͌���u�m�q�D�<�LtZ�-ьh�#��l��/%I��Ԑ�(�8&6+��u��P�A��A�3Y�,Pw�>�\��lqi�3�1P@8��or�4�S"��J6\�f���8/���T�o���e�Ѩ���Im��dSj�Tf�3��d���S����}�(�d]0/[<�VV2��t4b"�N2)X!�H�
�����󭥌����o1�tS��	�U9)G�a,u�N� ')�a�	2��`z'_��Y�
	"\d&�ɳ����J�=M�R`���H�JK���b�� R�6U�x�-Fh[S�b�����2�$ 	�?���aSV����i��.>�B[s)6.R�D;/�B{������`��8�ǳy��r6B��ې�Q5U�}
X�<�c�f�ڈ�ɥ�>qs�/{y|?/�X��w��&����D؝Dv���o9!��B�&��r|�F���۸=j:dbEt*���k}�e��~�S�?wl6��
˦��p��ݱ���v��.�?�4�!�(����p�c���D(Ϝ��B3���*5�'w�XvC���~�0H� ��:I�[p�D��9#�����'�Nչj�t
�awU��v�_@Dlj(3逍���StR��%�?��M�s�d`d�+��;��^ y�<N�2���=}b�bȼH6a���rɼH?�w�����p�kN`�$q݂�s��v`!Z����DR�f^�� ����TΙ��vulc�
�v��� ����բ��;D췭��{J ��6�_������m���d?��o[O�;�p����p�d.���������E��`����O�mUMv;3z+^�Q �6l��:v*�8�[/[a1���&�bۊ9ReE��V�Lֳ�7���v/���aO�x���֧(%��W��6�a[�x�*��o��
�����W/ۍ�}"�V���	9Þ ��P]{��{�C4�j��^�琂�Y���a�C �%�^\m8��8 ��h����<ס3�$�oϰ��C� �ʇ̞�<�$��c���@�d�&�V�MEݹ����n�s'$Q����4W]�bx�m�c�I@��ao̦������M(q���N����^��)�����@��FV��G��,O�9Ր�v]!����"&�xbYM�,�ZAb����"tq$�zPQ��K�V1al"Mv���4���a<ԝ�(
��V�sЫ|3 �*��<G$�H�X�:���U�6�0x{�Ha������B�H�X�o(Nd\�9��E��J5�oT`@�k��>�?��k|�7�~���5������U��NHB�C[ 5C��hIE�me|���V�%�"l��А�l�V�`�^��w"�<0�-K6�Bu��u*pD�����璬�Ǐ�ʟ�i����r����Y�VP8c!��xL}ϔ��D��mS"�#.�$v�8/��1��]ȲQر23��$�E�z��bGv�Hg�� 	�VӅ����2aNl�������ctn[i,�f0����+XM�"���p�
<�����=~���36�ގ�|ç*XJ�`�J�;WǺ����_lRH�t�8)�xB������̰b�Խ��^��޽#D�<A���    �L!@�<���I�ʇ���R1Ǎ�g��aVL�F��~nU�$�-�k��C�����}fDy�ܞz(��)�oR����V����"6�����f�D����NHV��1��-r^��Gt+�Bk�����V�B���aj�������w+}a7���t��v�GL<H�)8*�3�Vb��q̙I�h�ڝ�.n4�#����ɜ�B#8y�m�>7-Ȳ�E~߹�td?{�$fC�� ;
�wy�\��� �W~�,m��Ɇt���oG7ܡ��<¡�4��_!��� ��+yIi!U����9��G0�ɖ�k�
lXY"]]Y눰lD�������Wn�r9	6�����I?�!�=~� ��������<D�G�x�p1;�'tw@��X ���:� O�L5��W�=��%_Z��צ [� t)�P��Ԅ�$�M�'{�
 �l���+}h��WZ����@�E^d����~�4�"�b���n�9a�#� ��^C�Mǰ��&5����7jD��VGT߫���ДZ��Rx�_�M��(�{S�
P�j?�@�8�{Q��Pآc�.JXm�bL�vi�h8�����}�����a@�����Ṽ�W{��T�H�H����z��Hi:rB>3���<�W���u�g,�F(�~�ʖ��s"�)qg��M�E!����Jv^�#�H���v�V��h �"N�Z�E�ʊ�)���%�<�,P�#�p3�iE̦�&gv����M��!N"�S��	ۊz��L���U���˽��t'
w��+'��R�Y�Ʃ����F�H�����f��H��!Ci)Q��x �I2�p�=�}�(fv,��$]&�8Ѻ��T�L�=,%_tr2!�OA�.+�=p,�W�!z�'ȇ�"f�Մ�Q|���gD��@�t?��tw���D���"���"M��Q�b�!�&1j2��m�ݍ	XE������޴�����u�5Sf��Ǐ+�6y�]��\�M@@�Ը�4��$�S��u�l *N2} ����:Io�W��L�&��~g*"�;pOY~���w����V�N�Ĳ���oꄡ�,�69Vs>�������C�5����a���m�����$�~C�{1���Ӣ��(�Զ�i��{� ���6����
G*��n������.p�U�$X&�<ݏ��B���.+jl5���|���Y���j7P\gl�u�"�q8m�>
t�\��Q���(&���o��Q��k�``&CM1�J�v�N@��":��r��Z�����ˍ�p���|?�)o)m��M���p+����&l�r�8���t'��9��󚺿we�BS���X��Bs�FO�Ϣ�Tb�8��.*r*к?CVs��4ac"�$6瑂C��J,���n /����`�V��zfH�98��}$�e8%�}��;��h��4ٴ�����y�;$���� U�1�h�jmwI��%���t.����TiaF��<1���T�^�5�����A>y�ܟܓc��n�-�,P�C�q���$U�;mO���خ-�8_�	
@��b;��d@�����eD��b�f�4s��+3S���$������*�H?�/:#�=~Rl��4��(��)�DҌ�*FG�M)�%R�r~���"wD�����cH�#8�c�"|V!����ed�?Mʺ��r�,Q�_��c��~!-,����n�f�L�a	��$��V�%�b�C)#�����c��[KO�?���(܌yWw��E���t����7���~�?��Q��؇(�������L��
�p�Зߕ����ʇ�
=T$���	�)�9����\l�tJ*����p��"7��!�K�w���J1.J�!G�c�a0%���l��@%��\�/�vì�C5�_3��s�ן�������l�j2mCag�5ԙz�6T��(_���r��:�C��9�:�X�~����B���U��t�$��b��c�����1���=�<M��ZW� U�P��_w���c�q��V���N򯷼�u%�U�R�������u$����tZ�����*���T���^��\3W�u�G��J�j�r��S�n��Qb$��&�]��Q�C���MǨ�����YؚF=$�!��C@N�EK=9Kl�U����|��O���̀RlEi�uGX���x14�w���I�X��~+]�b�m�E:~�5�g�.����	V:��>��x�V㵵��@��݌|�m[#���:�mWZ�巚kTb�j������$B��E5�<&��$�m�d�Mc���VĴ�*`I��C �D�Քl�|߿ `,�d���?~R���-�$DN��I��v��<+�X4ɯ	y�ܗ�R�&��.��r�	�>~
$�����l[�]++yfw��d4�q��wu+1�ps�ɮ��m�&�Y�}�lh'{�_F����L�t9"ֶ�gs���qJ�&�bE'�w���~Vw�y[*�v�H���g6���:$�sd��H�-��}Ҏ�t�P鶕:�\y�F���m��J��	j��t���P����n[�ּF�ITX���U8��?9o�bߍ�o𖣂nH���ih&`a���R`�Djg�V�4T����[�B�䜒�X�����Ke�� c��r��k�#V[�m���
�k�af�V�<v5w���b0�>ᛎ%����ɞb�$��81{��"�y+��m��q��Њ���&�RΞ�P�<�j�	�/�xJ������!-�̶-A��<���m[}��\��;� x¶-@I�{�<IA$F�np�IQyFg\t�5ʶ����+��p7��[���`�gVnH�G���d[Of��&�4f,F�ZPv���4]6���T�{��9���=�0f�~�n��m!��G� �R[8�=���B���SO�/W����!������������w��l�&Yg3�9u�ީ�@/$��
�[�$s%_DG������i���v��`BSP:W���I�7Gj:s�����+H��@j_�蹉��)�b��l�*����Ӵ�ۗ��h!�B��<I;��_#��I�=͘ό��fA6�E��E���1	�W�""�k���Ozr��{Ո$Z4�+�U��秿��HAJ���0�.M�hēI�!�f]mrml�
�t4I��!��V4�@��
v�3��R���7���s��c��,�^L/��4�|�$l�O�;���N��!��V&s��1YDՑ.�<	Y%��R�nks<1����k�r�n�!�K�#��%�p�u)�P���i���D�t� y"YT��4�Y6r'�xJ�����
y�s�8�nُ�{cC��{���g3������L�]F�"X-�:m�;�qse�:�[$��]�G��z�I�p8HE��	[�I\��kյ6:��*E����ą|R���V��bq�Ӊo�	*��'AB�d[�v�@��*��K��P�f%��U�&�SА������x�K#���C���#QF%��q����F\r�l���  <�R������|��� *��{;�g�+d��{$�gϢ��w�y��;�V�(���T��L|��PHY����Ns@n�gLS-;QC��4V�zf�e�EO�ZZ��]սl$N��n��[*�뿫�8b��|�ѡ��a���,�w���צ�*M��x?���#�������� '9�r�1n�h�u�%�24-����F��|p;�{0/T�z ����z~��dr�6yM%�0�^]��ƾBm��<fƾ�Tv�<E<��)�}x9*y�
���,�T��6�
�8�1[�ˁ(1Ջ��4?�\�(s��)d^յɼrcׄD�~�}�ʣ)��y0��mL�&Q7��>�{��=��K�5A���5�=Ȁzu�k�U_׻tJ_:��Ӯ���	D1�*�m�Ȇr���Xu��P�Y��`cl9����$����Wnz�LD7��+���M͜p��(ɏ�	AC�������Qt1������&���.O�F�@e��i�t�ܔ��cM��i���kݴ��%���5��
��~�}�icO�:����>"ש�_�	�4�|��    ���LUS���+�׾��.���D�,S��4��5���\)�� -��0��%
@Q�~�NM��,���r7����/%�&p���I�
(��!;Y:�r��޹=<$)�f�U�1b�gl�#��yߕMM���l���I_�%d%ef[�F"�Hń�.dՐX��L[�*�Y�ASY��P7�eL�j�}�I	IN� !�Y1�ݠh1��LK���+�n��D�tR�{i7��L+*ʀL�_7���V�	Sк�C��L^��(��~�?`XB�u�'�����ڗ��(�~�R�п���x����F��h#�C����68��=L�vHyt�N۰q�,������o/�:���o�h�汳%�/��9&�Z%΃�=|��L`+�9H���;D���=CBj7�?d��lGO����=����jaaI7L�.4�ٰ�D;P����Z�_ڛ�z<��(QIF�7�^�X����l�L�1�vS��<�_�P�;�W�3�>ENp��� c��7}���S��O�l�i���bA��5�2
�\@8�����y������`���0�tG�
�̡��e���� k��jx����n��U	\=%��b� �����s=B4=o�D�a��ռ]�J������I����G��Ǐ��	�����V��T6���oz��C�y"�F�AM�����4��A_�)F:%3B�ɓN��S�Ko5G�%��O�&h�l���B�$b���DaZ4]���R2��j]�;M�gJ��d3����w��NG��dYy�;� ����g��с�E��|����K�l��_%up�zŚ(��	��0��7�G����T/�R�d��ڹ�˽UC�nگ-l�s���d���Z%����8��&3�O�N�i�����mk�����~޽�͡�����p������%<C�4:��c�����M ����ZM��Z�~#3#�q���g��]�1�'�d/�EΛ�X@�p�iG���&��@JM8�d��L����C�g�'{$��u���7j+��A��P�<9������^fBr]Zo�yD��ds�� ?q��� �G� ��ĉ�!��;7�NJ:�/ j�^$%�"����HH�3'HW��!�yή�\k�l�-&�t$��e�I���;�2�P�!�y�P��g\k�:��/U��0����~l��hR�h�$��Ǧ�u��3���h@��9��}�)�}�Ύ �kG}�x�a8!k�R��0����  I�x���������A.�F,�	OK�茋�}|����%�ҕ�Qi�(��u�O��A�tZ_o�dvp2�?�=݀�I���&��.�I�N�jbȞ����l>L�y�X�)�A�u�i�^�ǐ���^r�Zg�x��~j�ÔϮ���O,�������~ڲ.SX$i���k��:�t�D�p}���r!��Hj��Rz_�v2O�)�S�5��I8�1���ӵp�e��/�aA����]��S��>h�LM��wI�oMe�D'9gi��t��:2H.,��S���t���D�c7��7i^̈���� y��~@����+����K�ֳ���~���b釦"'�	�
�4��ws��Ο��$,��[�y�1� DT̗��h4�N2�Re9M�G���V��*N���G������spn����m��騕�]�@�!�sT.���G��$�Tx�T�[x] �	�P7�"<^���h��=��S_L@x�l`8:  :,g� �]p�o�T�+�!�E��pO��uڈW�b�Q.�2����Nr��eujl�uc�;|�I.>Ⱥ���d�Ƙ1��-�n�)N�M��wM��b"<A)ftr<�o���'�wP��=� +������tM����-o�>i�z�4����h�k,�n|���0΃�<���h�(�uH��#]�S�Pٿ�0�uN�c�����"�Ú��*�]e;h��X+"'�:�?������ٹI@kpT�#g5;�A���D�&��~����(�#�>�id��)��N��U'��p-���xAqA�ne�X��MI�8�M�J�X�s��ƌ�9�nw�WXꆖ���j t�½���3�#3e�������s�����6Q�8?�{�ڛ'��Ku�B"�C5N�b��Pr�������4ЛZn���rr����,E���{)9F��0B�
k�; �e���SdS���+���?�p�8��àC��'?����w����������WX-1�/�D���;��Q�$�~*TQ����a:i�Bت�'-�X�xY G��^7�(�i�&��
���]'�����!��3��	: wnɃ�� ;]�"�L����Hh�>��������%��a_%1<[�?��)S����r�u4�˞�:1�� O�w��;�$8��v��6Ic��ln�#R�/N��b[��(%,\k�����Qs�!2e��;�'iL�Е*��
5��4��LO|�ܥM������E���cS$`G��"���G�E��jE5�T3�"��TC�RGk!��+��*7t����A��'�^�GVD�����q���HRXg	�ݓ�G%��������fҌM#�H�������J�xd/�ʫ��6&��1�&�������_f<�V��	lJ�x�V�&�������� ��0�^ GI�������6�N�е��=�X3�8q)�=]#�}tes�J`��@��k�37�p�*� 6-��tYr���"M}��n��^�7k�}�F��I��z����3B���zbл�s�0�L���E&���Hq'!�9��]��)-��򊌻����F�c�*�a�DqWٜ/w�Hv��"��Զ�@��n�E�{T�ࠊVBQ�����k�^Nb/����4��Ż>� �6�b�9͗��E@������t'��8cA��giT������JcD����EX������^p(��/nDԌG�N%�9XS>���:�T�����P%R�o�O3��|L0ʠJ��q�Zǉ��g��Y]��^ە�s�X����L
�X���X�ċ�N�mX�\��H!T�/o���q�.�tx�s;
Ia��j�lq*hy2!�N�P��U2��I�� dԒ��ys]A�P䫓�]���`K�����5�� B�*!��I�U�
]wM����	Q"gfa�����i�<�4�0���)�<�� qSǃv3���ۨ�a��y�=~���F��ü5����Rv�
s��r�o���Y�!Qm���b���\�]jK{J^�/4�e�F;�l��ʒ����.��	���r.��j�0Ax�ke*���<���H�W@�����<��S�	 Z�j�ƭ��[x"FN�Qf\��[9�����kAgU���CLx���7��tl��-�ن��b�Z�ڙRpׂi"�Emz2�����%"=�!M�#5O����G��ı�ӛ*.���+������q�oq���w"�Jd���A����R),s�O�����Y8C��`rE�B^E(����g���zd�*4�ڢQ���FFCD�X�7�<+��*
��m�Ҕ����d�r���G_�S�]X�H���W߰���@ /rk�.R��ғ?S���u�ڵ85�+���ϗ�o�&�!����ƗP��o`�H���JK�RM������R˧�\���b���E���ڊUy�\C�.@�}�y-�J�n*�iݼ��~ i3�:JO�������S.�3ޞ�J��I=��������t������>�v� �X����-ȑ:k�0\>&����x���сGe�՞f4K���Ҳ���%�f��]`�R�8]#4��=�yC�b7�A{�zW�U	��Y����TLn�k>;��Oq��e6}+�>��˿P��,�r��΍�?އ�P��,���R��^�`�4�|�;f�F�.\9���(�c��>��	��1Ls����q1�lf&��<F-BB$�;�giA�5F�    �|I2O��"Igh� �´���$c^���+��"_��P��/{��\�rUK�H���=zU��6���V/�q'm���{:�C����h C,�
(��4Y�vȏ<蝦K�3 ���,Ͷ�q�.	Ay*w��w���L���J7�|��T5q�<�(�)8�@,o�;^߻��>���n�[I�^}��-(l�3�KLS/"y4{-;��Ǐ�Pj�,�z�RW��-�CP3����i�6��x���"�ʽW��;���t� �$�u��X�������6�nۋ2=\�`��>4��,_~��L�K�*�ٳ\˟vd`�?�bu��@Du����f]3�b ;q6sL �4�G^'��b��F��,Y5^:)��"�` �
�o�P��,���R~ӷ��)>3��L�\ZP��<1PJ�Q�4�ѯ�~T-�3ą�m��{�2gŲ2@6e���Y��R��z�m���/���c�(u���	��u3���b��0�"���H�,ێ�extNiD�VmPrH$ '�\_�Ǔ�;���Y�U�.�L��2�f�xH灼������0*̜���~ƛ���R����5-�U�E{p�'˝H���J�t�J��|u���x	!���z�(`J�ob�C�Wd����s�fK���[��|��1�l���U�	͇�1!��@���G]�N��r��x킽km���!ר�ٯ��(ض��*� H"�䧝9˷Ύ�����C'�$��\��z��,;���J�H}��m,υde c�$%N�� �7EW�#P,c���J�E�\f��[�,��x�t��ɘ[�USƉ�v8�Wbr�w$��h�$۹�+��~��X�'p��?V��VIsũ��7 �T�[p���b��ڃ����^q��Pa_�	T.���t��Y_laoH��_l��JT�KSU�T� �
��W�z8<Qq��fH|�KyW�YYe`(�� X�VC\��%8��~�vN[����?B^�_@��2�v�)�'JPzy�U�%�ְ}��������zrՄ�������1�1l�z�I���\��:��!��W_	.�+�QD&r���E�T�I�.h�1�F���෽��#���Ӎ5�R��	���>?���&9\uGB#�FBw,�,S4) �w歚�/�1��i�b��}\	�<�����l�-��s;PL̢�����PǍ�r�~�.��9@��z���	�6t!���,��@p��4�p�NH
y�B�-}ϧ�|��ɒ}���6(!2K�v#f�lȒ1�]ٴ'��_ᢺ�;�%I���f��-d&�dp.LKV�M3b.HX���D�=�7owH�M������WiMK\D&�]�p;��H�8=&
.F�+Ʃ�6�bl��^1?Y��ƛ=�x�&�eP�H<5�&X��N?���Lή����Q�Hl�����IJ%i:$Np�t]�zG�Jy������\c�I<Dk���P��Tl��N�j,���Rf�l�:2�3��mLu�-��V��:��l�D��%�fxX���l�)�hnL*ʯ҆����� ������dx2��$%�U����!�����/R۽`�voF�pً�%f��pi��ؽ�ձ�:�@��ݲ=�/����E"�A�z��7��m��@��YOY�[d�>e�
�eV����e��i��i��5m.O`(�5c�ؐ-��
2���ƛ��
�2���w��[u�k���S5?W\p+��x��)��o]�A697g���W�А��I�r���Hk�FA���6)�7��˃Y`m3u���̨H����"r�lSK�ֺ��0.'�6@!Xy���*�2����В{#���x�"�U�.</�'�=HI�)��7��Re�	���E��B�/���~Ѧp�}Aq�����m�i3R�}��/ZLWàt�l��4����9�0�ҙ%(O�赩^L�no��눉��I:�_�6bb�ﾌr*�&1���� �y�#�/d�N�>�=��mT���9O�2$�?q�.t�C��bƓ� F2���"ٔ��Z+7�aTS��o�Xq�c9�N�}!Ӽ����KR7)y�
yF2��o-{������s�����CD�o�& �A����fN�r8X�)9���`��@�e��m�kJ��U.;��K���=��Dܑ�{j����ZRxG�����x�!�T����H��a�) �AT�����N�������V7�m)�����c�3I�Փ����|-�Q��<�KY1I
�~�ˇ�@��(	��i�;I8@���-��H�O��a�@��������M���W#-`�ѓR_id<�ƕ�	tEg�P��_�PKP#F����׎{#R���|���H�(�צ)�PD��/*~~�=~^0���d\]�.87�)^���&g��<Y�B��C�C{�l<��}�-n!q�I�������w�.�G2CU"4�
v�bknpD��+�l�ZQ�GzgQ�~���Չ|C	A�Nڛx�A	#�s���H��/����!�i<�m �i2ש�:Z��Nӧ0 �I� �'CN�4�2H�Д����
_9��ADv��+���!.�ʨXD�
�G������yJ�+�����G�<�Oڌ&��k�œf����Ȃ�]�dx W6Ϯ)�7rN#�m�-�)�y�\ �:�{�?�|������
� �]�q��ɂ
ai8�R�c[΂*dq8�H!�l�a�d �ӽ���ziNgk��8W��2hȫ9�$BH.Ö��6�	�3��pj���y�_!fl�U��8�r�!���#�ҭuh����.��M�R��l��w��*% W�bC� ����Vu7}��j�w4�f�7_�9�����������<�+�[�N�?� y���[���ɫ�}U��Aɳh��kB�����V΢!VLU�����!Zy>�Dq[@Pr.Y�ؤQ� ��:n����>X��iڇ�*$��f�B�=8��~GRj�I�Y�<qN;�r'1�����M���	�皞>��GC�5:T ���������ņ:��e�F��BA7Ӎx�i��*8\b����!��}~M��H$�'z�Hg^<��xo�Յ��b���z�+ht�D�n��$[@��Nd�h�q�(:�	.:Ѧ��'��)'�'�W�����$j��Р�������������8̟CU^c��=)�h<"�s���R3G~�I��J㙗�}���	�Vb�E2ޫ����U��`v(�,%�l/�'�;u���$�O�~��{����ԣ�� ��xי���?� j��w�ą,��P�3D�0a_.�`e̦E�W�F�c|.�u���M	�8߯���)�a����1��̞x��Ö���C�kr|~��\�>R�����j��`�����%���m��p~��#I��G6N�$���ؒT)�l4�g�`@��T� e������n�*�2~���:�a�}�����6���M�,1�����9ߤ�l�7^Y=�xls-�;���|��m������_�ݐF�./�)D�}���O氫��g�إ$�|}*u�(I�ϸ.P�)f��h�h�v��p����ˮk}�Z��I�]�>p���m�ow���{eQ��6�����y٣i  ,���5mi  q����S_ 1��Z���[�A�T�I�NgґH��|�Fy��q�E3⛘�;���7�3�2R����:Wg�)��7��#��KM�=��Kc��~��Ii27�)��tFB�A�4��0�v.�+ʻE��f��_u�LB��n�J+���HWnJP�U����
{��N%L9I�Z�z���"w�DG�s��xZ���o!��+��25��C?U��2N������Fe����\�{H��T���2�Z�7o�����9 -hK�����������mt'��j�3Q]<��x�M����7G:���� _�-r>PO�Yu�0����,���p��Y����maa�B�y�    :#���tc�_�#�r�ލ�����~���Y�T�lhp�
�$I#k���m�Ǎ4d�Q�@�&��d�Yo����XmUA�|�vb.�Yy�=�  �g�B�j�M"��Mh
B�i4�&V�k�hG n�������r�9��鈗D���f$����:���ίR]����c}n�g�;�N�_j��n���񳿕�I,si�І���J6'6�h�mn�ua��%�����[�N��hG}���lW:��"�W�c�Y�P�v-ދ�g�S娘�}X)����.
aF���̳0��ױ@�9b	$�c���iQO"PZ�o��T���]PN�9����"�!�7���9���m@>8�Gm�'��DĮ�	��$���i��D8s:Y���tmo�B�wģ9���U<�QQ�,`7����q�#L%m�y��K���Ƈ�j�� �@�Z�$Ieָ(��n�C>�E*�Ƌ�BY�i(Ӂ���"X۔�_9�=z���)�Ub��D�s��G��|�c')�y�{�V�{�P�
���R�v�Z9��E�<�#\`�U�_�տ��@�ta*�'�Ш'�V��9��z�����4ahB�N?'��(G#�l~m�����ٰ��n��k���f��1���J l���S@1+���֮��AӾHa���٣�{R�ʒ�<�P�^�W���8�sX�b��v���zu�S}�k1��m�X��a�Q�pM�x�ya-������6�'����=����\�x��긜���7�������<��w�p�ꇴ?�8 25����Gk*d���
p�	��t�į$�f4C�t�V�z�z$�Q<�.�N�P�����f{��1kr��N�g�I;E34�^D��^N���d���%i�ܿ�]���#� '�d[�\+���-`ө�|"i��_�.�/�A�C.�20h"p���D���Q�ap�`3� )i�0���@<������29�0����  ii]����G�@�ٯ�G����;����Nls�O`�M���,	�Ly���p�c��d���.#C�$>-�]�RߠG�'ԇ�MuE��[�� �d���m����Y��j�5�f$��f�!�����m��t�<DQI���ە_e�4�,�;��eG�����a�a����|��3���+�<:�`��<Gd��x$�s�����L��i!�%���X}.�{{�	iȊ��2�?� &��P��|Sf:��	����u�:�X0K�xm!
�,�V�J@��f'��Ώz��aw���T�n�5�� RU0�H�3��^,_l���"�Z���޽��X���>~��0:�*��kI7K�Km�i�� ����3��t���x^u�Mjܑ�r�z�_����i��#�T�1�>����8�8��|�Y�a BJ
�ܛS��Q� �|ʳE�TڂK9��R8�Tn��e>-��{tr:��9ՑH
җ�R%�;֨Ԍ���9�z�T9Z�m6�Ѷ�pqE���!=<q��9[<���Uҡ��`��2���YЖ��!�^���ipX�I4�0P�x��&�|A��C�뛺�D�+7\G�8���$�#@"�����������A�#��G5"c#1���PF����T�Y�b3����m��A�=�L���7=��I�Xp��B=Zw=oa�H����C��7�M��`�����4z"p�1/qR�5�pȅ�]ʉ���s�� xw�h6s�F�����g.!�K�ل89k�V1�{ !f�~s�v����)b�%?�kCN��"��H�9	�,�-"9�S��m�p��<�,)<a���|��y��<zm%TE*z�V�U��#"�٢�s%"�|���b��iM�|��94w*�4Ud�?�W��:��~�ɱϨ�w���Z�����yJ7�T��@%�Nr�������4������)op^N��gX!�p9m� ��S)�U,���[�b�%*#�\��q�Gu#��X��5��Q�1k͉�3�0�u��S�w����̞�8|��Id0�˯u�`��"v[�BK�H���(�U7�F�(^�!���3x�'�����q	�bR�HE�H���ֿ��*�¿^���O�P��P踁az��T����F(>���ygɅ⽎T[��R(�VJ�.{4�!5	rO�7�[�� /��GU�I� � s���Gi���(���c�B��&&�p�+)�� ��h�!�ه��JP��K1T�X��W��L�5�:�+��ƊE��ݘߤ꽵�r�ti�q&)��t�s`�J��aG	%#�&q�_*�cG/ҽ�j��!T��fB�P���!iy��@���Gw����4u�٥R]%�{u���6�h��K��7����s�W�ZrIp<�.��48mيF��H���AdA�K*2_ie�t��Zn�=����_
d�����O��=~��?��}�a��P}#5T���8 3�+�L��@��v/V���R�-K��+��)�0?C����l5l�\�y^�է��׌��� eW��*���7�TdØ"'��U�sď`#�G��jlN�7���6����"U�w��{E�1IL�"�ؖLT�ᬎ
��x��H�`�������ˋ-�̞,f�qH�x�Ve��#��s�`yTn�:�B�����7���}���cS��h�m�Z)_�\c�Ӱ�g!��Cy򮖼;"r���v���*�t4*07�#*o[vM���>��6uh`J=�~y�q�@>�"�pw�!>~���^�(�� ^����,�qOX�d��v8T6hF��\3oS1QЬ�0�Ӕ���YÏS��9
�5�N�q��xu��I}PU<>�<��V�݀S�{z���S�!�-�ֲ"!�YTC�U��Ҵ���3w�u�����9js��!(<�.�����#��ST{�&�!)�� |E��]��Q�ŪS�	1c�H��`BS҆�<�y:U%��SR��TZ�qQ�柧_|��`�-�F�I8�Hip�����b5Z���Bl���*O�qrW^����	�[���.�C��m��6��'�����6�(��n*ȿ!6�_�0 <ժn/�*n'�Q�Y���������TJ>�gzBQ]��heQI��5���	1������(�a���Z8��VѰ\�.7r�k�� �J�L�+���m�5�6�:���XKq����r����!I!t�;jq��T�`�������b��ȍy?�hn�@3�6"�.�[���P���K�D��e�� W���6��5q�Wly�?�Ζ;R'��?uW0#���~n���{@N�9H���ʟJ�c4��1X���B�����L:�@��!�b�[� �Ć�Y���b_%w.�Q�7v���o碋�*	q��e�=�T'��t��X�/�wa�-���}�����'n�gmo��D�7�oGM��z�\�+8�_�.n�g
���g�=��k�,���H��3L�<~P�u f@���0��M���U��n�W2D4R�a�* `���6
iJ�Tࢀ�k�}լ�<b����@ႄEJy}��C��B�>ǋ�T��_ˣK_�'�;YL�<,�D�Z��o�nu��m��<JF������cbH�E�u�)�ğ��I���)���]��:W���I�l*O�%� �1���Y��؃�I���C�7�.kZ�I*��Z§�\{���{X�p��[�g�~-o�]�P�a(��H��H�% �$%bt��#$AR� E�g�F�FX�:�:5�}��@��TZ��O��!�I���2��-�^��2���ߡg0,[]��*R�\��_���n7�3!Q)6!|��	(s����8���(�&�C-��jI��Ӽ!��V��#mӚ��s+_˞�1A��7lv]�vG�����I���H YY@!v�0b��o*}�W�!!	ӵi����?��a_gD0Fz�H�w3���A�U>����ƋJ*�Y������U�W����e�%N/������B    bQ�i�'E6�Ȳx`���L��*����b�r���ۡ"�$3��Lt�	&��ݕ�����v+$�zpG�QɼFT D���m>,��ϙU�B�Y�m[C)���(=Bc�2>��[E
qeE4��y�%;��]��z�v��;�6i������[T_���.x [���;\z�j��Ǒ2�qD��g��1OFs��K:����He�.`�Ͼ�z�zb2Hk/���d�3^���5�Vߐb�՜�A��[����Xw4 !����Y<�������s�w�5$9.�'�.x�W`��vz���O_�;D E�����;��w|��C~ԍ�[�X��׬����UN�E~si�k�'��}�O��*5��w4���|�O̖"�)�9�u��zP���(�L�U�c	��)L'�o̧_CFU��D�N$�V�>����A�J#��9��=�[Amq��K~���/�"V��� n��`�&���&a�Z ��?g��!b� 1�}x�᷶7O63�#`�F-Rf�4c�N�bT��Yz/�%��
Ra�\n� _i.�$��R�Vp�ڍ9�
p\�������<a8�Y�1�k
����ITL�ZS����t}	,`Q����H u\�#�ױ*p�����\�E��㋼�0`���_���PB1�v2�5�qA���d�ܐWg��p�#4Ypk����vՓ����<#���5�#�?(�c�~5�.�B�B��L�H�	O�-��l5�)���DC?��v�l8:%V�~�x/O����*;E)[Q�$�f��,F�4��͵�� ~O�ì�qIs��Q�I �T�UeҞ��B�z��w����ç݋T�'$�A(y{�?hO��
`��7�n��!�;͹�N���ʅR�O�J�x5�o:b��H�
���Z������b��j�7Z��M����սPk`]�$80x�-}cz��h��n��<��o$�N� �*�%c
��o�ך~�N���T"���d�MNm�7��?��1jF��W�	�Ŷ��A��эĀ���t1R��Bu�t�ђb%k�7H�e��fgn��r
�`�I��(���Q1Vh�0��&��n�.A�$��T�D��M��|g��FI����rWc����Y���/nتq��\J�oy�Rn��7�rv{t���qC|��I�0\3�q��0c�nR;���Zk�	4MM�ljP����)�vR�/�S���F�߻�HRD�쒇ֶ�#~~���ݟWJICܢ]|�qʣ���֘A��Cz2��&[H�ܵ�m�zw��m8���bϏzz���9��a����g��y#�F�9�Ƅ�+O${1�LY6������3�_�` Hf�g�A�&��lC��ua�&�7�K�n��DA>$;H�:�$�(D&�����S��7��7�9�NɤIp���7�m��[_���O)�G�����&�{��?[�ִ9��LFW�!���,VW�/�T�sI������i]4k[bL��#��Φ``.�8zcV��O�"�B"%�A����9QH�%x@�6���_���=�hZ=MD	�����z-�˰O0�Q��D÷�"�XB)��<���b�ӓ$�uO"A�"O�G;rC��ʅ�� 
<]�	����o��<���"D�?��P�-�K4���,�s��V؂r�O�M�	�� P9��r�Dqh�|略����Sf���y$��/L���ɸ�~���\��7 ��/�C�Ax���\��Ϡ�-U�u���pB66�J+��45��t�iw����'��4g!q��0A��C
��/���Q��MD��W��*��]�b�M�*�7�<4��(&��%2Ȁؠf�����	��"���
T��D�,�p��jPH�R��:��3��:}i��_h:�/����>S �ұ�6%ډ���U_oC]MI�1�� x2��ܻ�(�ݾ��î���t0nE�����)��f\zH�Im�Ceb~&����YN�)�RyѮe����Bj��;�4}:Hp&p.<��g4�<x���g'#��H0(y��M-Jɲ���%d�|A�1���i����Z�{�#5 ���l�~H��Km--";�~N�s�p̙�ɼ�őG�u��g��kq�XVp4C�>y<�^{�bѣ-��P8�}�r�sʶ���{��a�&{���[y�����"�奾��=��1Ə�RG�^�[1D_$n�I{FI`o$�>�d�s�ckWe �24@>��Qi|�օ F����r�/XIl��:��C�J��%�.�)���}���0�
1���IaO$��M* ����'�7A�fP�R��I,Fg��1�.�oN�ǖBs�����#��jꓞWF�T>������?��oRC�O9}J?bs�̕n���GI*�7�I��̘I|m��A�Z``Iu�Gr�*#�:��KI��v}ȳ�<!�=_�F-�6����s�h*��?��j�_0�4����E��I��Z)U2�mB�ޔM
�?�f0�3���-"�M�Ή��X�l�E�Ye���h��y��gB��3�%K�㼺k����FtG�9aqаT��,��-��VUG?L/kQ�����]~�F%+�{���e�  �l>�q:_i��s]5���.<|�B��]6�G�F�}�*p}Wǉ:@Y� �� ��17z���7���ݯ���=^�4!��N�O �`�)+�z�0���)*��X���m�)Pb�t`��#�̶��(`��.HgaB-��Iۛ�k�wDsj@Ӎ��${�!��f��f�JTH��-%G-���'��I�nje�������:���?�_�{��6*�	��/�+\Aj/-nw.���V�!xL5�+�����ޗ�5w��Af|mk�ge�����T#��_.
�Kc��7�	���א	�d�p�|Xx���<!�AK�k�o*t��\� ��%���إ�$��in!�q�B��.�ۀ0.T3h�s����Z)ק�{qЗ2o�M>�V#�fx��Z�;��A'X��v�2	��-o�QDU�6ɳ#����v0���{�d��ru����s�[fxr�
aQy�~=�M-MRI�SE ���R���ꬴ��~��OP��Q���*����sZ�wR"&B������W���A��%��'�թ
���猪Oqɿ�;���[8^����7�#�Q�!��Xa�K�1�J��g��.I��H�z��D�|C$T� Ջ�Ǔ���>?Q5�_��� !��P|��Ze]��D)c����〻��0��[C��|��(�2�_{��rɫ6�֤���A�?����\���j k0�^��xԸ�x��S�_���ze��7�t�M��#K�\���rW]i�(U��>qV�8��i��H����V�������S��nм���d��I�qR�'J� 3I�_Z/�nj�P����8)H:�d�(�bPp�H:md�5��k*ڄ��I_�q3�k}��*���i/�.m}��f���P����Jpe��6"逛QZ!�ke�~�E��&KVj���4I�L�m�sA��!?_�N8մy����1$H�	�1��i���'+�ި�����oj�o�Jo���OКW�)bO�\4B@ԟ!�x��X}��Y֟���g�E�'�Ou<"%=]��Ϥ���>�}�����_�G�W���,R?P�����[��E��1״�d�0�θ�2�!����J+�џVT�����}�է2����;��o�Dk7z􄼮1�K�?�h�7lT��h�'��I9��9���]T�hU��&j�4}�+n�I�uX7���9��»�p�J�3�Ӧ$�p�:�����ĸ)�4i�2-q�D��]ZS-CE�c{@��ܟ�v��u?�I�䀭�z���'�DWXޟ��GZ��~������_-t�8���'�-��Nz�F����]i�]�ѣ�"<���4Q�t�d�ZH��is�\�w��ͪA�-���N):l��,l�e����h6�U�J��F�kcU�V�u�yHi���fO���	8�!�Z1!����    �ǟ�zpO���Fc��x:�S4�,��70��L�Ҽ
�?~�q��n-��g7]Z�,�H�z�u���b�����P^_��e��+�受�kkUM%�>:��W]�
c�k�J��ʾj$Wf���.U�gA���j#�?e�UWdP��˗���К��6w�b(p�<P�e�R��k��
yTY\�@�{5޵s��W�[�Y� �>r��$pU���&$��\F��:�XA5�TCX�\2�U���v��:F��J�(4��|yS�a��*t�����R��yp��D�V��V�4T� �;��
b|S;��l����e\!��4�ӷ�Q��zǛ�D�q���v�����*�$?]��lEoӒ�B�@��?����>� LB4]� z׶U�p��Ʊv�h���rTV{��+��_�*Ď��}��jj�=�O��}��|?�i�����1Cx\���s����+[�;��\���l?���l�'<-\\�ċd�R�\��=�p��̡� �2ٟ1�[ג����?]:Ue&}�{�";�i\(�XN�_/��;[���M�azq{`h��2��[�
8׮�lp�B��!�0O^5�H�Pp�����Z����	�5G	�����]\yx�cbj%SS�!ެ�	������{���;=�ΦQ�]!t�C�!8U�h1BR�W���� w"]x�]Ti�"�Z}��q����9�=2���SP��������L�ˁ��Ub�%�XBm&�kfg��ýڙ<ofGX�馏򛶦�D2^��{A����N/�rE.5=�N^;��!%��Y���C��&s�#��^ܪ
>��N���z:��Ӌ�d��i�7u�����+�7#GFfj2��D��6I��NC���"�:�B�u�@��h�O7ظ�l�-6��œmFIW��her�rdluܗЖzX����
�f���n귅 �u��Ң͏�,�A�t}�˺�͙�÷/���1��Y"�i�c�k��c�:��"<�g��CQ�_�."".�K��T�n�Y6vi^���Q���.����8�h ��p�&�5܋`g�Wv��6�������~V��# �n-��p���d��;
[��fjN��Ca�
�#$ώ`UJ�Um_�M��x�o�������]�s~�q#p��;Ə1��������b�f� ^�ћ{��k�����ˡ�p��W��s�H�6�!Q��1�H�?�QJe/��D�U13�j5�E�U>��Qx��W��s!U��#y��r��%�$"���]�ğ^ŵ��Su��Z^%"�j[��j1F�y����52�Wsk�)�����U�p�	��"��p�	6O�6�k�GZro�����[�y�5d�Aݎ[$���ٙ�w�<���Gi�Ƀ�����l�F�I�Y�7\�u���30�0*��|\�`���c|N�.�����5 �Hp�Ѻ(I��De�Kp�:^�Z��e��Ğ��J���"��=pO,�<ݮ~���M�%�$6���]w\	>O?��pq$�<-:�<��+)��������|��u���L.�GcN�3��Чjt��1OU��e��FT����1��F=���3��3�=�e�XN)kc\�
�:"Q�Y�� �Ÿ#����}S7���VW*h&�<��DdPQ�"Z��9���G��]e�?@���=���f��F������e
R׈�2�i�鱜��gU�dN���I��V��rީ'��F������ΠO�iDT���t�i+f�����Ԫ�j=��6��kU�p	�$%9vPg�^�Iv���4`G5#�AH��[r��i�Y�x����<���"�d7�`��QCģ�j�����UԨ�%�I��iԙ��QDē�4��:��E<IG����FX��V�af60��ثh{5m�����N�l�h4EZ�p���ti��Uu[JF~���F�r�;�t�Bw�>�p��\t@�īʆ���#Le�~�W���4/�^2F0��U�sS�\gV�`�0��@C�^tq�ց�zXc�\�I�xypȲJo��eM�����`l��Wd�����_��u�#�e\╼�Ũ�����ɜ�U�![H�lu���'�Z)�8_����G[<����B(�t)Q��ka/I����Y4�K^�e�ΐB�޾W�/�H�Ȩ-_f�tWڠOR�BR��]oX���}�k�*�^�z2R��U����4�{�b�X�����.�{E�
{�B=�c*���jQ
�H�i t�{��Y��J��\����P��H���T@@6�l*����qڀ��6^(zKtª��$���,��9�������\�O%bS�T�����Ve���`K�%�t�S��+��Yz�Jd"b�}�`�dr�D�ag����Z7��H�[w2�T/Z�dU��S��L&��$PrQ�l�˥ s�Ѕ��L�X)��2��e�R�|>} ׅgvuy�\g�c Hk���.�.JA����ͯ����jU#�?WY�tD1��C�$�������QQU$FU/�5�6�����֪���*P\7��߹�{��^���Z��L�[S���{ÕՐ�:�3��;z��*�# @ʑy׎_����80���C�V�m2�����K���厢�
��t50����
%�M̶�:�S��7A���S�VA� %�{ћ1���٬?�x&"?<�6
[؈��n�zeP�N�c����u8�P�	�xf�ۿ԰��T ��=��x�U�KJ���)W�p���UB�<� 6���EA	��kU���|�
S���� '��:�e��_�E�x�#�b�����l�UB��nKk|����m|@��NzP{�:�b�Y�o�#դ! �_���[S>Z��ڲ��h�����&l�����h�5�z�N�aʣ~����4��(P���oz�U������u��kT?!%Dr�:ܿ�U1���vW�B��m�]���PUS�*� ����`L��㼅ۥ/>���0�+\o����c盥�q�\�zUk���,����9���0;��ɪ�ŵK��90O��m���f�� ؗ�7դ:E�+wq:���j��M�&�}���t�='@X3� K5�Vݐ���'@�`��'��;
+~�Pyo�`I���]�o�8���{�k'D�ŗ[q��-�D/�����Ω:�=�"��ȷ���I��^P,"��B.
������!Rs͵�p�<��g;	�J�>Ii�M�[��ZM
H�3�R���OU���E�y�[���A��늎��)Y��<P�wY�b�pB�c�,'�ʷE�Z��~&�ٰ*�u�2�K�t`���1J�*��A�`a>�`�Yec���
@WZ뗓	��D�X;a��7m �|I �e<C��j��}�6EI{F� ;�q� �s�.��2�c��}��d2&��j��o`���P�Vk[� ���PB>`�0'�vi�����+��������$"�dw_f+�{l����}��_�k%P�[2N��j�ߞ�����4��K�$x��\��4Q%��k!��I� ZI&�p-�d����tD�덚� ����E!A��ҵo�#9>̐��M�	��[m	�*Y���.��Y����{B�/���ZJ4ʆ�S�q�u��P�!��ȀDұ���L8�I�\��N�6P�Ԡ��9��&���:rCs��dj$�����2��Qu�D���z���E�Ǐ�9?���1�d���*nce��t��'Wz�N��9ҿ�2�<#"�3�7���4�6����b�^˓Y4�Kd�.@P<���:������v!3@�F��{3i�a4|�Rc�Ϭ����Q�O��)��� �^������4���u��^4\����G�Џ�^q���(�}1B`��2���;/E�x�i�N�x�ub���xÌ�v���9_������a����x#�>��16�>�H�Y@ǳ���i_�e�U�3v�/@��p?��CYǐ.�2�kꢒ���H���:��D�1�ll���    ��Q�h�Ѧ(��m��^����Ơ\1^#���7E�N��"v�'�;),_Ļ�|� �E���^/Ǭ��"F=ݡ~�U�9���v��z���}��x�
�;eZP�M~��w�K�)�k�ܛ7�t`�΁ ��n�

b�g���R�	b�h��[?����=��I�l7�b�/��e��!8����L��h��p��̒�ƯЪ���x�G'�X�Y�P߁��p���t�8L5�j"�ǆ��]�0*�������������]5!i�\f�{��<������zY^��#���-��(�P*@�s�m��#�?����m-�vn���Vv�ǳY1:��]�����T���Ε18���҄H����_�b�=S9I��j�k=w�cȾ�ٿW����ޝ��q�亽uވ2�j�.�!�K�E�XA!���^��X�'�50h	�n�(�<����d��b��'���|ԅH���˄.X��}���ev�+�\�EO��Z��	u>�7�X2�X�g�X���!*FL�:xhEG�ֵ�=9�}���Q(��w�Ӵ{�^��HBej?PTƲ���^Thec4��ߕ�k~�CA�If=��Mܝ�W�=�����q�� �>�_h���g�~�Ƭ���`m8v����[y#�pSǮ#��0��_ׂ�`yb���ƿLt6��%�F���O��Ӗ}AwZ��w��}���;�.�X�$8^��A	�U-��k��������f�I,��o�������"e�	�K:�$�d�� LZj�,��O)�ѳ�ٲ��'����ޛ�α�[N�S�t�@�#aS�F�ni�g�]qDIL�^/������#Ll�r�`�?�(�|�����!�SW,^j�p����y'���ӎS�i�����"����GT2R�?d����	�),���tb�(g��౨Oy쿙�9��B�g���`��3��[ej�&`�̎�hr9p{��@,���F'pJ挹4��D�������f1am1�ʬ�(kk�y�p�`�:�cYm��kXz<�������Ȋ��`���K�n��jH�E;�A5|��x^T�-����Q�'���N6b���%z'�m��0٭S���l�ի �]ˏ�f�	9�Vk�upqّ
BP�f=��b�&�7�.��G�ȹ�'ަ;�Y,1�h������X�����͵ŉ9��X������j(���s��ӧu�9�����o/m���8��"���g렾�9�;W給,��^�O���ԑa_~x�hʙv���~��jv���Xh6�?����qۘ�^����V�8��?0�Q����]�"�	_��,�~)��Ky���*#��Y�/z@���?�{��˭W���A\%$,����¡���Y�0�u����t�pS8`�~4r��
Ut^oxP�3��@wB+�2�F���P��X[.�[��_���>�F��G��@`I�qD�[�?_�j���I�����'�U�׵BZ���XW �#6ϻB9E4��Ь5m��m;,��G�wP��!�r�}�x+����:���O�gb���@����Ѕ�:
��k����H��}�58z��@�zu4)�$���uuf,oG$��?���A~��R3t�,7�^���p�$R�Y�m���<+�#�}��"M@����@A���_r�\���$Ҷ���oCjJ԰NV�\�xR�/��/���O�}E��".� Lp���&:t�:���u�J˹���<�+�{2"��x�[����a��;p%V�t�!�N���� Jb��R9�p�x���{��i�d9an�m�VA�fp���`6���$��צץ�I��x3��[?����-v���@Ph�����h`�8��6x�>g`����}'C������M�=�_�o�<pH%��oTQ<u%+<�
��+87qķ<�<m/q(��������똿
������H���:�V�s�'�^�C	K!�Ib{�.��F�A��b�g�Lf{�]��#�����\;M����K,7�� �?�NKuE�VW6�ԛ� ��ӽ� ��,'�A�|W�-��/�8�7e��	���9���
5��[�ú|�	C��w�[��w��L;-�9��Xu�1~X?���h�e�=�e�ы�I�r��B۾�z�릎%&�����w����~sg�̰��Y@���s�ɀK3>��x8���3p��b�Ȝ�-n��!V��`�0բѤB��8����08�Z�,ݙtZ�ZTI2g�����fΠ�eH��+����ui9t����s�\��T�������q�J7VJ��)��)��L0�5G���~����n@D�����.B��n�OD�����Eݼ�B�H N����7D+2�v�-Z)p���>4�l#�X)�~#�sd�Ug��7K}�]Y�iw��f����g��4�h���OWf?�~ɠ�������:-0Z�t8�MiZ�llM�N����-�MTZ�N��n�΅��"eF~���	��)c#]�8�K�K��c�g�����6�A���/H�J�������x�"f�;�I�`�:�.W�@�y���)��C�T_�ޑ[��jz�鬨���D����vv�Y��M�K����Yq�m���� !���T����oUn�Є𖻸']�x]�	 -��v�W	��'x��P���'��ڹ��AڵW��=NH �U���լ+�{�U{�۴M����V�|�
����.�/�Њn�5sƧ�������@�VM� /�ª�B�:��s�d�U��2
Ԫ�rh ����u��0����p)o���.�������$Hk��yƎ7\�(�e�(@`=�x�j_�=�k��J�� �2A��8nڃ��ۖ��0$8κ�q��`�O��ur<���=������ӑ��/B����Y�I�x����.�y��¡�/���![�0�*i<5$�I��O�!�1���Y�"td�Ll�' N��#@������]*��ɾ�H_� 0K3�A{f�H��2�U�Eo�qPN�ёH;\��i�t�O6��)7-1����T ��KG�����cv�p"�=ʈ�dD�t�B�'���|K5}��3	��z��4'�T���ˆ�7��ᤛ ��b6]ag�V���{�􂅘Z�O/��0%Ro��T`�T�z�2�o��LCބ4^��Z��:�W&L�"�6HS��d��$��� ��=Exl�h���@3�+����n���@T;p��;����, ��,]�^o�2�7��^w�֑m�?�zm��qv����ٵ��<tQ7JFN6R���B�y��ǐ%R��>N�G"t�H�:g�ql�̙QCYUl|�]�E]}}��?u�`%�5����Sg�8ZܩG�.� ���+"���r���&-vЁ�J�ԑ_;�/p0B����,�Nװ�s/��ViY�׳P$����v�9�O�� x��tp/<Ȼ� 2��ى<��䍲��������"̂�k��1)Y��v6��5����fB�FƆ*-����_Y�WDOG�1o�@�^k*w�?��@��ĉ<cC1��� .S����v((�3{��j�q�Θ3Qzd4"v�����>�b:p�쐶�V��J��e�a�VmK���z���� ���L�q�Ȣ�B$�P��<>��������(, w&ʹ����`5�����q�q�ϸ4
��G&Jvk�L^҈�41��a1�҅y"�Ȼ�� �،ɫc8"2�9c�n``�`�\!�7�R]����z��7�-�y`&z�:�}���2��F꒮��KJc�v�
6�fU)����� �C��=����V��|�� ������ lL�y,�����jt�H�E��b�ʂ�d���!��@yiG"4�b�C&��1�nȤ�|t��HΑ}ѝC˙��A9�����d�v=�t5U�[���b���d��  >�m�H}z�-�P�����,*��B|� ���1l?� �J�    p���Y	^�!X�O+�����R<P����V9�mOMf�x8��:
����B���K�e'V�z~�@b�2/=� eV�ư?h���tA+:�<�����Q(m��8Α���q��x�� ���@JJ�k�Yo��­�Y	!ޞ=f%�`��ܵ���H���)&#n�O����v��A�� 8�~G�ߗ�������À��,�N1����ַ�a��L�a�j�pe�Isd�4#|m�E��b�k���4K+�'`����$ە�Ƽk�+�@	�l=tw�����×�4�$�ag.M��2��4HQj8��,���h�� �p��3��@j���u8(����/
al��*�39��T)���'��@A�eC�Ik������>Y^�S
/P�����z��rv���_��	z�+ح��,�9uNPN~(�l���|���6���z��-��6N3�t�s�.�F��9�B�PYN'�<�T�=�v����=K����,~�_Q�A���Q/K7Fj���VM����:�B�H�LPs�S�0@Ȁg�ͮ_j�M�ǈ��s5�G���"qӏ:
���=��}�x^�C�zH(ՌE���ǻ:`$�����m3�g�y���Vr��\�xO a4�N���b��xl$���uh�S�M��G*�-Am֍i��`�9HɄ��^or��iL�xf�ks��x ��@"Q�W��c��Rq��XC��	�/���D{�&�v7�u� H�ܟ[�g
KGH� &�ϸ���G�W��p^0��lŐC��j��� ��Vz��a�	K�У)���$�X��d
��T���w=��v�OU�J���C�E�V#8,��N�	s��!��|���!?dp��4�Sq�+�C`��x���s{����u�G��3���A<��Z�4�`;�Ǔq�v����9����h�u;h0�i";�CI�/@�G���8x<N� �e�1�a�re�ɺ�/C�%4q\�B��˱��s�I9X�ò�	�4a�Ѹ8���N��t�Q_ʝ~�"I����cmP��p	�󽙑�S�"X��#̊�������ѱN�X�w`U�E��^?�E+3Ga�z�R:��|(8���Ѡ
��Ig��3(�^d�#j�A�p��R:��F��:�(5J 7��CZ�)fч��%�fk�)�\8y�i��$V*F�M�����U���eO�S���z'��Qu��hIX�
|��_���K�W��a�+z���%fhHq)O�ﭫ�5%�;�����^�¯'���$�J!�L���\Pw=�4h���?���1�aʗ)��r9(�
� ز�Si�hA��x�S�䗋6
�j���7b�8� M�)����q�+�5ޗ�}��7�����<WY.��/�b����b�_퉁�Ro��9V�ͧ�^�ߠ������C�1�Mx`Ȁ��@��������No0vHJO��A3FI�y�j�����<$�����>����[@�S�T���@������z�Sy��-(;�g�0��W�9ry����<?n5ޠ�PXE��nY ���v���hm]�G����8 �.�v��H� ��H@z�!j:sq��1�X8�GvN�Q����Ԩ	/�Ц�I4 ����D��L��?�=�Mqr��<��ʳ[�����	8J�[Z�4�i�s�v�Sj�MdX/�)=�eӇ��d�.�B� �����( ɦ׉f�g���� Ť[�'Pf0ӦלZ�$��'��c4�m�uT �T	�=k�8����jnW@
W@41�G�/��T��#�θ��k�`O3�����?�f��P�MC��-�`��-Tf^�6��pƏ�h�`�F��}d�И ��6�47��9V����Sjn��&I��<�� ֗�De�s,zD�{7]kL�O����7u��k�D���&"�� �fi}��b���L�'"_}�ܱXf�����˶8�ϭ5� T���������e�jDf��R̗ǟo�� z8r[���[~�R����i:�A(nyӒ�o�i�f�䅷�R%�i"���.�~V`�/,L�K�t�g�Tt������+�%�	+v��v�ለ\),}Z�I�� �+�ƃ�YJ��&�������@���a�&�U�C��b�sO&"�~��U6¥)1+٤=���l�Ʒ���SK���.ù>��TG�C:?�1�~$�p� ��~-d���D�~D�_��	{��oP��	� �ُ1@`[;٤s���w8�<v2I�/PqK��ř3Bs{0��\��9S���T��	�i�L9�;�b]�����.H���G<�Vv��w��`��xiR�a~���ʅsH�$g��ۉ�_O:��Y+S�^8��Y�X8�	�g?X�5B��K�"��1�t�*��,dd�8O�������H	+��ĝ�:���G݆Ke����Ag��?�\!?����z�t�O���RwB�;������'6Ԭ�i�U�� ��C�Mw���ǀ{:�53�cɎC��[�h�� A�M��:?��*-���ԝ�� ���Խ@^��|���!p���]����� ���*���+@�!�!��u5�6@ �/�-�l�J)�MV����b�w6�ts� ������R����1s��5RwJD�,b`�b�%�Jg��X��,��,�ӊg����$��W8��^���^�qoD�ē�2�� � 6y��qg�(�#�+f�!=|��g��{��ᰲ�"�8`���2Yk1Oo?����"���g���u^�	��jM��(����yT�+E�4P9�XCk#�
�� ��)�5~��t�yL�$e�,�1�+3����d)BTc���#8Y�z ~�z���[��$5O���K܎��� ��$����y� ���:vx;Y������<�oD�x�����X:u��,Nr���1b�p7�@�:IX@ M��u�YFo�sf��̼)�G� �	Nc��G�f�&<ʌ���>JF�H<�ȮY�O����έ�	�pƓ)��$�p�3���o��IA2�z8h���㺞&��.�`��2N��R�<�2'��diU	��A��s�o���?�}q������ t��G�4��Z	�FF�h�=X�cb0�Eَ���K^E\LH5 \��b�6�&����`ڋe���=���na7X�1a

�ﮣ&� .�H�wĈ�Ό�p�'�[%t�_�8U��ӗ��G^����/bkmRߏ)���Bkϵ&|��wx�]M�^ �U$�w5�;0�c��5Ҩ�㦁I�d�����f�;M�����b)�����2�n��x��d��y�G�6�q�%�������4b�%_��zf[�M����f>�ܷMJ���U��/�i�Ϳ���,�� r�����3Ĥ��>3¤��`_�rSl��ۗ��l~Z_�Ǐo�/�P|���.�.�@��o��b5	����	Tm��Ĵ�NF�AJ�WU�Q8ğ�W�LG��w���$�G�&��&���`AZ�ny�	}	w"ؠؔ��$GJ� Tv�'�dh��re�r�OBg��=�:D2�t� ��8��{E�5��BZ�g�L_��7����K�Ip�GF|�GZG`��A\S�� D ���Y��� ��
O6������MO��M�ŢL	B;�0�6�)0*�6�20 ���m�_g�~m�6���v p0��+fa� aY?�=�#�"��������� A�!����a@��vb����	������D)�Œ����gŅ!�D��G�>=�a+���Jy)NUn~�
��o�"у�z�P���H]U�6h'\��k���n~��n����:HW�Y��?;��~��D�8x��t$��T�H�X��������M�&�u���Aw���Dg�=�J-v��s-N��~�O��h��>m<DU ���us�4�<k��_�����9��@O���8���)'�����    ����T��?�}I3/E3��KN�x�\qO'_
k�k��}���x��*���Ȟ�_��[�Li	��'����k�F��x̷�j��_Ǫ%��9�Y�Dn�B�D���y!��9J�<�'��*2�r��C����K��\,(s��Ȃ��	r2'wX��K�I�F��8�o�]�y^q�r.�Z���P�F+,&��{�2jь�ҹ�hv?��2�W���@'�*����o��z�D�?��˝�.U�`9�GIx���n��J)�cN��W�w���
�y�Ĺ���6��2	;�2g"À �@�E�������⍒u����Ip������6@�7��8� a���b ���d��)���jo�j��G���<W\O/�"�"��M
���E��`�'}.��s���J����1Z�l��5����0��œ���}.�@���iseɽ�*
~C��� � P'�B��H��3�:8L�9<Lo�B�!ڙ�<<Nw�C�?��䚏Z#����g�E��HK�>`�H�,1]~� ��fx����
Ǒ�ӹ�=�)0�$y����~I����z�S�Ƕ��`h;Nd��V7���8� X3N& �(���G0)���1˯.�jy�j�m3ڑFu#�N6��iD�X�	��F��64�|vom���������݊�N�ˈ[���Y���!RH? Ғ8�m�C��t����>�hwJ2��4��y���8 [���/������u<5�9w_C� Ύ��2N'�,�� �I���k��ZRش�i�������q���S}�ޯ���8՛Nr�^�9=E��*�Vᾤ�l�B���zF{�1���e��Y���TW4������_���pC�9�4z;�/�E <�*�J�uM��̥�F^WCH�,�!�"s��AZaQ�+=A,�Gfj� j��Y���r�d��d����%[4�y��R7�G�f�M��:1����~u���~8*� &�a�����O�H3��ņ�|34�>=^�G 	8�><�1��[�T$ �Uk��
D7j�u�B����<��7�k�EXJ�cn�����G/�͈�1=�{�Ԡ���c�#f����y��cp���F>J`�#k����0��X��d� b`1#Ӷ�E��:lqmY��k	�e#��p���Ml�X��NW�۲�zog4-�?- �4OpI!�B�FS� bqrԎ;�UJ,)ᖉ�w�5�9���3у�En"!L΅f��b/�A��9�$����&|�e^[�r�DCO::~u�
�ا�G�0L���P���+X�J��
�֤ҟ�E�H�&7���+�iF�"���{}�ݻ�k'�E�C!�:����[��|�8��;��S6�B���d�d䰎6�g$ �=y���@�la��b������(N��8(����@	%�A�[%	�~���٠b���v/�lP	�J�A�e��v6��@��`���J5�o���(X�em�I1Zڃ=W�p�%��B�Y���h���B�	wXBF��B�	�B�AX��O��|V�<��'��*P��)a�JN�Bƃ�BE�m2�"Sd��՜:���N��jCK����k.���o;��+�6�8i����\��=DG���ݺ�l7�^z]O��,�SiXP�3Z�ec1������I���I�W�Tg�%�ywn+�W�e� �"�y���sD��x�[�gS�{��;��X0�O��}]��W�#�'&O�ښ܈[*������aK�@���3o��?q�$��0�Ȩ�_��z^�j�D@����.��Dbr��B8x�@"1Yp ���q�#�%����j���$�'�7B�Ej�l@ю���i�I��C�3x0 ���A�>	,�(5�����o������T�'j�` HVj��k �ǅ�HM��ܖ>�V���$�C�RS,�f������e�ߝދSq�AP��	oz=��QB�����Q����mV��X�������pU0�A���>�����!��6@�D[駏h���_1J	]"㫣Z��_��A�b	�REx�v�m��be��?�o����׵���e���n�4�d���Rm�ޯ���Уz�R�)�:ws�zPEY��q�=���k��!�nۭRZ���)��k?r� ������ǽ�ܰ��R������V�ǮI�[!��+=�����栤M�R,�W�qx,�W8�/��VVش�� � ��s�v��������?��p�'$�)����� �Q�c��C,k1�n!7�j�&��N�\^���!�/�������'+O
8�����֌1Tj杌6+HD�N�����C�V� �X"�V>��}j�*��|���i��X㈯�'�tJ�Z���?��ǽ��-�#���n��6��@D����a"�������~��Ï��
}����H�4_D1A{�+�^�>����%?��_�<�ʮ�	���~*.�f�4ZEoHf�V��炚:+�v׾ Z����e�;�p�'s���AM�JH���u�����yiq��KQel�4P~�>�k�d����yϛ"�J�H���6\�H�{ʹ�c�P�ማ�Je������U��%������J8.d$Ӻ������F6���V�`cUX��;�QF+������������Y��K��w�x���M�:*�;�K���T��T:;�OXB^WP�ni3�������Үԍ��.��Ŧ��n$]l�z�8���>���\Yz�I��2�i���	��
��v��q}|��)�����h�E�9`��S���	��{L4h����o���:����5=@c��E���s^"@+���u�Q�w �!(��t��¶zu�KQx�%��u��"����KT��|v���_^
���K-b�A[���|¦s�8`�No<_{�G~��j�RJS>�&�XJ���k�fD�t���R�������2��0:��#JZ�Lm{Ɣ��K~y��_���;+e�R��)�ʿ�}�$H$�ʜ�:�|�h���c+��tw튀���#�=�P?�Zá*�\yW�9]�
� �Ε��y=u��-���J�dQl�� -,�����'�V��c{���$��֐��M	�:
�*���f@��0	� .T);�y�W��I��F[��}G���l���m��WL1Vv���d�����K�t�Ŭ���~���1_�� r�x?h��"�_�p7����T*cc��jn�j�XU0H\q\�����j�;��B��?���%:3RE e�Ǽ��R��2MO�;&�Qq�[A���2��V�<A{l��2t�8������w�WmQ��жg�d�JD�)D:�:��q)(F*�)�U�������5�A�/���F��s~=6=�Ő�0QWm�~Rd.��U�MS:?�����.E3~ `�?aÀɍ10�:��sk�����>�YA�&����]�N�2-���dXc�:,��R�u�|2�W!|��@2��iT�4 v��_ן��-j�ݩ�J^3{q��h�M�n�S����R��=ޕ�p�����M7��=
��B���2���A O)[}��K�U��R;����)����[���DH�ʡ�W����U��Z�}S�g_�^�u=���m�{c\�o���//`�/�V�Nes�B��:OR�a[�ҏ�}��_�v��4[u<�U0���U�ɲ'�J5�+(`�LY�]�&�+���_�-�����٭�):�(�};�m���ʌ�P�h��~5趄*��C��^���d�K��a�4*>�a�j7ۗ)B�4��2s��Q�����{�t��Y�6=���'�x����=2�H��g�Yl��JgT	��̒�73��@O���P-v*h���
��e됮ZyΝsy\�������7�u��������TTv�a��g����j��.�q0*��iY�q�.<r-�
�ƛҽ0�	P@luȿ�q[�����;\XڵW^��    ��v��G���� �AqON?J���_� cE�8H%�7jO;��d��|�� �5jp&�� +V�#�����JS5������_��ej)��
�C���m;�t�+��0�(�	��VJgn+���Glu)�ozU�	���{��m�'΂ll8��>E�T���°�88�r����Ǐʟ-��#�*��Q��Rs��q�0Wu-Cj��c�W���o����#}�U�x��S��G�
g`��f��ͭ:�1�-8Tf�7��L8�I�½���כ�Wm�м��F�+u�P��8JWiw��mjbWn��]b}��\5����uN�oD��,�'���R����z�ԬǮP�R���Wy̸R.�Vh�kW(�����"�XJ��1�D��1T�تȖ�~j��*3�R��X�F�?�����}l� �L�Y��~5 +��`{;�W�¬�s���r��5��׾�13���B4��a�F�u=L���{̝Jr��w���[pM��-�tԾeP�|����h��O�o��@����hOت�b\���;�{��ᆷE$��1w�j��e��|�ʶx��5�4���Vmڕ�����\t��u�2��1��G�R3�'�^�q�#�F����1H�d.]�Dr�������
]�Eo0'W���@��B)fj f�NQ0���m7���3�^%�$b�ҵO�{f�G��E�"�-�)K�M������bc�ݼ��sD��P'L��{���m��u8�Ƃ�)O���#��~������R2g���?b��\�{JqY�5.�)е�� X�҈j��K�Es�}��dD�Vk�s��'��(x-�Eu=�����)	���������R) 1\��IiS�ӕ�RW֢�s�@���J��yp��p���.n%9�%����K?~�5���.E$2�QnQA��/,>+������O�<H�]S_�i�l�U�H�����$U�ΡT{���%���>����ƏD:T����J��f�u�x�����be�՝r�3(�@c�p/[�����w���6A��I�Oz��}�;�8v-tGTA���tD�dE�����9�����LǍg�u u�K��#�Yu�����J�Q�re�d�'���;�{�y�6���sN�Ofw�F�Pamז�k I�^�\:�ck}]��v�)��w�J���I�F< ��v�I�p�D*%z�ޱ�ڀ�����钕������(C���$[}SF��;�(UF��%jg��`�)�2/jw7���9M5T�rK�V�T��Qĩp�Zo}�P6aŝ��4�\嗫��r�E.�4^���Ui(w,B��������FX�4�C
>���^��r$�"�~�?Y�3�ͪ��N{'�)=s������'�����z�������H�����B�H|�a�ǰ�u�>���P
���J��+H��6���+>�ZԒN1Y��SW���-@��;��	��J��}�tU�-�+c��v�jK��m���lUacW̜l6=�[z���l�7u,-�CD�a+Os�^�I"ٸ������Z��r��D���A�$��<թjRRM���M�W�P��C�d�Sg�B�Mj{��>қ�/��K�z?��-8Z�+e^�NG�����ά��6��W�f�a�&Ѡ�m����8@���)�]m#�y�S$�ӌ�yx����9�-�0��Z�8���\}�J��f��j[����mKW 
��V��%�Q�\��.��j�`�8"�&!Jw��
��*[��V6�hF4�V/��.|��>���_�r��WԡI?��{Ѓ�1l�E���Q�_O �1�Q�Bӥ�á�c�	s��\w�����O�#���t�v섉���������cèN��|�\pA-��1'�ŝ&�J���bNtJ:�sT�&�s;��+�#�����;a���I4BJ�&�����cN*���3<ᵨ_k�Q=�bY�c�s�I�աy`u'ܥ��W��~�����B����6�B�=iTP�@�t|���-W0?h���#Jx�M�"'���k,��>�3��KN6L�]��8'<]ag/���Qӏ�ξ��X0`*��|��s�-5Ƒ$=
�ť�_Y�h��w��`�|��U�l1n����ӭ��s��n�fz"���l�[�G	tU��`:%B4C���H��w�:�3�#��M�ꂗ,��p����:�~*�BSmpgv-�p�Vo"�����-UKl>��H���g��Gp��[��uݛ��S��hh���wk��t)܈�Cu���)�["#OW[$q��H�z�o{�~�8�E<]��G;��TK��Eoj�]�%4�^6�����h����x��	��GB
Fx"kh���k��n����9�.]UH�)w�'��Z-6,�D*{W	���o���6xo�A��8�HG-)����Bo�V��S�d]�%�_�Rq�/�D[݈�c�H�R?!�$X��񑾊����t'nK�č�A�ݗB�M�����}
%|U�Z��v��=� ����m���.�zW+����@^�G�Ǐ��+�
��N %��&�v-�hղ���q�ZB&x�����VN"�ru�P���B��f�h�z��3i|�J5Ε�:B2�i����Z =�̱u��\^�U�)����nO`�B&��z}��o%խ�R���l�$��[ME/YIo���.�]B�C����]ʣ.��L\�a`,j��N���(@v�p|��}�REu
�}}��j�.I���k��N��Z���g
��b���Lki����	�L�io������m~�mi��(ݝ�=n��_���u}.����Hj���b��r���)����_.�j�E�f�c$u,��,>�����ᾊ�x|�V1&	Y-Y4�>�%����ݻ�L�=m9�����K�S��?(��m���/E}1�c��X�	�$�*�j��ywm�z���!G �!��j��.�]��B��q���0����n�	$6J���BU1o����]�G�B�/�/Ŷ�j�����uBp�z<�R2��X���Σ{����Xێ�[�VZ�=F%�4�>�w-�����Jf���E"��RrQ��q�W��?���(�1�n.h����Υ�g�/}��Q�c��#@�h �+��4����+��z��o�?OEi��i�kX8����C_�)ު���b�=`��xîF��X�9#�;�ޫ��d�V�"k�k�,�)E2o1�}:��&��D�\{�k԰�bD7Gr�j3��1�9��=�1��um���D'�m�uZ_>�1�e[U�U�|�$ �h����ۀ�#�.Ap2�8�b�%��3���RR��6�q��$e����`���]qZ�O}裺?��6e���:w���N�q�<؆KX���~j�qϷEesP��Dj��Ep8B���E�5�y]ҩ
��qL��,�j������p�7�+~���ī�R5Z�NRg$��ׄ�5�!�0.ċ��U�r$�^�
�\#�[����!�x�0TN]K�O|��9BI�]�kJ�Z���T
7JeaM$v�+�R�2"�����\��A'�V\n�Ո,�	�^ʹ�ձ���K����
-R�x�yx�t���GN��)%�{�t���tZK�ۄ�����͡M{ĩ\J�ݐ��U�@�^ �f�o�*J�i���P�m��x�T��a�Ȅ�uş"�(��G��-j�YI��A�x��_;ǅn�k��Ӣ0���.����#B�D�7˚[��!���a�ɺ�H�@�337R�/��2׌	x�6��+p�C1(g��ֿ��+EgH�����Y�"USEiªf~  �bP����E��#�L�-٫7�/t�Dk �E�˴TL��	�S�^^��w)�Seq������G"�ˠ��!�rY쏂A �rL�/��9�kp�oE�ב�A�l�m��o���@��M���]�3���뵯_�_�ײ*�_�tȩ���Zz��
ᕃ���%��pv�@!�r��������;��	Y���U�
t��"�`(�g=�E?CA�ٺ��;�Dl���˳ԈP�p(�Y��@&�6qA�ԭԹ�    ��v�c�f��o�
��p�����\�K
5ѩ�;�;w�#��G�A�?� \«l-����ĺ34G����>�JF � ل�ɱM�J�L��&���y*4��W)"&҄���eoh��/�j���k\פ��?gKT�:�A"W����|)���oU�\5Ӗ��סP��7@��R��Y�2:�
�	$�!�i�8�3:^�*�.��$����$3���T��w�/D.݌�����F�5)"��4ru1��j������i��ǭ�5(��(ETF�Z��js?��6��R ��RQ~<�o�U%�e�ԵS�!������r�Gr����S�F��|Z[9E�P���],｝V9�!n:p*EQ�&+�v�/{��q�|�Ӂ"������=�*b6���<�8OY�Ax���A��~!�H�ANU����Tmf\!�O3�w�R���'�3�<��r�w��>����K���$QԹ�"&$%_`&WU�=!r`�v�wG�zW���^a�(��p��v�X�,$|:�{:r�c�C�S]����K�U�����V�LȽ�Z�i����z���Jd�ڗ�K0Z��{���p��[��Cn]���ի��6��|�u�lC]E�ku�`���R�Z��_Q?����;毝��k�Aa f�z�6�I����]W����-�V�L��U{���F�L�=��{���l����-�GyW�[K#�A��9�P �c٣hh���h3��	~{�7d��az�]�A������[���G��P��x�YD���y�W��k�т�wY$��%#+[53NzTpI4�\�7C������z.��x���<o��E<�+�+P�(��E�E ��&0�x�yYSo��C�~�X�Q�����Z�z�%�ES����fK��>��_�X�춨�D=��i[��װAn�*��|��N���6Y�,0��`�L����XP�  ��� 9�����l
:��y�64��2>ƃ���A>������;�rn)�k�ދ��2�ń]H4��L��&�O0a��?τ]�`B>�	����|v��	� �J{�ȝ\�X�Ll佂�c��d���İ9��t�]P�x����1�O�g��'�0/����Mg�j��z��κ�$R&izr��'ij�<��
N�L$���0<��H��ֽG������0E,�N���y4�ė���_�y��qfp���A%;�?��O�c�+�wR9(9aj=�p���^[®�iFe�Su��τ�6��+�=#�
'�hO�zm�ȴ69+"!�Φ��I�DYD�$�F&�R8B�d_��]nS#�3�<2ٗ�E�A�����U�8vu.rԐ]+�У�U��_�n"u����Q��b������2���S[G�CJ\��q�X�x� l0���e��m����m]�&�����(_�?���]�y/�þ�75�:�<t���Gh�Fk&'�6i~3V���8�*�ӝ��^q�Rѐ�\u������A�dpëGG�8L�'e�C�� �NiƂ�����)Ѯ�ܠ����Η/����Hfh�!��H&p2C��i���Lf�	S����4L)�G�}�˾�1�N��$L���/��I�����(LObƢ�՚�)mp5hЛ^Zg+@8*'a��gxQp��,��0���a�!x3�ʴt�Q4�O�!�}�EPMw��
0�u)���|U���<ܷ������'��qi�\�?8�y� �
�d�hi�a��.m�Ձ;L��%�6�F;��"�+zDW�������ݬ��TO�y�q&>Q��K�b@��m�xί�o(�> �oϜb�͠��	�a26{ʸ3>��r�R����F/�o��cD0��?hY�	BH�Ǭ�9v|d���5���eq���/͈�3�b2��,Y#����1�tAӓ�%�䞗����R.�@�b�v��E��T,SӜ���u�ĥ4ǒ4V��xv!��3<P��'�G���5��3��m�@���"_]�D�I�:
���&I/W��
'�t1gZ���r�c�@�ݖ�RQ��[�c�"�j� ���Q�
p����D�	p���sRQ��!�g�'�D�!
Ԟ!T����@��w�D�� P;.���Z��'�"TpR l�v�k���Qx���
A�B`�Zn.�� �����<�!�r�L�5� M��X�O��I��s���x�ă4�cr.�8&bZ��ԡ	}|b��qț?CGH�<P>])HR
<PWN�y- I�@e9H��b/I�y�z|��i���@�������@M��⛘�$�	:�-V�	�:��I��$Op���.ɱ��	�<�ğ��$YL��y	1]�c�d1��7��i�$�	���oL�,&��[|�d��ʗ�
z��F�v�@@�")!@���h�'$�"T�Ǟ.�	���_�~^�-š�l�Ӆ8�B�ΞX~s�$�2Tu�_{s\a��\x�`�Tb���!�
LJP�)�,�MIv�S�<]pS\��W&��Ԧ$�ҩ�&`�Ȧ$�ҩ�\rs�Z^�Jj��6����N��&$��SU=f��79��r��v|�4;��CY$��?��wF���z��5��
�;:�t��H�:�;�𗦔X��Z�/��o(�$�T���s��&�ϲ��i�8������C�丣6�
s�S�ke���Y��л(#��lV����9}��D�a̱H�F˞v�=�6���̨���-�!���0�a�Px���ۜ*i�$�ȵ6�$͒$?}�M<����x�r�t|K�=e��F$���x��F4�t�Rr����ꈫt��ra�����t������tIZ�	�iΚ�������bnbB�NPV�	�:,���>0|��?����	�r �~��Bf!-�/��
��c:�/�� �c:�/����c:�/��/g"=�,���W1���!A~L�e��h�	x�"�&�� <�VjZ�LP���t�_6A�.��(�O��1���$&(�'yEk
 D+#��*��8@��>WG.�(0�̵6�dm�ڡ��,d�P\`��k�.�(60��5k�dB��\�v�A&�~�k�~ 3����&(�xA2��h�:]6f�Q�`MP���2���	�uh����F��l!��(��R�#dGE��r��Lj���g#-���P\!�	��ll!��MP`��2�/���74�BOq�����5dk�	zp�xCF����9ds�	�nq�01"�g`F���u/�JAK���6K�-�Sԗ���hq�����/$���)*p�$Ӆ�b#>E>���I��U7�̱I��-�03���s���Sd)A�j���Ud�q����xEF������TK�W�}d�"K�h{�݇�/2�_��W�}T#��Hx��3��I��g�x����ꡊ�vKH8��Sc$D/N�ň4�0T�G���F02�`���%Cb�X�0FFa��B��8c00�eZ�?�/F��j"�g��D�N�r��"E0F2��q�Q���#�V��~��)t��v�d�k�9��d$�2������P�&B�%#)?��$A%���2A֯��z��S�bC�t��?��)����`����	9�rF2�g��$�c���Bd�D�8���%�Ę�;q���@��S�m/����r)�$���S������K�*���H�l�}e(�v���B��xɝŅ���c:���Kn.˄<s
>��%��b�9�'G���AӜ�zDɒ[���d�L�L��&��� ��$K�3T�68��B
�d�h
��&�;��%��i8Oߵ(:=J�ܵ&���~�4�,��M�����(<:J����܄=P�h&K��Id��%w�e%�ė��t�}�Yq~fKť|$(���/ܪ��-�]���1?>~�*��������W�Oꐹt���ߠL
�>�.�O�fP�}�.�9H�׾�t��#�8s}�N�܆'dX�V�4h�M��|��v܊��q?$���t�mv�<�sT�%���i8�5[rC�%�Ol��Υْ�?    &���h��>�:�p��,�0'��I\g$e�;]8e�딥��\�a�BK�LurS�a������MR�Le�]:ǋ봪�����&�q�x�}��v�,1.�y�͇yq?R~ͩ$4�s���kN1�).���ԑ��6K��&�q� �͒��Yy����f��1$Cn��"%�͒;��?k��@�Yr\6q�S� �,��-��ȥVKnr˥>rI�Z����Rg"O�X��>��EΜm\��w���P�����rG9厲h�{�ŒK9%��h�[ǱDϥNr��ʢ��}���}��[Y���r鷜`Y����B���Rd����M�֖h��5�2��<&�Ȗ�t�i6q���-}K�sEٜ���М�?s�k.�.�Z�)���E��s�9�^3��n8���fHYڌ-����Y{!�~3��^�dr:��p��
�^�A�آ�R��<���/�_}�������nW?[��)�n���V���<����TY�Su ��oSX>�S� ���Q����ڠ�� ��7�p���D���;M_�){�8`|���a�8UA`|���Q�xJ����+�,	3�-I�ߒ�i�2�C��xj?z�t���w��?��@������3*Z�;1��Kt6/�;1��Kt��^U�g$m�X�b�,�����$m7F	����l�	�}XӮ$7�1���Js0}� tg�b~RĆ3�|�����;f�	m��Bl4b& ��`Fٍ���V�f?ҴF����n4���p��.6�f<M�p�^Pyf���86�O�Ө��a�kNJ�(x�4헰�U�����8~V�}Оh�NƇA��3%}�i n��
=�Yن7K'S-���.�k�Ha�Vvb���FPu
���.��dI����Yjy��3�`�,�<��M�j�g��9\lO�9����X��LE!X2K�~ �ؑNM�שC�(�%�+�e�5������Ud`��*�'V]L���zznB�,�M%X��^�L��2	,y^�/X
AP)�<��+w ��K���'+&ƴ���((&ʴI��6	��PP���X:k��������t����-���t��Ր4k��� ,��G�b���5c��"��z�A��,��C<)/^=���Y�R�b�D�C6k�/(Ol:�2��=�$11��!��;�w��d{J�e�󧈥��v�gϟ#N��Õ=���g;k����������,��=�A|ƆQ���G�Ԧn��β�Oc$��qP�:�<��P�1�N���!7hg���d(��X�of��f����Y[Ģ)�RƓD���囲T�r�U)��bE�R��k�@�
�����Df��(U�X���_��/��R�
���|���>��H���fn��݅���f��l����q����,�(.��Y��r�2�y4k����w���Ѭ����Ē6�h��ɗ��7�h��i��lA��<��SZ,[P6�f���dh΋Ρ�k�����t3�8�������ҥ�K�h��h��h��ٞ�e��)s6��Q�n�I���R���� 1IQ�y�ڟL��0,@OO�R���)o�� E=�隚�8��SQY\US>0g�z"���)˗� ]=���5%�r����|�(��Y��^��M<H]� u�3xޏ&i,��?���$}��ux>�H	f�����YA�����̐�!�y��~&Q��8ʅ�<@9/��7��A٭�h�锜��)��� ��a骂�U9����*(/�� 5����Đ4���?��MI��0��D�v��ɣs��2e�r#K��ň�H6�?�!i�n��/m�ۯa�=��)(����?q��I�y�� :�{G6�A�H/w33C�dZ
��L�M��΍]�]�Hz�Ȏ|�p�kRR�$7%��e�I))g�9�����])){�ٓK`:${���p��3R*�$o��))��ٕ?EL����OgRoF�忀�M4��42&�]�obL�6~�H�+���x��_&�RRv%��U�$Z�H��YU�	k\I���*��k��@c����|��LIi�<~V�/��))C������5%%k��Y���y���6y�^�`0�&՞�T�<��R;u�T���_6�SR�'O�M����ɓE��i�lO�Ls�������g��ʓE��e�C%e��dэe�DQI��<Yt�Y.gTR�(O݂榏Nߗ(����K?G�̉�^�>{	�-�q�鳛�s���S�>�=}D���4S�>�1=�C7kK�\S�>�%=�M��f�5�>�}H
��T�>�-��*)���n@���JJG�ٳ[����7m:ٳ�Γ���~Cy�<[��5����$�EGK'�JJ^�٢ǣ��X%屦"Zm��ͪ�����\�����3�/���[���I(��7��]�������7*٢g�H�&�m٢ǭ���I��|h��=r-�J�Z�=t-�2���٢Ǯ%_����#6��>V��	$4�E�^?O���d4�g�á\���g7�esq%��ͳ;ޢi��n����}�g&�Jr��ͳ�����gW��g��e3k%�b��>�`�����ٍe�|[I��"zv'�@i1��#zv�+*On��+�g�����jE��*��ԕ��+�g��E�v%%��٭b��A�i����*�f7>�UPJ����*���+�g��}%%���٭b��_I9��=�U|����V���*�?u���l���/8�6��E�#�Ef�R;�d'�j��ݏ�������E� �D��$%�6kIL� _��厵P���M��n���`�E��$ѳIX�I���9�c��@�0��Sć}DX�i���	b]7e!��+^b�����)�gK�@K1��3D��b��bN7'�^M�MƜm����d���:�l{�@2gm顾Yh�o���L�L�-9\�IY�I���̰��sk�˜�%�m�[���Y[>�d;�@;3gm��b���͜�e�K5949sޖ|����^-r o���\@#4��`CO�{{��Dwx�����+�ͽ����-
�ҥ�~�j�*r��m�H��Z����ԟs�����z��+�ڪ�+ER�}�v3s�d�=l�{��92�w-�w�E�[�a}:w��޺W�^gwGk��rp��[T��\B�Ľ^�k�9����^�w�5�8��Q�4@�^�E.}�v]�!�{��2�����E�� ��"���I��v�W�/��7���\v��6rW��rF�~r�~r.�e�.�咸��-oԵ�nz�/�`�e����eۚ:�'��!�e�>����\v�z�%zй�=�7�K4�s�-􇎿`$�-��v����	7�Y ��ˤ�\��S���䕾m�m�\]&�t�_��_��2�#�%ur����˶W�Bg;W��U}[�%Zܹ�L���.����e�Z��w��w�/��>��]�����$�� ���
��\wˊ��N֨��Ët�Kt�s�-^�U^�U��n9��ߝ������6v���kF��Ey��w�nz�nz��e��m�m�\w�u���%����>��^�ў�n���d6t�s�-��;��M�� -�-͵�_��Е�M��׺���}n�%��wnY���[:l=��x$D�=7�R�ڛ֐'�s�<���%F�4ݒfo$�˵T�2hO7gS�닡[6�8צV4�[j�u�K��h��9�����b�4�lϐh�C��_^�t�f1tK���D�C���循�ѐ�0@�]%��xG8.��6A�_R��.�3�HX�[º�j��ׂt}�K��w}��7I@B)H��n#$7�t}x��o�K�u�����:�K�Ԅ��t},�7w@�}� ]�: �n�J�>n��D CѮ�V�Er���v�Kk��IKR h����X�z��e�t������J��g%L1�_Vʭ����/)e�2�Y���J��!+aց�������Y���Jp�/Y���J� ��v�뗔�MD蓓0A��9�~D���2!]rV�Ĭ�V&�M�� ��Dt��	م#	��I��������[�.9ZAb��`+s��f,H�Xle޹԰�a���9�'��7|e��T0�g�d��'���×    ?����M�Yc�7�᯷J$��|��_uq�HK�A]ޤE&6HLl�ĆO����A6�F7�/��ׇ�R�����8�I��/d<�s#6d��l����&N�ހp��{Q�MqXekͣ��{��}��_a2��&3���W��0�AxV�-�wQK�e�zS6^��=�����O�T�����&%\(^}�`:o&§��0l�������@�r�-X��{v�a���+�-��v��!W\|�9��\�q��u�9� r�e/^ӡ�_�L�.�� ��+�nU����wj�] v�����
������zj��p��\������Ě��\E��j+����N��j+	����+v7x+/�Wܙ��/�V������w��r�F��̮�2�6��k��|I��+F�[��a�/�A��=�NE�Wd��t�+t��"\��\��\�Y`U�j,��7��zE�ؗ��������~o�~o�W~��n��n�W}�n�naV|7�2;���Y�엎�`t�u��o�v,�u�߻�Z��Z������
��l�ﷶSn|��ha�����M��~t9�u�߻�Yq��{����
���l���lJVhJ���=�Tft�aEf�(��6X���k��U+RB�o~+��aE����,���քX���uR�sͯ�8\������
^�۪�Ъ+�Dޱ'W	��ݯ�V��V�T��˶��I��V��|���W6&+�8�"�ܽY��}�a�a%Y��]�^�^%Y��m�w�޲��U�\���n�eU�\ܷ9U�9U�\ܱU�U�\ܯ�T��T�\|����*�+��b���TL�Pq�-T��^��=�]� �tw�\�B���kx�峻Q�=��-�^�Y���Q]�t���t���2P�54��c��=~�5,�����m��^�ͯ��5$|���fE�o�T�|ɆG��GɊ�Y�qss�Bs�dE���v�m�.FɊ�ۧ�j�3Q�"�^�Q�Q�"�^��P��P�"�^��P��P�"�~T(����"�~P����������o�[�㿩h*A}~�����倌}��<0q�q���=�=��;�g�2h�kƻ�ȶ�)t��B�ݧ-��[�&!�`�릫��dߜBߜ�˯������sF��s�U{M]gJ���6~�m�:��9e��{�Y�Lgs��9�9������"����m�����;���k��o'���*�[g�6%������k��^��>:��������7/��0���v����_���,!/�֜�^��N
�{��4�su�F?���:�L�3�FW���
rp�~<)����Y�G��NJ��i�����r;mn�]j4�I��/}j���5�UY�viʃF����.����N]v�m���x����?�[�[��'���'������I9�����`F���Z��꒵�Χc�3Е�����q�E�H�kT�����z<���)IL�潒���N{����tV�&��o���8=�O�" `#���|�;E�&:�|^���9�rb_��lta��I壹����C��.�J�u�J���'t�Ie�I�9�������""�7xksyC3��� ���TԌ��_�PEӒ�>~b�]��>4)��W�&�̦Ѳ$��_t��n�?ޢ��W�i�z~���i�w�4�}8L&�ǫ������i:�~����25_��������i4*I�S�6R�{�UV�~��?5������p�P��Ok�7��=)�7����5b�`X��ξ�H��#ϻ,»[�|b�{�cs�poO�鸧�Su�v�D�dq���al]��H��z����a�P�'�q��HS����c!��]Zs��_g�h�PC
��LK���w�]��Rp��w��2p����M����f����$�<;k��~6�<PC
�8��v��<����Z�w8C��� {Ʒ�ԓ$�W�<�f��I���� ��!�	B ����<���-}<'������D�#��F��x���݉����iW�%p� �$������")���%��H����z�5�	�{Ej	�S.#(��(1��!˞�1��]��&��C�YH ��+�"��Z����;�^���]��z�8���Ϻ�HT|ID�������������ޏ��x�vw���nm?�3x���0wFFP�|i_ ��*�W?k�W������!��J����ϫ��"��P8�UT�g-$��A�4�r�h�~x&A�,F�m7*l�����tT��>���n2u���'�9-1�9֖b+�	 �x<�����tFz���s��\�v>���a����c��z��1�%�rQ�e+���PK)kH�]C�X-��a��B@gl�$t1'�4���ޅ�� 6^�7��v㵴�r�[�8���O%�E=��x��6]�؎w'�8�EW ��ؖ�C(/�&W˝[���M� ���²�3㘼(9�>b$�c������E<��DӃ^��AK"F�ֳ�;�_��w�Q�e|���ѽB�OL����x5~?޾	Q~Nϻw�k����,�7�����|z��M��?fpvE�ӑoϦ�ֶ��r���;��
 �Yw��F��#�x�|&�}�"�������D姣��$$�F{��;ڴ�?���ښE����x�����v�vW����O��F��>v��z~���r[�H,�^ꆞ�K��Jn��/Q7��Jց֥/��r���������$Y�Ҵ��!�T��e���:�f�{ ѥ�u���b�0��Cm����b*U؜�s&�kL��P���.��R�:��D� :K����֞���Jm�h-#@t����\�v�7]��@���fڨ��ϣ����x���k� �I��y�� �J���{D٥R�⎫��M����f&(>�&���J���QA`�4��*"D����B�� \UZ|@��!4�J��;����{�Zѝe��|�a;.��������/�J�]�G�P�*m>lCE��pI��y��*C>lU3;C������4��ʰ;�,YC�����l����*�f�n�A\Y���1+;�<���:~&�C��j)º�$++��c��S(�����ټǔ�"k;�{��*
�$Y�	�[���Y��㳷��Y�dm��oj�� P�Vʻ�M�h I�vF����9�pw��ZK�A��{?3N�q?���o�qnoʜY.3Yp��{��}w�_���Ó-�����{�b��l[�����d�9��)�~���_�!M�_�^�G���ס}	@>�޳յ���ν-�m>��܇���kl'� ������òo��h�o���߄e`�x/Xp_��8���	N|Z���͞"��Dd,Ci�B��0��7��������;�O.�s\��q~��)�|�Ȥ��rV%t�ލ�k��BI�r6�!��4-&��P�w`H���z�M��ʯ�f����X�<&6���7��h�?*�X	�����?>�ɭ�V���{={:�i�;��*~�0M���@�z���!R6h���&墡�%����yQ}v@�*a×�>�i)V�cߪ^��������`��~��.��Q�Ԍ44����w�7�=�O����?>ퟞ�_ߖ<�D�d��X��i���;�.��c�������v�7w��)�N�Ӕ5�^���)���/"��&��v��h���ϫ��sŦ�(���&�����Uf�+ևl�d�)�Ďo��
ڰӏ���`{��O��q�竘l�X3YGV`����H��L�L�����oǥ
ǚy8~y��#m2>慠��=���[�������6�Z?>�_�X@	D��_e50T5/z���C�Q�B�VS#j��T�*Q�"5/���A�(Nj^�V�e��3J�� Y�s9J�ZPYe3}T&�(��*')B@5R�����8@g������q��D��?���'{]�
���[p��Z�N�3<�B����\C�U��VT��(�P���9UI-t/'�A-R���p��Z�����ʢ����4�h�e�H���Z�U�t�s��`<o8������W��^    ~�F_O�Βw7��'����*T��ځ�P��R]`u%c������xZ�K8,pJxZ���5<�V�k�9�9��|���7��S�QV�j���WQ�6s��ƾY:^=�v����hnm��mH �Xka�l(�i%���+�)��x�r�6��/�DG����zq�q6=l�[ Wi�d㵩�Wm�t���*\mM���Ҍ�
iz5<��w%3=����w6L����g�۽Ӳ��8�ҘVU�e���_ZW�� RWӦ�_	�� f�*cq�*�!u&
(Ômh��� 
su�aUVg�`2�6��4L\���s��g�A~=���s�����"�]��Dc��8�\g�����!��I)�1Z�Ѹt��'f����q� �t3D��l�5���"f�Ơ35�+�{�!g��E����J&
�fH�����4A.B�H3��-�(E��.��b�!i�+G'�����.��LaH��������!@1\4��E(fD��ԹE֐t��c� �=�l)���������F#nqL&j1���h<-lt�]L004x_���C���0�c� 04���ь��F#0<����C�q��8G6�����FC��� MG9�����_����_�w�G;������p��Q5,��cX@g�a�8.���-��EC�d�b�\oX4�K�K B/�aQ�l�q�aQ8-�%�aQ`T]��A�fXK%'3 ��2,����4F��2�V@,[E0Y��2���-��ӎ�m�~�7D���?�8(ܱ���4*	t>f!v���E���YH�>�#����z!o0
:���f�L(��#�ॆY(*N�^ωf!<�[~�q���| dH�m�D6���!.q�,����i�#r��8�|:���#3�y]C.��-u :F�b��c	2P����ssq�@icD.�F
p��ƈ\P�X(f�ȅ���*P�������@����\|�J��#c�?N~��?B��X���f��P������ .12���b����������F<ʡ�02��GB�#c!�<��x�
èX\��� ��¨X��?NG.�FeB.�A5�"��u���j�5�/��=�_�n��%|v�E��q��ˈ[�-  ��y�.n3�����QXA�`ޫ��T s7P���*d�0��G�P*��re��W��{s�ۙ(�G0���mfӔ	��]h!M>P��ko��_��-?XP4F��o3��$�h�<��Q�7Z'}������&i 7��҇�r�1$��P��nMZ���tcX���E�ܘTP���pc�`{ؽ�w|��?p�A����E��Q��fB5nct������1&����M�aH�C[���"ɣ
ah����4��(�%��K���V�����1h�ӑ�PJ���=O��/��~�>���'1m��7 �|,�&�F�ϧ.L^���:Y��V�'���2��E�ɿ�����ux2���,a[ۄ\tq�� B/��2,C��oBUI@����f�;	�#��Ҥ)A���f^	�%�n�������~�.����`A$�X;vT������똕���H�WXǼ�xE�W�/������;P_5P��Ʃߝ�<��* ���1�3�����cҨQ@-n:�b���:gŎ�E�kD>+�
d_#�YQ��%�5�U���{V��^#�Y����Aϊ�B1���	t�!ϊ�9���BV�t�k�{q�.2�?x��G��� �ߋ��o3Qm��E����l�����G)�b���b���A��{#\�k�����k� P�K���9>��d�2�a�SA��F�`×�����:~�ug�>x:u�+:���m~v_�Mz��y�tpFh��t`��-X�ѕ�t@��: B�[��� ��+���C�G��נVt ��nw�7: o´�H� �l�S�t B�Φ���������Ʃ��(�5x�} $m>t�Q�J��J�ĭ�����(�b��L	`*�
�q��T�5@% ��k/CR�+?iV����{հ�F��B�#+V�wSy�1`�т�	E����<]Vy y�gp�8C����׫�G�緄D
$�<p<�qR@P�q�[*`�{*���׀�t:���6
��<0���0���n�D_��7�l< ��S�=�����e��a�wo�߾8aa�R�������`/IH�l���a�2@�~P`�:J�e���MN� f ����T3�����z�j`� s;��������7XK�-�M33����/����{����7�Ǉ��~�k7 uw��x������;��٬PoT�]2����~f]ycI4�A3Vpy�6�`#+/��2zl,8X�j.���q��?\~-q��[�����j{lY���L�Z��-3|Ģfⵊ#�R�#���ي��[ďXE�ƭʾ�I����洷�xz�/�M]ex�;d��V-e��Gg��
����Z����TY^i�Zb*Ȭ��D`2N8P^�yh��c��h�tk�}!$�gC�EH?��i0B�EH=Ҙ����@�����n���7�}F{x~�/�]�J
&��(��J��2�䊐��;`�*B3 *���Qȥ�@��"�Y��� �l��aH������`B&B3�,��1��Xm�1�끚� H�� ����Jg�fg_��7u��Am�Ă I"4�Ң�@�DX}E�8 &�2 -����6��j�E� y",в�@
EX�u��� �",�ۢ�� �",Ӣ�4@RE�z��9 R+�ri��%n�(u\]��1�v��nu�ܚ7�� ����Ȓ�@�Ex.=��w� ȹ����*J ��\Zr� ��%΢�@Fx.�V]��d��\z-��9 Z2�s⒭4@dF�z��9 �3�3 v�'�)���f�{�ڪ�OK�����&������7�ʰ�sDdp��w�w����a���,Q�{Ddd����V��@k������� ?$"CTW2S"�DdXk��4aB�HĥX-M��O�a���_���q�GW�����룝���1��wN~lp&27��4�$����ܾMbPM�!���1h&��0A�n�W�Df`�����$��fξ�ԒDf�w�n�$���$1ˠ�$�:I(2�$�*nޭ>⓿���_�i A�{��h��$�����f�L���y��O���ޒ�bF�ZP	�P`U̾U��L M&QŴZ�@PiU̬���3��$��T���D%'���*�iv����l���=��_l]t<�OS��F�x6� A�Y��b���h��i�Pl-R���/ug"S>J���h�:>2m��ɣ
�q�am�����+�!eh�n��ܐ���ެ�D,�c�=o�E����^�HvO#6����x���Ľ0���E�����g"�eY#�u�i:PU�ܯT�[��;�Ę; @�H���\k �!H��$�ҁ���4�t��4�  ��.��Ѹ����̦�ÂXka4��� �� >:���; �<:���(r;:���@����a��p!���l�65@������l��(a�M��q%��>$g��/����W5������z}<�L7~���)����!/�D�ɠ�2Jt�FPBJF�)�*a2J���8� ���/ 	b1Ji�	� 1JY���(��#��9�� MG9D`���w���䞍nq�y�C�;b��xQ����� ��4���H����t NK��^��tL�؀<��tH�v
 ���tH�ϵ-_Q�����h�(K�|ph?�VQV�i AIEY�����\==�-w��-��N�=N[ч)��O��1��m�Y*�0�ʊ�$r�mgP
��I�4�� b(�(OB�yM%�C�Ey��� u�I���)0�Z�'a��B��[�'Y����/�qQ    ��f�i�����^��f'h�(O���]�q�۵mKsn�I�h���@�EE�,-gh	20*���)AFE�#WT�$�èHrE��8!A*FE�Z���1*����֐$dT$)���LE��Q��F�i"����.���$AfFł8��5?��0��}�ǽx�C��[����JRsX��㢒֘�}(��d5�J����J^c+�Z褨U
���JY}f5x�z�JUct�HTꚃ�H����H�VR0�<�*?�����6�b���U~0�?< �1~�Ǥ��C�C�������!����W!�94=T�Q�=���*?P#��#�C�C����w�U~��b�C�C����@��P]
�d�s(o�F�Nǻ8�N����Z�<<����i"�4]�>}�"�!���U�	~����mu t0T�j�%0@�B��6�,T�z3p@�B�n;��@�B���<��j��#Ӡ���Rm*hH�Y�a:���G���P�P���� jD��QO�YȄ�R�C=B�J�h�G�ѩ�
��5&��h�t�C���P���$~��DG��t�A7�/����zݭ�~�����"�a���<�P��A�����A�ܔ���s6�Q	� L��Bh���P<���D��?y/��A�WՌ�܏ӑ��I�dB.�xHdv����0��������O}����l;��pu��;�~�~��6�p��H��6�=;�c֛���$fG.�7�.H@��jX����؉�}���n��°�r��j0;�a���+�̎fX�l�3��aXo,w(6� �4@��hʋN��ao?#�z��� ?t������<��������~0��a�{	�P�0��a�t�Ї0�]�`�P�0��X�2����ȋ���U	cy|�m�A�	c��Jc���0�>�:^}�?o^�8�MN��+�i��Z 
��v3�'T(,7� f�.�Da�1	1�%HB��r�bV�h�"��Dm�U
��5H�w�La��1�i�@b�r�b�R��̄q�1�����n�Wv�/���a2��x��sJǔ@�eM�?�l��@*2���6��g����c�&wЊ
�զe���J�s�&�q��bĄ���S�PYb����ְ*PL�/569�S8*UL��<6O*ZLt��4}��ń�2N�z��7]v��/Ww������JU�'hY&���v�11��t��Nο��{[s~�?�3v����t���[�KX?�4���e��M�0�$���-��<&�eVX`<� ��2ޣ�'P8d�_�g���L�^�
>(Q2)/��7f�k2�.�&ɑ�P&/�[I���2;]���>hM?�{���_���$@Ѓ�Pu���PBevPB��"n�����@	��
�>K\�*��*��%TfGԚ) %Tf���h�QBevzA���(�2;����4�PBe�6���A	�����/�J�x�{���n0"u�x|����|�~w�|��wc]O��{�_{��|7b3MzZ]�[�i_����4�����Լ��J�GU�i��k�P�fZv�U ԰�V��5,�J�Z�u?S���k��|��\��t��4����!_捇��z�#r�� W�7,��M�:���:���ߍ��/A��ݍ����=� Wg7:�����11#s(��·!��t@��·H���
ut>���q�ģM�7���d��+���"�P���	:T�� �:���|�yG�@DŚ*o%��]\]8��(c��T�GM����ɐ77,*ǜ���ӡ��0'�0L1�cs�
�7���˟�l��t.IE�@6R���I*�B[�{QNR��,�/2'��C��Ia�L!�ݍ��0L�hM����i*bC�s����i*V�#�a��*����F j�<�I�����n<��qq��ջ�c�z*�}�"<<#TSy���HB-��>b�-�	�T���Eh3�'�Qy�KH���s�H�q�PC��O��g`����>1��ʯ<�5��Z
^(�r�������)�v��������G��o��cw��<�����m-���~�T�����3��M����3�c9%X���󡇯8����9��@h��v�r5��}�Y�3m�m�s��h�Nб�y
H���9Om%���Ǜ��`��~�2{MݺR[��1�@�=積_��=�����0j������61�w��s�� Fm�a�^x.RƸ�|���Ej�>��������{��G��s�z�����ӹh�D^hB��{i�� �z��{xڣ����n:l2��0�28�։ˡ�b�A��%i�\BK\�F�q�A��%k5V�tG\�5�^;H����g�A=ĥl<>>��lL� ��G�����o�]��)b�����������i	��_��Bs�!h4y�[	��}���z���`A���x����ܗ�WU�	-�}��e�'$<<�U�vGy�P���w�]�
~�����g�}�q��>���l;�K����A��gI(q���0�E���)�H�����6�����j��Gȭ����jA�f��t�]-G^)���N���Ǜ���Քt����Z�����&׋���U�ꮇk��Z�}�������e�_+{ݝ��z|�n����f�>����?W�{{鿎/��<k�fؐ�&TM67t������a�w W�3|�*J��*sFlp�W�3r����Q[/Oa�j��|��^���V���N끚� ��C������� ��"�/ތH�� ��̂�&�Z�,f� �C1d�X�'��(�`�VR�Ő�o��87`�*�p��	G��_��x�����<��� (W�Ksj��lt�/P��5E[����zoeѯנ5��X0ʘ��fԅ�M�|)Hk6]���([
Қ{�(ʕ��&߅�8;�L)Hk�]Z.Pʓ�����
��ʒ���䅳�P��u�0�f�!� �4��(�,����5�8E(S
�&��RJ���I����LAפ�&�@�S�5���&P�tM�m�
�B[����ʣ����q�@�T�5�J�@U���NSJ�������پ�pӝl���HXk~��,��W�Zsm`2C��
֚j��Y�Zss��u�^+Xk~�ĩ\�[rh�@��
ޚ��W��:P��5}g�@�W���w`0M(��i�@UX����v���ी;ܣ� ���9y���� ��f�=꾂g [�c;}(T{���r-�P��
�Ax��(�(Tv�� ��|�A�Bd �r�*(D��+D��8D�v+D��$�P�b+ȓ,�P�B~y�^��y|�,�X2�Q5�`	4V
��mdX]�B�f�X -�B;K�G�����p�h����+���B�u��h�7{�Q�Q!E��4J�@*d+�ҨDw�����c/����t���"Bf2Xxx��8��S����A�L�
ݖ���P�Tڌ�J�2)(b� 9h��$��נj�2�'4>z�2����4Ơ�ix��/���x�v�]���{��X����8]�)���+�*��=3w�ͪ��C�_�a���P��������MW���J���f+���ھ�|��VQ�Zl�$5�EM_h��ό`��V+����j�z Ӹvu|�������=���z��w�x�e3ê��vu{CVZ�����]i��]�ް�+(����_i>�kW�7b���]=��-��׮o�J?3�]���vҸv,��i\���&`~}����duʧ��?}�3��T����s���c������t��{�邏Y�&*� ��`�t�������/vI���*���/��#�M��%��-<��A^�s�۰ٕ����!@dh9�K.ff�WF0�t��R$� ���Iȗ����0��4��=f�޾��ޫkĈ[*����!O��U�!4�$ᕖ:� 6�DTz,�4��Jsqt@Uk��}($�-�Xc$1�vgD��/�Py\\(�KZ�i��z/�2��D��i��    fs<���0c[������*���Տ�?��7d?OnS��9X`�~I��|e�!���b�;�
I���XbH$U[@�S�)�T_�m�� 6��\����T�[��t�'HF.�)͍�-Hv)RK�)����=X���������zNu{�繭nΙU�c�ݶ{L�TB�<wm_A�e��2�j�($�s����VCe!Y��/#J���|��y�v5��ɮӭ� _���yJܾ�7
�PwH������D������|��ce����m?�GL:��!p����Ml������w�X�o/���5��F�jc{kk����t���j6C�ĭ^�p�}'����u�唘�������;|�C������K R�nW����)h�3;��!R�F��O�H��^��x_�����|�������_��P'`k>|A&P�I�h[a)�ФI�s[a�e@�&�*n�
J,}�t·��� ��t��5F\ ��t"�����P�I��[�gF<tk�)�V�I��5)�0�khؤ��`�8�ݍW�G.�=����H�P�Iiڍv�0�mR��K���M*�n9�\�ܤ�+�@��Tl�5��+4oR�v3T�|�J��H��7���(TpR���/޿F���?�흼nwx��ھ�g�n�?
�|��P��`FX��F�|�����@
՛��x/��7��1�)�n2�Ue��S(�d0۫�2� *7����1#
7Lꪱ��*�m2��Uc4�U(�db����t���̖��'�r�Gj՘X`
7i����e0��4�q|u�;`J7i�s��VQ�4�n�ħ�չ�c�7i���*0՛4�z���P�I��W�k�<�o��G���Jc
8i�5�Ng| �F�l����h{�j��Zs��Э��Gf���!HS���:����| ��/�
25�`�3�7�aj��Wi��lh��࣭�b�`b.5�8��2�Y���Wg%�ch�԰liCΡ���x�}�?E��w;ew�5V@|��~�@(ꛊ�H��A$^�+�#"n���R�I�_	qx+�����8��B	D�I?�3'W� l��c?nuF�K���Qi����5��FT��A���g���܏��{��S����=�̾]>ٷ���1֦\gҏ��&�JJQ[�g0]��>&�x�T(����eU%<C����-.㨇�IQ����&E}o��5E��>l�=�4L����v���ZR���9:%�"���ǫ���߬�3�L��u� ,��Wq�9��Y�<�UYJ�^H�ȣ]���c R,��W���|�<V��r��pG�ȳ_��<Or�����$�` �Q<�j����4�G^�T�Ib�@��: &qm xQ<��o�&�c��ٻ&]�j�3�֤���[[f����Ъ(���&��0i���o�t�P�(�������r�2��:%2�I3f!+Q"�𘴑�+T$J�+�U�F�ި�������	?���}�����R�U/Ij�d�JW��1���]��uJ��`) +�w*5�㈥@��jVY,@��2x�Y}%j0K�Y���q2���2xwYc$�Z
��KÖ�2xr<��y,��#�G���B�d��Wc&[H���j�v�-�]J�q5�K���K��9��v�Pv)<�UY,��.���?�W���t)��q2��.���;5FҰ��K�K�R.�|�=X���q�]AO�t;����ô��{;�[�~~��'�.|0n5� <�`*Ъl��a��T�l��U@F�}����x*3Hc�;��Dh*��tpW` h�T ��t�k�	6�o��`�.(�T����!Ml��@���e����S�O�M־��gN������p��>g;�[�!�¨�����1�O/gBt/Hbr�^�;0�{0���z-�D�n�S�ZA�+]�ɐ��-��+���J]�}{��HL��k)3��IL���U�O]�$&���;E����Է��-^�������b�������v�� �*j��3���Z�:L���d����H�j���#��Q,(R?_��<�M��E��+�Ÿmr��"RC_�"Kc�3g���ڋWf�ɫ��Hu|��Wr��*X���WXM���F�M6HQ����I%K8+�����������a}�d(���d�F�=(E&H��,�Da(C�@���y��P�ҁ����š��]\ǋ]Cy(v�@P�g3���]/iJD�L
�>nS����|�iۖp����,-��6����0�o:��ku҃֨��qf�CeN�}��℅:�������	U;�ﭺf5T�����Z]μ������ZM�I�=���H1
�}:��<����o���R��^'BQ��N{0ʌ:�vX]�����5�e����=�L�{]�FCySJ�K��O�;�H3J�:$v�b@Nu�T��޿��t��F����n�������o��n�z�M6��*��Ă�PՁP��Z��P�ԁ���z�B�S�ǖe���L�[\�y�������p�`P�ԁ̱���0	*�:�=���)5G�[l���E[��H uD��M'
�k����k�Ow��t<nW u�;|~��Ё��R����-d������&k�P<�o�@Yk>v�Ё ��h�¡ud�%�9q�@)Y�g8�q�@Yk'n�Ё@��p
�ʡ�d¬mg�������xr7�]�J\��,���:K6��`3:t �lv���ԡ�e�ZJ,�q:�Y6���fv�@h�n��ܡ�庫UC�ޡMf�Ù)0�C��f�i���3�=���<t �t����w�X<�<N�v����7W8T��&���:�b�Xː�	�@��b�O`ƀt�-�(Q&�@^��"��G��d��1`J�$�͗��0�@*�_3`���-��L�9:�:�O� F�@Ҙ0��n&�x���/�u���զ2؇�O��j�=�i���k(��=H���!Y���Vx��N����RvH�t��v4#�9h��a9��xՖS��M̎���+���Gۦ��>��N��u����a#�4^��G��f�}��	A��g������|��3fz���el3���*�Aa����(��W6��)�7�����_�
"x�6�������rf�=�'��`�o�����/�=�<�o����y*��{fS����*���[!��zph��J�%���Vi.�p���F
�����r�5����Yiw��Y�����h��ʐ�O�)C��w�	��?����J�gq�*X�j(CI���@�d(���0ԝ<�vZ�$L��j�q�@�d��7S�I�ʶ�tG��j�3t /2TW�TD��F}>���8�k��Y8�|5���[�	���U�/�ُat��Ь�����a������~�]�|�d��q�0�r�=`��a|�J g�.���㗍��&�- �<��-��� �1L��3��9���v�T�����&hl�w{��������n6�7j�_/h���-Y��@$c��-K�J�a�wn	�%B�b��_KX�C������R6
���p�;�@A�b��(�0;�2#���ai�@�bDU\���^�??����s�{�c��kos�k*X�q�@nbo5��t&F�V�=P����w	OP��Z�ƑI���Zc�ŃYu�5h���ȡ���;�G�$���l��F줱����0��f;{O_��;�+�?m+�}�oomƃ��w��Uw�x_�,COb���"�u�K���]���M�T��V�
�O�Խ�ƹz#Mwo��>Ũ�"W����W1��^��UЯE{;Hs�,Fu�4�A�b��Iw/�����ނ���L����;��;L�XnA�E�M,�1Jn��!+|��(��z^�Wl���Q� |��(��E�m�E��-�Ă��M�^���m��|�t�o��6�J3�tc�z��I ߻1:�2�n�ʜޭ    $��4����}92dՌ���X�Z�Ҍ��B��,4c�e���8!63&Z_�) �2c�%��)ր"2c�U���P�-D�K��0c�"<��	#��Ͱ}	K!��1���0��M�� 21�N�8�J+��/JY��^�t������Ŀ���,��-�������cw��?>�K��}��Vb���P@���M�Bԭ�65@���e�f�3w�B�6�LӃ�M>6�:�V^6yP���܃�㓙���"g�	���9W��Y3��I�(��X��;���
��eh���sEI��hj�V�5f[�	� �s�ɺ�S�t 3��R�}�:�Υ(Ͷ�\@pY��$	�$@2���_�;��J�-�N t��b���	�C3����f0��"�K�%�/͠,b4X���b�
%�(��&u�5�$ %� )b}�!i)����# mAGjP��L!y�p�.B�e0����\Nf0��A�C9����pz=�L�{,�G,���� � ����F9�a��ί2�a��?7;c�+,�燥ABV�itP���r�ネ�_�?���_w��N�f�\
H��~x��s�2�r".�#���c@�%��J�c�.�RC�|�乌�5Z %(y.e/IJP�s�$�g�-lyn󕳓�1��:��� l�A���q}�ӽ��yu�?�_�㽬��Ǵ쇽�%=�s2�����\P �P��gx��D���z�Y����Ub�����
w1���
O����ပW���8Hd�����J�$3��n<MUT%;rJ��8�Kf�&��ʾ]��2ɾ�=�%Z���Z�0� �ҳ�{�� ���K(� ��ڳ��"@!2��[9��/I1�ʠ)�'S��u�I#R �*����߽~w��0��|7�lMz��ڝwn3\agQ	�����d�XU��p���� ��흫�RB�t���޹�O�0V�u���%�s���Ul� ׹��*�s����:�l\e0M��7b;�ܡ�9���{*�&���'��3�������F3�� ���Nzp���r-���"
,�����)�#
<b������(0�)g�kV�%
\bʹ��rf��θh2�'
|b6�=�(
�b�<0��Y͕_�ޣ�<�ˆ|��'&��:Ѡ�p��l��&&��Ŕ��j�(�`�q������^e�@%V_79�����0�U�M��8���M� �����֛\lEy�F��orж�'�p�u���i�Z����v�~<g;C/V�7�j۝�|��h�HNLԸ��@�Gr��F�q�1���t��M�~ $9IњYCC���Ҩ��LG������r���$9�Q��=A,H���l�ߏOϧ��v�]O��1�**�?���9���jjMs���&K��@?��,���|5�^��6�t���'�X��A�G��β��<�O,m�u
<�(,}`Tr;�,m)�m��u��vz��Ì�� ��_`�:��+}h3���[iS=0�?ʕ�Y�$t���V�^3P���Z+�@8G�O`β3���Wi�3f �#�����1��?=����Dr$�~�i�9����a<�v/�XH�	�ů��(��o�Ƞb8|��3�ԝ�?Y��TB �P$�Z�g%�PW��[L���hGݓ�R��GM��XC��&y�����Y|��y:��2�_:�OE�{�×/^?M0|d:v�n� ����O�F~�	R�@��#2���/���Y�ȡ���;�xt�Rˬ�6����s�A�E���&WYFF:� �"r1�u:�l{��\*�����=�m��Ghz48���x���F�?�mG����G�󿲣�F�rKO���������&y|U}$"E�G)� &"R����w�S%�*�D>D��k��"M�����*�^{�mw��n�|������7r�;\�Λ�&:��?	��І(��e�F�����%����R@�R��%v��Ǖ?�����O��~�{�X�V� �(^qT��!�!JTX�"k���Jx���(Ua*-f��5
(���Ӫ�0D6g�w�hRqL:�]��t�CC�2���a���>w3�����=�g���`2��fg�b�[Mf0Q�r����;�41D��K)����V?q�BC��l݃��9����]�Vơ�!�lu8 41�Э����6D1�l�v�; �!���O�S �b�hO؝���� m!FV��:�+Ĩ*;=(*��*�%�B�B��2�&d&t�L�(�$Ӟ���j@�h��IЃЁU�N��|С&�Ӑ����(��?O��v�΍L�b��a�A���x,���s('�`�^J�I%C�B<��u��d�+D1D����kB�JX����P��?M)��$�+�
L���G�{��yw�}|{�}���}LO�a�\��+�-b"� W[� �WW{�&�_y\��� �~�q��8N!�~%r���!�~�r�%�a �_�\�w���_�\m7�-P���Q�� 	��LzE��w�߰��|�.����r��x�}��/#�mq�t������ǧ��������a��7M�x3ImY�#��S��G/!́Rj+���d�!������k/�*��ڲ�Ǯ+J�j����<OsHA�-��ݫ tI	�u��]��sHS�����)�C�B�sw2�pHe(k�����ֲ��h��?����d9�)@oF7����Kߖ8��gb���~�MC?�����hZ���ho�j�Ľv���N!wL�L���E΂D�������9ȓ(o��q=r#�Q�7��8�R>�,���������Qޜ�>�
yr4ʛ��EVM�����T�'5� ã�9Ƣ�{
H )����>�Cʛs��>�m17���s����;&ڟ���*��?o}�p���ɺ�:�H(�hN�����@�IEs���y��hΕ�ϥ��!4��9#�^g<_C�JEs�뾺B.�X���u��]�g!ǥ�9e�^�C!���9��^P:?BRL�'�t�h����8�5���y7�����������jw�z�Hnw7������d��i:��洲��"�AjMes�ض�L����f�߶���'}8�ͩ`��K	�� kN�VOG�jS�L��RH>�R����[M��"��ff߶�9�@�De3mos�N#Nw�>���I���&����nw3�s�����7��?����~^���اj�o\�"��
�����ד�0���Dԛ���!�=&�Mܾ�DJ	��p�&�߼�x>z�&�߾�BzB?U����M��VhڡjS�ؼ�9y�3��M�b�jҹ-CTf�H�6�QݚU����ߏ�h��5�I�GT�����LF@OխDzf���U��V�<[E����Du+�y�)��n�s�.�Zyſ65�6(jZI����?莢��g��䁦)jV�3�|�RQ�^��?����x�E˖}�r�}?q�0_�mw���p���޼��Տ���.{����F��A�5��͋�0:��i/�m^TfCS5��ͫ/1"�Ȩi��m^Y�I�xFM��f�z
�V56�h����Fs��1��83>���ЮWټ�t�@�>���wlX�>9�v� �{�p}�sphn�еǆ5�1��G_�<��<�`mt��a͓glI%*Fo �<:����݃��y"�:)�&�Y󄗼�5L�DFּ����=���y����,t12҇!�D�>GF����0�>O��2���LgF��nIF��`a/C5h�d���==��4#~����-��f�/������6�{i�@!h�d���E�!�2�����.�"�h3���$�.RF��7Mh4ete�8o�1��_�/޽������- 2U��`��!�������ZJ������[�z-��Y�����:���������Z_�|ю�ڻӺ������e�    �j]�j�ᗵ7��Z�-�!���z-$�h�R��;�z�,��Ѓ�0��z�x�جG�8۰<����iw������8�aB�DE6RQYa�]���y���g6�KS�@�/�����;�@�.�T��)��@.����N�*�Q�0jw��<
��2L��x�*�L�וav�zoo�$и�0�w��$�t�2��Ijh)e\���a7�/���e��I�dk4P2;�7��hѷ�������%�݂��Nz)�Mz�N���	�q̎NX�
ZҘ�_~�	��᤭9�р�����o�Q��'&ҁ��Q�1a�<�Nw�=��f����v��r{��j�L�io�cw3�L��Fˡ��ED���I�n$�h�a��푒��.��{	hta��[���)L��
(B3	�r�5��?�T�.f̡a�I�n"E�X0ٌ�4B��Ԅ��l.�������-� .I�b�840E�?� �L���=?S<���殈H[�#�x�d�B�C�Δ*��&¡:gJ�M͑�8S&��t�B��t2�ґ	�5�A��>�5�R� Φ?.�Je�����2�1�A��Qe/�A�A) ��e:$�=�.X9�B�A��t+�8h��V�`s�^~��3W�1�hI��{kQ���~��2?Z���(��}&�\�؈���Ү�kd�O)]Iר��xD�B���C��ʯƔO�&BQT�Ð�6G*J�| �_�#P>�/�(k�!2;pz��f?�7�_p�cd�_�Ed�lɇȀ���HG���9~{"UI>DF�f����*$"�@3F��@Ց�q�9S����Id`g�k���"'����3�PE�$2x3stY�r��4�P%���l&��	w�����[����v�~�|���-���1��h<���1�c���f�f��p�Zf�f,�A������zfԖε^���`2m��-�\x0e6shX���`rl��y`��n�[���5T<x����t��;�o�7��=��>ޏ�;<�F�3['�B(�#
�_�y��[V(��e�G���#��OXf.����Χ��E%Q|�Z��+Q����g�0��%.Q"|֝���2�'|¢߲�D��G����d�����N�V�ؗJ��xD��b��1e�N<2��o��E>F�G���MN%�É�K]r��hB�y�GəGf��i��xe�#���&7���AŞGF"�M�/����G�]Ϊ�i�ցG�!�Mίz�!��L�����#��H�m�_jt����G�&�M�,�	���G+�8��#~��#�?}m��4B<2�/����*$��Xv�MdN<2��/pz��
�T<2��/���VR-���WXqa�1��g���z���q��ļ=���Gf8��N����� ���Si�<����}z�t\�%;��h,!2�A���L����G�>�";�ch&yd��L)�B��#å?|��T(�̐���+��<2W�s�yM���G�O���	�,�̞��%�S$4�<2���טJ���Ȍ��}k߽��p�T�qZ���GFX�3��k�x��k�!$஢�=G]zҳ��G�j��㹖;pv�`��-��瑉ڟ���L������.eZ������M��c�������b�Ov��y����fd(�g_�tE�L���%��*�xdxv��φBc�$�̼�`u��0΀G�Vor�IFh��1כvx,C�,���޴�R@C �����5N���⑉��|�W��i_1�Zb>5����~~$AC�L��d>͋��$2n{���9�}d"��R��y�X�#3�?a5u����OYX�|�N,21�S�c��
����rF%�wo�#s�?e��,��#��?g����6H���w�k��+���v��-1�[D��ʲ�Y3�Edt���3�=1�[D���{�9Ffy�ް^o?B�<�nlD��[&y��[D����##�\D���[f)͠�\D���[B<w�]Df�wt\Hhb���/ˣ^DƧ�[�L�h�����|����"2@���ɢy_Df��p��S�rLd��6�B� ���G�F1(@D�o�ك<1M@D��o]\�21q@D��ou'JL%�Y����Dd�{�\C��n "c෮`�BL@��[=�	SDd�V�)��$���q��`w��>����KL�}�/?�]bƄ�Ә���.1�B��d����s2D�n���y���!�����w�Y�O��Gσ��&"�����/1�D�i[���x��(�O?��g�KLVL|9�V��9Fy5~?��_O�r�ď��χ��<^=�����r/[�����Ԩ�K]�W.�)�6L_�y���0�D0s�U�����˭ �R��N.�7� F�N/|�+�^a���rKy#o����˹JR����/FoIbU�!x+�ݾ���>E������Vb��O����ӄ
�[Y+e9ÏĝC+�<� C�q���RK*1f��@)wq��!ZI&��i����H�q��_���Tng�B���|�0��%��х��Np!�X�f��0� �Ow���qHi�������Z�&JHX�ڢ�lBy�K�A��M,�XN�p�u,d$\��M�B6�?�@4���	��V�2h���>g�AǬ�M�O�L�\�܎�4��Uȵ�p�;�� Ǉ��h�:=��[{�\�%����kT��Ԑ���$4�
���~{��;�Z���h��B�e���8��S���RpY�6tU
��f*.v١QR��Ĕ_�L��j-3彤	�B]����E�ֲ�C�u�|{��b{��4+z-��8[P(:	�^Kem~3���@��2V�:zP,:��^�rm.Q.���^�m��S0w���P�dt�	��Wܜ�F��kɳmU3ec���k���k���J'�G�i���'L�ލS��ۺ���p|����_��5C;"F�0M3��X4�	�DY1=�}n�41Vl-%fDg�0M��'=��	��3Q�>.ޚ�#y�j�
�j�4�F���B�P�	�1�i�AO�6b;��B�C�?� +�U��a#a�	�1K�@����7�atnɡ	�q'=8]Wrh�v|5%Aǔ�p��t;ɡ	�	�&A������f5\"]�7A?�rf4�H҄���4�@y-�f��JEI�x J��� �
�'gǯ���d
0[d�m9�]�%��p���D$�0C'_VByU�t�݃�P��$B!�Y�0���$�1��6�ؐ$B8��{uI"��������4�Z�V2�C>�pW'Oi�D��R��:Ŧh���i�̻Zɽ�p�����gdA�h���i���P�h$mژ�{�Zf$m��)Q�c$mڼN�4�VI�6)����E��mK�"��Z\$k���fJA;�dM���Z�6к"����m*��A��x�������`�9[k��Z�Bd��6e6�h�m۔���6٦�M���h��m�ٔ�8���A�ic�
\�v٦��^�JA��l�����̂� �&fMMd��Mǚ����e�^u�ҏ��i�[���?߿�����n�P�C-Y<�=8��dP6�f}��W���u�=��W��WU`!�����=F�HC//�ժ~򌤡������kY�KzxY/c-�~c'������M'9JC�.���e_	��з�F��t�u<=���`��<�(?��jt�.w�Ww�{�u�|�1k�p���A/c���n3�G�ٷ�}X���M���m���D��˘Զ�Z�$
5��)p/���B�/cb�ݙ⅐_�d��5S2d�2����4M�h�1%p�U�h-�M(\�<Yu��LV�}��h�m�����@�����zp-Z	d��������@�I��N����&.�*�$d�����!Zd��v��d�צ�-ZO3�d�ط�.EehH�m_�^oG��Q��10�]q�z7moA`h;�mZݜ�w��@��ss�z��d�T7��c��@�)ms��d��&��z)��d�^�xk(
��M�s<�zd��5g8MLh�m�֜�'�@�iV_=�s�\��Q{    7�`#(�e�5e7CEP��F�j�O�_6�YS*���Q��rg ��M��tQ�(�e�r5{�j�
x٨cMy��
w�(VMYM��Qr��(��0�}eg��m����X![�,H�t5�m3�m��6=h�t5�m+)�	t�jۼĉ�t��R��.�T��TCP��Aos7s��j0�̥�jtE6�8�Т+��{6c5'�g���G|�F~�@<�������5��h���^h��q�W�(Tߊ�8�ڊ#�nE|��-��"> �gV�*�ÇA�����c;zP!�W+Z�i@A��ۋ	�ڭ���0l!��~�Vε��"+��_��rbE��l�6��Vԏ���hQ��~,�̀���*�ުq��Z����Nf�P�*�G^ݐe��b��K�+�c���|PC;~f����Q���O[hTj�c�ߧ�(2(��^�G&4^�)�Gbݗ"4���c��s����~��٠]��~�&?���q?*뿞�]��Bl�c"K���m��Ex5�G���@v�����g ���~�o���b*��h��J��"Sq~ۜƑi�>B7�*�4�J�(�pQk8bM%|J��}&�6���b��4;A��DOvISt�J��Z7�x�3"خ��xNbfpƃ}�z�i3�q*l��;�@_:N%����U��@ǩd��\�1J\:N%���?y�2�q*lp7^�
�2�q*<��w��W:N�x]��<�s@J��Iq�b��g�#%��@������X�˩�n�#���bd�ps*�7�ːq�5����1�/�6-�D]�U*E69���J�m�%�Rl�E��$H�⛼�4��Rb��4O@������jC�"�N�=w*��(�3�C%�T��c3��P���z@�>�#(�M����=�#�J�C�<�#�I�)��;�# �8&�@M�t,�I�J9�#8h�m��S�6�����M頂�힍uP�*M�6P�)T�Zohϔ	����m�,S&�2��m�S&()7L�6P�)�W�6�|)}�͹6Pt)�{��Z���i���MU\����2�x�Ϝ�
'��J(�t���>9�@D�C��6�M�Pj�i���TJ��M#�w�7��MS�Q:M��l��ҡn�u���I������N:Gl��l nҡ(b��d�_Ձ��\d��T}l }ҁ��3���t ۸� c9�d}g�t ��b#\|f�~�I�b)hE66�M�@/�^���J"��#��T:��Ħ�����I~����J���ٽ:*�R.4��@F�ˊ	�**(U�����t SY1G�@C��ʖQ�F���!���k��ҁ\�iୁ�J2�����)hY�ck�[�ȥɴ�*�YZ��H�t�p��|Y���0�F���t xi�k��ҁ�e� X���/�f��t �ɏs5d�@��8��@��L�PV��d0-sW�[���&��t ��3;�@��OG5���@�q���RL
��NDd:P�t�aj�/Ӂz�SJ�g:���Cj�JӁ�ˤQ��(f���t�6�ǅ��@���j�с�a�AuUz�K��4(��@��:���u�u�9�{��-Zp�� S���i�#A��H��4n(�'e�]�A�0L�b6�$�]���H�D��GZN�#aZ?�r����� �5��=�'�{���ѓ�9D�J�o�t��@���8@r2,�D讝9�$T"�Sc ������I��! D�x
'��$(����}�^(:��֠J^8n��]tP7/��@��U������9d�0������c�A��h7/HWtP^/[+�j���ξp���^t0#��ً��E�����<�A���YZW�q���������ل?��(���]`:�����"�u�]���m��\ U�6Q�nY[�+ ��&��-~�\��6Q�o�V�Hq��R��[�EP�h��-��
�m�̲�A�ˠ�Ѧ3���2!m|N*�������'���|��Uf��c���$�I�0_o�M�����z�]�>�WMɛ�qX�1�q�dW���^��&5�P �@u��yw���:b
,Px�[6=&
�d�>!�1�  pU�SqLP���㒻��?F�G����gSwИ���s�2&���s 1&({R��Y�w�=O'�p\�EM:��E�C�b%�ܑ�x�*�,��9K=����q�\�����a���Q ɈYT��F
`�Ϊ�S��fQ��ٝ�=�Y�sǥ��au�
���/������ho�����xo�e��`��G�6�a<�p>[�����d-����DH3�ť)�uc����0��c�a|��;=�ǅ���Н�t^^�IN���ɨ/��ǃ�{�.;Ӊ�P�,L�,P7|H��ֆ�ݎ(;�o����8-l����O5U�Y�TQ55���d���eR5�u:�����ƬN��5�����z�w��)�~V�d��W�!�u�d�'�G��O'��>�?
tj:�-�_1�t:`�v~�h���Z�����m��ƕ-�qާаj���)���/%�PR.���0����jV�~�O/�!v $H$�T��W�է� ����["��cq}[r�1K���=�M����	���J�ԏ�j�b�y<���>%=0Q2��M�<%pP2���;%=�O2��{�rJ���d������#'c��Қ��&񄺛e�̓�ܿ��r�/h���Fqͱb��b_���_Gܚ���E���}�~�?��C�^�:�K�������j"WS��$z{:�ʽ�0�JD'O���TLFK�U���-CBhy���|�x2������'�C�S�L�*T�~��W�഼|�O�_`���@��*�~�9k-#���ƿ���
L�a&��+�nl�~
���b��P՗��
i���ܹ��Ǭ=��)�}%?�f~�/<����H�i-E���A>z-%,��S��Os�j��`��PH��\�vK�y��5�2ya��-boK� �ŘP��͙��������e��O�z+0gb i'��4���yv��Cy�����1e�g~f���y��2���������3��Еg~�ȯ�n3yey����6͐ޖg~��a-��m���<��oE-����m�o�����jv�6�4~��&�����j�����u����~�����v2���O��ܯ��Q�,��~���N�n �0���O���m���<�ӹ�����z�s?}�s���	�8��~����ѭ�{�翞bt�r�o湟�d����E�>]�)��c�j�EY/�R��;�q�2�&P�O�oCW�g4�b�r�?n"=M	�rN~�#�4��)cU��Oo}���)V~��"��o�Ӹ!��O�}�D���rt����ԇNoF�Rү���&���ѝ�E,g짗>rƝ����rF~J�#g�֋TrQN�?�d�Z�r�å�]�x?���4����v�����:Rܮ>x�*3�������4h*nWL�is
5�B�k���]��]�0I2�)[~�|��:U��VG�n_q�T~���pFEGP��v��3壱#hlq�~���x.n׎<A�>����S�n�A�^j����n^�zV7�1/��It�Xc(��KKyӟЊ1�b�:��{�J���/��=�9}C^��{P�2�a�^���3x���m��#�c���K�y�����4��N����0�0)\ܒ,�$=��cS��vآi���{8��K%ű��L��KQ7[Ij�%r�x��6��i:���L 9C����kB�&���g����� I�@R��q���9	�@�����]3$��g�GOqF�$�(�g����|M�@�E��{<�N�%�`�gN��ʭ�h��WPFn��@cF.%u}X�_="=�y�\���C�[
����#F��Y)tV����(�&�\�����/)�K�ޏ��]k���K?d�]�B�.������    �)$|쒥��K'�S��%1�[�����	:��M!cc?��P۳��O��?��@��;���i�g��0Ą� Bc?��! 73�����ajs�2������ƵK�2�3�nmF,f���Yw������0�3�n�@' 3���#p� n��AD$=nQ�A�%ށ*)d}_����z|FJ�#K>����!`=/����M�������ϙ��z��yA��|՜Fȡ<o���)ەIe�y�'MtF��C���"|TX�yM��̽�~9���u��37��̡8=���ɺtnG��oz~Zk�KT��aDM�,�~�P�n�,���b��{��	��=TM�����ڃJ�?pP�����T���CMK�`		NE���28XBS����h�������r0{�pqJ�`	I�A�l�g��G/�.ϲ;	$
;,��nZ�H`���n��<�'w�aN��<�{ �D��<�����̥<z���H
���G��X��nJn	�^��^�ts;����x��իYVg�����9,�\�Gh��!��R�G��%��	̱7]�������y�n�J�ѝ4g�.�J��;�Ç����&�o���銧$��G���tSҽ����L%%�;��s�6����4N]��y����1��k�B�G���}(D� p�P��QS�!od����W���6ʌ(��<!�����p�;!�G܉ܓ"{a� �u7!$*�"	��D0!�6D��3���>��K�T~����v��T���3917��f2n�o&��c>zR��ޘ��R� &���8'q�K�G�o����%���F����$%��CW�Gzⲓ���H'MqiI�G䖮�|$OF5�K����Or�O�Z�堺�)����N��P7��u���a�8�Y�+D"I~B>���G� ��D?rZsb����|�vч�C"L:Ҍ�����W�G����Gމ5����ݢW�D�@��_�9$(Y{x!��Le:�.v�!��r��Kk �poGP���N�)\��@��a �pkFPF���3'�p�EP^��ǲ�#�Y����f����t~���������A;������O�-np_C�n1��"6Lc�/&���L<���r0~k�H`�p7dV��JEC �p�B��G5!�p�B��G� ��+"N?j�s��+D�}��v��"�?l����"Y~���A\�����t�w*D|�@nq�"� Q���M!��c�z���|Qd�$���$�O�d�s#�	���"�8��8�� nL�d�(t����J�d��s�vA�;"�8�:̌d���N���YHQ�["�p��8r'�pB���)���A��QB�-�pB��¤mv����/��z��t��Mt�
WD:/?nbBd�>�H��ÍC>@r�R�H�ɍS�`��ټd�q\�Cz����ʭ�͈3�؋l^�ܳ�>R��"��=7N�n�vټĹq ��Cʺ�,zܢy�"�"�����Ǣ>�rw8&J��H�ϓ��W�oN�qrF�>��)��%��J�-�B䝋,�x�o!��E�|�fd[��s���jl!��E<v�i�"�\����C���;y��ѵ<�w.���ԝ�,D޹�)\��,D޹�{�s�}�=�X	`���5���//~aqZ���ҩ�3�� �>|���C.���0�,D�{�\��Y<@B"?>X��0�9��L�`���إ)r�e�3&0#c��,���->�y��2�	s��12��e��tKi��/8ݲ�u����uŏ�KB������\#�eל���`fv��Gg uq� ������c��! /q� �{�2'�����%�:����CjS ⇬���BRB ���	 �����[��1�w��[t���\ש��7UAz{,�18��x�	q�3�����`Y��Ɯ�P�g���]� ��EyF<�~A$�^!р;A��g�N,�Ad�!�	�;�`Y�8�}��
c��Ŭ$ ,����B 9�U�����#E?���wQ~ �#?���w�`��_P����>�M�%:��Ȏ����K���H~�^�]�t����J�E���H]������L"�D}�Wݽ.��	�~�~��||Mr��+5
�}��T�g�Q�l�ڐ�D���Τ 7����S_�?Jf��0'�)��s�>��W's��gK�b�zqQn��Iwm�a�4��y�P�E���\�-Atca��\ye3���S�+>ɴAL�ؔ=��H�6�{I���q8ћ%�������_窭���k�h��N94JU��TU��?��d"����/r@��s0��F��{a��c� �8��o����,Z�0����'n�or6�MU[8>c�\}	C,wP�����Y*��p��E?K̗G�=��F�����F���C��L?�yǆ�C&Q���%���k�́��_U��[z����I=��i@%*-��^�Z�C�䦡��|.$0�
�ּp�d0�<�����nx ��I^���8��uݴ������`�����P-�]�n/���Q e*�hi~*O����;�I��h[J��m}^_�>j�#�0��o�g�e�I�t�sv��_���������A��D���}��Mm?p�����w�#<���~�^�LV
*��_��(��Iʟ���n�s��P��� ��H?m��YI���!�v �]E}�g��B������ev��N�׆����c�߶�aH�X<Ɖa;J<] 9u`S�)�������XN��4�y�ZzE�z ͩ��[y����6��ɛ�!{#N,�>bnf����(z�T�<q�@u/����Ŷ�SO�So��!����H��<;1�����G%: rf}7�S�!���;М��AG���ܧ9�:@ꕻ
Vޢi��E:��Ir.�aiI��5��O��fv�@��?'2hI��fv��s����K�r$�l�_.��� gv�c`��r#%���O�ې(���o�_<0 �98� EvV��^�ڗ��,%ъT�B �y�`�~v�ǥ1����A�c��0A<��9@�K�om�7��@In=�����n{Ƭ�]�2���혇ЗVǪ����\��9ԗ�G�<���ߗ���3c�F<�{���3����C���������� ����?��A��I�f�m¿��=4i�﫯��q5�����v��=�k���.'��)���t��a���i�h�KN�p9T�u�]�uE�.ؖ��H�{��#��~��J�d�x@G��JZ�Mg0���@�.�$w!�ɪ%�Zb$;�_��$?�b������]�Y<���nG��fEH=�F��
��J8*hA+�K�����u�O��O7����|c*��٭`��?|��/Ҧ�4m�w����UG�C]Ƚ'3� ��6s�|yy��qR��[��s�DK�]J��O��)���������ԧ����q�MJ���*C^4a>lW�a%���CQK�����P��PP2]�|t��(S�(�JAjm	�R�M���-kp��j����QJBy�-�v�7-vpo��lBk���@փD�����k%0����<����mSH-A�.v��J��m��r�%@�������_��C�<\�h]8�;��f2��|؁j�Ty���?�����ixJ�q`���#����"ua� ֗�46�&��8�jc)�[^�(�S#٘x>�0pa��|�VE���	�U��[�aT�F��(Z)K�0���kQK�2L�^;8��]�荳�8Qㅷ˺��y�a�R�e��J��̀p2�r�4�ԗ{-�	7���<;d�2o���r�!%w�k#�E_˃��q�
>/>��o:lT���%1���E�0�h��g	 �����Pڥ̮�J_�-,��V�cu��Љ�^.zo��qҺ��M.�>h١�/xI�lͣ:�P\�p��0��Qj!@\�YRԅ��E��Fvp�(-�l\�#��3^"�FS��w\�#;t-4�f��XF.�    ��c����a�� ��&��Hg��WHf`8\��(�xg�I��ˏu�!�|��D�w��	6hu&kg�ɓy�-��(��|�9?pOvb�qU-��NaZ8�O~[��s�t�bA��<��:P,�>��yԛ?pu&Q�S��S%3��� C<��9�#�#��T�~Zߊ�,���!����!�� )�:�pxiu>ҋ'�?�RW{8�X���=���V���
0�1?�@�'t/w�\������uI��zVI���ء0v.F*L�H+��u�8bd�RZU
d�J-F *t��:���9l�#�fR��,a�=��Q��v�h�TR�����u(��j���U,x�g%�ir�w����*��[|1�����4�H��������L[�}�G8g8)��o�`�lW@^���.w��h�l�1��<�w=硇P�".z�3�'�z69T�?yw������H�A��cp_G����up�lG�r���������TxGLs8�x��>��������p�AHR�,�� �lAԡ&�S\����R� �O�V��<��ǵ�^+I�u�V#��:�؛C��>�&�2v$�W�(ė���-B�)0�_��"��@]��^���V
���rܲH��?�"�.�Ұ����ߺ�$���Ѽ���obh�r耳d���[�?Gr1�|�-Nk]y����tz�Z[Lv�b ݺ:Tά�-�	4�u]���Hd!lZ��J�ճ�Me� ����x|�.���~]����sB�)�_�#��"��^Or�b��BWp��!�W�yRNߑ�/�[j�n�0L�-)�������h�1�#m��k��gVph{*8�k9����R-�"1B��-����(�������"/5���Nh�7V���-PM������ME�s�*��Xc�(i�-Wp ��5��1��CG����4t�2Q�\���
���ە�g2G��r9��lջ㸎�M@���s89���_窮V�$�_�1=��vK�r!?�lU�v�f���®�TO3i�z���b��1_Z��0��(W�u9!��y�#G4�ƹv��/:\��ZA�c"9���H�䬕����,:e���Mun����N����ھ��.)mr���@`�]a��1:8���o�qj�����V/v����M-��'��Ыܓ1|�+�kg�V8f�i�#/�|�lp�E���-{o�a�ˇ<��?�I�V��V�V�������<T-�^�Q���ё�K%�ε����D��/"���3a4�~N��:y�J/qh��=�����w�&,X�-R������Ceq�0"[Z�ˁ��j��B�z�U���.��X0
�\�!L�^�¿zn�b��2.*D�`�m��@��2�=1c=�	N�f2�E~OU��ܶ+w���w��Y���)�y>�cf�lOwr���f�����MR�#$���f�Sv�H� 5�'pi��H^VD�E�����s[m���"٢� N���J��m"��.#(���l,5F=Si.�55J�
���V���0|�Fvz���pP>M��I�<YF��F>��ʚ.ň;G�(�`|c�Fx-�r�����VL`�E���<���C������JG���5�j��nP]�����oq�#r���s��:�%�I���P@�N&���R�߆�FZ#_�w��h:R/O�}���Kqz�U�>5�Lz��5'[���Mu<6�G����Zb��#G��������3]Z�������Ww�Z'�"5sO[�ɿ����#x?D�4;�����nh����	r��:G�����+���k�?�d�!��ؿ�3�����9��R3q��j�����#��7>U�H{'�RС��I XG��'�[R)�e����#�~Օt*B�#鈥�Ƥ��M#�#G4�6�z��R_��L��K�K��e���ٴ�Ry�nRj��䧓�0Q ���l�4��ƅdI��F���α2S��2�_�w#G�~Hpp�Ҹw8A�{M���#a r��us�g�H�?��t<V<����ח�b�D�@{]���mݬp�z Ҏ��߂]/v�g��5ۺ��Sᚖ�"�3_#F���F߶��fi��m��p�R]o��?���Cw}|w�����2��+�[Xla����� ������Q�Y�Hc�|T��?�R/����kS]�S�����~�|^����di��\�e��W_��6=�~�!˽�k�|��WX:��rc*�pF_~�(�[Ih�V�\�wQ����;�I� ���F�s	vwn�}���P�Il�H~O�\���G�8'�m�i(]��Mݏ��I@�"'r�7��tK�+�{��������Z�- ���]9�t�(��E}�1� ��wџb�n �P*��!̆����Ζ�Gi�.�S��}�F��FVG?J�w��JEЉ9���ʖ`Vp	��^"M��$���(}��.t����鹨k>lH�잪�6�&��l��Qt���l�GfB^ :e��`@P>�ߩMH D�,�#eguDޣ,�1�ӈ�GY�G�F�E�=�O\�s"�Q�z��fAh<��(�r�(�m��[N�)y�֊"�ņ�#�RvV��.?d_��Β���N�	�#N���o�
�H3E���կ�[	�N.�༦O���RD�	�*:2�ޮ���|�h]��4�~���uő`��s��,�0'v�Q��K�z-�'�߸��Y{D��G=����WC�>�sv$���'��T�z)�#`�y��ޣ<~�76C��-����ɧ�XQG���(O< y!����yA�(Ϟ�>~T�"	�����l�5��=�&��x����'�$[���Ǣ��x)n�?�u�NbV�"��'쬱� �/u��xs�M�Š=)�F�������f�}�y_�N<�m+*�j��J�y���p<��U��mAS�78ό����j�c��(�Jغ��
�i�)d�J�Њq�����:Tɖ͹�
&)?�Р�b{�)�A�x�?�rR�bc�m|mw�>3�!���N���}�p�6/��0�H�mV9S�\'9�-)�X�����\�r�{��ho��%���O��bL�����WlhT6~���U���B�k�粐m�R���t�B,�*���C���Ν����F��n.s�^Sh��}���32��8X��d�����;�Y��i��E�x�T��3��t�L��0� �q<��]��t��7���A���%<��agT���A�UD�Ɖ7��4����t$x!��9y�� `H?f�;� `>�>fRw�C���?lZ�
�t�p�A�f�E�P\�$Nk�s������?1x8��8���<�;Yޓ8�6!<���ޙ8�O����NG��dS��5��x ���k��`��ܐ9w�	�e�lȗ�x�8�QMz�,�N>k�Q2�>j����=1a��&s';�?'Z��Y��ո&G����@�Å�8
~�Y��l�H���7ؓ�Dѻ���L�>��G�x'ǰg.J9��ق�{Q���<�����b���FBw[��u?�\�93O�7�)6�ˇ�������#gp'C �&��������}�����8�>[���q<�=<�.��7�� 2�7�B�&�`�v<�1�c�;Y�]��د����|���c_�mSy ��p������7�qA N�S��zقB�<L"���M��e�8	5ڝpƕ�8�5����G�$~�D匡�<�@��cAמ���lxaa�d,�n�r�s��X�g�;�{q:�B��ݠ�݅8��q��q<����85D���F��ϗT���=���;	����i��1��x���4y�d�yơ�4}�t����i�`���=�v:���]�g�a��~�����l�`�71�����C�p'sp<���<trw3ĳ���{��@���xvz,Ƽ����Y�A������,�9s��8��e?g�w�Gó�æ�@���x��I���������Y#�s��    tw��J�c��&���N���R����fgT�8�ZVմ��V�Ng9n���TR���d_��H�g��Jr=���^��ɞꊕ��p�..���ʹ�L��St4<c�r]i���i<�M0TMѤ{�'z��By���_��\�<9@>������'-�^����aы��Oc��(�b��4�v��'(�{�j�� kd��y�t�˫��7	5Z�������_�wy�9wj���˧a±��������R�G��k9�ԃ��;K��ɒ���-�I�h�^�B29��]Y�>M��������Wyb�/?�Wih�"�6�?���ɱ�o���$������]}Ꙋ5�<�m�=���u!���I����fj	1Z�� \HD�t,�Tׅ�Z�����3�R|���q͟^7��b`"ʋ�^�F��z*��ܕr���OR�퐃��dЮ.Փ����P9�j��F� U����~��L<C/��}J}F�ּ,�p5�a�@.�A߹ �����;s����S"Tb8�q�t"�K<e� �.$��� '�4�h`�P0��a��nT�.�e��a�÷���q1	B�0�7-�yCC_2�����wg�~�5�9�$���B!��D��z˟_�DjzҐZ2�,e}���>j ���kYΓɟ�W�n�cEl��T̎� n��{iz�F;}3IIl�u�|�lG�N�R.��b���b)�����]�t��"̇��
a0�;���7���Ꝏza4�;����7�k���.�B�Q��0�菅����gݩ0^y��0��;NU���@ i���꽍�8 �IA�J��4�P9�{�,���Rud��"�c�����Br�+!�$
&Z�EԂ�r�tÉ�GI�E[ 2��(�ߌ��`?������~�
|�W���$�lB)�aVD��{��%�M���L�������q�S}�nE��L �oBJ�m�e�Ѝ�Vqa퍢x�����U9wx��
�}�BM�~�Ƥ�B�E.�WQT䊩kS�B��4����Ǣ>�&|{���PS���o$��S��"�4�ˏf�z�ʺkc���P�Q\�|�mA� �n�h�LbC���j.�)�*m4冷@�⮇c%���;RN��=#���IF�E�	,6͞����Q���\��B��kPj�/����H��]`gm_�蠧��bW0�;����X��X;����ݛr�b(ί1�t��w�@�n�v=Y�|n�$+J�U|X6�a���}���*Ԛ���D�����;��5*�G�7�X��/���C� )i�Z9y���;��X��s�b[�H/j���oÅY�O����A��v~���$���V�.w-@S�b 2��˟_�)X��zk7�5U�/Py�vK+�$�хO5ICO��ܬ�x�u&i4�.�>w�m���ų���R��O��ƃ���d��RWt
Q�������ة4����h:�%'�K�]�L:���^�C�����s�o`[�-�/x[E�)*ٛF;��(5�-�f��g����2�Q���7t_FU����@Z�J�]΍|Γ�"I�+ZYQn�;������ɂ!�1��yU��L^�p��s�vT점��=}��I�����M��z��f\��*[�5�@�-?j�7ވ2M�X�'�]��MK�xR0e�3�{0��I��T�yL��g���o���;��n+�:�8�N�8�1@�[�LN�� Պi�u���w���C�<����f�U�%�M����s�<� �C� �i��PvC7��T�t �<���LIH�c?"�]w��;�'~�e����u'(���|A4yIS�)p�q��'#2�,�2i�z#��˟P��P7D@�'Q�1*F*	B��r���zU�T���۴^H/hK�Xre��܉�X��Tb}��Jh	J�%әn�&@-��/��4� �b/r撩J��� �x��-s�����<���V⌜�f�=�{IKե�Vy5y(�_j0�)�ߎ��HD����e#|	/&���F~��o�`������gX<˳E͉L2~L�F��� t��?V�ۈ�{�n���sh���} ͒աYս7Xںl�F߀oпY��=��7�=�S'��f� ,}�:Ƭ�t[�4~�4~�ȃ�m����Y�C�UPh�@�*]����pު��0��Q΁���o��+1�@㕘śz�����
^��$��ݰA� ��hF��|
���J�X_��I�w8�'��jo�J������c��|���ck*b֌��0{/睜���k��'Q��
�VA�˗dȼK��]d6�
��b�WćG襬wƐ#$A�5��cO /��q�ŐpO���)�.� c����A>���]�m�7x&���^wl����Ѓ[�=�;F����c<��	�]�#ƅ�(=����$���LL��܇�7gph��'�!Q �#ț^���݁���Ƃ���h5/#�y`���^;��Fi�H��s�д�?ѭ��GE��z켔��ءy�/?�I��r̎ƨ��]�.�*8�	?>9
�������X��}w2�B��#��S�I��t��ô�'*�|p��a�Vyt��D�����u3B)�-��9N�4�a�!��s�f�>���>�ғ��}	���؃m�yH��l����^��
Q�TuN�}#[�C�l�R^����+ǃ�{��_�2�$e0o<�q���W,�#����.��o���:3cmͺ �o���������[8`;N��%کp���%gӣ�ŊĀ��8�i}^]�jjt �$��/%��=U�|�~��DL��ͮ"L�`z.���M��(ְW*��^�O�>H�H�p���� �'wc�bS��H���b�
2�v$C�_�&nZQ���'H��S~In���*�rIj���n5vJzx�{M�K%�e(##˗A�tK�)tϕ�֘p��al�=�񮰱�
�G�8�ui���؎K���04 �fq���h�zrQ�[�B"��T�!lͥ�};F�i< 0��I�v\�<��~�`P���&{;����Ij��)BRO�MG��Ov��̻w�?���X��۩X�
�	��V���V�-H ��ҏ�({a!2�;0Y*;��OYp�v��� f޲�#���E7mA�_$��Y�M�q�����0a�:}���$0�]l�J���&��� f6	̾�T�sQ��B�!<�AZ�h!�t��i�	Rmh �枸Tꢠ��k����$B�8��;�$@�/���Z����|�}�k	��^�O"Հ�Jp�.�t�q[#Q��{�@��i�UNY������U۶:�$jPX-�}@:�IWJ�����3�B�h��ȭ���"U#�E�L�-}�7��OF-�l�#�}U%�Ζ���i�*��"ɦ����Ƥ{2N�����R�)���h}���*w��a�ГԐ��	�(O���7ק�a��0��M6��z�ÄƇ{���!�Т�ŷ��s�m�kA9e6�	Fx�����z��$��7O��	x�b���Ä���K>�]�V�"2�w#�����{/������ߖ|<k�DO��m{>44,���6L!q<(,�~E47�(G)�x1�~��5/*�x�F����]-��C�<W������;�I���Xw�� ���x.}���M�xUs��;
ʏ�bY�stN�j1��~�i3�jYD�� x����G�{�K��� ��H�mq,�,�t7_G�u@��9H0�htetp����Fo*��;��"pP���O�f�_�WzT�f�K�d"��Eet��|�������=?�-l�TFש\=o����Wˆ"gb+����@�%8��z��,�;�=�m��lt�N���u�|�Ȑk����>��z���c��n�����S$z����t�;I��6� ����;���˱�0�P_lyH/�H}�ɍ�ǆ����� 
5�6��?C��H@@Ƀ�S��r�������v�fL8����.�^��UA�V���S�L�i�[!-�ߑz��+u�!�    �-��n8�M!�η�~��Z�����ֵW�=dS�S�\�<�ծlmx�WB@�u�cw����j_����u�!�x�swW�qMWx��HQfx,�x��A��R���B��;�B���X����'�����ȏ�٪<��X_���{o����:p���,ٕ<x��@�)(.���4MJZ�����줗	ȉ�1Fȩ���=L|��yO�0S������$Ί���5���@�F�����Q�Q�/��1�C�5�Ƙ���{Ï/A����(7�%�'b;v[�i������.�8�!}��Օ왖/.�����Bk���x.O%���{&'�Ұ��.V�Z��+�����7�C��Β�29�($z>{�s\r�fO��+�t����5���](�Z�̩h7|{¼�'?�^i�q,@��-�U����5O�@Oҩ�끁A�0
�����(��"�QGD�{�|"�A~䫴�>�W�-��?���7`���i[���v+�h=�;�Ӱow�/�1���<
�����:7}l@�-j�W4���QM�x�&��H���E�=�m���iz����y2��X��)�`΂�a�,��@(�����d�~ ޾Oz�%c�w1�5�<��2
�av�ຓeJ����if�C�hr@D]���
��⾵�l �l����<�A_`�+���9{�o��Ia\H�q���4�q����K�ʥVA���|��8�|υ�?��-��JEF��|RW�C>��Tj����Gy/*��!yؗS�����#G�(�)x��Ӕ=�������O�y<*�u5,|��fpu>��|��O�*,:C�/.�/�w�D�XJ#�nT�����.�͑J-���fO��l�
�#�>�9���#<B��3���rI���kYl���\�\�E�\�Se�$k�����  �Y�ҟ�&D��^m�Qˑa�pT�����F�1���a)R'x\��M$�%��x�⛺��\��k��CJ����C�sX���;���2n����AŊf�����;�"?�fw1����a���,y�{��Wr�|�r�-kX U����/p���t;�,Z���d��wa�D8l}£�;��Q+�ID�f����
��UU(a�E2lC��mxR��������
i������Q������1b�F��#�
{���<Xi�[ܞ1�s,�<��R'�$p�Y1��L���� ԗ�����|d�"��]��X� �u_�k�����{_��H IAl�q�P;�B�Ђ�F�{���5H�#���q0��#ǈ�F'��Af��k�x��%7��ޖ���+���{�ʪr./ r�J{�ԥ1�#6,\=W�n��
�U���<��۔��B�Q�ZyP@A�G��D��.
�=-�.L|����l[��fE��,dH�Њ<��T嚺���9�ԕ�ˊ7�N��n�<Zz���f�T�P�4�r^|�����x��HL���RGp��Q0�7�\�HЭᜈ���#��3��̎��v9�D�YE��I	~�]���m<�.�%��]�]o�(E?��(���2�%|Dy�ϟn��c��ē����� ��D�u��o���.�U山�������k03_,O�U�����r�!��%����v�����)b��;T��J�Ԝ?1���y�������3�@�@\�
e�Jo2�Tudٗ�������=p3R�S2��fF�e�J�ʕi)�<�o ���t��#1�*�!�bģ����W�d�x�b���m�Q��R��6-F�<O�+:HZ��6Ԕ�Y�" .��	-!��um���*��b���$�
M]����3~�K�%��P�Ym������IM�+�:"��u�m=��k�V?�O�"�G�f=��w�N��~��QOK\>��%O�8 ��L��֔<S] gP�[� 8��l�/B��`dII�_�4~B��2�ؙ���S��b����)�࿢���UE8�W(V���n1��y�2��Hc��|�JN.���Ʌ�/��6F� |�Z�1��^�,��6��㪭mS��B��p����7U��b��!U�[h��J���?ʳHM?a������sIնbv`d���UZ�rGi1{#��l�V�3�٩���k9�=��Bg�`�ˏ-C �y��6��E?����3�]�<��<X�\���E#�5H���f��~�qa��Ai�(�]e���P ���Oq�2R�0?,cnq�u�\�}1�.�q���S�v�!:���$��3�_v_̮�<�j���a쁾����ٍ�#9�U��\�P� 8����F��ba�.1���r9�~$���/���>cYK. �)��4,���_�	'�8����+��#��]�3uN�9����l���%T�L����i2�$	�CeK\��ЧZ�:�C�q�3�J��ݔ�!�dSt�`��t-�YP�9��2^Q�H2br���ձcO�2��|�/�4�����U���B&���!��o�7����n��c�L33@�6���)�.ǿ�	q�D�+JxfQ�ww(.�.Q4��J�1���0�&�n�W���d�@Ϭ*W���#
�Ⱄ${'3��W'#Z�@�L@�{*�������I�S���
��A�KH'�t_DDW�8�8TES?I=���IWj� +���5t�,>�ϥr����9���H�N���� ��!��+��w!�کF��x ��m��m�eQD���ޖX��W���A7�4E_qF��8P�h���@�E
h�������_AB=&y�dֺ <�G���M�2z����pW�����-]�WJ0JPs�"�j��L���I��VrQ:�ݓڛ�Vq<L�@���e~�Vm���E�>�Z���21�&zs?D�J8��D���_��4ٓ��ʀ]؅��w���p���۳� ,�h�q�㹬�1Y +Z�xk�؉ē�tCG���d_�&��[U�����*r�o94��S�D��;^�;�ђ&�DѼ&uL�����A@�&� �*{n
u�����2�V�勲����?i�Ta^&M=�hR�u3�6=���Txr2��ad7�0�Q#�I��Ðx��gS��ຊx<ioT�g��@f<���/��%�䔆��Ɠ݁n-|5�T���T/�t(�-���\�h�����<���\�{m��y�ǮD�\�F́�8��oB� 6�;��op��,���x�����_8�R`"p�U�LZW뚲]OL�INZuGJ�b��,%\]��8]~�L�����x9���%x%���y�P��s$��.��V6�[����1��LB"�kJ������A���+��h��$7J�~F�_r��� bɤ~��Afh�U��Au�ʯ����5N�w((��OG��5� �Y���ލAi��tzM�'9�_)��T�T�4��>���u��q �t��uByMW�FY��\���;�� ���)�XQ���,���8�x���-/<�P���%�'�N���p��������$��Hʘ臢��,�f�6R�V��fF�Q���z}
�zѡM�I�V�`0P�S�(����O�#uu��28���f�5��:xm����$�QII��Pǂ*��[�GI>P�5	� ̝�9�pC7x�����:�s���C��i7%�2�d#)�N|���Z�yݭ�1�g��C�G�$�P5Xs�Y���@��-��t�!8)��C����1J!�ta�~���u��L�f���^�F̮m�����H0K���<!�F���P��X����wYqZ= ����x�zmB�.k�cB[ҎE�y�K�|��Tu�T7���S��8�$���ʩV��q=	�K>k�������qWQ��'�� ���.h*��F*�h���9�Mn.�.���A��J���4����|��:J��@~s�F5	�u�3^41c�K>�]����z�)0�
eK�iPZ���h(�<�a�؀��-��&St��3�T<��و���ǲ�7��2�Mm�����^^N��9�P���BU����/�B �̝O�б2S��ˏ�$�6t�P��v���C�`Zs\    �?-,s�4�f�5��;>3
1�I�T��钁B�S�pP� �XNrbwUh
#1�L2�<J��CZ�ߑ4��ky��]i��G���n�U���I;O7Www�>^Ѯ˾�L3��Zu�*��̙0&�˺pxo����o��^/?�8� ������J�����`g�C*A���'��5�gʮ���SĶ
q��|�0HO���,�	�Bp�3���U:�5���O�ї�x��FiEpF��M��3S3:q�x��`��~&�yOg�I�U$�#	g��͚���;qi�v�����V�BDzM�Ł]���ާ�$	�=u�|~���@:0X�~��Ғ��#(�߈�MI�2e�	�)q��5����=w��!H'�d�ẉ����[�:��8kDzR�`�4lU�4���J�C/R�2�O"�OB���R��^���2Js��mԛCfM�	�O��b��`�ն�m�W��u�� u�>��?�¥+�۫H$"wAr.?E4 Ղ�Ic�M|RxDD�9�1G�X�;�7Dt��z썤[
'����6��_!�9�����p���K��Rx D8g��~�>�� �i�Ҩru�yN�]t���5��uѲ�EˀYz���}��}��W�~�I��=a�ʃj2)�"���~>�0)�P�$0�3̽N���pE˛N�T��h}"H�ݔ�ttuE{�Y�FUpĞӓS��E4wd-�$͹�}����;���>�8�h�f\�~�ܩc���bO�)�"�Ml��򗇪	y����.��GF��g |: �.����L�y��y �O��a���� ���7����
�Y��3"���&eo��X���L����]B5|�]!�΢�İ_�j�q��_3���Wu k)+������H4E���κ��H���(Xh:R}EԘq#��p�����op���W:x%%#�
:���'�Mʇ�x��Ƴ��ɐ��g,x/���c�\7���I3�&Y�Xw�bS^_�Q��lֳ<<�V��1=J��p��j��|���v�:���E�u r����J5\b�FF����=�����P��3�V�"��sMC�����B>�L&3��Q����7��1u������ې�q�1�3�	]�k}���Sv2$�%���aڵG �'�!�1K\CQ���'��	m����d�S�[#R�Ԕ0��S�Q{i\|����]U:V3�eS��tyI� �%�Ԩ�D��#?
�"�)�� |,��P�Ĉ\���	�)g��4}%|�VA��Hg[lk�;����q���.�#��gI�ۮ.������ �澙���+M �4y�
z����H�i��xa^��eThW3�m��'i�~��"�R-S�X�p�wp&d��JsOr��k��:�x¿.����ص�-=�sͣ�=S��u��%���!�Id�'���1r�D�	��y͏�dK��,�7T׃F��������bT�)?���/N�0	oE߷m��qU� c_�hԈs<���/sa���J�>��w]Ht��Ud��p�vde����zWK�޷��n�|��k�c��^�܁N'�	\�Xv�Ѽ��;��C��Q��D�)��j��XI�Z����.��]F�����&D{�; �.���،��^u�(c�W���i7VT�f�I�w9`Y�C]~���ʌ]]���4�I���re�S�����@M�,�i@H�tA���*u6��Fn̪Z�s��rl�e������K+��@�����e�:�G��3<J��c9x�G\��G��.mˑ�<v7K�*5\�`2x ��2=�.k��!:;��x��W-38􂥃�fk>tN��9�p�g��5�곖\�������'t�',,my�9y��mYJ"X��aɁ�IU�B�^0�p�Mç�I����S� ��tr�i�0�p0��Jg�	p��䨂����,�:J�)�q<�������nf��e1Q�*C(z�V"�l�@+�Y�\�M_�*�,�����R�gpt�����*�Z�0Ъ݂��
p,=��*���$2wT�[(Or7U�
�Г�:���ѭ+eU��	�ؓ��Q%��J���
�dAjo�!G����m{�*D
| <y8�;)�F�yJ�bg��: =X?j��ו����]	�R:@�΃�)lН�܇*x�����Qc?�3�f�=�X�_�[f�1P��5�qM>�a�KoCe�|��j��7�������i}$T��O#���!� ��IK �� r �w+�q_OJ�V�4TǺTd����lo���V啩;c:�r�S��d��<�|q�9l��2$|1k���9B2}��(��-���κP���L����`Idc���dr�)vF�dܾA�����']��^�[ɳ��������r��Ŏ/ffp�����4����t�3��Op�O��|���Β+������,�w?0�;�j.Z�6x�o}�=�b��F��[Q�0z,:-�E	�֩��iX�ʩ���Ԓ
G�M�i~;��i�ׄ�p��z[��{B��E%�'g�=$�kL�d'U����nRg�8$�����S�m���I�I�I� ��6^+X|[���r9��[��@� �Ĥ�!��YUx�!C�� I��QR�����Ш&E�l����:E�j@}��-C�λZ�Ot��< �h��B�n�ǎ�i�N`�-:�1s�˩AA����R0*C�� u!Y�bs%Sũ�h����G�dNX�ӣ�(j��V�����]�vu�VR'8����&�j�Ŕ������xΫ�4�r�Ԃԅ̮�f��Y��8��~C��Z����vR.�>K�V���<�&��2�~��-4�G�-�V՟���J So��+(#����
2�.���Lv�Q>����՗U�R�;]�<<S�V��`�/Ϳ��$��\6+
nH�z�w�R�+�� ��E~r���̡��9�]a^ϺZ��@3���U�P�DPQ��B�U��w�� ��m|6zv]Fs��� s�[�*,���g�V�L�28�-����t�����hq~�)�s�!RE򜴕�"�3 �rT�I��M;�F�?�ת5�V刻���	�]�&�QR�H��o,��s��H^�6����Pq&��W>�a�.���2�\��k];�r$��K)VW��x�l�"�p)�Ư����i�PQ� P��o�ń��Z��t���= ��x0�5�Q����V�C9�$�2����T���K}�ʽ@���,�Hr$#�b�t]I{ѽ+�v��P��{s�JF�#��A_�:Gp#��ɺ��@�"���rֳK)G�"�qW7;�x��x8���#�H�ݹ�wa���y��fw�ʽ����>��	����m�--����%8˾P�z�FY����JT�~]�碌ffg�+@�&��đe���H���i���z��r����`��v�����~=ØUO0�!���EM��R��{�@����n�%mIU>���פ�; �����~[I�(����nmߌ�k��"�g�I�{[v�����X�6�{��rH��åuJ���^;�e >t�L��FY���G�R�!������B�.�*����N�@�#I��~[��������*B�t��a�jL2�����\�ϛr+Hج�t ���ԱV��?��z�*Ox��@1gp�)sIx$L'̽��
HT����;L!5��m�g�pb�<�������3��\g~EN�f����M9ImQ<�Op��·�K��[�}7j	�E�{��Ռ�.:�?�3�"+v���S�u����?5D���?�V	{4��O�s������x�� ׮��=9�a,�����lJ�;6*v� ���x������p]>uӒ�w����K�s�3t�_�4�K#-���qё^�Ӫf�9`�8/���31y�˔�ۨ0�j�k����)�*��ٸ呼t�{.���p��q�ΰ�%[z�rܚmO��"* �  X�D�V{���m3Tyy���x��ߴͮ���˶-^)��-�>�����맳$9z�3e�+ۭz1{q�f�>�0��?���`ד��BPly��[�[�d�!��'��ED-����"�1������k���"��iho�Q #�/���K�Zה��!��b�Y���M��:R낦Xr��uAS,9K�̺�)���~f]�K�R=�.h�%G,4̬�b��3낦XrV�}A��Bfɓ�r���+�\�B�ts�o����<� �]��M�3�,��u�^�\��O!�y��%a��u�O͜���*%��S�|E!̗s4_z�@��YL17��NX�<x燍��уv���b4�U)%9������n�z�k���_j��G���R$�6z�bW���`u�B�0�����h�l�_����w"��� �_�����I��󳐍IPD���pk����:l] ����mj��Hm�c`w�����W�gN������M����b{IH��1�lYf8���0fTD�
�ͪ*�#t#�h>H;s�n��bH�����7��J#��å���mO�UI�V��G 1Ɓ�=���>���O-�(��$�H����}� 	`��,��L�/�ϊ}7@yγ���7�W� �?kV�]�cf��Y��H�*��+딂��������0�w      2   {   x��K1C��)8��g��a�MF�l�?+?˖���qԭ
�-��Ț��3�Ay�3���gq��iA�ܠp��q�CȤ��j�F�����n��`�����,�p=�̿���{D�8�$      4   �   x�}�;�0C��9A���2���eCv2��9� ]�t��G�:��fA]�q�[.���T"7й���MÎѥ�Xf�����Y�C��?�i�w��ZYgH�����g��u�t��|��:[=z�h�"'�KC�J�A�,�$}D��/B      6      x������ � �      8      x������ � �      :      x������ � �      <   "  x����n�0���S��I�lKG�� �=��N��(�s����e�r�8��� /�,}�/���]m=c"�2mҔ���c�����=?�0Z�b���L&$�^n˺��``$*�wy�_7_s��m��'B&qK
c�\+�8g������{v�!�����㞌A:F��m������6��r�&��~�9�qH���')�5�Qt/O���Qd"�*F	�P"H�����һ �Rc�bI�4�)'���r�Y�p�[;�Xr�:q���x|���슪9�M7*�n���Z[Jo��ySzG<pK`��ͫ��9�+��yz�O�ٍ�C&3�:a����9P��z*�3�-u�)���<*�ۺ��Z�T�v�EMi�D��4���߂���zP/.RÊ�z�&(����b�����¦{�E�9Qp�4o���  c<u2DR�B`����)�ܾ3��4��s͂O�!��βO9y��H��L^U|�'G(IX���
/��!k�6sX��Ҩ�gk�!�vz���Fx�
r�]EQ����      >   �   x�e���0�᳽K
�r^�d�9򫽴ҁ�<P�y�"fMCs�4��S�!�Mr $�IN�D7Ʌ��&Y����1ڧ���D7�������@a�~n`_��ȋ[4��[����(�������آ�7���*��=}��nI�W���;_�      "   Q   x�34�4�4�7202�50�52�+.K�s@�\��@��"3.Cb�r��Td��24�k�!�$s�ZK�&Yr��qqq q�-O      A   �   x�U�K
�0еu
-�M�M�٪�.�dd;P���ц6�ىy3�����à�Й�3>�|�E3�����@t{��K���O�F�o�؂Zg��Xx����e��%��3�F^�i_��Is���I���«�7^P7q      C   S   x�3���O�1414�,�4�44��".#NC#cS3s� G�4N#NN##c] 2)0��M,��j4�45D�#)������� 3��      E      x������ � �      G      x������ � �      I   �   x��K�0���\�O���5�u��P�z�s�{#�������J)aA=�q�
>=�R��V�� La��xF�[��|�Pn��]@��!��]a�k�Y"Ǥv���}q0�X�fj��ˉ����tȼ�1�qyJ�9:l*�ID~U�)�      K      x��\=��8���_!s&�oC�&M��T��H?j�:λX㬍��3�ls�16ƛ��?v�%@��u�\�=*1� 2_&2I�?��͡lu�7����4����,T�}�^*U�G�Q��_k/��n��ߕ�"}���/��j��:/܄�k����R�����6���o�UX�A��J�ʮR}��x1���E�]SsbY3��[u8�u���Y��r�m_a�^��U���O����4�
�M�;/%UDI�']���iO��K�Ÿ�B�sUo�z[�����muw����M|o/�U���]V���f_�Ƨ�)T��m��ƿ��̒{�^���߃�!���A,_����[���K���}wı�U]`)|� ����m_���I~+r \?�֌;ݾa'������A��(t�-��n�wыpN8`��2P��A0�գ�'\`)ǭ�P�o��˓��թ�m���|�7��K���a(�:��0��Tە�7T��*��9�f��h�Yv�8�B� ��H��0 �%��GU`��y �z&��R5�(|�|���kI�3���s�Ԙʮ�)���^u=Lح����+��P00E���R7Us�:�������Yѥ C-Pcbbm-��b 4��Tݗ4� y�A
7��4\9��! 2��DCa�X[��m׈��C4F�!1%�ɤI;�,��9���>-�8�mO�O=$F�ܝ���(|��Jۺ����6�W���xz}��rj����`*.Ǘ�הs�Y�x�R4�<��B�"�]k��E����;�}���u�z!4��i|2�t��FF�٪J�b�N��K��/�' �7��/!����L�g|lκ����m�V��7��)k�p�FȰ�10)��> �������/��A2-%{�*zÐG8$�/�������~���/��z6�(�`�fW�<��,�,!b����z��>��V�i=������ɝ��k�= w@Q���F�4�<ZMG"��]v�^D�cM��Y1U�����y*��S����4���%�V���l��w�C���Ĺ���"�'��h�Qj�Pʋ��x!)]oi�+S=��Q�OC��?�;j 	��Uv��.�jHx�t���o&��Q_L�$�fh᷄ÖG�+bX�׺+{�Oo
���_)*#�S[��;N�%TS�,�d��j�0�RBL�0:_>��9>�@ӣ1�3�L(~��7���Q�gs�b[#�"x�ޒ�߯Fl2��M;�����Fs˽B/0�Oӂ1���@��p�}؍��&��ן�.���o�r�	�})O<��qߴf����6Dr,1kP=pƔ�Nx�i���Azcᥔ6����~���h�(�������x�P3���~��9[L)g��a;yC��atT���~@�R�0J!�0X�w�g�^�}�RSh+Um�I�W͙�g%2�9+P�r�k�M�h8���,�N� ����>��Y@�`#���2�Zmk]�Q*#+rI�\p)�^��ei��4��oӸ,&M|��V.TWL?-���iĿ}Az��G�#�� �A�{/�j/����OTg׻��t-G�Ǜ�H:zu������PT,Y��ߝDyr�{.���>9Mx�E~�T��|:�L��p�/�����/#���������0O8��ǽ���)��85�e�ן��nӜ����\T�;N��k�~�r���#Fߙ���L���ᓦ���#O3�Y�]s����O�����z�<�q��&����L]�yM�.$Y~�_,Ӯ`1ɂ�9K�w�w���J	2��V*��2����]�9�@ J[}�ҎN+��)��[�X.���]���O�
�J��}s"!���M�y�i='�^;.M�BJ��<+hL����^�ڞ��,g	��Ns	���X�{�&�N5�p��~n� ���<bs6�3m�2�PS���]n���@"|���]�}����}�a�iJ�otYki���@3.�O���mBJ�z<�+�[�QO�m�����߷����?��׿o�������W6�H9�lV,�D�ض��'��?�8�{�i�	��3�:bj���O�����~��� fD�[g��B��i��lx@��ޫ� $��n�P�ԁ�U2�NA���J�*�9(q��@3W�6�$�󬟒�ѐ����_@��=m�h��M*�P�b��<i0��P�&���m~H#j{
0���2�8�ټ��ʩ��0qek�$j�K�����ż&[�|4q���picLڈ�ɒvܦ���2&e����`�< ?�	�e8B c="�P�W����)i��W�j�'�Ҙap�qc�xo�&*`m�K�~DP���C$|q��,���r��cL��b&�*<VEBba=�&i��t�N�w �N�r�6
�X�F�V�0�Ø,ґ��m���b7s���{����	�p�i��I�D�a���K/̋n��1��<���ݼsM ;&���'�c#Q�RL$���+7M��4��t���M�F�M�����p���<P
߼t��r��~-L��!KC��jz#b�V�U�� �nu��B�V�ҍG"P�<��%�WHh��WV aЅ���J��Zeׂ�T���j��8`�<��j��|qN��@`����3�2\Id�-Z���
?Vvs��A=jz�[<bI��U�U-�Ovt'�Y�kK�܅w�K�!OԚX�8�y�,d3���*���:e��>�U�l��>�t�z �lf����3t
+;$���?X��J0\C����h�cY䫓r,�տo��^�)$���ю�e,?! �K�hM���q���*�R�!�����d�0�#�+�1�Xd
�)S��A}�L�Ɠ�10x����}Su��%��L����(�9>�,�Ӆ��0m��i)6����P7N�i�U�7�b>�����>�cq#Y;W'�����	����M����B�O3>6���z�JS���9iBw<p�2j��3���<�(��e>a@K��̵ٶ�ZД��ܠ�0ðz^����G[-�'2����$�gQ�Q��Be}n��D�Ω�0_�`Ԭ#�g��#�&P�t���xԌz�>~ɹ^<�v�Q�8����L�>��p����1���X�83���f�;�8H{s�E,G-�&��։�DFޗ�l9��8hDG��9RF��/��*��D���\|�A���C����#s`#^gvֱc_�{:�⾷���@�Ë�lqz�߸4�8����J́O��gy�ޤv�W��q�܇K)!���8��\�v�J:�ȯ���W�aFVk���ͺ0��(\V�n+Ø�q��V��]� ����_��2XW��E�ӛ�`�>\j�QҦ�b�'[������b�F�����3����g1�lln,����<2EJx��D�n��=�/�����.�D�e��Ri�!�"���^�W�;�%Z��,D{��Cy�t(��X:�6l��@	�M��1|�Rx.��7��"�P%����|��>b����?L�A���qs3u?7��g�59b�l?!�`#��X�jv�4�� Nk{���i��3�0�(�e� .�^�c�Z�Y��[��͈.�};{ ;�yN��C��fA���B���Uh��w��j��}o��'�?����c�� �I/������*e`�k4$����ڄ.��������s��a�8��!�
}P�x(��a�
����O�G�1�^L`�q��������ịN0�\0b��`a�x�a�X �G��g>�jO#K�pm�fA(���Z[�Y6	���(Ɔ�!G?\��yo�������[��������,�m�9�c��v�V�hR��bv�Zt���!t�>�7�.�7Y�N�-32��i�x�4q��q��8�+c09!�v<MO�i�����5@��i����cWP}�T��1��Nlr�>���2$)��}3��;N��ҳ�I`p����4�g:�ڲ;�/�V4R	ꄺ���>�i���8��ML�
tl�w��b�\�dC �  ��� ������ZU_�����#�۬��)�k�zJe� '�Ҭ��Rp8V4���"M̢�.�>�<������qL]�R�����Ĥ�q��; �o��*b��Y�v�����C�1�Ɔ#�d���Z���y��n���X�YD�}��	I��<�v��&,UC���]q�D�2_�v\��)+/1�o:����ѿ�9=�Q/Hv�9(%��_�����+�\e����I���A1i'��c�n8c��.Y��y�U�3=v��<���
�9�O�3i�?<���t+����v�bzGd�,k��~ -NåiZ�ן�P�T|�z�'�5�\�`��ځ7Yj�()�vZ#h}��.��I��_��.���&��cM��&�W1]��.j�W
��t]C�Z�z��+���*�u�ѷ��h����m�OKjeOվ9�O3~lƒ�����J5]N��d/�v|�<�Z�A�dyV���3��?^~9�>�)���^�u���5N��aľ�����^d!��o��{0o�4t?��0#JXDx��ؒ\*���@�|B�f��2g���}����g���g�&	�ȋ2���P_Ə��|��B��T��~ʈ�(�,���](t�캥�伺��ͷ�,������B��b�f��Y��w��\�J�G�X�&��dT�Z����Q��TKia:�r�0�_L7_m.f��Äs�\��ٚ�������880i� �U�M� ��$+2n<�8*\��pd ���U��2�3��c 3\I����; ˉ�`5`��-=@ɦ���Gc�?�"��n��Yg~Ob�o8�j'9��h��/P�S�	�y�ا�|0������p�psVlE�ś ����J��1j\�H�Z�5$��cD.���g���E���U�I���]ı�r�E��c�����voZp���so����=�vxl��'d|���[k��.�`�x��n�K��Η1to�	e6���1�3�̯���2���jp�_)VOaĊo���E#8jg=����L�ټRF���H������z�~؛����G���P�0%�y10q}�/��a
9{�:�H ����d3L|�=7�qͬ��j���1��N^3i���"R~��J��}��az�|ƚ�~⑑��N��7SU��4<r>�6K�i���<<����4>����\��BϷ�U�t��w�ś���m-��_ǵ�)�.��t�?�,�.z�a�~T15l�ƛc#��6��*gb��c�p@�'�ݔ�.�KMp���}�h�,|4��/�DpZƌ��ݐ����=\K1��L�B�4��&5�����$\E�oB`�#)M�o�)��}=�<�Ƽ��sl�ym�M�״�1G��,�xR����jċuv?���0�+�J�p�����!�0�K5:}�	��<.SJi��<��k��@Ni}�>(�G�YeE���[������1Y���;��Fc]v8���ڈ9�	n]y.�;5aH$�v��cK�b�X��Gii�}�"%��a��fϡ8�b��+��L��y�"������T�5���d+���>e�x�q<Q�	�%���0U�/A�=e��8\n����RkZ�{-C�^�>4�u-��Ny7��d�����[4�Н�r��3�0�e����0%!O�)ߺ�z^Mg},�Fi��:*���k`� Ul�2V0݌5���y�Z\�y/v���0,��Ȏ��l������.�}���R~A$��5tƀTe�sy�������J�L����^J��e�/�������Ϟ=�D�@}k����4�c�XD���5�)���מ�1�����d?��q������L"GZy;iN6o|��c�	xΞi��áU�4�
�112��L���c|a{,�Cۗ֗&D<����YB5�O�/�`"Z��?_�i��	5�_��ݬ��L�v�r� �O�HI�M&]�]�g*��6�K �f�a����(�(����϶,&)�ݶ��^϶a`+<8����lf�Cp������Te�1�CHo��>�);%=klZ��;���_m�����Ok�8k2��pR���!�lz<`���� Lo��M�ͼ3�l��Ӑ>X�BT3�#���v���&z�Gl$`�`A�F߾7W�6";7
��݅��?ҐR�8{��J�JR��?��R����K&؆��
J�H#2�6~l��pV��������W.�"8�|��1�Օ"x{� �,Z�j���3	�#���3�7Nr����=RF����V<�S�tZ��L��w�l@��8�>\�,��!1/h�<�~�FQ�qʈͶ(Z�g{���/��0"������h�Yp�_��%�͈���s���/혲����0�ʁ���a���F����{�7KH���k�f��b�B�#\�na�<�%נ�4N�`�-�$@~�'��|5�I�@���Λ;�"!`�A���&0WT���!���4���s�=㬒4
#�"I�p:;w��<�@��(X��|�U~JnH}.M��L䘁@ w�n���oRӋv;R�Lc���fz��o�����lb�Nri�5K�耣?���y+�ֻ�%�<�.�n�E�h���vѲ'�m�hGM��=���n��KW�d�3�sˉ��_�#ڥ�>������2�b��1�d 3֘�}F�������)�y��#A�&`X~����\:g�� ��I�1��i�V��n�l�c֟�K��iO&CRQSx�t<ܖ����	�Ǿ����y��ش^�M����a��{�E7�|�<Cć�TƗj�zg���ƕ�)�L?v!���3����p!��JJ��J��0(����@F����T�\����d�x~��85[e~&�<��>M�e+ ���[�8�qB��#����v�c�wE$]�x����k�U$j����F@��G`
����)pDAF�`���N�dB�6v���Tج�G�]�9hb}���\dOa>k��<��6��?Fq[�9莿>�ń��	��ѯe����<�:�WSo Xcy���c�/q�XN`~��o��fm��L=�lC��E^����ŒM���in2�"_	��|g[��u�dm`������v��K�q�a1\F�o}�o�.MD=2����y���:      M   �   x�M�K�0D��S�@J�-u[�|P�Tq)���H�b��<��wd�M/���f%T��ȑZHz��L{܂_tQ�P�I�����9�ră�(t���e��O�>���g�L����kfZL�*�(?�W���,���V(5Q]�B�nvj�<l���^0�+���;��*����F9�      O   X  x��W�n�8}������$E��BK��@��d4F�BI��'�4@�/�M��=��X�:E���L��p�̜3#���	DQ��'5˴��*��m�粲:�aq������-.?8�l����fy��^7�������U�Gb�qxD0�7d�|.���+1��4K�GEu9�I��ILQ�y���*mE�V��pO����β$3%5�*3S�\�θ�� $<��8�C�dEu|����vr5W�D%f�*/=&�oV��×�p��_<�G�q� ��]���Ti��Jӣ,9V𨞪��i?T��o��C@�<��X�Ja(��j��cl���� J_��j�T(�W<p��!g���.���h�<�����8��N�*�O��/x(�D�Պ&ʚ<�%,Ƶ"U=�ȓ��#N���͢�ϛ�z��iĳ�����󡐯��2ESM'��qUҩ��
kzJS�Љ�(��~�� <E�sU��ܙx��!�B� �uNG�8A�
�`��$y3-=�2$g���嗳xx�����c�m�g�b�(D���37�E �<& /d�Nm�JKU$�zN��\��X���!��b���9[�]r�3�[�9@(����
6�Z��Z��uI�W1S=�*e)�V*AYbAݟ�0KZB4P�Q�Z9ͬ����d�G�鳂��H�{T��<"�gddOUAO��a�21��p� �.���b/���z���y�:2�D��-6=��ᑯǪ��EVE�ґUS�u��ujk=Ba�9�3m������yi�$8e5pC�$9�e�%
>��(ñ�Q�ʹ͜>��(#I���_6������QA��'���
;�Re%��H����Uz<�2#a��۱��6҉P�����N�]s�|�u�\|]���J����B�o �{6��0�5��|bJ0��JbF�p�,WN�]Y����Z��c$w�Z;�]?��&�_2�sx�tx�$��I�غ:��ש�/5UPTY
�i�3���l��]n5�����y�ک"
Z��[��
���7T-�|�"�(�*
`-.�Ijf�T���6��|s�Z��7����=����T��Ȝ��0�Dn�r�>m�y��e)��N���Ot��v�^�G"�1��D��b�fmG#<�^L�3m�������g����	d/����J!Qi���6<�K��C����C�R��񕱝�{�tKP�v5��M(|	��$�ۅp���������>6�lU#<A�����lI��P_����>d�ôL_�J����i�C��Y?�և���g��$�� ���u��4�����z�o�|�;�\���B��Η^	�����ÕN
�����8r��P�#'U�͸��v����Y��Y>�c�[��*=/F�\7�����1���D�r$w_����}�w��KM����r�;i[�qm!�������^� ���w�:�%�"#)%c�;�3=��"h�c V�<���i�n�s��^7�6���z�C���܍?�p�0��(��)w���ԡlo"�}�/����a�5 � �[�0�cP�P�6�&'�����!N�|ǬͶJڶ�n����_�����m����|0����      Q     x�m��N!���O��&���tcБ�Ɨ�|1ˎ���;J�� ��*��I!������QZ��;T��2}���\ l�q	��l=g/��y��s��=K��_�ؐ�6J8D}�87�i�T�Jƍ�W�wq`e�;�-p�n���0�̡R$_��j��x�x	�k�%Z�co���xH��'p-f6&���P���܋�J"�f���d+�.���&+kQ�`�>�:��?�%R��0��f]�E�EYaޟ�v~��+ ���{�      S      x������ � �      U      x������ � �      W   �   x��I�0е}
.�`(��D4jW@ .ř�����ַ�0�����	�/��)#M�;���|���+D�5�A�dQ���0��6Զ��*���JIW��Z���ʬ��Xv�e�*
�ޔ�Xޑ��T�����f%r�����|2g�[��3U��b�r����V�B�ğ3���6�      Y   |   x��[
1 ��)<@)�u 7�Ԓ�7���k�(3s�i�(Mِ�&�;�E���:�+�,��?����8�N�@*u}�����Bx��D��M�"�9�;U��(���P�,6�q|7�� N�t'�      [      x������ � �      ]      x������ � �      _   .   x�3�ttr��tqt�2���v�	u
s�9��B��=... �4
E      a      x������ � �      c   �  x��VIr�0<������*_F��A
�T9�|*o���C�Z\��(Y�t7�#�y�gk�t�)hrړ�_tQ�f�Uꧥ����T/�Nq�@�ǁcg}��P�[N<�/�\��yJ���Et��+'?�
Cͱ@~`��O�k��O�Ԏ�6�V��#�4���'v:>y��.ab���1]-A9@�b)F,�:r�m�!D��Md3�{�ć�X3�a`�o��dGf o,�|����+WF�[r�
Ԭ߼�שg��ڵ4��K���� S��[2�2T��
������	PM?FLL�O���&c[2��Q>?��Ԙ;T ���	<��/��S�K�ܙ��:�(oD3��L���uw�{�\�>�M|Oi�X��bQ�_�XTY�u��!�>D�7l����.TQz_���:�B���?ݥ�}9����n9;�L�̳��t����-��ԓt���&8NF����|1��F�zi^Z0�M�#^��V�_G�`�@JX0y%Ǖ��V�"����/=N؅�Ho��3��"��M���(\4T�P>����v�r�����RB��Z���2��TU�:h�Ե�*T���� ��I��������-nۇ�:RU�M��1�N���;�����KUr Sz=r�Zf�O�Zz6j�[����ݒ�g�]νΥ'�Co��,���@��^�(5�c�e{�ԯ'��_�<	      e   �  x�]T�n�6<���/l`2�4�'Y��������6�3>��C����~,Ւ�N]D��U�]o�M��w��(����W���\Ǚz��4q�%��b�6�3�<�$��f a��[��~�V��A/�f^�zr1O�H,�LɅ;7���N{:��
2�I"�t�!�����~P}O<����w����8H$�puAIh9��o��^��̙�DMbmQ}�u������ft�Z��Oz`�����}�G��.=Q���찫n`|H)L�����..?i�����|��na�b�a��Z��t�Uw�� k6�:�o hJ." #��?�N|���$ݔ>��'�/K�)�\P� � �8����mW�#�(i~�^�L�t�8�f����<�$a��@8�gQ_m�G	x�8� ��:��{R:ű��}�5����֟�<4���S0�� 9FE�s�XL�t!���(�3x�eH_'ڡ�0E�����l���c���]V�9GPyt}�t1�]O(뛕5:/cv��5�G����2��������VS1����/Q@v9��˔��D=�����6LE:�Ϫ��S��@;0���Q�	<u�� :*�2��W��[��K[�AR� s:bR�Sκ-}��3�����ī�l6[JS;���.��� �*�v���R�9�דK�1 iDu��
�3�!L��. ��EA����=�ٖv��o��M�@����d\,��@�d�]�,���5�f�a藟���#<����40� �;�	w{������H�6~�jSUa� �e�P�J<���(AS���yl�p����
b))`<�v���80fG(�
����E���0��w�D��/��>���vl���� wH�>�P��<C���邾��l����d:��ꛯ�e�,/�a@��p�ba�ۢ�.0��_����ݕ�      g      x������ � �      i      x������ � �      k   �  x����r�0���S貝�F�z'����A�i2}��_��K�ML�Io��JZ}{�(i�&���q��{{�3��2�qh��u���?��w6�6�t�y�w�aL+K_��wJ1T��S�K���ҷ��R�,"`������h�h롢`�α4OD��יJTO�й�RE9�ꠔ*�.�XK�E���]�5�lg_o�
�XZ`�`X��v���t�"�P
0`b��OvkKo�o��X{��`��} �h���L�8a���0o�� ��(��
B����Iv�VT'�������%�Y���3��wp�2���1����1S�p��w�	k�_�D{W�X����A�L}�G��5�2�8��!�a����:�$����Q���)�����E���g�-�s�l�K̾x�p�:��`�"�X\�K�03�$�I7~d��ۆ�թaR��'��2�P:�ŵ�NJ=�^uMZ
F��ߚ�dA�̺���m��J1��+��{���b����3�X�Y����+�E��k��0�r�I<��k�g����p2�@5 ��O�^?��3?�O�� \����M^<�îg�LQ�6�K�uk.��:�K�̥3��f.�ϢW�Ғ�Z0�VT��\Z���\L��p�.pº�{�EFL��.2`�"C��`v��� ���掺:abo���[�����;C�^o��4�X�ۣ�*hg�]�#6���(3䄍�5:ѷ�5�ɿ���̿Ş�s;���+F���篁ۃm����C�
��
���*�f&*�<l��p��*Z�Q�࿚���Ʈe������=���o��:]��KF���/���;n�b����GXǡ�,��a=�!"!౻���a%+��TX�R�FX�2xٯf9tr5������e3      m   y   x����	1Dϫ*TA �[�8X�	K��#ޤ��f�<�y�7<���q���8+�&�F���;�$X�����<�7����~�������6yMF�c���h�@2�"�"�>'"�{9�      o      x������ � �      q   B   x�3�tt����	rt��,�2�u����9���=�����i\&�~�~�~ �=... �r�      s      x������ � �      u   Y   x�3��p�p�u�7�OL����,.)JL�/�/-.M,����*.�2BV������������X����W+5�mbjQQ~XQ� �)&      w      x�3�4�4�2�B.cN ����� !��      {   /   x�3��tv�Wpr���2��}B���a<O?_O?W�W�=... J/&      }   �   x�u��i�0F�g��sѵ�T��ױ�9?>�FJ��g��%,���V�����Z	?Y/'%�d{X=�Ҽ
�yh����:�T�ɪl�5����M��m�[dK���]���Ow�P�d�m���-Ț��6����?���yhS]#[����K'{����e�={A��&Y�-��3��ݹ�ͻc[���:4Wd�-�{��o��>!��/            x����n!Ek�+(mlY��a��a@�n���D�:���,�9�W�lw'��t ��x�e�t���L'��8���s�qr���f�v�]��nz�Ov)�Mwˠ8���w��6�vr5Ƶl��2��3�c������\��5��R��ܸ&�G�S�֠ʅ٧��e�.�f�!���WYK&mP8xg�����C���1�̌H��>��#�9<��~��'!/֞��X{P���������BK�ow����A}�����,�h����q���cGD_ةx|      �      x������ � �      �   �   x�]�]j1���S����+�dQ�Z�4�R=S/Vy[��73��ag48a=r�gv���Xz:T��4��1x_� ���MEc�edNχͭ�Zdu�E3g:��0��vH\A�f�F�;�zB[Dtb7��(�ܝ/������7;E����\:���������p�g��`�J���P�Pɘh��qQ�z5O�O���ӂ�������u���W��5���T7K)�o'�g�      �      x������ � �     