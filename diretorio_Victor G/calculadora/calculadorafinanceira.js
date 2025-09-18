function calculoFinanceiro() {
    var qntTrutas = Number(input_qnttrutas.value)
    var precoVenda = Number(input_precovenda.value)
    var taxaAtual = Number(input_taxaatual.value)
    var custoImplantacao = 10000
    var taxaComIot = 0.05

    var conversaoPorcentagem = (taxaAtual / 100) * taxaAtual  // o numero 10 viraria 0.10

    var calculoReceita1 = (qntTrutas - (qntTrutas * conversaoPorcentagem)) * precoVenda
    var calculoReceita2 = (qntTrutas - (qntTrutas * taxaComIot)) * precoVenda

    var lucro = calculoReceita2 - calculoReceita1 // em meses

    var payback = custoImplantacao / lucro // em meses

    div_msg.innerHTML = `
        Você atualmente possui ${taxaAtual} % em perdas mensalmente, com um investimento de apenas R$ ${custoImplantacao}, 
        seu negócio passaria a possuir uma taxa de mortalidade de ${taxaComIot * 100} %, em um investimento que se pagaria em ${payback} meses, uma vez que sua receita passaria a ser ${calculoReceita2}

        ${lucro}
    `



}