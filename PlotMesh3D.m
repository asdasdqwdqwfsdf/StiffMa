function PlotMesh3D(elements,nodes,pnodes,nelement)
% PlotMesh3D: Plot a structured grid in 3D with 8 node brick elements
%
% INPUT
%               nodes:       Coordinates (X,Y,Z) of the nodes
%               elements:    Conectivty matrix of the elements
%

fig = figure('color',[1 1 1]);
axh = axes('Parent',fig,'FontSize',14);
box(axh,'on');

%% PLOT THE ELEMENTS
n1 = elements(:,1);
n2 = elements(:,2);
n3 = elements(:,3);
n4 = elements(:,4);
n5 = elements(:,5);
n6 = elements(:,6);
n7 = elements(:,7);
n8 = elements(:,8);

Face1 = [n1 n2 n3 n4];
Face2 = [n5 n6 n7 n8];
Face3 = [n1 n2 n6 n5];
Face4 = [n3 n4 n8 n7];
Face5 = [n2 n3 n7 n6];
Face6 = [n1 n4 n8 n5];

Facesxy = [Face1;Face2];
Facesxz = [Face3;Face4];
Facesyz = [Face5;Face6];

Faces = [Facesxy;Facesxz;Facesyz];
patch('Vertices',nodes,'Faces',Faces,'EdgeColor','k','FaceColor',[.8,.9,1]);

%% Graph configuration
xlabel(axh,'x','FontSize',17,'FontWeight','bold');
ylabel(axh,'y','FontSize',17,'FontWeight','bold');
zlabel(axh,'z','FontSize',17,'FontWeight','bold');
view(3);
axis equal;
axis tight;
alpha(0.3);

if pnodes == 1
    hold on;
    plot3(nodes(:,1),nodes(:,2),nodes(:,3),'MarkerFaceColor',[0 0 0],'Marker','o','LineStyle','none');
    % node = strcat('  N',num2str([1:length(Mesh.ncoord)]'));
    n = strcat(num2str([1:length(nodes)]'));
    text(nodes(:,1),nodes(:,2),nodes(:,3),n,'fontsize',8,'color','k');
    hold off;
end
if nelement == 1
    hold on;
    for i = 1:size(elements,1)
        X = nodes(elements(i,:),1);
        Y = nodes(elements(i,:),2);
        Z = nodes(elements(i,:),3);
        text(sum(X)/8,sum(Y)/8,sum(Z)/8,int2str(i),'fontsize',10,'color','w','BackgroundColor',[0 0 0]);
    end
    hold off;
end
