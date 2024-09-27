program GerenciaEstoqueTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestuClienteControl in 'TestuClienteControl.pas',
  uClienteControl in '..\Controller\uClienteControl.pas',
  uClienteModel in '..\Model\uClienteModel.pas',
  uEnumerado in '..\Model\uEnumerado.pas',
  uClienteDAO in '..\DAO\uClienteDAO.pas',
  uConexao in '..\Conexao\uConexao.pas',
  UConecta in '..\Conexao\UConecta.pas',
  uSistemaControl in '..\Controller\uSistemaControl.pas',
  TestuProdutoControl in 'TestuProdutoControl.pas',
  uProdutoControl in '..\Controller\uProdutoControl.pas',
  uProdutoModel in '..\Model\uProdutoModel.pas',
  uProdutoDAO in '..\DAO\uProdutoDAO.pas',
  TestuEntradasProdutosControl in 'TestuEntradasProdutosControl.pas',
  uEntradasProdutosControl in '..\Controller\uEntradasProdutosControl.pas',
  uEntradasProdutosModel in '..\Model\uEntradasProdutosModel.pas',
  uEntradasProdutosDAO in '..\DAO\uEntradasProdutosDAO.pas',
  TestuPedidovendaControl in 'TestuPedidovendaControl.pas',
  uPedidovendaControl in '..\Controller\uPedidovendaControl.pas',
  uPedidovendaModel in '..\Model\uPedidovendaModel.pas',
  uPedidovendaDAO in '..\DAO\uPedidovendaDAO.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

