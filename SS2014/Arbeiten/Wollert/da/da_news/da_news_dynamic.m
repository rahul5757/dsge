function [residual, g1, g2, g3] = da_news_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           columns: equations in order of declaration
%                                                           rows: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              columns: equations in order of declaration
%                                                              rows: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(8, 1);
lhs =y(6);
rhs =params(2)*y(14)+params(3)*y(7);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =(-(y(8)-y(14)-y(9)))+y(15);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =params(6)*y(2)+(1-params(6))*(y(6)*params(5)+y(7)*params(4));
residual(3)= lhs-rhs;
lhs =y(10);
rhs =params(7)*y(3)+params(9)*x(it_, 1)+params(9)*y(5);
residual(4)= lhs-rhs;
lhs =x(it_, 1);
rhs =y(13);
residual(5)= lhs-rhs;
lhs =y(11);
rhs =y(4);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(10)*params(7)+y(11)*(1-params(8))/(1+params(1));
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(10)+y(7)-y(1)-(y(11)-y(4))/(1+params(1));
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 16);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,14)=(-params(2));
  g1(1,7)=(-params(3));
  g1(2,14)=(-1);
  g1(2,7)=1;
  g1(2,15)=(-1);
  g1(2,8)=1;
  g1(2,9)=(-1);
  g1(3,6)=(-((1-params(6))*params(5)));
  g1(3,7)=(-((1-params(6))*params(4)));
  g1(3,2)=(-params(6));
  g1(3,8)=1;
  g1(4,3)=(-params(7));
  g1(4,10)=1;
  g1(4,5)=(-params(9));
  g1(4,16)=(-params(9));
  g1(5,13)=(-1);
  g1(5,16)=1;
  g1(6,4)=(-1);
  g1(6,11)=1;
  g1(7,9)=1;
  g1(7,10)=(-params(7));
  g1(7,11)=(-((1-params(8))/(1+params(1))));
  g1(8,1)=1;
  g1(8,7)=(-1);
  g1(8,10)=(-1);
  g1(8,4)=(-1)/(1+params(1));
  g1(8,11)=1/(1+params(1));
  g1(8,12)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,256);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,4096);
end
end
