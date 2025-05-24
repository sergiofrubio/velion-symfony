<?php

namespace App\Controller;

use App\Repository\InvoiceRepository;
use App\Repository\SpecializationRepository;
use Fpdf\Fpdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;

#[Route('/api/invoice')]
class InvoiceController extends AbstractController
{
    #[Route('/generate-invoice', name: 'user_export', methods: ['GET'])]
    function generarFacturaPDF(): Response
    {
        // Datos de prueba
        $empresa = [
            'nombre' => 'Clínica Fisioterapia',
            'direccion' => 'Av. Prueba, 17',
            'ciudad' => 'Córdoba, Córdoba, 14001',
            'telefono' => '957 000 000 • 600 000 000',
            'cif' => 'CIF: X-12345678',
            'logo' => $this->getParameter('kernel.project_dir') . '/public/Aquiles-logo.png' // Ruta absoluta al logo
        ];

        $factura = [
            'numero' => 'FAC-2025-001',
            'fecha' => '2025-05-24',
            'productos' => [
                ['descripcion' => 'Sesión de fisioterapia', 'cantidad' => 2, 'precio' => 50.00],
                ['descripcion' => 'Consulta inicial', 'cantidad' => 1, 'precio' => 30.00],
            ],
            'iva' => 21 // Porcentaje de IVA
        ];

        // Calcular totales
        $subtotal = array_reduce($factura['productos'], function ($carry, $producto) {
            return $carry + ($producto['cantidad'] * $producto['precio']);
        }, 0);
        $iva = $subtotal * ($factura['iva'] / 100);
        $total = $subtotal + $iva;

        // Crear el PDF
        $pdf = new Fpdf('P', 'mm', 'A4');
        $pdf->AddPage();

        // Encabezado: Logo y datos de la empresa
        if (file_exists($empresa['logo'])) {
            $pdf->Image($empresa['logo'], 10, 10, 40); // Logo en la esquina superior izquierda
        }
        $pdf->SetFont('Arial', '', 12);
        $pdf->SetXY(60, 10);
        $pdf->MultiCell(0, 6, utf8_decode("{$empresa['nombre']}\n{$empresa['direccion']}\n{$empresa['ciudad']}\nTel.: {$empresa['telefono']}\n{$empresa['cif']}"));

        // Número de factura y fecha
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->SetXY(10, 50);
        $pdf->Cell(0, 10, utf8_decode("Factura Nº: {$factura['numero']}"), 0, 1, 'C');
        $pdf->SetFont('Arial', '', 12);
        $pdf->Cell(0, 10, utf8_decode("Fecha: {$factura['fecha']}"), 0, 1, 'C');

        // Tabla de productos
        $pdf->SetY(80);
        $pdf->SetFont('Arial', 'B', 12);
        $pdf->SetFillColor(230, 230, 230); // Color de fondo para el encabezado de la tabla
        $pdf->Cell(100, 10, utf8_decode('Descripción'), 1, 0, 'C', true);
        $pdf->Cell(30, 10, utf8_decode('Cantidad'), 1, 0, 'C', true);
        $pdf->Cell(30, 10, utf8_decode('Precio'), 1, 0, 'C', true);
        $pdf->Cell(30, 10, utf8_decode('Total'), 1, 1, 'C', true);

        $pdf->SetFont('Arial', '', 12);
        foreach ($factura['productos'] as $producto) {
            $pdf->Cell(100, 10, utf8_decode($producto['descripcion']), 1, 0, 'L');
            $pdf->Cell(30, 10, $producto['cantidad'], 1, 0, 'C');
            $pdf->Cell(30, 10, number_format($producto['precio'], 2) . ' €', 1, 0, 'R');
            $pdf->Cell(30, 10, number_format($producto['cantidad'] * $producto['precio'], 2) . ' €', 1, 1, 'R');
        }

        // Totales
        $pdf->SetFont('Arial', 'B', 12);
        $pdf->Cell(160, 10, utf8_decode('Subtotal'), 0, 0, 'R');
        $pdf->Cell(30, 10, number_format($subtotal, 2) . ' €', 0, 1, 'R');

        $pdf->Cell(160, 10, utf8_decode("IVA ({$factura['iva']}%)"), 0, 0, 'R');
        $pdf->Cell(30, 10, number_format($iva, 2) . ' €', 0, 1, 'R');

        $pdf->Cell(160, 10, utf8_decode('Total'), 0, 0, 'R');
        $pdf->Cell(30, 10, number_format($total, 2) . ' €', 0, 1, 'R');

        // Generar el archivo PDF y devolverlo como respuesta
        $pdfContent = $pdf->Output('S');
        $response = new Response($pdfContent, 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename="Factura.pdf"'
        ]);

        return $response;
    }

}
