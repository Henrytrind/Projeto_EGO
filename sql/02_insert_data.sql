USE ego;

-- 1. CLIENTE
INSERT INTO cliente (nome_cliente, cpf, endereco, telefone, email, foto_perfil) VALUES
('Lucas Silva', '12345678901', 'Rua A, 123', '11987654321', 'lucas@email.com', 'lucas.jpg'),
('Maria Souza', '23456789012', 'Rua B, 456', '11976543210', 'maria@email.com', 'maria.jpg'),
('João Pereira', '34567890123', 'Rua C, 789', '11965432109', 'joao@email.com', 'joao.jpg'),
('Ana Lima', '45678901234', 'Rua D, 321', '11954321098', 'ana@email.com', 'ana.jpg'),
('Carlos Oliveira', '56789012345', 'Rua E, 654', '11943210987', 'carlos@email.com', 'carlos.jpg');

-- 2. PRODUTO
INSERT INTO produto (nome, tipo, descricao, preco) VALUES
('Pizza Margherita', 'Pizza', 'Pizza tradicional com molho de tomate, mussarela e manjericão', 25.50),
('Hambúrguer Clássico', 'Hambúrguer', 'Hambúrguer de carne bovina com queijo, alface e tomate', 18.00),
('Suco de Laranja', 'Bebida', 'Suco natural de laranja', 6.50),
('Salada Caesar', 'Salada', 'Salada com alface, frango, croutons e molho Caesar', 15.00),
('Sorvete Chocolate', 'Sobremesa', 'Sorvete cremoso de chocolate', 10.00);

-- 3. AVALIACAO
INSERT INTO avaliacao (id_cliente, id_produto, nota, comentario) VALUES
(1, 1, 5, 'Excelente pizza, muito saborosa!'),
(2, 2, 4, 'Hambúrguer gostoso, mas o pão poderia ser mais macio.'),
(3, 3, 5, 'Suco fresquinho e delicioso.'),
(4, 4, 3, 'Salada boa, mas pouca quantidade.'),
(5, 5, 4, 'Sorvete saboroso, mas um pouco derretido.');

-- 4. ENTREGADOR
INSERT INTO entregador (placa, telefone_entregador, nome_entregador, status_disponivel) VALUES
('ABC1234', '11911112222', 'Rafael', true),
('DEF5678', '11922223333', 'Bruna', true),
('GHI9012', '11933334444', 'Paulo', false),
('JKL3456', '11944445555', 'Camila', true),
('MNO7890', '11955556666', 'Ricardo', false);

-- 5. PEDIDO
INSERT INTO pedido (data_pedido, status_entrega, frete, valor_total, id_cliente, id_entregador) VALUES
('2025-10-30 12:00:00', 'processando', 5.00, 30.50, 1, 1),
('2025-10-30 12:30:00', 'enviado', 3.50, 21.50, 2, 2),
('2025-10-30 13:00:00', 'entregue', 2.50, 9.00, 3, 3),
('2025-10-30 13:30:00', 'cancelado', 4.00, 19.00, 4, 4),
('2025-10-30 14:00:00', 'processando', 6.00, 16.00, 5, 5);

-- 6. PAGAMENTO
INSERT INTO pagamento (valor_pagamento, metodo, data_pagamento, status_pagamento, id_pedido) VALUES
(30.50, 'pix', '2025-10-30 12:05:00', 'pago', 1),
(21.50, 'cartão-crédito', '2025-10-30 12:35:00', 'pago', 2),
(9.00, 'dinheiro', '2025-10-30 13:05:00', 'pago', 3),
(19.00, 'boleto', '2025-10-30 13:35:00', 'cancelado', 4),
(16.00, 'cartão-débito', '2025-10-30 14:05:00', 'pendente', 5);

-- 7. ITEM
INSERT INTO item (id_produto, id_pedido, quantidade, valor, subtotal) VALUES
(1, 1, 1, 25.50, 25.50),
(2, 2, 1, 18.00, 18.00),
(3, 3, 1, 6.50, 6.50),
(4, 4, 1, 15.00, 15.00),
(5, 5, 1, 10.00, 10.00);

-- 8. INGREDIENTE
INSERT INTO ingrediente (custo_adicional, nome_ingrediente) VALUES
(2.00, 'Bacon'),
(1.50, 'Queijo Extra'),
(0.50, 'Molho Especial'),
(1.00, 'Alface'),
(0.75, 'Tomate');

-- 9. PRODUTO_INGREDIENTE
INSERT INTO produto_ingrediente (id_produto, id_ingrediente, obrigatorio) VALUES
(1, 3, true),
(2, 1, false),
(2, 2, true),
(4, 4, true),
(4, 5, true);

-- 10. ITEM_INGREDIENTE
INSERT INTO item_ingrediente (id_item, id_ingrediente, adicionar) VALUES
(1, 3, true),
(2, 1, false),
(2, 2, true),
(4, 4, true),
(4, 5, true);

-- teste para ver se entrou os dados
select * from cliente;
select * from produto;
select * from pedido;
select * from item;

-- usar o JOIN para entrar na tabela
select p.id_pedido, c.nome as cliente, pr.nome as produto, i.quantidade, i.subtotal
from item i
join produto pr on i.id_produto = pr.id_produto
join pedido p on i.id_pedido = p.id_pedido
join cliente c on p.id_cliente = c.id_cliente;
