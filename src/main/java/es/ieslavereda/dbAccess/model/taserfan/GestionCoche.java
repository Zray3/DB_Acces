package es.ieslavereda.dbAccess.model.taserfan;

import es.ieslavereda.dbAccess.model.Conector;
import oracle.jdbc.OracleTypes;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;

public class GestionCoche implements IGestionCoche {

    @Override
    public Coche getCoche(String matricula) throws SQLException {
        DataSource ds = Conector.getMyOracleDataSource();
        Coche coche;
        String quer = "{call GESTIONVEHICULOS.consultarcoche(?,?,?,?,?,?,?,?,?,?,?)}";
        try(Connection connection = ds.getConnection();
        CallableStatement cs = connection.prepareCall(quer)){
            cs.setString(1, matricula); // para in

            //para out
            cs.registerOutParameter(1, OracleTypes.VARCHAR);
            cs.registerOutParameter(2, OracleTypes.NUMBER);
            cs.registerOutParameter(3, OracleTypes.VARCHAR);
            cs.registerOutParameter(4, OracleTypes.VARCHAR);
            cs.registerOutParameter(5, OracleTypes.VARCHAR);
            cs.registerOutParameter(6, OracleTypes.NUMBER);
            cs.registerOutParameter(7, OracleTypes.DATE);
            cs.registerOutParameter(8, OracleTypes.VARCHAR);
            cs.registerOutParameter(9, OracleTypes.VARCHAR);
            cs.registerOutParameter(10, OracleTypes.NUMBER);
            cs.registerOutParameter(11, OracleTypes.NUMBER);
            cs.execute();

            coche=new Coche(cs.getString(1),cs.getDouble(2),cs.getString(3),cs.getString(4),
                    cs.getString(5), cs.getInt(6), cs.getDate(7), cs.getString(8), cs.getString(9),
                    cs.getShort(10),cs.getShort(11));


        }
        return coche;
    }

    @Override
    public void borrarCoche(String matricula) throws SQLException {
        DataSource ds = Conector.getMyOracleDataSource();
        String quer = "{call GESTIONVEHICULOS.borrarcoche(?)}";
        try(Connection connection = ds.getConnection();
            CallableStatement cs = connection.prepareCall(quer)){
            cs.setString(1, matricula); // para in
            cs.execute();
        }

    }

    @Override
    public void addCoche(Coche coche) throws SQLException {
        DataSource ds = Conector.getMyOracleDataSource();
        String quer = "{call GESTIONVEHICULOS.insertarCoche(?)}";
        try(Connection connection = ds.getConnection();
            CallableStatement cs = connection.prepareCall(quer)){
            cs.setString(1, coche.getMatricula());
            cs.setDouble(2, coche.getPrecioHora());
            cs.setString(3, coche.getMarca());
            cs.setString(4, coche.getDescripcion());
            cs.setString(5, coche.getColor());
            cs.setDouble(6, coche.getBateria());
            cs.setDate(7, coche.getFechaAdq());
            cs.setString(8, coche.getEstado());
            cs.setString(9, coche.getIdCarnet());
            cs.setShort(10, coche.getNumPlazas());
            cs.setShort(11, coche.getNumPuertas());
            // para in
            cs.execute();
        }
    }

    @Override
    public void updateCoche(Coche coche) throws SQLException {
        DataSource ds = Conector.getMyOracleDataSource();
        String quer = "{call GESTIONVEHICULOS.actualizarcoche(?)}";
        try(Connection connection = ds.getConnection();
            CallableStatement cs = connection.prepareCall(quer)){
            cs.setString(1, coche.getMatricula());
            cs.setDouble(2, coche.getPrecioHora());
            cs.setString(3, coche.getMarca());
            cs.setString(4, coche.getDescripcion());
            cs.setString(5, coche.getColor());
            cs.setDouble(6, coche.getBateria());
            cs.setDate(7, coche.getFechaAdq());
            cs.setString(8, coche.getEstado());
            cs.setString(9, coche.getIdCarnet());
            cs.setShort(10, coche.getNumPlazas());
            cs.setShort(11, coche.getNumPuertas());
            // para in
            cs.execute();
        }
    }
}
