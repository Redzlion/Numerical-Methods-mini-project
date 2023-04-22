function final_result_norm =gepp(A)
% inverse of A =  A_inverse 
% A is a Square - Hessenberg matrix which is invertible
% determinant of A = determinant
% cond of A = cond_of_matrix
% norm of matrix and its inverse = norm_of_matrix & norm_of_matrix_inverse
%final_result_norm= norm_of_matrix_inverse * norm_of_matrix
% final_result_norm is to prove the given 

determinant = det(A)
cond_of_matrix = cond(A)
norm_of_matrix = norm(A)
a=length(A); % the order of A is axa
I=eye(a);
augmat=[A I]; % Auhgmented Matrix
% GAUSSIAN ELMINATION METHOD:
% I is identity matrix of order axa, inv(A) is the inverse of A of order axa
% Converting A to its Echelon form
for i=1:a-1
    m=augmat(i,i);
    augmat(i,:)=augmat(i,:)/m; % normalization,so that pivot values will be equal to 1
    for j=i:a-1
        augmat(j+1,:)=augmat(j+1,:) - augmat(i,:)*augmat(j+1,i); % making the elements below the pivots as zero
    end
end
augmat(a,:)=augmat(a,:)/augmat(a,a); % normalization of the last row of A
% Converting A from its Echelon form to Row Reduced Echelon form
for k=2:a
    for g=(k-1):-1:1
        augmat(g,:)=augmat(g,:)-augmat(k,:)*augmat(g,k); % makes the elements above pivots to be row
    end
end
%We end up with A converted to I and I will be converted to inv(A)
A_inverse=augmat(:,a+1:2*a); % extracting inv(A) from augmented matrix [I inv(A)]
norm_of_matrix_inverse = norm(A_inverse)
final_result_norm= norm_of_matrix_inverse * norm_of_matrix;s
end