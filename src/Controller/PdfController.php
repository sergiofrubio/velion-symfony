<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use App\Repository\SpecializationRepository;
use Fpdf\Fpdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;

#[Route('/admin/download')]
class PdfController extends AbstractController
{
    #[Route('/user-list', name: 'user_export', methods: ['GET'])]
    public function exportarUsuariosAPdf(UserRepository $userRepository,): Response
    {
        // Instanciar un nuevo objeto FPDF
        $pdf = new FPDF('L', 'mm', 'A4'); // Orientación horizontal, unidad de medida en mm, tamaño de página A4

        // Agregar una nueva página al PDF
        $pdf->AddPage();

        // Definir el alias para el total de páginas
        // $pdf->AliasNbPages();

        // Definir el título del reporte
        $pdf->SetFont('Arial', 'B', 11);
        $pdf->Cell(0, 10, 'Reporte de Usuarios', 1, 1, 'C');

        // Definir los encabezados de la tabla
        $pdf->SetFont('Arial', 'B', 8); // Cambiar el tamaño de la letra
        $pdf->SetFillColor(230, 230, 230);
        $pdf->Cell(17, 10, 'ID', 1, 0, 'C'); // Reducir la anchura de la celda
        $pdf->Cell(25, 10, 'Nombre', 1, 0, 'C'); // Ajustar la anchura de la celda
        $pdf->Cell(25, 10, 'Apellidos', 1, 0, 'C'); // Ajustar la anchura de la celda
        $pdf->Cell(20, 10, 'Telefono', 1, 0, 'C'); // Ajustar la anchura de la celda
        $pdf->Cell(25, 10, 'F. Nac.', 1, 0, 'C'); // Ajustar la anchura de la celda
        $pdf->Cell(110, 10, 'Direccion', 1, 0, 'C'); // Ajustar la anchura de la celda
        $pdf->Cell(40, 10, 'Email', 1, 0, 'C'); // Ajustar la anchura de la celda
        // $pdf->Cell(40, 10, 'Rol', 1, 0, 'C'); // Reducir la anchura de la celda
        $pdf->Cell(15, 10, 'Genero', 1, 0, 'C'); // Reducir la anchura de la celda
        $pdf->Ln(); // Salto de línea para la siguiente fila

        // // Obtener los datos de los usuarios (ejemplo usando una consulta a BD)
        $usuarios = $userRepository->findAll(); // Suponiendo que 'obtenerUsuarios' devuelve un array de usuarios

        // Recorrer los usuarios y mostrarlos en la tabla
        $pdf->SetFont('Arial', '', 8);
        foreach ($usuarios as $usuario) {
            $pdf->Cell(17, 10, $usuario->getId(), 1, 0, 'C');
            $pdf->Cell(25, 10, $usuario->getName(), 1, 0, 'L');
            $pdf->Cell(25, 10, $usuario->getSurname(), 1, 0, 'L');
            $pdf->Cell(20, 10, $usuario->getPhone(), 1, 0, 'C');
            $pdf->Cell(25, 10, $usuario->getBirthDate()->format('Y-m-d'), 1, 0, 'C');
            $pdf->Cell(110, 10, $usuario->getAddress() . ', ' . $usuario->getProvince() . ', ' . $usuario->getCity() . ', ' . $usuario->getZip(), 1, 0, 'L');
            $pdf->Cell(40, 10, $usuario->getEmail(), 1, 0, 'L');
            // $pdf->Cell(40, 10, implode(', ', $usuario->getRoles()), 1, 0, 'C');
            $pdf->Cell(15, 10, $usuario->getGenre(), 1, 0, 'C');
            $pdf->Ln(); // Salto de línea para la siguiente fila
        }

        // Crear el footer en cada página
        // $pdf->SetFont('Arial', '', 8);
        // $pdf->SetY(-15); // Posicionamiento vertical del footer (1.5 cm desde el final)
        // $pdf->Cell(0, 10, 'Pagina ' . $pdf->PageNo() . 'de {nb}', 0, 0, 'C'); // Page No. and Total Pages

        $pdfContent = $pdf->Output('S');
        // Generar el archivo PDF y descargarlo
        $response = new Response($pdfContent, 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename="ReporteUsuarios.pdf"'
        ]);

