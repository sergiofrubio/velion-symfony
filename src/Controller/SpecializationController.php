<?php

namespace App\Controller;

use App\Entity\Specialization;
use App\Form\SpecializationType;
use App\Repository\SpecializationRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/admin/specialization')]
class SpecializationController extends AbstractController
{
    #[Route('/', name: 'app_specialization_index', methods: ['GET'])]
    public function index(Request $request, PaginatorInterface $paginator, SpecializationRepository $specializationRepository): Response
    {
        $query = $specializationRepository->findAllSpecializations();
        $pagination = $paginator->paginate(
            $query, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            10 /*limit per page*/
        );
        return $this->render('specialization/index.html.twig', [
           'pagination' => $pagination,
        ]);
    }

    #[Route('/new', name: 'app_specialization_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $specialization = new Specialization();
        $form = $this->createForm(SpecializationType::class, $specialization);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($specialization);
            $entityManager->flush();
            $this->addFlash('success', 'Especialidad asignada con éxito.');
            return $this->redirectToRoute('app_specialization_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('specialization/new.html.twig', [
            'specialization' => $specialization,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_specialization_show', methods: ['GET'])]
    public function show(Specialization $specialization): Response
    {
        return $this->render('specialization/show.html.twig', [
            'specialization' => $specialization,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_specialization_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Specialization $specialization, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(SpecializationType::class, $specialization);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success', 'Especialidad actualizada con éxito.');
            return $this->redirectToRoute('app_specialization_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('specialization/edit.html.twig', [
            'specialization' => $specialization,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_specialization_delete', methods: ['POST'])]
    public function delete(Request $request, Specialization $specialization, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$specialization->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($specialization);
            $entityManager->flush();
        }
        $this->addFlash('success', 'Especialidad eliminada con éxito.');
        return $this->redirectToRoute('app_specialization_index', [], Response::HTTP_SEE_OTHER);
    }
}
