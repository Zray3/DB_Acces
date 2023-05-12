--------------------------------------------------------
--  DDL for Package GESTIONVEHICULOS
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE PACKAGE "GESTIONVEHICULOS" is
type estructura_tmp IS REF CURSOR return tmp_estructura%rowtype;

procedure insertarCoche(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2, r_NUMPLAZAS number, r_NUMPUERTAS number);
procedure actualizarCoche(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2, r_NUMPLAZAS number, r_NUMPUERTAS number);
procedure borrarCoche(r_matricula varchar2);
procedure consultarCoche (r_matricula in out varchar2, r_PRECIOHORA out number, r_marca out varchar2, r_descripcion out varchar2, r_color out varchar2, r_BATERIA out number, r_FECHAADQ out date, r_estado out varchar2, r_carnet out varchar2, r_NUMPLAZAS out number, r_NUMPUERTAS out NUMBER);

procedure insertarBicicleta(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2, r_TIPO varchar2);
procedure actualizarBicicleta(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2, r_TIPO varchar2);
procedure borrarBicicleta(r_matricula varchar2);
procedure consultarBicicleta(r_matricula in out varchar2, r_PRECIOHORA out number, r_marca out varchar2, r_descripcion out varchar2, r_color out varchar2, r_BATERIA out number, r_FECHAADQ out date, r_estado out varchar2, r_carnet out varchar2, r_TIPO out varchar2);

procedure insertarMoto(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2, r_VELOCIDADMAX number, r_CILINDRADA number);
procedure actualizarMoto(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2,  r_VELOCIDADMAX number, r_CILINDRADA number);
procedure borrarMoto(r_matricula varchar2);
procedure consultarMoto(r_matricula in out varchar2, r_PRECIOHORA out number, r_marca out varchar2, r_descripcion out varchar2, r_color out varchar2, r_BATERIA out number, r_FECHAADQ out date, r_estado out varchar2, r_carnet out varchar2,  r_VELOCIDADMAX out number, r_CILINDRADA out number);

procedure insertarPatinete(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2, r_NUMRUEDAS number, r_tamanyo number);
procedure actualizarPatinete(r_matricula varchar2, r_PRECIOHORA number, r_MARCA varchar2, r_DESCRIPCION varchar2, r_COLOR varchar2, r_BATERIA number, r_FECHAADQ date, r_ESTADO varchar2, r_CARNET varchar2, r_NUMRUEDAS number, r_tamanyo number);
procedure borrarPatinete(r_matricula varchar2);
procedure consultarPatinete(r_matricula in out varchar2, r_PRECIOHORA out number, r_marca out varchar2, r_descripcion out varchar2, r_color out varchar2, r_BATERIA out number, r_FECHAADQ out date, r_estado out varchar2, r_carnet out varchar2, r_NUMRUEDAS out number, r_tamanyo out NUMBER);

PROCEDURE listarvehiculos(tabla varchar2, listado out estructura_tmp);

end GESTIONVEHICULOS;

/

