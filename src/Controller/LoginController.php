<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;

final class LoginController extends AbstractController
{
    #[Route('/api/login', name: 'app_login', methods: ['POST'])]
    public function login(
        Request $request,
        EntityManagerInterface $em,
        UserPasswordHasherInterface $passwordHasher,
        JWTTokenManagerInterface $jwtManager
    ): JsonResponse {
        $data = json_decode($request->getContent(), true);

        $email = $data['email'] ?? null;
        $password = $data['password'] ?? null;

        if (!$email || !$password) {
            return new JsonResponse(['message' => 'Datos incompletos'], 400);
        }

        $user = $em->getRepository(User::class)->findOneBy(['email' => $email]);

        if (!$user || !$passwordHasher->isPasswordValid($user, $password)) {
            return new JsonResponse(['message' => 'Credenciales inválidas'], 401);
        }

        $token = $jwtManager->create($user);

        // Aquí puedes devolver datos básicos del usuario, o un token JWT si configuras JWT más adelante
        return new JsonResponse([
            'success' => true,
            'userId'  => $user->getId(),
            'userName' => $user->getName(),
            'token' => $token,
        ]);
    }
}
