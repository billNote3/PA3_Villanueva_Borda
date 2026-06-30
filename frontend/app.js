const API_ESTUDIANTES = "http://localhost:5043/api/estudiantes";
const API_CURSOS = "http://localhost:5043/api/cursos";

// 1. Lógica para Actualizar Tabla
document.getElementById('btn-actualizar-est').addEventListener('click', async () => {
    try {
        const respuesta = await fetch(API_ESTUDIANTES);
        const datos = await respuesta.json();
        let filas = "";
        datos.forEach(est => {
            filas += `<tr>
                <td>${est.id}</td>
                <td>${est.codigo}</td>
                <td>${est.nombres}</td>
                <td>${est.apellidos}</td>
                <td>${est.carrera}</td>
                <td>
                    <button onclick='editarEstudiante(${JSON.stringify(est)})'>Editar</button>
                    <button onclick="eliminarEstudiante(${est.id})" style="color: red;">Eliminar</button>
                </td>
            </tr>`;
        });

        // Luego inyectas todo en la tabla
        document.getElementById('tabla-estudiantes-body').innerHTML = filas;

    } catch (error) {
        console.error("Error al cargar datos:", error);
    }
});

// 2. Lógica para Registrar Estudiante
document.getElementById('form-estudiante').addEventListener('submit', async (e) => {
    e.preventDefault();

    const id = document.getElementById('est-id').value;
    const datosEstudiante = {
        id: id ? parseInt(id) : 0, // Si hay ID, lo incluimos
        codigo: document.getElementById('est-codigo').value,
        nombres: document.getElementById('est-nombres').value,
        apellidos: document.getElementById('est-apellidos').value,
        correo: document.getElementById('est-correo').value,
        carrera: document.getElementById('est-carrera').value
    };

    const metodo = id ? 'PUT' : 'POST';
    const url = id ? `${API_ESTUDIANTES}/${id}` : API_ESTUDIANTES;

    try {
        const respuesta = await fetch(url, {
            method: metodo,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(datosEstudiante)
        });

        if (respuesta.ok) {
            alert(id ? "¡Actualizado con éxito!" : "¡Registrado con éxito!");
            document.getElementById('form-estudiante').reset();
            document.getElementById('est-id').value = ""; // Limpiamos el ID oculto
            document.querySelector('button[type="submit"]').textContent = "Guardar Estudiante";
            document.getElementById('btn-actualizar-est').click();
        }
    } catch (error) { alert("Error de conexión"); }
});

// FUNCIÓN ELIMINAR
async function eliminarEstudiante(id) {
    if (confirm("¿Estás seguro de eliminar este estudiante?")) {
        try {
            const res = await fetch(`${API_ESTUDIANTES}/${id}`, { method: 'DELETE' });
            if (res.ok) {
                alert("Estudiante eliminado");
                document.getElementById('btn-actualizar-est').click();
            }
        } catch (error) { console.error("Error:", error); }
    }
}

// FUNCIÓN PARA CARGAR DATOS AL FORMULARIO (Editar)
function editarEstudiante(est) {
    document.getElementById('est-id').value = est.id;
    document.getElementById('est-codigo').value = est.codigo;
    document.getElementById('est-nombres').value = est.nombres;
    document.getElementById('est-apellidos').value = est.apellidos;
    document.getElementById('est-correo').value = est.correo;
    document.getElementById('est-carrera').value = est.carrera;

        // Opcional: Cambia el botón a "Actualizar" para avisar al usuario
    document.querySelector('button[type="submit"]').textContent = "Actualizar Estudiante";
}

// 1. Listar Cursos
document.getElementById('btn-actualizar-cur').addEventListener('click', async () => {
    try {
        const res = await fetch(API_CURSOS);
        const datos = await res.json();
        let filas = "";
        datos.forEach(c => {
            filas += `<tr>
                <td>${c.id}</td><td>${c.codigo}</td><td>${c.nombre}</td>
                <td>${c.creditos}</td><td>${c.docente}</td>
                <td>
                    <button onclick='editarCurso(${JSON.stringify(c)})'>Editar</button>
                    <button onclick="eliminarCurso(${c.id})" style="color: red;">Eliminar</button>
                </td>
            </tr>`;
        });
        document.getElementById('tabla-cursos-body').innerHTML = filas;
    } catch (err) { console.error(err); }
});

// 2. Eliminar Curso
async function eliminarCurso(id) {
    if (confirm("¿Seguro que quieres eliminar este curso?")) {
        await fetch(`${API_CURSOS}/${id}`, { method: 'DELETE' });
        document.getElementById('btn-actualizar-cur').click();
    }
}

// 3. Editar Curso (Carga los datos)
function editarCurso(c) {
    // Asegúrate de tener un <input type="hidden" id="cur-id"> en tu form de cursos
    document.getElementById('cur-id').value = c.id;
    document.getElementById('cur-codigo').value = c.codigo;
    document.getElementById('cur-nombre').value = c.nombre;
    document.getElementById('cur-creditos').value = c.creditos;
    document.getElementById('cur-docente').value = c.docente;
}

// 4. Lógica para Registrar/Actualizar Curso
document.getElementById('form-curso').addEventListener('submit', async (e) => {
    e.preventDefault();

    const id = document.getElementById('cur-id').value;
    const datosCurso = {
        id: id ? parseInt(id) : 0,
        codigo: document.getElementById('cur-codigo').value,
        nombre: document.getElementById('cur-nombre').value,
        creditos: document.getElementById('cur-creditos').value,
        docente: document.getElementById('cur-docente').value
    };

    const metodo = id ? 'PUT' : 'POST';
    const url = id ? `${API_CURSOS}/${id}` : API_CURSOS;

    try {
        const respuesta = await fetch(url, {
            method: metodo,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(datosCurso)
        });

        if (respuesta.ok) {
            alert(id ? "¡Curso actualizado!" : "¡Curso registrado!");
            document.getElementById('form-curso').reset();
            document.getElementById('cur-id').value = ""; 
            document.getElementById('btn-actualizar-cur').click(); // ¡Refresca la tabla de cursos!
        }
    } catch (error) { alert("Error al guardar curso"); }
});