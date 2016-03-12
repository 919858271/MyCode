!Lyapunov_main
program Lyapunov_main
implicit none
    integer,parameter::n=3
    integer,parameter::nn=n+n*n
    integer,parameter::LeData=999
    integer:: i,k,nstep,ns=20
    real*8 Y(nn),znorm(n),le(n)
    real*8::tstart=0.0,stept=0.01,tend=1000,para=27,t,h
    nstep=(tend-tstart)/stept
    h=stept/ns;t=tstart
    Y(1)=10;Y(2)=1;Y(3)=0.0;
    do i=n+1,nn
        Y(i)=0.0
    end do
    do i=1,n
        Y((n+1)*i)=1.0
        le(i)=0.0
    end do
    open(LeData,file='LE.txt')
	do i=1,nstep
		call ODE45(nn,ns,Y,para,t,h)
	    call ORTH(n,znorm,Y)
		do k=1,n
			le(k)=le(k)+log(znorm(k))
		end do
        write(LeData,"(4f12.6)") t, le(1)/(t),le(2)/(t),le(3)/(t)
	end do
    close(LeData)
stop
end program Lyapunov_main
!ODE45 龙格库塔
subroutine ODE45(varNum,TotalIter,Y,para,t,tstep)
    integer varNum,TotalIter
    real*8 Y(varNum),k1(varNum),k2(varNum),k3(varNum),k4(varNum)
    real*8 para,t,tstep
    integer j
    do j=1,TotalIter
			call FCN(Y,k1,t,para)
			call FCN(Y+tstep/2*k1,k2,t+tstep/2,para)
			call FCN(Y+tstep/2*k2,k3,t+tstep/2,para)
			call FCN(Y+tstep*k3,k4,t+tstep,para)
			Y=Y+(k1+2*k2+2*k3+k4)*tstep/6.0
			t=t+tstep
		end do
end subroutine
!ORTH 施密特正交化
subroutine ORTH(n,znorm,Y)
    integer n,k,L,j
    real*8 znorm(n),gsc(n),Y(n+n*n)
		znorm(1)=0.0
		do j=1,n
		    znorm(1)=znorm(1)+Y(n*j+1)**2
		end do
		znorm(1)=sqrt(znorm(1))
		do j=1,n
		    Y(n*j+1)=Y(n*j+1)/znorm(1)
		end do
		do j=2,n
			do k=1,(j-1)
				gsc(k)=0.0
				do L=1,n
				    gsc(k)=gsc(k)+Y(n*L+j)*Y(n*L+k)
				end do
			end do
			do k=1,n
				do L=1,(j-1)
					Y(n*k+j)=Y(n*k+j)-gsc(L)*Y(n*k+L)
				end do
			end do
			znorm(j)=0.0
			do k=1,n
				znorm(j)=znorm(j)+Y(n*k+j)**2
			end do
			znorm(j)=sqrt(znorm(j))
			do k=1,n
				Y(n*k+j)=Y(n*k+j)/znorm(j)
			end do
		end  do
end subroutine
!FCN 动力系统方程
subroutine FCN(input,output,t,alfa)
    implicit none
    integer i
    real*8 t,input(12),output(12),alfa
    output(1)=10.0*(input(2)-input(1))
    output(2)=-input(1)*input(3)+alfa*input(1)-input(2)
    output(3)=input(1)*input(2)-2.666*input(3)
    do i=0,2
        output(4+i)=16.0*(input(7+i)-input(4+i))
        output(7+i)=(alfa-input(3))*input(4+i)-input(7+i)-input(1)*input(10+i)
        output(10+i)=input(2)*input(4+i)+input(1)*input(7+i)-2.666*input(10+i)
    enddo
end subroutine