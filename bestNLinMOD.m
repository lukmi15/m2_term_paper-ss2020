% Bearbeiter_A = Fabian Rod

function PN = bestNLinMOD()

PN = zeros(3,1);
    for j=1:3
        Nstart = 10;
        Nend = 100;
        k=1;

        switch j
            case 1
               s = @s;
            case 2
               s = @s3;
            case 3
               s = @s4;
        end

        [z,u]= stationaer_lin(s,10000);

        A = zeros(length(z),2);
        A(:,1) = z;
        A(:,2) = u;

        while k < 4
            i = Nstart;
            while i^k <= Nend^k
                [z,u]= stationaer_lin(s,i^k);
                B = zeros(length(z),2);
                B(:,1) = z;
                B(:,2) = u;
                [~,LocB] = ismember(A,B);
                [~,LocA] = ismember(B,A);
                LocB = nonzeros(LocB);
                LocA = nonzeros(LocA);   
                seeA = A((LocA),2);
                seeB = B((LocB),2);
                %ValueA = sum(A((LocA),2))/length(LocA);
                %ValueB = sum(B((LocB),2))/length(LocB);
                %result(i,1) = (abs(ValueA - ValueB))/abs(ValueA);

                result = abs(seeA(:,1)-seeB(:,1))./abs(seeA(:,1));
                promille = nonzeros(result > 0.001);
                if (isempty(promille))
                    PN(j,1) = i^k;
                    k=3;
                    i = Nend^k;
                end    
                i = i+Nstart^k;
            end
            k = k +1;
        end
    end
end