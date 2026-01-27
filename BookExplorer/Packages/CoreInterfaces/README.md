
# CoreInterfaces

## Purpose
Defines protocols and abstractions for the Core and feature modules.  
Provides a contract for how different modules communicate without tight coupling.

## Responsibilities
- Declare interfaces for Core entities
- Define repository and service protocols
- Allow feature modules to consume Core functionality via abstractions
- Enable easy mocking for unit testing

## Usage
- Feature modules import CoreInterfaces to interact with Core modules
- Implementations of these protocols reside in Core or feature-specific modules

## Notes
- This module is strictly for interfaces and should not contain business logic
- Supports modular architecture and SOLID principles
