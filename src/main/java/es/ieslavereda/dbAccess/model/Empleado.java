package es.ieslavereda.dbAccess.model;

import java.sql.Date;

public class Empleado {
    private int idEmpleado;
    private String DNI;
    private String nombre;
    private String apellidos;
    private String CP;
    private String domicilio;
    private String email;
    private String cargo;
    private String password;
    private Date fechaNac;

    public Empleado(int idEmpleado, String DNI, String nombre, String apellidos, String domicilio, String CP, String email, Date fechaNac, String cargo) {
        this.idEmpleado = idEmpleado;
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.CP = CP;
        this.domicilio = domicilio;
        this.email = email;
        this.cargo = cargo;
        this.fechaNac = fechaNac;
    }

    public Empleado(int idEmpleado, String DNI, String nombre, String apellidos, String domicilio, String CP, String email, Date fechaNac, String cargo, String password) {
        this(idEmpleado,DNI,nombre,apellidos,domicilio,CP,email,fechaNac,cargo);
        this.password = password;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getCP() {
        return CP;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public String getEmail() {
        return email;
    }

    public String getCargo() {
        return cargo;
    }

    public String getPassword() {
        return password;
    }

    public Date getFechaNac() {
        return fechaNac;
    }

    @Override
    public String toString() {
        return "Empleado{" +
                "idEmpleado=" + idEmpleado +
                ", nombre='" + nombre + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", CP='" + CP + '\'' +
                ", domicilio='" + domicilio + '\'' +
                ", email='" + email + '\'' +
                ", cargo='" + cargo + '\'' +
                ", password='" + password + '\'' +
                ", fechaNac=" + fechaNac +
                '}';
    }
}
