
# BookData

## Purpose
Handles all data-related operations for books, including fetching, persistence, and storage.  
Acts as the bridge between Core and feature modules for Book entities.

## Responsibilities
- Provide repositories for books
- Manage local persistence and caching
- Support fetching data from remote sources (API, database)
- Abstract data layer for features to consume via CoreInterfaces

## Usage
- Feature modules (BooksListFeature, BookDetailsFeature) interact with BookData via protocols in CoreInterfaces
- Keeps feature modules independent of concrete data sources

## Notes
- Designed to follow MVVM + Clean Architecture
- Supports async/await and modern concurrency patterns
