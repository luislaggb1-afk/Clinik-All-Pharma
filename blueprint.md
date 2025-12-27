# Blueprint: Calculadora Médica Integral

## Visión General

Crear una aplicación móvil y web con Flutter que sirva como una herramienta médica todo-en-uno para profesionales de la salud. La aplicación contará con una calculadora de dosis, un compendio farmacológico, un verificador de interacciones medicamentosas y un dashboard principal. El diseño será moderno, intuitivo y estéticamente agradable, utilizando un efecto de "glassmorphism" para los componentes principales de la UI.

## Diseño y Estilo

- **Tema:** Moderno, limpio y profesional con soporte para modo claro y oscuro.
- **Efecto Visual Principal:** Glassmorphism (efecto de vidrio esmerilado) para los elementos persistentes de la UI, dándoles una apariencia de "píldoras" flotantes.
- **Paleta de Colores:** Se elegirá una paleta de colores calmada y profesional, probablemente basada en tonos azules o verdes, adecuada para el entorno médico.
- **Tipografía:** Se usará `google_fonts` para una tipografía clara, legible y moderna.
- **Iconografía:** Iconos intuitivos y de alta calidad para la navegación y las acciones.

## Arquitectura y Estructura

- **Manejo de Estado:** `provider` para la gestión del tema (claro/oscuro) y otros estados de la aplicación.
- **Navegación:** `go_router` para una navegación declarativa, robusta y compatible con enlaces profundos (deep linking), ideal para las diferentes secciones de la app.
- **Estructura de Archivos:** Organizada por funcionalidades (`screens`, `widgets`, `layout`, `theme`) para mantener el código limpio y escalable.

## Plan de Implementación

1.  **Configuración del Proyecto:**
    *   Crear el archivo `blueprint.md` para documentar el proyecto.
    *   Añadir las dependencias necesarias al `pubspec.yaml`: `google_fonts`, `provider`, y `go_router`.

2.  **Creación del Layout Persistente (Glassmorphism):**
    *   Desarrollar un widget reutilizable `GlassContainer` que encapsule el efecto de "glassmorphism" (blur, transparencia, bordes redondeados).
    *   Construir el widget `PersistentLayout` que servirá como el `ShellRoute` de `go_router`.

3.  **Configuración del Tema y Rutas:**
    *   Crear un archivo `theme.dart` para definir el `ThemeProvider` y los `ThemeData`.
    *   Configurar `go_router` en `main.dart` para usar el `PersistentLayout` como `ShellRoute`.

4.  **Mejoras en el Diseño y Contenido del Dashboard:**
    *   Actualizar el tema, la textura del fondo, y añadir un saludo en la cabecera.
    *   Añadir contenido al `dashboard_screen.dart` utilizando el widget `GlassContainer`.

5.  **Implementación de la Calculadora de Dosis:**
    *   Crear el archivo `lib/screens/calculator_screen.dart`.
    *   Diseñar e implementar una UI para calcular dosis de medicamentos.

6.  **Implementación del Compendio de Medicamentos:**
    *   Crear el archivo `lib/screens/compendium_screen.dart`.
    *   Diseñar una interfaz con una lista de medicamentos con capacidad de búsqueda.

7.  **Implementación del Verificador de Interacciones:**
    *   Crear el archivo `lib/screens/interactions_screen.dart`.
    *   Diseñar una interfaz para seleccionar dos medicamentos y comprobar sus interacciones (con lógica de placeholder).

8.  **Integración Final y Verificación:**
    *   Asegurar que todas las pantallas estén correctamente enrutadas en `lib/router/router.dart`.
    *   Verificar la consistencia de los nombres de las rutas y corregir discrepancias.
    *   Confirmar que la aplicación se compile y ejecute correctamente con todas las características implementadas.

## Estado del Proyecto: Completado

La aplicación "Calculadora Médica Integral" ha sido desarrollada exitosamente siguiendo el plan descrito en este documento. Todas las características principales, incluyendo el dashboard, la calculadora de dosis, el compendio de medicamentos y el verificador de interacciones, han sido implementadas con una interfaz de usuario consistente y moderna basada en el efecto "glassmorphism". La arquitectura subyacente utiliza `provider` para la gestión del estado y `go_router` para la navegación, asegurando una base sólida y escalable.
