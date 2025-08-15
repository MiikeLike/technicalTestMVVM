# 🚀 Rick and Morty - Prueba Técnica MVVM

## 📱 Descripción del Proyecto

Esta es una **prueba técnica** que demuestra la implementación del patrón arquitectónico **MVVM (Model-View-ViewModel)** en iOS utilizando **UIKit** y **Swift**. La aplicación consume la API pública de [Rick and Morty](https://rickandmortyapi.com/) para mostrar información sobre los personajes de la serie.

## 🎯 Objetivos de la Prueba Técnica

- ✅ Implementar el patrón **MVVM** correctamente
- ✅ Consumir una **API REST externa** (Rick and Morty)
- ✅ Manejar **asincronía** y **gestión de errores**
- ✅ Implementar **navegación** entre pantallas
- ✅ Mostrar **listas** y **detalles** de personajes
- ✅ Aplicar **buenas prácticas** de desarrollo iOS

## 🏗️ Arquitectura del Proyecto

### Patrón MVVM Implementado

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│      View       │    │    ViewModel     │    │      Model      │
│                 │    │                  │    │                 │
│ ViewController  │◄──►│ CharactersVM     │◄──►│ Character       │
│ DetailVC        │    │ DetailVM         │    │ Location        │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │
                              ▼
                       ┌──────────────────┐
                       │  NetworkService  │
                       │                  │
                       │ Alamofire + API  │
                       └──────────────────┘
```

### Estructura de Carpetas

```
technicalTestUIkit/
├── Model/
│   └── Character.swift          # Modelos de datos
├── View/
│   ├── CharactersViewController.swift    # Lista de personajes
│   └── SecondViewController.swift        # Detalle del personaje
├── ViewModel/
│   ├── CharactersViewModel.swift         # Lógica de lista
│   └── CharactersDetailViewModel.swift   # Lógica de detalle
├── Services/
│   └── NetworkService.swift             # Servicio de red
└── Supporting Files/
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    └── Storyboards
```

## 🛠️ Tecnologías Utilizadas

- **iOS 12.0+**
- **Swift 5.0+**
- **UIKit** (Interface Builder + Storyboards)
- **Alamofire** - Networking y HTTP requests
- **CocoaPods** - Gestión de dependencias

## 📋 Funcionalidades Implementadas

### 1. Lista de Personajes (`CharactersViewController`)
- ✅ Carga asíncrona de personajes desde la API
- ✅ Paginación automática (scroll infinito)
- ✅ Pull-to-refresh para actualizar datos
- ✅ Indicador de carga (Activity Indicator)
- ✅ Manejo de errores con alertas
- ✅ Navegación a detalle del personaje

### 2. Detalle del Personaje (`SecondViewController`)
- ✅ Información completa del personaje seleccionado
- ✅ Carga asíncrona de imagen del personaje
- ✅ Manejo de errores en carga de imágenes
- ✅ UI responsive y bien estructurada

### 3. Servicios de Red (`NetworkService`)
- ✅ Cliente HTTP con Alamofire
- ✅ Decodificación JSON automática
- ✅ Manejo de errores de red
- ✅ Singleton pattern para reutilización


### Prerrequisitos
- Xcode 12.0 o superior
- iOS 12.0 o superior
- CocoaPods instalado


## 🧪 Casos de Uso

### Flujo Principal
1. **Inicio**: La app carga la lista de personajes
2. **Navegación**: Usuario selecciona un personaje
3. **Detalle**: Se muestra información completa del personaje
4. **Navegación**: Usuario puede regresar a la lista

### Características Técnicas
- **Asincronía**: Todas las operaciones de red son asíncronas
- **Manejo de Errores**: Alertas informativas para errores de red
- **Performance**: Paginación para manejar grandes cantidades de datos
- **UX**: Indicadores de carga y pull-to-refresh

## 🔍 Puntos Destacados de la Implementación

### 1. Separación de Responsabilidades (MVVM)
- **Model**: Estructuras de datos puras (`Character`, `Location`)
- **View**: Controllers que solo manejan UI
- **ViewModel**: Lógica de negocio y estado de la UI

### 2. Networking Robusto
- **Singleton Service**: `NetworkService.shared`
- **Error Handling**: Enum `NetworkError` personalizado
- **Decodificación**: Uso de `Codable` para JSON

### 3. UI/UX Profesional
- **Navegación**: Títulos grandes y jerarquía clara
- **Feedback**: Activity indicators y pull-to-refresh
- **Responsive**: Manejo de diferentes tamaños de pantalla


## 📚 Recursos de Referencia

- [Rick and Morty API](https://rickandmortyapi.com/)
- [MVVM Pattern en iOS](https://developer.apple.com/documentation/swiftui)
- [Alamofire Documentation](https://github.com/Alamofire/Alamofire)
- [UIKit Framework](https://developer.apple.com/documentation/uikit)

## 👨‍💻 Autor

**Mikel Valle** - iOS Developer

## 📄 Licencia

Este proyecto es una prueba técnica y está destinado únicamente para fines de evaluación.

---

<div align="center">
  <p><strong>¡Gracias por revisar mi prueba técnica! 🎉</strong></p>
  <p>Espero que demuestre mis habilidades en desarrollo iOS y arquitectura MVVM.</p>
</div>
