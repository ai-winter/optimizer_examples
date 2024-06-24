#include <OsqpEigen/OsqpEigen.h>

Eigen::SparseMatrix<double> _convertToSparseMatrix(Eigen::MatrixXd A)
{
  int row = A.rows();
  int col = A.cols();
  Eigen::SparseMatrix<double> A_s(row, col);

  for (int i = 0; i < row; i++)
    for (int j = 0; j < col; j++)
      A_s.insert(i, j) = A(i, j);

  return A_s;
}

int main(int argc, char** argv)
{
  Eigen::Matrix2d P;
  P << 4, 1, 1, 2;

  Eigen::Vector2d q;
  q << 1, 1;
  Eigen::MatrixXd A(3, 2);
  A << 1, 1, 1, 0, 0, 1;
  Eigen::Vector3d lower, upper;
  lower << 1, 0, 0;
  upper << 1, 0.7, 0.7;

  // solve
  OsqpEigen::Solver solver;
  solver.settings()->setVerbosity(true);
  solver.settings()->setWarmStart(true);
  solver.data()->setNumberOfVariables(2);
  solver.data()->setNumberOfConstraints(3);
  solver.data()->setHessianMatrix(_convertToSparseMatrix(P));
  solver.data()->setGradient(q);
  solver.data()->setLinearConstraintsMatrix(_convertToSparseMatrix(A));
  solver.data()->setLowerBound(lower);
  solver.data()->setUpperBound(upper);

  solver.initSolver();
  solver.solveProblem();

  Eigen::VectorXd solution = solver.getSolution();

  std::cout << "osqp-eigen solution is x1: " << solution[0] << ", x2: " << solution[1] << "\n";
}