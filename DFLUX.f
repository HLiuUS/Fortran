      SUBROUTINE DFLUX(FLUX,SOL,KSTEP,KINC,TIME,NOEL,NPT,COORDS,
     1 JLTYP,TEMP,PRESS,SNAME)
      INCLUDE 'ABA_PARAM.INC'

      DIMENSION FLUX(2),TIME(2),COORDS(3)
      CHARACTER*80 SNAME

      V=0.25/60  		! Travel speed is 250 mm/min
      RBEAM=0.00125  	! Radius of laser beam
      VI=607.0   		! Laser power
      EFF=0.4   		! Absorptivity of the substrate and powder
      QTOT=EFF*VI  		! Equivalent laser power
      Q=QTOT/(3.1415*(RBEAM**2.0))    	% Power density

C    Deactivate the powder element (Model Change)
      if(TIME(2).LE.0.00000001)THEN
      ZM=0
      XM=COORDS(1)

C    First layer
      ELSE IF(TIME(2).GE.0.00000001.AND.TIME(2).LE.1.80000011)THEN
      ZM=COORDS(3)-V*(TIME(2)-0.00000001)-0.0026
      XM=COORDS(1)

C    Second layer
      ELSE IF(TIME(2).GE.1.80000012.AND.TIME(2).LE.3.60000022)THEN
      ZM=COORDS(3)+V*(TIME(2)-1.80000011)-0.0026-0.0075
      XM=COORDS(1)
      ELSE

C    Third layer
      ZM=COORDS(3)-V*(TIME(2)-3.60000022)-0.0026
      XM=COORDS(1)
      END IF

C    Heat flux only exists within the laser beam; in areas outside of the laser beam, heat flux is 0
      R=SQRT(ZM**2.0+XM**2.0)		
      C=(R**2.0)/(RBEAM**2.0)
      IF(C.GT.1.0) GOTO 10

      FLUX(1)=Q
10  RETURN
20  CONTINUE
      END
