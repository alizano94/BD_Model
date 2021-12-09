      SUBROUTINE QuadControl(Psi6,lambda,ControP,C6,flag)
      
      
c     parameter defination 
      character OneDcontroller*30
      
      integer,parameter ::N1=50,N2=120,N=N1*N2
      
      integer Controlpolicy(N),RealDPsi6,RealDC6,ControP,flag
      
      double precision Psi6,dPsi6,Psi6_0,C6,C6_0,dC6,disPsi6,disC6
      
      double precision Voltage,lambda
      
      double precision conn6avg
      Psi6_0=0.0
      dPsi6=0.02
      C6_0=0.0
      dC6=0.05
      open(214,file='Policycheck.txt')
      do i=1,N
        read(214,'(i1)') Controlpolicy(i)
      end do 
      close(214)

      open(2,file='PolicyOut.txt')
      do i=1,N
        write(2,'(i1)') Controlpolicy(i)
      end do 

      close(2)

c      !discretize the BD simulated order parameter 
      
      
      
      if (Psi6 .lt. Psi6_0) then
      Psi6=Psi6_0
      end if
      if (C6 .lt. C6_0) then
       C6=C6_0
      end if

      if (Psi6 .gt. 1) then
       Psi6=1
      end if
            
      if (C6 .gt. 6) then
      C6=6
      end if
    
      RealDPsi6 = int((Psi6-0)/dPsi6)+1
      RealDC6 = int((C6-C6_0)/dC6)+1
      
      ControP=Controlpolicy((RealDC6-1)*50+RealDPsi6) 
      
      
c      !Convert the control into actual voltage
      
      if (ControP .eq. 4) then
      lambda=0.2186
      end if
      if (ControP .eq. 3) then
      lambda=1.9674
      end if
      if (ControP .eq. 2) then
      lambda=0.8744
      end if      
      if (ControP .eq. 1) then
      lambda=19.7283
      end if 
      
      if (lambda .eq. 0.2186) then
      ControP=1
      end if
      if (lambda .eq. 0.8744) then
      ControP=2
      end if
      if (lambda .eq. 1.9674) then
      ControP=3
      end if
      if (lambda .eq. 19.7283) then
      ControP=4
      end if
 
      return 
      end