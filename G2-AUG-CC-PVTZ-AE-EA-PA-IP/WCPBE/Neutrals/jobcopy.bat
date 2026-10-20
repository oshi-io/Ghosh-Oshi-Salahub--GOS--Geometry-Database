@ECHO OFF
FOR /D %%D IN (*) DO (
    IF EXIST "%%D\deMon.inp" COPY "C:\Users\user\Desktop\Molecule_Databank\16_functionals_input_files\job.sh" "%%D\"
)
ECHO Done!