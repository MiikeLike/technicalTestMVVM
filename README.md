# 🚀 Rick and Morty - Prueba Técnica MVVM

## 📱 Descripción del Proyecto

Esta es una **prueba técnica** que demuestra la implementación del patrón arquitectónico **MVVM (Model-View-ViewModel)** en iOS utilizando **UIKit** y **Swift**. La aplicación consume la API pública de [Rick and Morty](https://rickandmortyapi.com/) para mostrar información sobre los personajes de la serie.

## 🎯 Objetivos de la Prueba Técnica

- ✅ Implementar el patrón **MVVM** correctamente
- ✅ Consumir una **API REST externa** (Rick and Morty)
- ✅ Manejar **asincronía** y **gestión de errores básica**
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
│ DetailVC        │    │ DetailVM         │    │ (Struct local)  │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │
                              ▼
                       ┌──────────────────┐
                       │  Alamofire API   │
                       │                  │
                       │ Rick and Morty   │
                       └──────────────────┘
```

### Estructura de Carpetas

```
technicalTestUIkit/
├── CharactersViewController.swift    # Lista de personajes + Modelos
├── View/
│   └── SecondViewController.swift    # Detalle del personaje
├── ViewModel/
│   ├── CharactersViewModel.swift     # Lógica de lista
│   └── CharactersDetailViewModel.swift # Lógica de detalle
├── Supporting Files/
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   └── Storyboards
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
- ✅ Estructura de datos `Character` con propiedades básicas
- ✅ Navegación a detalle del personaje
- ✅ Integración directa con Alamofire

### 2. Detalle del Personaje (`SecondViewController`)
- ✅ Información básica del personaje seleccionado
- ✅ Carga asíncrona de imagen del personaje
- ✅ UI simple pero funcional

### 3. ViewModels
- ✅ **CharactersViewModel**: Maneja la lista de personajes
- ✅ **CharactersDetailViewModel**: Maneja la carga de imágenes



### Prerrequisitos
- Xcode 12.0 o superior
- iOS 12.0 o superior
- CocoaPods instalado


### Flujo Principal
1. **Inicio**: La app carga la lista de personajes
2. **Navegación**: Usuario selecciona un personaje
3. **Detalle**: Se muestra información básica del personaje
4. **Navegación**: Usuario puede regresar a la lista

### Características Técnicas
- **Asincronía**: Operaciones de red asíncronas con Alamofire
- **Manejo de Errores**: Logs básicos en consola
- **Decodificación JSON**: Uso de `Codable` para parsing
- **Navegación**: Segues entre pantallas

## 🔍 Puntos Destacados de la Implementación

### 1. Separación de Responsabilidades (MVVM)
- **Model**: Estructura `Character` con propiedades básicas
- **View**: Controllers que manejan UI y navegación
- **ViewModel**: Lógica de negocio para datos e imágenes

### 2. Networking Básico
- **Alamofire**: Cliente HTTP para llamadas a la API
- **Decodificación**: Uso de `Codable` para JSON
- **Asincronía**: Completions para manejar respuestas

### 3. Estructura del Proyecto
- **Organización**: Carpetas separadas por responsabilidad
- **Navegación**: Segues configurados en Storyboard
- **Dependencias**: CocoaPods para gestión de librerías

## 🚀 Mejoras Futuras (Para Implementar)

- [ ] **Manejo de Errores**: Alertas para errores de red
- [ ] **Loading States**: Indicadores de carga
- [ ] **Pull-to-Refresh**: Actualización manual de datos
- [ ] **Paginación**: Carga de más personajes
- [ ] **Cache de Imágenes**: Evitar recargar imágenes
- [ ] **Tests Unitarios**: Con XCTest
- [ ] **UI Tests**: Automatizados
- [ ] **Manejo de Estados**: Estados de carga, error, éxito
- [ ] **Validación de Datos**: Verificación de respuestas de API
- [ ] **Logging**: Sistema de logs más robusto

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
  <p>Esta es una implementación básica pero funcional de MVVM que demuestra los conceptos fundamentales.</p>
  <p>Las mejoras futuras están documentadas para implementación posterior.</p>
</div>