        return $response;
    }


    // function generarFacturaPDF($factura_id) : Response
    // {
    //     $factura = $this->invoiceModel->obtenerDatosFactura($factura_id);
    //     //echo(json_encode($factura));

    //     // Verificar si se encontró la factura
    //     if ($factura) {
    //         $pdf = new PDF_Invoice('P', 'mm', 'A4');
    //         $pdf->AddPage();
    //         $pdf->addSociete(
    //             iconv('UTF-8', 'windows-1252', 'Clínica Fisioterapia'),
    //             "CIF: X-12345678\n" .
    //                 "Av. Prueba, 17\n" .
    //                 iconv('UTF-8', 'windows-1252', "Córdoba, Córdoba, 14001\n") .
    //                 iconv('UTF-8', 'windows-1252', "Tel.: 957 000 000 • 600 000 000")
    //         );
    //         $pdf->fact_dev("Factura:", $factura_id);
    //         // $pdf->temporaire("Devis temporaire");
    //         $pdf->addDate($factura[0]['fecha_emision']);
    //         $pdf->addClient($factura[0]['paciente_id']);
    //         $pdf->addPageNumber("1");
    //         $pdf->addClientAdresse($factura);
    //         $pdf->addReglement("Tarjeta");
    //         $pdf->addEstado("Pagada");
    //         $pdf->addNumTVA("FR888777666");
    //         // $pdf->addReference("Devis ... du ....");
    //         $cols = array(
    //             "REF"    => 23,
    //             iconv('UTF-8', 'windows-1252', "DESCRIPCIÓN")  => 78,
    //             "CANTIDAD"     => 22,
    //             "PRECIO UNITARIO" => 37,
    //             "PRECIO TOTAL" => 30,
    //         );
    //         $pdf->addCols($cols);
    //         $cols = array(
    //             "REF"    => "L",
    //             iconv('UTF-8', 'windows-1252', "DESCRIPCIÓN")  => "L",
    //             "CANTIDAD"     => "C",
    //             "PRECIO UNITARIO" => "R",
    //             "PRECIO TOTAL" => "R",
    //         );
    //         $pdf->addLineFormat($cols);
    //         $pdf->addLineFormat($cols);

    //         $y    = 109;
    //         $line = array(
    //             "REF"    => "REF1",
    //             iconv('UTF-8', 'windows-1252', "DESCRIPCIÓN")  => iconv('UTF-8', 'windows-1252', $factura[0]['producto_nombre']),
    //             "CANTIDAD"     => "1",
    //             "PRECIO UNITARIO"      => $factura[0]['monto'] . EURO,
    //             "PRECIO TOTAL" => $factura[0]['monto'] . EURO,
    //         );
    //         $size = $pdf->addLine($y, $line);
            
    //         $pdfContent = $pdf->Output('S');
    //         // Generar el archivo PDF y descargarlo
    //         $response = new Response($pdfContent, 200, [
    //             'Content-Type' => 'application/pdf',
    //             'Content-Disposition' => 'inline; filename="Factura.pdf"'
    //         ]);
    
    //         return $response;
    //     }
    // }

    #[Route('/product-list', name: 'product_export', methods: ['GET'])]
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

    #[Route('/specialization-list', name: 'specialization_export', methods: ['GET'])]
    public function exportarEspecialidadesAPdf(SpecializationRepository $specializationRepository) : Response
    {
        $especialidades = $specializationRepository->findAll();
    
        // Instanciar un nuevo objeto FPDF
        $pdf = new FPDF(); // Orientación horizontal, unidad de medida en mm, tamaño de página A4
    
        // Agregar una nueva página al PDF
        $pdf->AddPage();

        // Definir el alias para el total de páginas
        // $pdf->AliasNbPages();
    
        // Definir el título del reporte
        $pdf->SetFont('Arial', 'B', 11);
        $pdf->Cell(0, 10, iconv('UTF-8', 'windows-1252', 'Reporte de Especialidades médicas'), 1, 1, 'C');
    
        // Definir los encabezados de la tabla
        $pdf->SetFont('Arial', 'B', 8); // Cambiar el tamaño de la letra
        $pdf->SetFillColor(230, 230, 230);
        $pdf->Cell(27, 10, 'ID', 1, 0, 'C'); // Reducir la anchura de la celda
        $pdf->Cell(163, 10, iconv('UTF-8', 'windows-1252', 'Descripción'), 1, 0, 'C'); // Ajustar la anchura de la celda
        // $pdf->Cell(45, 10, iconv('UTF-8', 'windows-1252', 'Última modificación'), 1, 0, 'C'); // Ajustar la anchura de la celda
        $pdf->Ln(); // Salto de línea para la siguiente fila
    
        // Recorrer los usuarios y mostrarlos en la tabla
        $pdf->SetFont('Arial', '', 8);
        foreach ($especialidades as $especialidad) {
            $pdf->Cell(27, 10, $especialidad->getId(), 1, 0, 'C');
            $pdf->Cell(163, 10, iconv('UTF-8', 'windows-1252', $especialidad->getDescription()), 1, 0, 'L');
            // $pdf->Cell(45, 10, $especialidad['fecha'], 1, 0, 'C');
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
            'Content-Disposition' => 'inline; filename="Especialidades.pdf"'
        ]);

        return $response;
    }

}
