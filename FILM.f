      SUBROUTINE FILM(H,SINK,TEMP,KSTEP,KINC,TIME,NOEL,NPT,
     1 COORDS,JLTYP,FIELD,NFIELD,SNAME,NODE,AREA)
      INCLUDE 'ABA_PARAM.INC'
      DIMENSION H(2),TIME(2),COORDS(3),FIELD(NFIELD)
      CHARACTER*80 SNAME
      
      SINK=298.15				! Sink temperature
      H(1)=0.002169*(TEMP**1.61)		! Film coefficient
      H(2)=0.0034921*(TEMP**0.61)		! Rate of change of the film coefficient
30    RETURN
40    CONTINUE
      END
