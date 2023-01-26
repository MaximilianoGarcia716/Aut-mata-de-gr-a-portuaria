%graficar posicion de codesys
figure
subplot(2,1,1);
hold on
grid on
plot(posicionCarro(:,1)*60,posicionCarro(:,2))


subplot(2,1,2); 
hold on
grid on
plot(posicionIzaje(:,1)*60,posicionIzaje(:,2))





%plot(posicionIzaje)