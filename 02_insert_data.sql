-- inserçao de exemplos

insert into cliente (nome, cpf, endereco, telefone, email) values
('João Silva', '12345678901', 'Rua das Flores, 123', '11987654321', 'joao.silva@email.com'),
('Maria Oliveira', '98765432100', 'Av. Paulista, 456', '11912345678', 'maria.oliveira@email.com'),
('Carlos Souza', '11122233344', 'Rua Verde, 789', '11999887766', 'carlos.souza@email.com'),
('Ana Lima', '55566677788', 'Rua Azul, 101', '11911223344', 'ana.lima@email.com');

insert into produto (nome, tipo, descricao, preco) values
('Camiseta EGO', 'Vestuário', 'Camiseta de algodão com estampa da marca EGO.', 59.90),
('Tênis EGO Run', 'Calçado', 'Tênis esportivo confortável para corrida.', 249.99),
('Boné EGO Classic', 'Acessório', 'Boné preto com logo EGO bordado.', 79.50),
('Mochila EGO Travel', 'Acessório', 'Mochila resistente com compartimento para notebook.', 199.00);

insert into pedido (data_pedido, status_entrega, valor_total, id_cliente, status_pagamento, forma_pagamento) values
('2025-10-10 14:30:00', 1, 309.89, 1, true, 1),
('2025-10-11 16:45:00', 2, 249.99, 2, false, 2),
('2025-10-12 09:20:00', 3, 139.40, 3, true, 1),
('2025-10-13 11:10:00', 1, 278.50, 4, true, 3);

insert into item (id_produto, id_pedido, quantidade, subtotal) values
(1, 1, 2, 119.80),  -- 2 Camisetas para o pedido 1
(3, 1, 1, 79.50),   -- 1 Boné para o pedido 1
(2, 2, 1, 249.99),  -- 1 Tênis para o pedido 2
(4, 3, 1, 199.00);  -- 1 Mochila para o pedido 3

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