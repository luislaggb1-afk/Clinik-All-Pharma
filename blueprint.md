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

## Plan de Implementación Actual

1.  **Configuración del Proyecto:**
    *   Crear el archivo `blueprint.md` para documentar el proyecto.
    *   Añadir las dependencias necesarias al `pubspec.yaml`: `google_fonts`, `provider`, y `go_router`.

2.  **Creación del Layout Persistente (Glassmorphism):**
    *   Desarrollar un widget reutilizable `GlassContainer` que encapsule el efecto de "glassmorphism" (blur, transparencia, bordes redondeados).
    *   Construir el widget `PersistentLayout` que servirá como el `ShellRoute` de `go_router`. Este layout contendrá:
        *   Un fondo degradado para resaltar el efecto de vidrio.
        *   **Píldora de Cabecera (Heather):** En la parte superior izquierda, mostrando el nombre de la app y un saludo.
        *   **Píldora de Ajustes (Settings Pill):** En la parte superior derecha, con iconos para "Ajustes" y "Perfil".
        *   **Píldora de Navegación (Nav Bar):** Una barra de navegación vertical a la izquierda con iconos para las secciones principales: Dashboard, Calculadora, Compendio y Verificador de Interacciones.

3.  **Configuración del Tema y Rutas:**
    *   Crear un archivo `theme.dart` para definir el `ThemeProvider` y los `ThemeData` para los modos claro y oscuro, usando `ColorScheme.fromSeed`.
    *   Configurar `go_router` en `main.dart` para usar el `PersistentLayout` como `ShellRoute`, haciendo que el layout sea persistente a través de las diferentes pantallas.
    *   Crear pantallas de marcador de posición (placeholder) para cada una de las secciones de la barra de navegación.

4.  **Integración Final:**
    *   Modificar `lib/main.dart` para inicializar el `ThemeProvider` y el `GoRouter`, y poner en marcha la nueva estructura de la aplicación.
