package es.ieslavereda.dbAccess.model.taserfan;

import es.ieslavereda.dbAccess.model.Conector;
import oracle.jdbc.OracleTypes;

import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class GestionCoche implements IGestionCoche{
    @Override
    public Coche getCoche(String matricula) throws SQLException {
        DataSource ds = Conector.getMyOracleDataSource();
        Coche coche;
        String query = "{ call GESTIONVEHICULOS.consultarcoche(?,?,?,?,?,?,?,?,?,?,?) }";

        try(Connection connection = ds.getConnection();
            CallableStatement cs = connection.prepareCall(query)){

            cs.setString(1, matricula);
            cs.registerOutParameter(1,OracleTypes.VARCHAR);
            cs.registerOutParameter(2, OracleTypes.NUMBER);
            cs.registerOutParameter(3,OracleTypes.VARCHAR);
            cs.registerOutParameter(4,OracleTypes.VARCHAR);
            cs.registerOutParameter(5,OracleTypes.VARCHAR);
            cs.registerOutParameter(6,OracleTypes.NUMBER);
            cs.registerOutParameter(7,OracleTypes.DATE);
            cs.registerOutParameter(8,OracleTypes.VARCHAR);
            cs.registerOutParameter(9,OracleTypes.VARCHAR);
            cs.registerOutParameter(10,OracleTypes.NUMBER);
            cs.registerOutParameter(11,OracleTypes.NUMBER);

            cs.execute();

            coche = new Coche(cs.getString(1),cs.getDouble(2),
                    cs.getString(3),cs.getString(4),
                    cs.getString(5),cs.getInt(6),
                    cs.getDate(7),cs.getString(8),
                    cs.getString(9),cs.getShort(10),
                    cs.getShort(11)
                    );
        }
        return coche;
    }

    @Override
    public void borrarCoche(String matricula) throws SQLException {

    }

    @Override
    public void addCoche(Coche coche) throws SQLException {

    }

    @Override
    public void updateCoche(Coche coche) throws SQLException {

    }
}
