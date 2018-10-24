% This Matlab function is part of the code package released as a
% supplementary material for the article: 
%
% "Evaluation of methods for detection of fluorescence labeled 
% subcellular objects in microscope images" by P. Ruusuvuori. T. Äijö, 
% S. Chowdhury, C. Garmendia-Torres, J. Selinummi, M. Birbaumer, et al. 
%
% We kindly request you to acknowledge the authors properly 
% (citation or request for permission from the authors) when using this
% function.
% 
% 2010 (C) S. Chowdhury, T. Äijö, P. Ruusuvuori, J. Selinummi
%
% Website: http://www.cs.tut.fi/sgn/csb/subcell

% H-dome transform
% 
function hdImage = hdTransform2(I, h, n)
    disp('Enter into h-d transform');
    smallNumber = 1e-7;
    se = strel(ones(n));
    J = I-h;
    flag = 0;
%      [R C] = size(I);
%    count = 0;
    pI = J*0;
    while flag==0
        tempJ = min( imdilate(J, se), I);
        resud = sum( sum(abs(J-tempJ) ));
        J =  tempJ;
        pI = max(pI,J);
%        count = count +1
        if resud < smallNumber
            flag = 1;
        end
    end

    hdImage = I-pI;
%         figure
%     subplot(2,2,1)
%     imshow(I,[])
%     subplot(2,2,2)
%      imshow(pI,[])
%         subplot(2,2,3)
%      imshow( hdImage,[])
%      colormap('jet')
%      linkaxes;
    disp('Exit from h-d transform');
end 
