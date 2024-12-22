# GeoNamesKarate

## Project Overview
GeoNamesKarate is a project that automates testing for GeoNames web services using the Karate framework. GeoNames is a comprehensive geographical database that covers all countries and includes over 11 million place names, freely available for download.

## Technologies Used
- **Karate Framework**: An open-source BDD (Behavior-Driven Development) framework for web service testing.
- **Java**: Used as the primary programming language for test implementation.
- **Gradle**: A build automation tool for managing dependencies and executing tests.

## Requirements
- **Java Development Kit (JDK)**: Version 8 or higher.
- **Gradle**: Version 6.0 or higher.
- **Internet Connection**: Required to access GeoNames web services.

## Steps to Run from Command Line

1. **Clone the repository**:

   ```bash
   git clone https://github.com/FrankAtencioLoreth/GeoNamesKarate.git
2. **Navigate to the project directory**:

   ```bash
   cd GeoNamesKarate
3. **Run the tests**:
    ```
    gradle test --tests parallelTests -Dkarate.env=preprod -Duser=karate -DbaseUrl=http://api.geonames.org/ -i