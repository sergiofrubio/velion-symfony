<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class RegisterController extends AbstractController
{
    #[Route('/api/register', name: 'app_register', methods: ['POST'])]
    public function register(
        Request $request,
        UserPasswordHasherInterface $passwordHasher,
        EntityManagerInterface $em
    ): JsonResponse {
        $data = json_decode($request->getContent(), true);

        // Validación rápida (puedes mejorar con Validator)
        $requiredFields = [
            'dni', 'nombre', 'apellidos', 'fecha_nacimiento', 'direccion',
            'ciudad', 'provincia', 'zip', 'telefono', 'genero', 'email', 'password'
        ];

        foreach ($requiredFields as $field) {
            if (empty($data[$field])) {
                return new JsonResponse(['message' => "Falta el campo $field"], 400);
            }
        }

        $user = new User();
        $user->setId($data['dni']); // suponiendo que 'id' es el DNI
        $user->setName($data['nombre']);
        $user->setSurname($data['apellidos']);
        $user->setBirthDate(new \DateTime($data['fecha_nacimiento']));
        $user->setAddress($data['direccion']);
        $user->setCity($data['ciudad']);
        $user->setProvince($data['provincia']);
        $user->setZip($data['zip']);
        $user->setPhone($data['telefono']);
        $user->setGenre($data['genero']);
        $user->setEmail($data['email']);

        $hashedPassword = $passwordHasher->hashPassword($user, $data['password']);
        $user->setPassword($hashedPassword);

        $em->persist($user);
        $em->flush();

        return new JsonResponse(['message' => 'Usuario registrado correctamente'], 201);
    }
}