--------------------------------------------------------
--  DDL for Package Body GESTIONVEHICULOS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "GESTIONVEHICULOS" IS

    PROCEDURE insertarCoche ( r_matricula VARCHAR2, r_preciohora NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER,
        r_fechaadq DATE, r_estado VARCHAR2, r_carnet VARCHAR2, r_numplazas NUMBER, r_numpuertas NUMBER ) IS
        proce vehiculo.changedby%TYPE;
        r_idcarnet vehiculo.idcarnet%TYPE;
        
    BEGIN
        proce := 'INSERTARCOCHE';
        
        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;
        
        BEGIN
            INSERT INTO vehiculo VALUES (r_matricula, r_preciohora, r_marca, r_descripcion, r_color, r_bateria, to_date(r_fechaadq), r_estado, r_idcarnet, current_timestamp, proce);

        EXCEPTION
            WHEN dup_val_on_index THEN
                raise_application_error(-20072, 'Insertando, valor duplicado');
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Insertando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            INSERT INTO coche VALUES ( r_matricula, r_numplazas, r_numpuertas);
        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

    END insertarcoche;

    PROCEDURE consultarcoche (r_matricula IN OUT VARCHAR2, r_preciohora OUT NUMBER, r_marca OUT VARCHAR2, r_descripcion OUT VARCHAR2, r_color OUT VARCHAR2, r_bateria OUT NUMBER,
        r_fechaadq OUT DATE, r_estado OUT VARCHAR2, r_carnet OUT VARCHAR2, r_numplazas OUT NUMBER, r_numpuertas OUT NUMBER) IS
    BEGIN
        SELECT v.preciohora, v.marca, v.descripcion, v.color, v.bateria, v.fechaadq, v.estado, ca.tipo, c.numplazas, c.numpuertas
        INTO r_preciohora, r_marca, r_descripcion, r_color, r_bateria, r_fechaadq, r_estado, r_carnet, r_numplazas, r_numpuertas
        FROM vehiculo v INNER JOIN coche c ON c.matricula = v.matricula INNER JOIN carnet ca ON v.idcarnet = ca.idcarnet
        WHERE c.matricula = r_matricula;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20100, 'No existe información para el coche');
        WHEN too_many_rows THEN
            raise_application_error(-20101, 'La consulta ha devuelto más de un registro');
        WHEN value_error THEN
            raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END consultarcoche;

    PROCEDURE borrarcoche (r_matricula VARCHAR2) IS
        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
    BEGIN
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;

        SELECT COUNT(*) INTO numcar FROM coche WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        ELSE
            BEGIN
                DELETE coche WHERE matricula = r_matricula;
            EXCEPTION
                WHEN value_error THEN
                    raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;

            BEGIN
                DELETE vehiculo WHERE matricula = r_matricula;
            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;
        END IF;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para el coche');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END borrarcoche;

    PROCEDURE actualizarcoche ( r_matricula VARCHAR2, r_PRECIOHORA NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER, r_fechaadq DATE,
        r_estado VARCHAR2, r_carnet VARCHAR2, r_numplazas NUMBER, r_numpuertas NUMBER) IS

        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        proce    vehiculo.changedby%TYPE;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
        r_idcarnet vehiculo.idcarnet%TYPE;
    BEGIN
        proce := 'ACTUALIZARCOCHE';
        
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;
        SELECT COUNT(*) INTO numcar FROM coche WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        END IF;
        
        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

        BEGIN
            UPDATE vehiculo
            SET preciohora = r_preciohora,
                marca = r_marca,
                descripcion = r_descripcion,
                color = r_color,
                bateria = r_bateria,
                fechaadq = to_date(r_fechaadq),
                estado = r_estado,
                idcarnet = r_idcarnet,
                changedts = current_timestamp,
                changedby = proce
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            UPDATE coche
            SET numplazas = r_numplazas,
                numpuertas = r_numpuertas
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para el coche');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END actualizarcoche;

    PROCEDURE insertarBicicleta ( r_matricula VARCHAR2, r_preciohora NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER, r_fechaadq DATE,
        r_estado VARCHAR2, r_carnet VARCHAR2, r_tipo varchar2 ) IS
        proce vehiculo.changedby%TYPE;
        r_idcarnet vehiculo.idcarnet%TYPE;
        
    BEGIN
        proce := 'INSERTARBICICLETA';
        
        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;
        
        BEGIN
            INSERT INTO vehiculo VALUES ( r_matricula, r_preciohora, r_marca, r_descripcion, r_color, r_bateria, to_date(r_fechaadq), r_estado, r_idcarnet, current_timestamp, proce);

        EXCEPTION
            WHEN dup_val_on_index THEN
                raise_application_error(-20072, 'Insertando, valor duplicado');
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Insertando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            INSERT INTO Bicicleta VALUES ( r_matricula, r_tipo );

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

    END insertarBicicleta;

    PROCEDURE actualizarBicicleta ( r_matricula VARCHAR2, r_PRECIOHORA NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER, r_fechaadq DATE,
        r_estado VARCHAR2, r_carnet VARCHAR2, r_tipo varchar2) IS

        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        proce    vehiculo.changedby%TYPE;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
        r_idcarnet vehiculo.idcarnet%TYPE;
    BEGIN
        proce := 'ACTUALIZARBICICLETA';
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;
        SELECT COUNT(*) INTO numcar FROM Bicicleta WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        END IF;
        
        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

        BEGIN
            UPDATE vehiculo
            SET preciohora = r_preciohora,
                marca = r_marca,
                descripcion = r_descripcion,
                color = r_color,                 
                bateria = r_bateria,
                fechaadq = to_date(r_fechaadq),
                estado = r_estado,
                idcarnet = r_idcarnet,
                changedts = current_timestamp,
                changedby = proce
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            UPDATE Bicicleta
            SET tipo = r_tipo
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para la bicicleta');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END actualizarBicicleta;

    PROCEDURE borrarBicicleta ( r_matricula VARCHAR2 ) IS

        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
    BEGIN
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;

        SELECT COUNT(*) INTO numcar FROM Bicicleta WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        ELSE
            BEGIN
                DELETE Bicicleta WHERE matricula = r_matricula;

            EXCEPTION
                WHEN value_error THEN
                    raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;

            BEGIN
                DELETE vehiculo WHERE matricula = r_matricula;

            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;

        END IF;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para la bicicleta');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END borrarBicicleta;

    PROCEDURE consultarBicicleta ( r_matricula IN OUT VARCHAR2, r_preciohora OUT NUMBER, r_marca OUT VARCHAR2, r_descripcion OUT VARCHAR2, r_color OUT VARCHAR2, r_bateria OUT NUMBER,
        r_fechaadq OUT DATE, r_estado OUT VARCHAR2, r_carnet OUT VARCHAR2, r_tipo OUT VARCHAR2) IS
    BEGIN
        SELECT v.preciohora, v.marca, v.descripcion, v.color, v.bateria, v.fechaadq, v.estado, ca.tipo, c.tipo
        INTO r_preciohora, r_marca, r_descripcion, r_color, r_bateria, r_fechaadq, r_estado, r_carnet, r_tipo
        FROM vehiculo v INNER JOIN Bicicleta c ON c.matricula = v.matricula INNER JOIN carnet ca ON v.idcarnet = ca.idcarnet
        WHERE c.matricula = r_matricula;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20100, 'No existe información para la bicicleta');
        WHEN too_many_rows THEN
            raise_application_error(-20101, 'La consulta ha devuelto más de un registro');
        WHEN value_error THEN
            raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END consultarBicicleta;

    PROCEDURE insertarMoto ( r_matricula VARCHAR2, r_preciohora NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER, r_fechaadq DATE,
        r_estado VARCHAR2, r_carnet VARCHAR2, r_velocidadmax NUMBER, r_cilindrada NUMBER ) IS
        proce vehiculo.changedby%TYPE;
        r_idcarnet vehiculo.idcarnet%TYPE;
        
    BEGIN
        proce := 'INSERTARMOTO';
        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;
        
        BEGIN
            INSERT INTO vehiculo VALUES ( r_matricula, r_preciohora, r_marca, r_descripcion, r_color, r_bateria, to_date(r_fechaadq), r_estado, r_idcarnet, current_timestamp, proce);

        EXCEPTION
            WHEN dup_val_on_index THEN
                raise_application_error(-20072, 'Insertando, valor duplicado');
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Insertando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            INSERT INTO Moto VALUES ( r_matricula, r_velocidadmax, r_cilindrada );

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

    END insertarMoto;

    PROCEDURE actualizarMoto ( r_matricula VARCHAR2, r_preciohora NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER, r_fechaadq DATE,
        r_estado VARCHAR2, r_carnet VARCHAR2, r_velocidadmax NUMBER, r_cilindrada NUMBER) IS

        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        proce    vehiculo.changedby%TYPE;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
        r_idcarnet vehiculo.idcarnet%TYPE;
    BEGIN
        proce := 'ACTUALIZARMOTO';
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;
        SELECT COUNT(*) INTO numcar FROM Moto WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        END IF;

        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

        BEGIN
            UPDATE vehiculo
            SET PRECIOHORA = r_PRECIOHORA,
                marca = r_marca,
                descripcion = r_descripcion,
                color = r_color,                
                bateria = r_bateria,
                fechaadq = to_date(r_fechaadq),
                estado = r_estado,
                idcarnet = r_idcarnet,
                changedts = current_timestamp,
                changedby = proce
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            UPDATE Moto
            SET velocidadmax = r_velocidadmax,
                cilindrada = r_cilindrada
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para la Moto');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END actualizarMoto;

    PROCEDURE borrarMoto ( r_matricula VARCHAR2 ) IS

        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
    BEGIN
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;

        SELECT COUNT(*) INTO numcar FROM Moto WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        ELSE
            BEGIN
                DELETE Moto WHERE matricula = r_matricula;

            EXCEPTION
                WHEN value_error THEN
                    raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;

            BEGIN
                DELETE vehiculo WHERE matricula = r_matricula;

            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;

        END IF;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para la Moto');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END borrarMoto;

    PROCEDURE consultarMoto ( r_matricula IN OUT VARCHAR2, r_PRECIOHORA OUT NUMBER, r_marca OUT VARCHAR2, r_descripcion OUT VARCHAR2, r_color OUT VARCHAR2, r_bateria OUT NUMBER,
        r_fechaadq OUT DATE, r_estado OUT VARCHAR2, r_carnet OUT VARCHAR2, r_velocidadmax OUT NUMBER, r_cilindrada OUT NUMBER ) IS
    BEGIN
        SELECT v.preciohora, v.marca, v.descripcion, v.color, v.bateria, v.fechaadq, v.estado, ca.tipo, c.velocidadmax, c.cilindrada
        INTO r_PRECIOHORA, r_marca, r_descripcion, r_color, r_bateria, r_fechaadq, r_estado, r_carnet, r_velocidadmax, r_cilindrada
        FROM vehiculo v INNER JOIN Moto c ON c.matricula = v.matricula INNER JOIN carnet ca ON v.idcarnet = ca.idcarnet
        WHERE c.matricula = r_matricula;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20100, 'No existe información para la Moto');
        WHEN too_many_rows THEN
            raise_application_error(-20101, 'La consulta ha devuelto más de un registro');
        WHEN value_error THEN
            raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END consultarMoto;

    PROCEDURE insertarPatinete ( r_matricula VARCHAR2, r_PRECIOHORA NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER, r_fechaadq DATE,
        r_estado VARCHAR2, r_carnet VARCHAR2, r_numruedas NUMBER, r_tamanyo NUMBER ) IS
        proce vehiculo.changedby%TYPE;
        r_idcarnet vehiculo.idcarnet%TYPE;
    BEGIN
        proce := 'INSERTARPatinete';
        
        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;
        
        BEGIN
            INSERT INTO vehiculo VALUES ( r_matricula, r_PRECIOHORA, r_marca, r_descripcion, r_color, r_bateria, to_date(r_fechaadq), r_estado, r_idcarnet, current_timestamp, proce);

        EXCEPTION
            WHEN dup_val_on_index THEN
                raise_application_error(-20072, 'Insertando, valor duplicado');
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Insertando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            INSERT INTO Patinete VALUES ( r_matricula, r_numruedas, r_tamanyo );

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Insertando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Insertando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                raise_application_error(-20076, 'Insertando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

    END insertarPatinete;

    PROCEDURE actualizarPatinete ( r_matricula VARCHAR2, r_PRECIOHORA NUMBER, r_marca VARCHAR2, r_descripcion VARCHAR2, r_color VARCHAR2, r_bateria NUMBER, r_fechaadq DATE,
        r_estado VARCHAR2, r_carnet VARCHAR2, r_numruedas NUMBER, r_tamanyo NUMBER ) IS

        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        proce    vehiculo.changedby%TYPE;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
        r_idcarnet vehiculo.idcarnet%TYPE;
    BEGIN
        proce := 'ACTUALIZARPatinete';
        
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;
        SELECT COUNT(*) INTO numcar FROM Patinete WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        END IF;

        BEGIN
            select idcarnet into r_idcarnet from CARNET where tipo = r_carnet;
        EXCEPTION
           WHEN NO_DATA_FOUND THEN
                raise_application_error(-20173, 'No existe información para el carnet');
           WHEN too_many_rows THEN
                raise_application_error(-20174, 'La consulta ha devuelto más de un registro');
           WHEN OTHERS THEN
                raise_application_error(-20175, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
        END;

        BEGIN
            UPDATE vehiculo
            SET PRECIOHORA = r_PRECIOHORA,
                marca = r_marca,
                descripcion = r_descripcion,
                color = r_color,
                bateria = r_bateria,
                fechaadq = to_date(r_fechaadq),
                estado = r_estado,
                idcarnet = r_idcarnet,
                changedts = current_timestamp,
                changedby = proce
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

        BEGIN
            UPDATE Patinete
            SET numruedas = r_numruedas,
                tamanyo = r_tamanyo
            WHERE matricula = r_matricula;

        EXCEPTION
            WHEN value_error THEN
                raise_application_error(-20073, 'Actualizando, se intenta guardar un valor en un campo más pequeño');
            WHEN invalid_number THEN
                raise_application_error(-20074, 'Actualizando, se intenta guardar un valor alfanumérico en un número');
            WHEN OTHERS THEN
                IF sqlcode = -2291 THEN
                    raise_application_error(-20075, 'Actualizando, fallo FK no encontrada');
                ELSE
                    raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
                END IF;
        END;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para el Patinete');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Actualizando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END actualizarPatinete;

    PROCEDURE borrarPatinete ( r_matricula VARCHAR2 ) IS

        numvehi  NUMBER(3) := 0;
        numcar   NUMBER(3) := 0;
        sin_c EXCEPTION;
        sin_v EXCEPTION;
    BEGIN
        SELECT COUNT(*) INTO numvehi FROM vehiculo WHERE matricula = r_matricula;

        SELECT COUNT(*) INTO numcar FROM Patinete WHERE matricula = r_matricula;

        IF numvehi = 0 THEN
            RAISE sin_v;
        ELSIF numcar = 0 THEN
            RAISE sin_c;
        ELSE
            BEGIN
                DELETE Patinete WHERE matricula = r_matricula;

            EXCEPTION
                WHEN value_error THEN
                    raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;

            BEGIN
                DELETE vehiculo WHERE matricula = r_matricula;

            EXCEPTION
                WHEN OTHERS THEN
                    raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
            END;

        END IF;

    EXCEPTION
        WHEN sin_v THEN
            raise_application_error(-20110, 'No existe información para el vehículo');
        WHEN sin_c THEN
            raise_application_error(-20101, 'No existe información para el Patinete');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Borrando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END borrarPatinete;

    PROCEDURE consultarPatinete ( r_matricula IN OUT VARCHAR2, r_PRECIOHORA OUT NUMBER, r_marca OUT VARCHAR2, r_descripcion OUT VARCHAR2, r_color OUT VARCHAR2, r_bateria OUT NUMBER,
        r_fechaadq OUT DATE, r_estado OUT VARCHAR2, r_carnet OUT VARCHAR2, r_numruedas OUT NUMBER, r_tamanyo OUT NUMBER ) IS
    BEGIN
        SELECT v.preciohora, v.marca, v.descripcion, v.color, v.bateria, v.fechaadq, v.estado, ca.tipo, c.numruedas, c.tamanyo
        INTO r_preciohora, r_marca, r_descripcion, r_color, r_bateria, r_fechaadq, r_estado, r_carnet, r_numruedas, r_tamanyo
        FROM vehiculo v INNER JOIN Patinete c ON c.matricula = v.matricula INNER JOIN carnet ca ON v.idcarnet = ca.idcarnet
        WHERE c.matricula = r_matricula;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20100, 'No existe información para el Patinete');
        WHEN too_many_rows THEN
            raise_application_error(-20101, 'La consulta ha devuelto más de un registro');
        WHEN value_error THEN
            raise_application_error(-20102, 'La matrícula del cliente excede el tamaño');
        WHEN OTHERS THEN
            raise_application_error(-20076, 'Consultando, error no encontrado ' || sqlcode || ' ' || sqlerrm);
    END consultarPatinete;
	
    PROCEDURE listarvehiculos (tabla VARCHAR2, listado OUT estructura_tmp) IS
        notabla EXCEPTION;
    BEGIN
        IF upper(tabla) = 'COCHE' THEN
            FOR i IN (SELECT v.matricula, v.marca, v.descripcion, v.color, v.fechaadq, v.estado, t.tipo, v.preciohora, v.bateria, c.numplazas, c.numpuertas 
				FROM vehiculo v INNER JOIN coche c ON c.matricula = v.matricula INNER JOIN carnet t ON t.idcarnet = v.idcarnet) LOOP
                INSERT INTO tmp_estructura (origen_datos, c1, c2, c3, c4, c5, c6, c7, n1, n2, n3, n4) 
				VALUES ('LISTACOCHE', i.matricula, i.marca, i.descripcion, i.color, to_char(i.fechaadq), i.estado, i.tipo, i.preciohora, i.bateria, i.numplazas, i.numpuertas);
            END LOOP;
        ELSIF upper(tabla) = 'BICICLETA' THEN
            FOR i IN (SELECT v.matricula, v.marca, v.descripcion, v.color, v.fechaadq, v.estado, t.tipo, v.preciohora, v.bateria, c.tipo as tipus
				FROM vehiculo v INNER JOIN bicicleta c ON c.matricula = v.matricula INNER JOIN carnet t ON t.idcarnet = v.idcarnet) LOOP
                INSERT INTO tmp_estructura (origen_datos, c1, c2, c3, c4, c5, c6, c7, n1, n2, c8) 
				VALUES ('LISTABICICLETA', i.matricula, i.marca, i.descripcion, i.color, to_char(i.fechaadq), i.estado, i.tipo, i.preciohora, i.bateria, i.tipus);
            END LOOP;
        ELSIF upper(tabla) = 'MOTO' THEN
            FOR i IN (SELECT v.matricula, v.marca, v.descripcion, v.color, v.fechaadq, v.estado, t.tipo, v.preciohora, v.bateria, c.velocidadmax, c.cilindrada 
				FROM vehiculo v INNER JOIN moto c ON c.matricula = v.matricula INNER JOIN carnet t ON t.idcarnet = v.idcarnet) LOOP
				INSERT INTO tmp_estructura (origen_datos, c1, c2, c3, c4, c5, c6, c7, n1, n2, n3, n4)
                VALUES ('LISTAMOTO', i.matricula, i.marca, i.descripcion, i.color, to_char(i.fechaadq), i.estado, i.tipo, i.preciohora, i.bateria, i.velocidadmax, i.cilindrada);
            END LOOP;
        ELSIF upper(tabla) = 'PATINETE' THEN
            FOR i IN (SELECT v.matricula, v.marca, v.descripcion, v.color, v.fechaadq, v.estado, t.tipo, v.preciohora, v.bateria, c.numruedas, c.tamanyo
				FROM vehiculo v INNER JOIN patinete c ON c.matricula = v.matricula INNER JOIN carnet t ON t.idcarnet = v.idcarnet) LOOP
                INSERT INTO tmp_estructura (origen_datos, c1, c2, c3, c4, c5, c6, c7, n1, n2, n3, n4)
				VALUES ('LISTAPATINETE', i.matricula, i.marca, i.descripcion, i.color, to_char(i.fechaadq), i.estado, i.tipo, i.preciohora, i.bateria, i.numruedas, i.tamanyo);
            END LOOP;
        ELSE
            RAISE notabla;
        END IF;
       
       
        -- LLENA EL CURSOR DE SALIR PARA QUE LO LEA LA APLICACIÓN
        OPEN listado FOR SELECT * FROM tmp_estructura ORDER BY c1;

    EXCEPTION
        WHEN notabla THEN
            raise_application_error(-20100, 'El tipo de vehículo no existe');
    END listarvehiculos;


END gestionvehiculos;

/
