package es.ieslavereda.dbAccess.model.taserfan;

import es.ieslavereda.dbAccess.model.Conector;
import oracle.jdbc.OracleTypes;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class GestionCoche implements IGestionCoche{
    public static final String COCHES = "COCHE";
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
        DataSource ds = Conector.getMySQLDataSource();
        String query = "{ call GESTIONVEHICULOS.borrarcoche(?) }";

        try (Connection con = ds.getConnection();
             CallableStatement cs = con.prepareCall(query)) {
            cs.setString(1,matricula);
            cs.execute();
        }
    }

    @Override
    public void addCoche(Coche coche) throws SQLException {
        DataSource ds = Conector.getMyOracleDataSource();
        String query = "{ call GESTIONVEHICULOS.insertarCoche(?,?,?,?,?,?,?,?,?,?,?) }";

        try (Connection con = ds.getConnection();
             CallableStatement cs = con.prepareCall(query)) {
            cs.setString(1,coche.getMatricula());
            cs.setDouble(2,coche.getPrecioHora());
            cs.setString(3,coche.getMarca());
            cs.setString(4,coche.getDescripcion());
            cs.setString(5,coche.getColor());
            cs.setInt(6,coche.getBateria());
            cs.setDate(7,coche.getFechaAdq());
            cs.setString(8,coche.getEstado());
            cs.setString(9,coche.getIdCarnet());
            cs.setShort(10,coche.getNumPlazas());
            cs.setShort(11,coche.getNumPuertas());
            cs.execute();
        }
    }

    @Override
    public void updateCoche(Coche coche) throws SQLException {
        DataSource ds = Conector.getMyOracleDataSource();
        String query = "{ call GESTIONVEHICULOS.actualizarCoche(?,?,?,?,?,?,?,?,?,?,?) }";

        try (Connection con = ds.getConnection();
             CallableStatement cs = con.prepareCall(query)) {
            cs.setString(1,coche.getMatricula());
            cs.setDouble(2,coche.getPrecioHora());
            cs.setString(3,coche.getMarca());
            cs.setString(4,coche.getDescripcion());
            cs.setString(5,coche.getColor());
            cs.setInt(6,coche.getBateria());
            cs.setDate(7,coche.getFechaAdq());
            cs.setString(8,coche.getEstado());
            cs.setString(9,coche.getIdCarnet());
            cs.setShort(10,coche.getNumPlazas());
            cs.setShort(11,coche.getNumPuertas());
            cs.execute();
        }
    }

    public List<Cliente> getCustomers() throws SQLException{

        DataSource ds = Conector.getMyOracleDataSource();
        List<Cliente> clientes = new ArrayList<>();
        String query = "{ call ?:=GESTIONALQUILER.listarClientes() }";

        try (Connection con = ds.getConnection();
             CallableStatement cs = con.prepareCall(query)) {

            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.execute();
            ResultSet rs = (ResultSet) cs.getObject(1);
            while (rs.next()) {
                Cliente cliente = new Cliente(rs.getInt(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
                        rs.getDate(8),rs.getShort(9),rs.getBlob(10));
                clientes.add(cliente);
            }
        }
        return clientes;
    }


    @Override
    public List<Coche> getAllCoches() throws SQLException {

        DataSource ds = Conector.getMyOracleDataSource();
        List<Coche> coches = new ArrayList<>();

        String query = " { call GESTIONVEHICULOS.listarvehiculos(?,?)}";

        try (Connection con = ds.getConnection();
             CallableStatement cs = con.prepareCall(query)) {

            cs.setString(1,COCHES);
            cs.registerOutParameter(2, OracleTypes.CURSOR);

            cs.execute();
            ResultSet rs = (ResultSet) cs.getObject(2);
            while (rs.next()) {
                Coche coche = new Coche(rs.getString(13),
                        rs.getDouble(3),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getInt(4),
                        formatearFecha(rs.getString(17)),
                        rs.getString(18),
                        rs.getString(19),
                        rs.getShort(5),
                        rs.getShort(6));
                coches.add(coche);
            }
        }
        return coches;
    }

    private Date formatearFecha(String fechaEntrada){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yy");
        LocalDate fecha = LocalDate.parse(fechaEntrada, formatter);
        return Date.valueOf(fecha);
    }


}
