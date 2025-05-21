<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use App\Repository\SpecializationRepository;
use Fpdf\Fpdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;

#[Route('/api/product')]
class ProductController extends AbstractController
{

    #[Route('/download-productlist', name: 'product_export', methods: ['GET'])]
    public function exportarProductosAPdf(ProductRepository $productRepository) : Response
    {
        $productos = $productRepository->findAll();

        // Instanciar un nuevo objeto FPDF
        $pdf = new FPDF(); // Orientación horizontal, unidad de medida en mm, tamaño de página A4
    
        // Agregar una nueva página al PDF
        $pdf->AddPage();

        // Definir el alias para el total de páginas
        // $pdf->AliasNbPages();
    
        // Definir el título del reporte
        $pdf->SetFont('Arial', 'B', 11);
        $pdf->Cell(0, 10, iconv('UTF-8', 'windows-1252', 'Reporte de Productos'), 1, 1, 'C');
    
        // Definir los encabezados de la tabla
        $pdf->SetFont('Arial', 'B', 8); // Cambiar el tamaño de la letra
        $pdf->SetFillColor(230, 230, 230);
        $pdf->Cell(27, 10, 'ID', 1, 0, 'C'); // Reducir la anchura de la celda
        $pdf->Cell(118, 10, iconv('UTF-8', 'windows-1252', 'Nombre'), 1, 0, 'C'); // Ajustar la anchura de la celda
        // $pdf->Cell(59, 10, iconv('UTF-8', 'windows-1252', 'Categoria'), 1, 0, 'C'); // Ajustar la anchura de la celda
        $pdf->Cell(45, 10, iconv('UTF-8', 'windows-1252', 'Monto'), 1, 0, 'C'); // Ajustar la anchura de la celda

        $pdf->Ln(); // Salto de línea para la siguiente fila
    
        // Recorrer los usuarios y mostrarlos en la tabla
        $pdf->SetFont('Arial', '', 8);
        foreach ($productos as $producto) {
            $pdf->Cell(27, 10, $producto->getId(), 1, 0, 'C');
            $pdf->Cell(118, 10, iconv('UTF-8', 'windows-1252', $producto->getName()), 1, 0, 'L');
            // $pdf->Cell(59, 10, iconv('UTF-8', 'windows-1252', $producto['categoria']), 1, 0, 'L');
            $pdf->Cell(45, 10, iconv('UTF-8', 'windows-1252', $producto->getPrice(). '€'), 1, 0, 'C');
            $pdf->Ln(); // Salto de línea para la siguiente fila
        }

        // Crear el footer en cada página
        // $pdf->SetFont('Arial', '', 8);
        // $pdf->SetY(-15); // Posicionamiento vertical del footer (1.5 cm desde el final)
        // $pdf->Cell(0, 10, 'Pagina ' . $pdf->PageNo() . 'de {nb}', 0, 0, 'C'); // Page No. and Total Pages
            
        // Generar el archivo PDF y descargarlo
        $pdfContent = $pdf->Output('S');
        // Generar el archivo PDF y descargarlo
        $response = new Response($pdfContent, 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename="Productos.pdf"'
        ]);

        return $response;
    }

}
