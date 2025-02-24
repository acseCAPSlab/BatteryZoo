# Battery Modelling Database README

## Overview
The Battery Modelling Database is a comprehensive library of battery parameters and characteristics collected from various sources. This database is intended to support battery modelling by providing model parameters on a wide range of batteries.

## Contents
The database contains the following key fields for each battery entry:
- `model`: The model name or identifier of the battery.
- `commercial`: Commercial availability of the battery.
- `chemistry`: The chemical composition of the battery (e.g., LCO, LFP, NMC).
- `format`: The physical format of the battery (e.g., cylindrical, prismatic).
- `capacity`: The nominal capacity of the battery in Ah.
- `voltage`: The nominal voltage of the battery in V.
- `mass`: The mass of the battery in grams.
- `dimensions`: The dimensions of the battery in mm.
- `cycle_life`: The cycle life of the battery for 80% of initial capacity.
- `cycle_life_info`: Additional information about the cycle life conditions.
- `Q`: The charge capacity of the battery in As.
- `R0`: The initial internal resistance of the battery in Ohm.
- `R1`: The first resistance parameter of the battery in Ohm.
- `C1`: The first capacitance parameter of the battery in F.
- `R2`: The second resistance parameter of the battery in Ohm.
- `C2`: The second capacitance parameter of the battery in F.
- `OCV_points`: Points on the Open Circuit Voltage curve.
- `OCV_coeff`: Coefficients for the Open Circuit Voltage curve fitting.
- `R0_SOC`: Internal resistance dependent on SOC.
- `R1_SOC`: First resistance dependent on SOC.
- `C1_SOC`: First capacitance dependent on SOC.
- `R2_SOC`: Second resistance dependent on SOC.
- `C2_SOC`: Second capacitance dependent on SOC.
- `info`: Information about the source.
- `aux_info`: Auxiliary information related to the battery.

## Data Collection Process
- The data has been collected from various sources including academic papers, manufacturer datasheets and experimental results.
- Dependencies of model parameters on the state-of-charge (SOC) are included where available.
- The database includes results from digitising experimental OCV-curve plots using an online resource to transform plots into sets of points.

## Usage
- The database is intended for use in battery modeling and simulation applications.
- The database can be expanded with additional entries as more data becomes available.


## Make Your Contribution

1. Locate a paper that contains data about a battery. Recommended resources include IEEE Xplore, ScienceDirect or similar databases. Our priority is to collect experimental Open Circuit Voltage (OCV) curves, model parameters (R, C) for the equivalent circuit model (ECM) of the first and/or second order, and a detailed model of the battery.

2. Convert OCV curve plots into digital data arrays, typically .csv files for MATLAB processing. Recommended tool: WebPlotDigitizer (https://apps.automeris.io/wpd4/).

3. If model parameters (resistances, capacitances) are given as functions of State of Charge (SOC), digitise them in the same way as the OCV curves and save them as .csv files.

4. If model parameters are given as constants, directly input these values into the corresponding fields in the database. If parameters are given as curves, extract the constant value by averaging over the most monotonic interval (typically 10%-90% or 20%-80%) and fill in the database field.

5. If the paper provides separate curves for charge and discharge scenarios, use the interpol.m file to obtain a universal (average) curve from two .csv files representing the charging and discharging curves.

6. Run base_program.m to compute coefficients for the approximating curve. Save these coefficients in a separate file for later transfer to the database.

7. Create a new folder for the battery following the existing folder structure and populate the folder with content similar to existing examples.

8. Modify the struct_create.m file to include all the information about the new battery.

9. Run struct_create.m to incorporate the new battery data into the main database.

10. Celebrate success! But not for too long, there are still more batteries to add...
