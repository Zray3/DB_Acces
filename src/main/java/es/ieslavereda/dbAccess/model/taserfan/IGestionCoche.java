package es.ieslavereda.dbAccess.model.taserfan;

import java.sql.SQLException;
import java.util.List;

public interface IGestionCoche {
    Coche getCoche(String matricula) throws SQLException;
    void borrarCoche(String matricula) throws SQLException;
    List<Coche> getAllCoches() throws SQLException;
    void addCoche(Coche coche) throws SQLException;
    void updateCoche(Coche coche) throws SQLException;

}
